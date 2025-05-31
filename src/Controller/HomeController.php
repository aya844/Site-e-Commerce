<?php

namespace App\Controller;

use App\Entity\Produits;
use App\Repository\CategorieRepository;
use App\Repository\ProduitsRepository;
use App\Repository\SousCategorieRepository;
use Symfony\Component\HttpFoundation\Request;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class HomeController extends AbstractController
{

    #[Route('/', name: 'app_home_root', methods: ['GET'])]
    #[Route('/home', name: 'app_home', methods: ['GET'])]
    public function index(ProduitsRepository $produitsRepository, CategorieRepository $categorieRepository, Request $request, PaginatorInterface $paginator): Response
    {    $data= $produitsRepository->findBy([],['id' => 'DESC']);
        $produits =$paginator->paginate(
            $data,
            $request->query->getInt('page', 1),
            4
        );
        return $this->render('home/index.html.twig', [
            'produits' => $produits,
            'categories' => $categorieRepository->findAll(),

        ]);
    }

    #[Route('/home/product/{id}/show', name: 'app_home_produits_show', methods: ['GET'])]
    public function show(Produits $produits,ProduitsRepository $produitsRepository, CategorieRepository $categorieRepository): Response

    {   $latestProduct= $produitsRepository->findBy([],['id' => 'DESC'],2);
        return $this->render('home/show.html.twig', [
            'produit' => $produits,
            'produits' => $latestProduct,
            'categories' => $categorieRepository->findAll(),

        ]);
    }


    #[Route('/home/product/sousCategorie/{id}/filter', name: 'app_home_product_filter', methods: ['GET'])]
    public function filter($id,SousCategorieRepository $sousCategorieRepository ): Response

    {
        $produits = $sousCategorieRepository->find($id)->getProduits();
        $sousCategorie = $sousCategorieRepository->find($id);

        return $this->render('home/filter.html.twig', [
            'produits' => $produits,
            'sousCategorie' => $sousCategorie

        ]);
    }

}
