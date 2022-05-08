<?php

namespace App\Form;

use App\Entity\Jupiter;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class JupiterType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom', TextType::class, ['attr' => ['class' => 'form-control']])
            ->add('planete', TextType::class, ['attr' => ['class' => 'form-control'], 'label' => 'Planète'])
            ->add('photo', FileType::class, ['required'=>false, 'data_class' => null, ], ['attr' => ['class' => 'form-control p-3']])
            ->add('decouvreur', TextType::class, ['attr' => ['class' => 'form-control'], 'label' => 'Découvreur'])
            ->add('date', TextType::class, ['attr' => ['class' => 'form-control']])
            ->add('description', TextareaType::class, ['attr' => ['class' => 'form-control']])
            ->add('submit', SubmitType::class, ['attr' => ['class' => 'btn btn-primary mt-3'], 'label' => 'Envoyez'])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Jupiter::class,
        ]);
    }
}
