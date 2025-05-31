<?php

namespace App\Entity;

use App\Repository\AjouterhistoriqueproduitRepository;
use Doctrine\ORM\Mapping as ORM;
use DateTimeInterface;

#[ORM\Entity(repositoryClass: AjouterhistoriqueproduitRepository::class)]
#[ORM\Table(name: "ajouterhistoriqueproduit")]
class Ajouterhistoriqueproduit
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private ?int $id = null;

    #[ORM\ManyToOne(targetEntity: Produits::class, inversedBy: 'ajouterhistoriqueproduits')]
    #[ORM\JoinColumn(name: "produit_id", referencedColumnName: "id", nullable: false)]
    private ?Produits $produit = null;

    #[ORM\Column(type: 'integer')]
    private ?int $quantite = null;

    #[ORM\Column(type: 'datetime')]
    private ?DateTimeInterface $createdAt = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getProduit(): ?Produits
    {
        return $this->produit;
    }

    public function setProduit(?Produits $produit): self
    {
        $this->produit = $produit;
        return $this;
    }

    public function getQuantite(): ?int
    {
        return $this->quantite;
    }

    public function setQuantite(int $quantite): self
    {
        $this->quantite = $quantite;
        return $this;
    }

    public function getCreatedAt(): ?DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;
        return $this;
    }
}
