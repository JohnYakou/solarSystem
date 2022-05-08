<?php

namespace App\Controller;

use App\Entity\Uranus;
use App\Entity\Neptune;
use App\Form\UranusType;
use App\Form\NeptuneType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class NeptuneController extends AbstractController
{
    public function __construct(EntityManagerInterface $manager){
        $this->manager = $manager;
    }

    /**
     * @Route("/neptune", name="app_neptune")
     */
    public function index(Request $request, SluggerInterface $slugger): Response
    {
        $neptune = new Neptune();

        $form = $this->createForm(NeptuneType::class, $neptune);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoNeptune = $form->get('photo')->getData();

            if($photoNeptune){
                $originalFilename = pathinfo($photoNeptune->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoNeptune->guessExtension();

                try{
                    $photoNeptune->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){

                }

                $neptune->setPhoto($newFilename);
            }else{
                dd("Aucune photo");
            }

            $this->manager->persist($neptune);
            $this->manager->flush();

            return $this->redirectToRoute('app_all_moons');
        }

        return $this->render('neptune/index.html.twig', [
            'neptuneForm' => $form->createView(),
        ]);
    }

    // ----- SINGLE -----
    /**
     * @Route("/single/neptune/{id}", name="app_single_neptune")
     */
    public function single(Neptune $id): Response{
        $neptune = $this->manager->getRepository(Neptune::class)->find($id);

        return $this->render('neptune/single.html.twig', [
            'neptune' => $neptune,
        ]);
    }

    // ---------- EDIT ----------
    /**
     * @Route("admin/edit/neptune/{id}", name="app_neptune_edit")
     */
    public function neptuneEdit(Neptune $neptune, Request $request, SluggerInterface $slugger): Response
    {
        $form = $this->createForm(NeptuneType::class, $neptune);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoNeptune = $form->get('photo')->getData();

            if($photoNeptune){
                $originalFilename = pathinfo($photoNeptune->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoNeptune->guessExtension();

                try{
                    $photoNeptune->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){
                    
                }
                $neptune->setPhoto($newFilename);
            }else{
                dd('Aucune photo disponible');
            };

            $this->manager->persist($neptune);
            $this->manager->flush();
            return $this->redirectToRoute('app_all_moons');
        };

        return $this->render("neptune/edit.html.twig", [
            'formEditNeptune' => $form->createView(),
        ]);
    }
}
