<?php

namespace App\Entity;

use App\Repository\ProduitsRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ProduitsRepository::class)]
class Produits
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255, unique: true)]
    private ?string $nom = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $description = null;

    #[ORM\Column]
    private ?int $prix = null;

    /**
     * @var Collection<int, SousCategorie>
     */
    #[ORM\ManyToMany(targetEntity: SousCategorie::class, inversedBy: 'produits')]
    private Collection $sousCategories;


    public function __construct()
    {
        $this->sousCategories = new ArrayCollection();
        $this->ajouterhistoriqueproduits = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): static
    {
        $this->nom = $nom;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getPrix(): ?int
    {
        return $this->prix;
    }

    public function setPrix(int $prix): static
    {
        $this->prix = $prix;

        return $this;
    }
    #[ORM\Column(type: 'string',length: 255, nullable: true)]
    private ?string $image = null;

    #[ORM\Column(type: 'integer',nullable: false)]
    private int $stock = 0;

    /**
     * @var Collection<int, Ajouterhistoriqueproduit>
     */
    #[ORM\OneToMany(targetEntity: Ajouterhistoriqueproduit::class, mappedBy: 'produit')]
    private Collection $ajouterhistoriqueproduits;


    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(?string $image): self
    {
        $this->image = $image;

        return $this;
    }

    public function getStock(): ?int
    {
        return $this->stock;
    }

    public function setStock(int $stock): static
    {
        $this->stock = $stock;

        return $this;
    }

    /**
     * @return Collection<int, SousCategorie>
     */
    public function getSousCategories(): Collection
    {
        return $this->sousCategories;
    }

    public function addSousCatGory(SousCategorie $sousCatGory): static
    {
        if (!$this->sousCategories->contains($sousCatGory)) {
            $this->sousCategories->add($sousCatGory);
        }

        return $this;
    }

    public function removeSousCatGory(SousCategorie $sousCatGory): static
    {
        $this->sousCategories->removeElement($sousCatGory);

        return $this;
    }

    /**
     * @return Collection<int, Ajouterhistoriqueproduit>
     */
    public function getAjouterhistoriqueproduits(): Collection
    {
        return $this->ajouterhistoriqueproduits;
    }

    public function addAjouterhistoriqueproduit(Ajouterhistoriqueproduit $ajouterhistoriqueproduit): static
    {
        if (!$this->ajouterhistoriqueproduits->contains($ajouterhistoriqueproduit)) {
            $this->ajouterhistoriqueproduits->add($ajouterhistoriqueproduit);
            $ajouterhistoriqueproduit->setProduit($this);
        }

        return $this;
    }

    public function removeAjouterhistoriqueproduit(Ajouterhistoriqueproduit $ajouterhistoriqueproduit): static
    {
        if ($this->ajouterhistoriqueproduits->removeElement($ajouterhistoriqueproduit)) {
            // set the owning side to null (unless already changed)
            if ($ajouterhistoriqueproduit->getProduit() === $this) {
                $ajouterhistoriqueproduit->setProduit(null);
            }
        }

        return $this;
    }

}
