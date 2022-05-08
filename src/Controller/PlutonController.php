<?php

namespace App\Controller;

use App\Entity\Pluton;
use App\Form\PlutonType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class PlutonController extends AbstractController
{
    public function __construct(EntityManagerInterface $manager){
        $this->manager = $manager;
    }

    /**
     * @Route("/pluton", name="app_pluton")
     */
    public function index(Request $request, SluggerInterface $slugger): Response
    {
        $pluton = new Pluton();

        $form = $this->createForm(PlutonType::class, $pluton);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoPluton = $form->get('photo')->getData();

            if($photoPluton){
                $originalFilename = pathinfo($photoPluton->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoPluton->guessExtension();

                try{
                    $photoPluton->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){

                }

                $pluton->setPhoto($newFilename);
            }else{
                dd("Aucune photo");
            }

            $this->manager->persist($pluton);
            $this->manager->flush();

            return $this->redirectToRoute('app_all_planets');
        }

        return $this->render('pluton/index.html.twig', [
            'plutonForm' => $form->createView(),
        ]);
    }

    // SINGLE PLUTON
    /**
     * @Route("/single/pluton/{id}", name="app_single_pluton")
     */
    public function single(Pluton $id): Response{
        $pluton = $this->manager->getRepository(Pluton::class)->find($id);

        return $this->render('pluton/single.html.twig', [
            'pluton' => $pluton,
        ]);
    }

    // ---------- EDIT ----------
    /**
     * @Route("admin/edit/pluton/{id}", name="app_pluton_edit")
     */
    public function plutonEdit(Pluton $pluton, Request $request, SluggerInterface $slugger): Response
    {
        $form = $this->createForm(PlutonType::class, $pluton);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoPluton = $form->get('photo')->getData();

            if($photoPluton){
                $originalFilename = pathinfo($photoPluton->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoPluton->guessExtension();

                try{
                    $photoPluton->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){
                    
                }
                $pluton->setPhoto($newFilename);
            }else{
                dd('Aucune photo disponible');
            };

            $this->manager->persist($pluton);
            $this->manager->flush();
            return $this->redirectToRoute('app_all_planets');
        };

        return $this->render("pluton/edit.html.twig", [
            'formEditPluton' => $form->createView(),
        ]);
    }
}