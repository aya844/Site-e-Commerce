<?php

namespace App\Controller;

use App\Repository\OrderRepository;
use Dompdf\Dompdf;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Dompdf\Options;
use Symfony\Component\Routing\Attribute\Route;

final class BillController extends AbstractController
{
    #[Route('/editor/order/{id}/bill', name: 'app_bill')]
    public function index($id,OrderRepository $orderRepository): Response
    {
        $order = $orderRepository->find($id);
        $pdfOptions = new Options();
        $pdfOptions->set('defaultFont', 'Arial');
        $pdfOptions->set('isRemoteEnabled', true);
        $dompdf = new Dompdf($pdfOptions);
        $html = $this->renderView('bill/index.html.twig', [
            'order' => $order,
        ]);
        $dompdf->loadHtml($html);
        $dompdf->render();
        $dompdf->stream('Jnintek-e-commerce-app-bill-'.$order->getId().'.pdf',[
            "Attachment" => false
        ]);

        return new Response('',200,[
            'Content-Type' => 'application/pdf',
        ]);
    }
}
