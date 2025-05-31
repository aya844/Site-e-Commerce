<?php

namespace App\Controller;

use App\Entity\Order;
use App\Entity\City;
use App\Form\TypeDeCommandeForm;
use App\Repository\ProduitsRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Attribute\Route;

final class OrderController extends AbstractController
{
    #[Route('/order', name: 'app_order')]
    public function index(Request $request, SessionInterface $session, ProduitsRepository $produitsRepository): Response
    {
        $cart = $session->get('cart', []);
        $cartWithData = [];
        foreach ($cart as $id => $quantite) {
            $cartWithData[] = [
                'produit' => $produitsRepository->find($id),
                'quantite' => $quantite
            ];
        }
        $total = array_sum(array_map(function($item) {
            return $item['produit']->getPrix() * $item['quantite'];
        }, $cartWithData));


        $order = new Order();
        $form = $this->createForm(TypeDeCommandeForm::class ,$order);
        $form->handleRequest($request);

        return $this->render('order/index.html.twig', [
            'form'=>$form->createView(),
            'total'=>$total,
        ]);
    }
    #[Route('/city/{id}/shipping/cost', name: 'app_city_shipping_cost')]
    public function cityShippingCost(City $ville): Response
    {
        $cityShippingPrice = $ville->getShippingCost();
        return new Response(json_encode(['status'=>200, "message"=>'on', 'content'=>$cityShippingPrice]));
    }
}
