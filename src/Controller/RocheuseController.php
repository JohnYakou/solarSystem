<?php

namespace App\Controller;

use App\Entity\Pluton;
use App\Entity\Gazeuse;
use App\Entity\Rocheuse;
use App\Form\RocheuseType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class RocheuseController extends AbstractController
{
    public function __construct(EntityManagerInterface $manager){
        $this->manager = $manager;
    }

    /**
     * @Route("/rocheuse", name="app_rocheuse")
     */
    public function index(Request $request, SluggerInterface $slugger): Response
    {
        $rocheuse = new Rocheuse();

        $form = $this->createForm(RocheuseType::class, $rocheuse);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoRocheuse = $form->get('photo')->getData();

            if($photoRocheuse){
                $originalFilename = pathinfo($photoRocheuse->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoRocheuse->guessExtension();

                try{
                    $photoRocheuse->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){

                }

                $rocheuse->setPhoto($newFilename);
            }else{
                dd("Aucune photo");
            }

            $this->manager->persist($rocheuse);
            $this->manager->flush();

            return $this->redirectToRoute('app_all_planets');
        }

        return $this->render('rocheuse/index.html.twig', [
            'rocheuseForm' => $form->createView(),
        ]);
    }

    // ALL PLANETS
    /**
     * @Route("/all/planets", name="app_all_planets")
     */
    public function allPlanets(): Response
    {
        $gazeuse = new Gazeuse;
        $pluton = new Pluton;

        $rocheuse = $this->manager->getRepository(Rocheuse::class)->findAll();
        $gazeuse = $this->manager->getRepository(Gazeuse::class)->findAll();
        $pluton = $this->manager->getRepository(Pluton::class)->findAll();

        return $this->render('rocheuse/allPlanets.html.twig', [
            'rocheuse' => $rocheuse,
            'gazeuse' => $gazeuse,
            'pluton' => $pluton,
        ]);
    }

    // SINGLE ROCHEUSE
    /**
     * @Route("/single/rocheuse/{nom}", name="app_single_rocheuse")
     */
    public function single(Rocheuse $id): Response{
        $rocheuse = $this->manager->getRepository(Rocheuse::class)->find($id);

        return $this->render('rocheuse/single.html.twig', [
            'rocheuse' => $rocheuse,
        ]);
    }

    // ---------- DELETE DE ROCHEUSE ----------
    /**
     * @Route("admin/delete/rocheuse/{id}", name="app_rocheuse_delete")
     */
    public function rocheuseDelete(Rocheuse $rocheuse): Response
    {
        $this->manager->remove($rocheuse);
        $this->manager->flush();

        return $this->redirectToRoute('app_all_planets');
    }

    // ---------- DELETE DE GAZEUSE ----------
    /**
     * @Route("admin/delete/gazeuse/{id}", name="app_gazeuse_delete")
     */
    public function gazeuseDelete(Gazeuse $gazeuse): Response
    {
        $this->manager->remove($gazeuse);
        $this->manager->flush();

        return $this->redirectToRoute('app_all_planets');
    }

    // ---------- DELETE DE PLUTON ----------
    /**
     * @Route("admin/delete/pluton/{id}", name="app_pluton_delete")
     */
    public function plutonDelete(Pluton $pluton): Response
    {
        $this->manager->remove($pluton);
        $this->manager->flush();

        return $this->redirectToRoute('app_all_planets');
    }

    // ---------- EDIT ----------
    /**
     * @Route("admin/edit/rocheuse/{id}", name="app_rocheuse_edit")
     */
    public function rocheuseEdit(Rocheuse $rocheuse, Request $request, SluggerInterface $slugger): Response
    {
        $form = $this->createForm(RocheuseType::class, $rocheuse);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoRocheuse = $form->get('photo')->getData();

            if($photoRocheuse){
                $originalFilename = pathinfo($photoRocheuse->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoRocheuse->guessExtension();

                try{
                    $photoRocheuse->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){
                    
                }
                $rocheuse->setPhoto($newFilename);
            }else{
                dd('Aucune photo disponible');
            };

            $this->manager->persist($rocheuse);
            $this->manager->flush();
            return $this->redirectToRoute('app_all_planets');
        };

        return $this->render("rocheuse/edit.html.twig", [
            'formEditRocheuse' => $form->createView(),
        ]);
    }

    /**
     * @Route("/admin/all/planets", name="app_admin_all_planets")
     */
    public function admin(): Response{
        $rocheuse = $this->manager->getRepository(Rocheuse::class)->findAll();

        // J'INSTANTIE LES AUTRES
        $gazeuse = new Gazeuse;
        $gazeuse = $this->manager->getRepository(Gazeuse::class)->findAll();

        $pluton = new Pluton;
        $pluton = $this->manager->getRepository(Pluton::class)->findAll();

        return $this->render('rocheuse/gestion.html.twig', [
            'rocheuse' => $rocheuse,
            'gazeuse' => $gazeuse,
            'pluton' => $pluton,
        ]);
    }
}