<?php

namespace App\Controller;

use App\Entity\Saturne;
use App\Form\SaturneType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class SaturneController extends AbstractController
{
    public function __construct(EntityManagerInterface $manager){
        $this->manager = $manager;
    }

    /**
     * @Route("/saturne", name="app_saturne")
     */
    public function index(Request $request, SluggerInterface $slugger): Response
    {
        $saturne = new Saturne();

        $form = $this->createForm(SaturneType::class, $saturne);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoSaturne = $form->get('photo')->getData();

        if($photoSaturne){
            $originalFilename = pathinfo($photoSaturne->getClientOriginalName(), PATHINFO_FILENAME);
            $safeFilename = $slugger->slug($originalFilename);
            $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoSaturne->guessExtension();

            try{
                $photoSaturne->move(
                    $this->getParameter('photo'),
                    $newFilename
                );
            }catch(FileException $e){

            }

            $saturne->setPhoto($newFilename);
            }else{
                dd("Aucune photo");
            }

            $this->manager->persist($saturne);
            $this->manager->flush();

            return $this->redirectToRoute('app_all_moons');
        }

        return $this->render('saturne/index.html.twig', [
            'saturneForm' => $form->createView(),
        ]);
    }

    // ----- SINGLE -----
    /**
     * @Route("/single/saturne/{nom}", name="app_single_saturne")
     */
    public function single(Saturne $id): Response{
        $saturne = $this->manager->getRepository(Saturne::class)->find($id);

        return $this->render('saturne/single.html.twig', [
            'saturne' => $saturne,
        ]);
    }

    // ---------- EDIT ----------
    /**
     * @Route("admin/edit/saturne/{id}", name="app_saturne_edit")
     */
    public function saturneEdit(Saturne $saturne, Request $request, SluggerInterface $slugger): Response
    {
        $form = $this->createForm(SaturneType::class, $saturne);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoSaturne = $form->get('photo')->getData();

            if($photoSaturne){
                $originalFilename = pathinfo($photoSaturne->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoSaturne->guessExtension();

                try{
                    $photoSaturne->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){
                    
                }
                $saturne->setPhoto($newFilename);
            }else{
                dd('Aucune photo disponible');
            };

            $this->manager->persist($saturne);
            $this->manager->flush();
            return $this->redirectToRoute('app_all_moons');
        };

        return $this->render("saturne/edit.html.twig", [
            'formEditSaturne' => $form->createView(),
        ]);
    }
}