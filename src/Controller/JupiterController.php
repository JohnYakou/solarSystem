<?php

namespace App\Controller;

use App\Entity\Jupiter;
use App\Form\JupiterType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class JupiterController extends AbstractController
{
    public function __construct(EntityManagerInterface $manager){
        $this->manager = $manager;
    }

    /**
     * @Route("/jupiter", name="app_jupiter")
     */
    public function index(Request $request, SluggerInterface $slugger): Response
    {
        $jupiter = new Jupiter();

        $form = $this->createForm(JupiterType::class, $jupiter);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoJupiter = $form->get('photo')->getData();

            if($photoJupiter){
                $originalFilename = pathinfo($photoJupiter->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoJupiter->guessExtension();

                try{
                    $photoJupiter->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){

                }

                $jupiter->setPhoto($newFilename);
            }else{
                dd("Aucune photo");
            }

            $this->manager->persist($jupiter);
            $this->manager->flush();

            return $this->redirectToRoute('app_all_moons');
        }

        return $this->render('jupiter/index.html.twig', [
            'jupiterForm' => $form->createView(),
        ]);
    }

    // ----- SINGLE -----
    /**
     * @Route("/single/jupiter/{nom}", name="app_single_jupiter")
     */
    public function single(Jupiter $id): Response{
        $jupiter = $this->manager->getRepository(Jupiter::class)->find($id);

        return $this->render('jupiter/single.html.twig', [
            'jupiter' => $jupiter,
        ]);
    }

    // ---------- EDIT ----------
    /**
     * @Route("admin/edit/jupiter/{id}", name="app_jupiter_edit")
     */
    public function jupiterEdit(Jupiter $jupiter, Request $request, SluggerInterface $slugger): Response
    {
        $form = $this->createForm(JupiterType::class, $jupiter);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoJupiter = $form->get('photo')->getData();

            if($photoJupiter){
                $originalFilename = pathinfo($photoJupiter->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoJupiter->guessExtension();

                try{
                    $photoJupiter->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){
                    
                }
                $jupiter->setPhoto($newFilename);
            }else{
                dd('Aucune photo disponible');
            };

            $this->manager->persist($jupiter);
            $this->manager->flush();
            return $this->redirectToRoute('app_all_moons');
        };

        return $this->render("jupiter/edit.html.twig", [
            'formEditJupiter' => $form->createView(),
        ]);
    }
}