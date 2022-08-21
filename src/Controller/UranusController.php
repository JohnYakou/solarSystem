<?php

namespace App\Controller;

use App\Entity\Uranus;
use App\Form\UranusType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class UranusController extends AbstractController
{
    public function __construct(EntityManagerInterface $manager){
        $this->manager = $manager;
    }

    /**
     * @Route("/uranus", name="app_uranus")
     */
    public function index(Request $request, SluggerInterface $slugger): Response
    {
        $uranus = new Uranus();

        $form = $this->createForm(UranusType::class, $uranus);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoUranus = $form->get('photo')->getData();

            if($photoUranus){
                $originalFilename = pathinfo($photoUranus->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoUranus->guessExtension();

                try{
                    $photoUranus->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){

                }

                $uranus->setPhoto($newFilename);
            }else{
                dd("Aucune photo");
            }

            $this->manager->persist($uranus);
            $this->manager->flush();

            return $this->redirectToRoute('app_all_moons');
        }

        return $this->render('uranus/index.html.twig', [
            'uranusForm' => $form->createView(),
        ]);
    }

    // ----- SINGLE -----
    /**
     * @Route("/single/uranus/{nom}", name="app_single_uranus")
     */
    public function single(Uranus $id): Response{
        $uranus = $this->manager->getRepository(Uranus::class)->find($id);

        return $this->render('uranus/single.html.twig', [
            'uranus' => $uranus,
        ]);
    }

    // ---------- EDIT ----------
    /**
     * @Route("admin/edit/uranus/{id}", name="app_uranus_edit")
     */
    public function uranusEdit(Uranus $uranus, Request $request, SluggerInterface $slugger): Response
    {
        $form = $this->createForm(UranusType::class, $uranus);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoUranus = $form->get('photo')->getData();

            if($photoUranus){
                $originalFilename = pathinfo($photoUranus->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoUranus->guessExtension();

                try{
                    $photoUranus->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){
                    
                }
                $uranus->setPhoto($newFilename);
            }else{
                dd('Aucune photo disponible');
            };

            $this->manager->persist($uranus);
            $this->manager->flush();
            return $this->redirectToRoute('app_all_moons');
        };

        return $this->render("uranus/edit.html.twig", [
            'formEditUranus' => $form->createView(),
        ]);
    }
}