<?php

namespace App\Service;

class StripePayment
{
    public $redirectUrrl;
    public function __construct(){
        $stripe::setApiKey($_SERVER['STRIPE_SECRET']);
        Stripe::setApiVersion('2025-05-28');
    }
    public function startPayment($cart,$shippingcost){
        $session= Session::create([
            'line_items' => [
                array_map(fn(array$product)=>[
                    'quantity' => $product['quantite'],
                    'price_data' => [
                        'currency' => 'DT',
                        'product_data' => [
                            'name' => $product['nom'],
                        ],
                        'unit_amount' => $product['prix'] * 100,
                    ],
                ], $products)
            ],
            'mode' => 'payment',
            'success_url' => 'http://127.0.0.1:8000/pay/success',
            'cancel_url' => 'http://127.0.0.1:8000/pay/cancel',
            'billing_address_collection'=>'required',
            'shipping_address_collection' => [
                'allowed_countries' => ['FR', 'CM', 'SN', 'CI', 'BJ', 'TG', 'ML', 'NE', 'BF', 'GN', 'GA'],
            ],
            'metadata'=>[]
        ]);
        $this->redirectUrrl = $session->url;
    }
    public function getStripeRedirectUrl()
    {
        return $this->redirectUrrl;
    }
}


