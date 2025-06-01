<?php

namespace App\Service;

use Stripe\Stripe;
use Stripe\Checkout\Session;

class StripePayment
{
    public $redirectUrl;  // Fixed typo in variable name

    public function __construct() {
        Stripe::setApiKey($_SERVER['STRIPE_SECRET']);
        Stripe::setApiVersion('2024-06-20');
    }

    public function startPayment($cart, $shippingCost) {
        $cartProducts = $cart['cart'];
        $products = [
            [
                'quantity' => 1,  // Correct parameter name
                'price' => $shippingCost,
                'name' => "Frais de livraison",  // Correct parameter name
            ]
        ];

        foreach ($cartProducts as $value) {
            $productItem = [
                'quantity' => $value['quantite'],
                'price' => $value['produit']->getPrix(),
                'name' => $value['produit']->getNom(),  // Correct parameter name
            ];
            $products[] = $productItem;
        }

        $lineItems = array_map(function(array $product) {
            return [
                'quantity' => $product['quantity'],
                'price_data' => [
                    'currency' => 'eur',  // Use valid currency code
                    'product_data' => [
                        'name' => $product['name'],
                    ],
                    'unit_amount' => $product['price'] * 100,
                ],
            ];
        }, $products);

        $session = Session::create([
            'payment_method_types' => ['card'],
            'line_items' => $lineItems,
            'mode' => 'payment',
            'success_url' => 'http://127.0.0.1:8000/pay/success',
            'cancel_url' => 'http://127.0.0.1:8000/pay/cancel',
            'billing_address_collection' => 'required',
            'shipping_address_collection' => [
                'allowed_countries' => ['FR', 'CM', 'SN', 'CI', 'BJ', 'TG', 'ML', 'NE', 'BF', 'GN', 'GA'],
            ],
        ]);

        $this->redirectUrl = $session->url;
    }

    public function getStripeRedirectUrl() {
        return $this->redirectUrl;
    }
}