<?php

namespace App\Form;

use App\Entity\Produits;
use App\Entity\SousCategorie;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Validator\Constraints\File;
class ProduitsForm extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom')
            ->add('description')
            ->add('prix')
            ->add("image",FileType::class,[
                'label' => 'Image du produit',
                'mapped' => false,
                'required' => false,
                "constraints" => [
                    new File([
                        'maxSize' => '1024k',
                        'mimeTypes' => [
                            'image/jpg',
                            'image/png',
                            'image/jpeg',
                        ],
                        'maxSizeMessage' => 'Votre image ne doit pas depasser 1024ko',
                        'mimeTypesMessage' => "Votre image doit etre au format valide(png,jpg,jpeg)"
                    ])
                ]
            ])
            ->add('sousCategories', EntityType::class, [
                'class' => SousCategorie::class,
                'choice_label' => 'nom',
                'multiple' => true,
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Produits::class,
        ]);
    }
}
