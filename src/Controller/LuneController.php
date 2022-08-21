<?php

namespace App\Controller;

use App\Entity\Lune;
use App\Entity\Mars;
use App\Entity\Charon;
use App\Entity\Uranus;
use App\Form\LuneType;
use App\Entity\Jupiter;
use App\Entity\Neptune;
use App\Entity\Saturne;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class LuneController extends AbstractController
{
    public function __construct(EntityManagerInterface $manager){
        $this->manager = $manager;
    }

    /**
     * @Route("/lune", name="app_lune")
     */
    public function index(Request $request, SluggerInterface $slugger): Response
    {
        $lune = new Lune();

        $form = $this->createForm(LuneType::class, $lune);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoLune = $form->get('photo')->getData();

            if($photoLune){
                $originalFilename = pathinfo($photoLune->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoLune->guessExtension();

                try{
                    $photoLune->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){

                }

                $lune->setPhoto($newFilename);
            }else{
                dd("Aucune photo");
            }

            $this->manager->persist($lune);
            $this->manager->flush();

            return $this->redirectToRoute('app_home');
        }

        return $this->render('lune/index.html.twig', [
            'luneForm' => $form->createView(),
        ]);
    }

    // ALL MOONS
    /**
     * @Route("/all/moons", name="app_all_moons")
     */
    public function allMoons(): Response
    {
        $mars = new Mars;
        $jupiter = new Jupiter;
        $saturne = new Saturne;
        $uranus = new Uranus;
        $neptune = new Neptune;
        $charon = new Charon;

        $lune = $this->manager->getRepository(Lune::class)->findAll();
        $mars = $this->manager->getRepository(Mars::class)->findAll();
        $jupiter = $this->manager->getRepository(Jupiter::class)->findAll();
        $saturne = $this->manager->getRepository(Saturne::class)->findAll();
        $uranus = $this->manager->getRepository(Uranus::class)->findAll();
        $neptune = $this->manager->getRepository(Neptune::class)->findAll();
        $charon = $this->manager->getRepository(Charon::class)->findAll();

        return $this->render('lune/allMoons.html.twig', [
            'lune' => $lune,
            'mars' => $mars,
            'jupiter' => $jupiter,
            'saturne' => $saturne,
            'uranus' => $uranus,
            'neptune' => $neptune,
            'charon' => $charon,
        ]);
    }

    // SINGLE LUNE
    /**
     * @Route("/single/terre/{nom}", name="app_single_lune")
     */
    public function single(Lune $id): Response{
        $lune = $this->manager->getRepository(Lune::class)->find($id);

        return $this->render('lune/single.html.twig', [
            'lune' => $lune,
        ]);
    }

    // ---------- DELETE DE LUNE ----------
    /**
     * @Route("admin/delete/lune/{id}", name="app_lune_delete")
     */
    public function luneDelete(Lune $lune): Response
    {
        $this->manager->remove($lune);
        $this->manager->flush();

        return $this->redirectToRoute('app_all_moons');
    }

    // ---------- DELETE DE MARS ----------
    /**
     * @Route("admin/delete/mars/{id}", name="app_mars_delete")
     */
    public function marsDelete(Mars $mars): Response
    {
        $this->manager->remove($mars);
        $this->manager->flush();

        return $this->redirectToRoute('app_all_moons');
    }

    // ---------- DELETE DE JUPITER -----------
    /**
     * @Route("admin/delete/jupiter/{id}", name="app_jupiter_delete")
     */
    public function jupiterDelete(Jupiter $jupiter): Response
    {
        $this->manager->remove($jupiter);
        $this->manager->flush();

        return $this->redirectToRoute('app_all_moons');
    }

    // ---------- DELETE DE SATURNE -----------
    /**
     * @Route("admin/delete/saturne/{id}", name="app_saturne_delete")
     */
    public function saturneDelete(Saturne $saturne): Response
    {
        $this->manager->remove($saturne);
        $this->manager->flush();

        return $this->redirectToRoute('app_all_moons');
    }

    // ---------- DELETE D'URANUS -----------
    /**
     * @Route("admin/delete/uranus/{id}", name="app_uranus_delete")
     */
    public function uranusDelete(Uranus $uranus): Response
    {
        $this->manager->remove($uranus);
        $this->manager->flush();

        return $this->redirectToRoute('app_all_moons');
    }

    // ---------- DELETE DE NEPTUNE -----------
    /**
     * @Route("admin/delete/neptune/{id}", name="app_neptune_delete")
     */
    public function neptunesDelete(Neptune $neptune): Response
    {
        $this->manager->remove($neptune);
        $this->manager->flush();

        return $this->redirectToRoute('app_all_moons');
    }

    // ---------- DELETE DE CHARON -----------
    /**
     * @Route("admin/delete/charon/{id}", name="app_charon_delete")
     */
    public function charonDelete(Charon $charon): Response
    {
        $this->manager->remove($charon);
        $this->manager->flush();

        return $this->redirectToRoute('app_all_moons');
    }

    // ---------- EDIT ----------
    /**
     * @Route("admin/edit/lune/{id}", name="app_lune_edit")
     */
    public function luneEdit(Lune $lune, Request $request, SluggerInterface $slugger): Response
    {
        $form = $this->createForm(LuneType::class, $lune);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $photoLune = $form->get('photo')->getData();

            if($photoLune){
                $originalFilename = pathinfo($photoLune->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '-' . $photoLune->guessExtension();

                try{
                    $photoLune->move(
                        $this->getParameter('photo'),
                        $newFilename
                    );
                }catch(FileException $e){
                    
                }
                $lune->setPhoto($newFilename);
            }else{
                dd('Aucune photo disponible');
            };

            $this->manager->persist($lune);
            $this->manager->flush();
            return $this->redirectToRoute('app_all_moons');
        };

        return $this->render("lune/edit.html.twig", [
            'formEditLune' => $form->createView(),
        ]);
    }

    /**
     * @Route("/admin/all/moons", name="app_admin_all_moons")
     */
    public function admin(): Response{
        $lune = $this->manager->getRepository(Lune::class)->findAll();

        // J'INSTANTIE LES AUTRES
        $mars = new Mars;
        $mars = $this->manager->getRepository(Mars::class)->findAll();

        $jupiter = new Jupiter;
        $jupiter = $this->manager->getRepository(Jupiter::class)->findAll();

        $saturne = new Saturne;
        $saturne = $this->manager->getRepository(Saturne::class)->findAll();

        $uranus = new Uranus;
        $uranus = $this->manager->getRepository(Uranus::class)->findAll();

        $neptune = new Neptune;
        $neptune = $this->manager->getRepository(Neptune::class)->findAll();

        $charon = new Charon;
        $charon = $this->manager->getRepository(Charon::class)->findAll();

        return $this->render('lune/gestion.html.twig', [
            'lune' => $lune,
            'mars' => $mars,
            'jupiter' => $jupiter,
            'saturne' => $saturne,
            'uranus' => $uranus,
            'neptune' => $neptune,
            'charon' => $charon,
        ]);
    }
}