<?php

namespace App\Controller;

use App\Entity\Mars;
use App\Form\MarsType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class MarsController extends AbstractController
{
    public function __construct(EntityManagerInterface $manager){
        $this->manager = $manager;
    }

    /**
     * @Route("/mars", name="app_mars")
     */
    public function index(Request $request, SluggerInterface $slugger): Response
    {
        $mars = new Mars();

        $form = $this->createForm(MarsType::class, $mars);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoMars = $form->get('photo')->getData();

            if($photoMars){
                $originalFilename = pathinfo($photoMars->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoMars->guessExtension();

                try{
                    $photoMars->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){

                }

                $mars->setPhoto($newFilename);
            }else{
                dd("Aucune photo");
            }

            $this->manager->persist($mars);
            $this->manager->flush();

            return $this->redirectToRoute('app_all_moons');
        }

        return $this->render('mars/index.html.twig', [
            'marsForm' => $form->createView(),
        ]);
    }

    // SINGLE MARS
    /**
     * @Route("/single/mars/{id}", name="app_single_mars")
     */
    public function single(Mars $id): Response{
        $mars = $this->manager->getRepository(Mars::class)->find($id);

        return $this->render('mars/single.html.twig', [
            'mars' => $mars,
        ]);
    }

    // ---------- EDIT ----------
    /**
     * @Route("admin/edit/mars/{id}", name="app_mars_edit")
     */
    public function marsEdit(Mars $mars, Request $request, SluggerInterface $slugger): Response
    {
        $form = $this->createForm(MarsType::class, $mars);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoMars = $form->get('photo')->getData();

            if($photoMars){
                $originalFilename = pathinfo($photoMars->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoMars->guessExtension();

                try{
                    $photoMars->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){
                    
                }
                $mars->setPhoto($newFilename);
            }else{
                dd('Aucune photo disponible');
            };

            $this->manager->persist($mars);
            $this->manager->flush();
            return $this->redirectToRoute('app_all_moons');
        };

        return $this->render("mars/edit.html.twig", [
            'formEditMars' => $form->createView(),
        ]);
    }
}