<?php

namespace App\Controller;

use App\Entity\Order;
use App\Entity\City;
use App\Entity\ProduitsCommande;
use App\Service\Cart;
use App\Form\TypeDeCommandeForm;
use App\Repository\ProduitsRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Attribute\Route;

final class OrderController extends AbstractController
{
    #[Route('/order', name: 'app_order')]
    public function index(Request $request,
        SessionInterface $session,
        ProduitsRepository $produitsRepository,
        EntityManagerInterface $entityManager,
        Cart $cart,
    ): Response
    {
        $data = $cart->getCart($session);

        $order = new Order();
        $form = $this->createForm(TypeDeCommandeForm::class ,$order);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            if($order->isPayOnDelivery()){
                if(!empty($data['total'])){

                    $order->setPrixTotal($data['total']);
                    $order->setCreatedAt(new \DateTimeImmutable());
                    $entityManager->persist($order);
                    $entityManager->flush();

                    foreach ($data['cart'] as $value){
                        $produitCommande = new ProduitsCommande();
                        $produitCommande->setCommande($order);
                        $produitCommande->setProduit($value['produit']);
                        $produitCommande->setQuantite($value['quantite']);
                        $entityManager->persist($produitCommande);
                        $entityManager->flush();
                    }
                }
                $session->set('cart', []);
                return $this->redirectToRoute('order-ok-message');

            }
        }

        return $this->render('order/index.html.twig', [
            'form'=>$form->createView(),
            'total'=>$data['total'],
        ]);
    }

    #[Route('/order-ok-message', name: 'order-ok-message')]
    public function orderMessage():Response
    {
        return $this->render('order/orderMessage.twig');
    }

    #[Route('/city/{id}/shipping/cost', name: 'app_city_shipping_cost')]
    public function cityShippingCost(City $ville): Response
    {
        $cityShippingPrice = $ville->getShippingCost();
        return new Response(json_encode(['status'=>200, "message"=>'on', 'content'=>$cityShippingPrice]));
    }
}
