<?php

namespace App\Controller;

use App\Repository\ProduitsRepository;
use App\Service\Cart;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Attribute\Route;

final class CartController extends AbstractController
{
    public function __construct(private readonly ProduitsRepository $produitsRepository
    ) {}

    #[Route('/cart', name: 'app_cart', methods: ['GET'])]
    public function index(SessionInterface $session, Cart $cart): Response
    {
        $data = $cart->getCart($session);
        $cartProducts=$data['cart'];
        $product=[];
        foreach ($cartProducts as $value) {

        }

        return $this->render('cart/index.html.twig', [
            'items' => $data['cart'],
            'total' => $data['total'],
        ]);
    }

    #[Route('/cart/add/{id}', name: 'app_cart_new', methods: ['GET'])]
    public function addToCart(int $id, SessionInterface $session): Response
    {
        $cart= $session->get('cart', []);
        if(!empty($cart[$id])){
            $cart[$id]++;
        }
        else{
            $cart[$id] = 1;
        }
        $session->set('cart', $cart);

        return $this->redirectToRoute('app_cart');
    }

    #[Route('/cart/remove/{id}', name: 'app_cart_produit_remove', methods: ['GET'])]
    public function RemoveToCart(int $id, SessionInterface $session): Response
    {
        $cart= $session->get('cart', []);
        if(!empty($cart[$id])){
            unset($cart[$id]);
        }

        $session->set('cart', $cart);
        return $this->redirectToRoute('app_cart');
    }

    #[Route('/cart/remove', name: 'app_cart_remove', methods: ['GET'])]
    public function remove(SessionInterface $session): Response
    {

        $session->set('cart', []);
        return $this->redirectToRoute('app_cart');
    }

}
