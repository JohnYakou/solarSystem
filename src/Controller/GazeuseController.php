<?php

namespace App\Controller;

use App\Entity\Gazeuse;
use App\Form\GazeuseType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class GazeuseController extends AbstractController
{
    public function __construct(EntityManagerInterface $manager){
        $this->manager = $manager;
    }

    /**
     * @Route("/gazeuse", name="app_gazeuse")
     */
    public function index(Request $request, SluggerInterface $slugger): Response
    {
        $gazeuse = new Gazeuse();

        $form = $this->createForm(GazeuseType::class, $gazeuse);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoGazeuse = $form->get('photo')->getData();

            if($photoGazeuse){
                $originalFilename = pathinfo($photoGazeuse->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoGazeuse->guessExtension();

                try{
                    $photoGazeuse->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){

                }

                $gazeuse->setPhoto($newFilename);
            }else{
                dd("Aucune photo");
            }

            $this->manager->persist($gazeuse);
            $this->manager->flush();

            return $this->redirectToRoute('app_all_planets');
        }

        return $this->render('gazeuse/index.html.twig', [
            'gazeuseForm' => $form->createView(),
        ]);
    }

    // SINGLE GAZEUSE
    /**
     * @Route("/single/gazeuse/{id}", name="app_single_gazeuse")
     */
    public function single(Gazeuse $id): Response{
        $gazeuse = $this->manager->getRepository(Gazeuse::class)->find($id);

        return $this->render('gazeuse/single.html.twig', [
            'gazeuse' => $gazeuse,
        ]);
    }

    // ---------- EDIT ----------
    /**
     * @Route("admin/edit/gazeuse/{id}", name="app_gazeuse_edit")
     */
    public function gazeuseEdit(Gazeuse $gazeuse, Request $request, SluggerInterface $slugger): Response
    {
        $form = $this->createForm(GazeuseType::class, $gazeuse);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoGazeuse = $form->get('photo')->getData();

            if($photoGazeuse){
                $originalFilename = pathinfo($photoGazeuse->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoGazeuse->guessExtension();

                try{
                    $photoGazeuse->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){
                    
                }
                $gazeuse->setPhoto($newFilename);
            }else{
                dd('Aucune photo disponible');
            };

            $this->manager->persist($gazeuse);
            $this->manager->flush();
            return $this->redirectToRoute('app_all_planets');
        };

        return $this->render("gazeuse/edit.html.twig", [
            'formEditGazeuse' => $form->createView(),
        ]);
    }
}