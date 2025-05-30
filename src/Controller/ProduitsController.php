<?php

namespace App\Controller;

use App\Entity\Ajouterhistoriqueproduit;
use App\Entity\Produits;
use App\Form\AjouterhistoriqueproduitForm;
use App\Form\ProduitsForm;
use App\Repository\ProduitsRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\String\Slugger\SluggerInterface;

#[Route('/editor/produits')]
final class ProduitsController extends AbstractController
{
    #[Route(name: 'app_produits_index', methods: ['GET'])]
    public function index(ProduitsRepository $produitsRepository): Response
    {
        return $this->render('produits/index.html.twig', [
            'produits' => $produitsRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_produits_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager, SluggerInterface $slugger): Response
    {
        $produit = new Produits();
        $form = $this->createForm(ProduitsForm::class, $produit);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $image = $form->get('image')->getData();
            if ($image) {
                $originalName = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFileName = $slugger->slug($originalName);
                $newFileName= $safeFileName.'-'.uniqid().'.'.$image->guessExtension();
                try {
                    $image->move(
                        $this->getParameter('image_dir'),
                        $newFileName
                    );
                } catch (FileException $exception) {$this->addFlash('danger', 'Erreur lors de l\'upload de l\'image.');
                    return $this->redirectToRoute('app_produits_new');}
                $produit->setImage($newFileName);
            }

            $entityManager->persist($produit);
            $entityManager->flush();

            $stockHistorique= new Ajouterhistoriqueproduit();
            $stockHistorique->setQuantite($produit->getStock());
            $stockHistorique->setProduit($produit);
            $stockHistorique->setcreatedat(new \DateTimeImmutable());
            $entityManager->persist($stockHistorique);
            $entityManager->flush();

            $this->addFlash('success','votre produit a été ajouté avec succes');
            return $this->redirectToRoute('app_produits_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('produits/new.html.twig', [
            'produit' => $produit,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_produits_show', methods: ['GET'])]
    public function show(Produits $produit): Response
    {
        return $this->render('produits/show.html.twig', [
            'produit' => $produit,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_produits_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Produits $produit, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(ProduitsForm::class, $produit);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();
            $this->addFlash('success','votre produit a été modifié avec succes');
            return $this->redirectToRoute('app_produits_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('produits/edit.html.twig', [
            'produit' => $produit,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_produits_delete', methods: ['POST'])]
    public function delete(Request $request, Produits $produit, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$produit->getId(), $request->request->get('_token'))) {
            $entityManager->remove($produit);
            $entityManager->flush();
            $this->addFlash('danger', 'votre produit a été supprimé');
        }

        return $this->redirectToRoute('app_produits_index', [], Response::HTTP_SEE_OTHER);
    }

    #[Route('/add/product/{id}/stock', name: 'app_produits_stock_add', methods: ['POST','GET'])]
    public function addStock($id, EntityManagerInterface $entityManager,Request $request , ProduitsRepository $ProduitsRepository): Response
    {
        $addstock= new Ajouterhistoriqueproduit();
        $form= $this->createForm(AjouterhistoriqueproduitForm::class,$addstock);
        $form->handleRequest($request);
        $produit= $ProduitsRepository->find($id);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($addstock->getQuantite() > 0) {
                $addstock->setProduit($produit);
                $newquantite = $produit->getStock()+$addstock->getQuantite();
                $produit->setStock($newquantite);
                $addstock->setcreatedat(new \DateTimeImmutable());


                $entityManager->persist($addstock);
                $entityManager->persist($produit);
                $entityManager->flush();

                $this->addFlash('success', 'Le stock a été mis à jour avec succès.');
                return $this->redirectToRoute('app_produits_index', ['id'=>$id] );
           } else {
                $this->addFlash('danger', 'Le stock ne  doit pas être inférieur à 0.');
                return $this->redirectToRoute('app_produits_stock_add', ['id' =>$produit->getId()]);
            }
        }



        return $this->render('produits/addstock.html.twig', [
            'form' => $form->createView(),
            'produit' => $produit,]
        );

}
}
