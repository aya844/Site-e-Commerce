<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Mapping\Entity;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class UserController extends AbstractController
{
    #[Route('admin/user', name: 'app_user')]
    public function index(UserRepository $userRepository): Response
    {
        return $this->render('user/index.html.twig', [
            'users' => $userRepository->findAll(),
        ]);
    }
    #[Route('/admin/user/{id}/to/editor', name: 'app_user_to_editor')]
    public function changeRole(EntityManagerInterface $entityManager, User $user): Response
    {
        $user->setRoles(["ROLE_USER", "ROLE_EDITOR"]);
        $entityManager->flush();
        $this->addFlash("success", "Role editeur ajouté a l'utilisateur");
        return $this->redirectToRoute('app_user');


    }
    #[Route('/admin/user/{id}/remove/editor/role', name: 'app_user_remove_editor_role')]
    public function editorRoleRemove(EntityManagerInterface $entityManager, User $user): Response
    {
        $user->setRoles([]);
        $entityManager->flush();
        $this->addFlash("danger", "Role editeur retiré de l'utilisateur");
        return $this->redirectToRoute('app_user');


    }
    #[Route('/admin/user/{id}/remove/', name: 'app_user_remove')]
    public function userRemove(EntityManagerInterface $entityManager,$id, UserRepository $userRepository): Response
    {
        $userFind= $userRepository->find($id);
        $entityManager->remove($userFind);
        $entityManager->flush();
        $this->addFlash("danger", "utilisateur supprimé");
        return $this->redirectToRoute('app_user');


    }

}
