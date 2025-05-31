<?php

namespace App\Form;

use App\Entity\City;
use App\Entity\Order;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class TypeDeCommandeForm extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('firstName', null,[
                'attr'=>[
                    'class'=>'form form-control'
                ]
            ])
            ->add('lastName', null,[
                'attr'=>[
                    'class'=>'form form-control'
                ]
            ])
            ->add('email', null,[
                'attr'=>[
                    'class'=>'form form-control'
                ]
            ])
            ->add('telephone', null,[
                'attr'=>[
                    'class'=>'form form-control'
                ]
            ])
            ->add('addresse', null,[
                'attr'=>[
                    'class'=>'form form-control'
                ]
            ])
            //->add('createdAt', null, [
            //    'widget' => 'single_text',
            //])
            ->add('ville', EntityType::class, [
                'class' => City::class,
                'choice_label' => 'name',
                'attr'=>[
                    'class'=>'form form-control'
                ]
            ])

            ->add('payOnDelivery', null, ['label'=>'Payer à la livraison'])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Order::class,
        ]);
    }
}
