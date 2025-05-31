<?php

namespace App\Service;

use App\Repository\ProduitsRepository;

class Cart
{
    public function __construct(
        private readonly ProduitsRepository $produitsRepository
    ) {}
    function getCart($session):array
    {
        $cart = $session->get('cart', []);
        $cartWithData = [];

        foreach ($cart as $id => $quantity) {
            $cartWithData[] = [
                'produit' =>$this->produitsRepository->find($id),
                'quantite' =>$quantity
            ];
        }

        $total = array_sum(array_map(function($item) {
            return $item['produit']->getPrix() * $item['quantite'];
        }, $cartWithData));

        return [
            'cart'=>$cartWithData,
            'total'=>$total
            ];
    }
}

