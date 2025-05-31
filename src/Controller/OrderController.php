<?php

namespace App\Controller;

use App\Entity\Order;
use App\Entity\City;
use App\Entity\ProduitsCommande;
use App\Repository\OrderRepository;
use App\Service\Cart;
use App\Form\TypeDeCommandeForm;
use App\Repository\ProduitsRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Mime\Email;
use Symfony\Component\Validator\Constraints\MacAddress;

final class OrderController extends AbstractController
{
    public function __Construct (private MailerInterface $mailer)
    {

    }
    #[Route('/order', name: 'app_order')]
    public function index(
        Request $request,
        SessionInterface $session,
        ProduitsRepository $produitsRepository,
        EntityManagerInterface $entityManager,
        Cart $cart
    ): Response {
        $data = $cart->getCart($session);

        $order = new Order();
        $form = $this->createForm(TypeDeCommandeForm::class, $order);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if ($order->isPayOnDelivery()) {
                if (!empty($data['total'])) {
                    $order->setPrixTotal($data['total']);
                    $order->setCreatedAt(new \DateTimeImmutable());

                    $entityManager->persist($order);

                    foreach ($data['cart'] as $value) {
                        $produitCommande = new ProduitsCommande();
                        $produitCommande->setCommande($order);
                        $produitCommande->setProduit($value['produit']);
                        $produitCommande->setQuantite($value['quantite']);
                        $entityManager->persist($produitCommande);
                    }


                    $entityManager->flush();

                    $entityManager->refresh($order);

                    $session->set('cart', []);

                    $html = $this->renderView('mail/order.html.twig', [
                        'order' => $order,
                    ]);

                    $email = (new Email())
                        ->from('Jnintek@gmail.com')
                        ->to($order->getEmail())
                        ->subject('Confirmation de reception de la commande')
                        ->html($html);
                    $this->mailer->send($email);

                    return $this->redirectToRoute('order-ok-message');
                }
            }
        }

        return $this->render('order/index.html.twig', [
            'form' => $form->createView(),
            'total' => $data['total'],
        ]);
    }

    #[Route('/editor/order', name: 'app_orders-show')]
    public function getAllOrder(OrderRepository $orderRepository, Request $request, PaginatorInterface $paginator): Response
    {
        $data=$orderRepository->findBy([], ['id' => 'DESC']);
        $order=$paginator->paginate(
            $data,
            $request->query->getInt('page', 1),
            5
        );

        return $this->render('order/order.html.twig', [
            'orders'=>$order
        ]);
    }
    #[Route('/editor/order/{id}/is-completed/update', name: 'app_orders_is_completed_update')]
    public function isCompleted($id,OrderRepository $orderRepository, EntityManagerInterface $entityManager): Response
    {
        $order=$orderRepository->find($id);
        $order->setIsCompleted(true);
        $entityManager->flush();
        $this->addFlash('success','modification effectuée');
        return $this->redirectToRoute('app_orders-show');


    }
    #[Route('/editor/order/{id}/remove', name: 'app_order_remove', methods: ['GET'])]
    public function removeOrder(Order $order = null, EntityManagerInterface $entityManager): Response
    {
        $entityManager->remove($order);
        $entityManager->flush();

        $this->addFlash('danger', 'Commande supprimée avec succès.');

        return $this->redirectToRoute('app_orders-show');
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
