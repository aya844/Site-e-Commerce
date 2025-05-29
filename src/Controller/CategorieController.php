<?php

namespace App\Controller;

use App\Entity\Categorie;
use App\Repository\CategorieRepository;
use App\Form\CategorieFormTypeForm;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
#use http\Client\Request;
use Symfony\Component\HttpFoundation\Request;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class CategorieController extends AbstractController
{
    #[Route('/categorie', name: 'app_categorie')]
    public function index(CategorieRepository $categorieRepository): Response
    {
        $categories = $categorieRepository->findAll();

        return $this->render('categorie/index.html.twig', [
            'categories' => $categories,
        ]);
    }

    #[Route('/categorie/new', name: 'app_categorie_new')]
    public function addCategorie(EntityManagerInterface $entityManager, Request $request): Response
    {
        $categorie = new Categorie();

        $form = $this->createForm(CategorieFormTypeForm::class, $categorie);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($categorie);
            $entityManager->flush();
            return $this->redirectToRoute('app_categorie');
        }
        return $this->render('categorie/new.html.twig', ['form' => $form->createView()]);

    }

    #[Route('/categorie/{id}/update', name: 'app_categorie_update')]
    public function updateCategorie(Categorie $categorie ,EntityManagerInterface $entityManager, Request $request): Response
    {
        $form = $this->createForm(CategorieFormTypeForm::class, $categorie);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();
            return $this->redirectToRoute('app_categorie');
        }
        return $this->render('categorie/update.html.twig', ['form' => $form->createView()]);
    }

    #[Route('/categorie/{id}/delete', name: 'app_categorie_delete')]
    public function deleteCategorie(Categorie $categorie ,EntityManagerInterface $entityManager, Request $request): Response
    {
        $entityManager->remove($categorie);
        $entityManager->flush();
        return $this->redirectToRoute('app_categorie');
    }
}
