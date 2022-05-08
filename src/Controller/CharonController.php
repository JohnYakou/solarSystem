<?php

namespace App\Controller;

use App\Entity\Charon;
use App\Form\CharonType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class CharonController extends AbstractController
{
    public function __construct(EntityManagerInterface $manager){
        $this->manager = $manager;
    }

    /**
     * @Route("/charon", name="app_charon")
     */
    public function index(Request $request, SluggerInterface $slugger): Response
    {
        $charon = new Charon();

        $form = $this->createForm(CharonType::class, $charon);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoCharon = $form->get('photo')->getData();

            if($photoCharon){
                $originalFilename = pathinfo($photoCharon->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoCharon->guessExtension();

                try{
                    $photoCharon->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){

                }

                $charon->setPhoto($newFilename);
            }else{
                dd("Aucune photo");
            }

            $this->manager->persist($charon);
            $this->manager->flush();

            return $this->redirectToRoute('app_all_moons');
        }

        return $this->render('charon/index.html.twig', [
            'charonForm' => $form->createView(),
        ]);
    }

    // ----- SINGLE -----
    /**
     * @Route("/single/charon/{id}", name="app_single_charon")
     */
    public function single(Charon $id): Response{
        $charon = $this->manager->getRepository(Charon::class)->find($id);

        return $this->render('charon/single.html.twig', [
            'charon' => $charon,
        ]);
    }

    // ---------- EDIT ----------
    /**
     * @Route("admin/edit/charon/{id}", name="app_charon_edit")
     */
    public function charonEdit(Charon $charon, Request $request, SluggerInterface $slugger): Response
    {
        $form = $this->createForm(CharonType::class, $charon);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoCharon = $form->get('photo')->getData();

            if($photoCharon){
                $originalFilename = pathinfo($photoCharon->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoCharon->guessExtension();

                try{
                    $photoCharon->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){
                    
                }
                $charon->setPhoto($newFilename);
            }else{
                dd('Aucune photo disponible');
            };

            $this->manager->persist($charon);
            $this->manager->flush();
            return $this->redirectToRoute('app_all_moons');
        };

        return $this->render("charon/edit.html.twig", [
            'formEditCharon' => $form->createView(),
        ]);
    }
}