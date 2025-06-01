<?php

namespace App\Controller;

use App\Repository\OrderRepository;
use Dompdf\Dompdf;
use Dompdf\Options;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class BillController extends AbstractController
{
    #[Route('/editor/order/{id}/bill', name: 'app_bill')]
    public function index($id, OrderRepository $orderRepository): Response
    {
        $order = $orderRepository->find($id);

        if (!$order) {
            throw $this->createNotFoundException("Order not found");
        }

        $pdfOptions = new Options();
        $pdfOptions->set('defaultFont', 'Arial');
        $pdfOptions->set('isRemoteEnabled', true);

        $dompdf = new Dompdf($pdfOptions);

        $html = $this->renderView('bill/index.html.twig', [
            'order' => $order,
        ]);

        $dompdf->loadHtml($html);
        $dompdf->render();

        $dompdf->stream('Jnintek-e-commerce-app-bill-' . $order->getId() . '.pdf', [
            "Attachment" => false  // change to true to force download
        ]);

        exit; // prevents Symfony from continuing to render a response
    }
}
