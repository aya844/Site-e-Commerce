<?php

namespace App\Entity;

use App\Repository\OrderRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: OrderRepository::class)]
#[ORM\Table(name: '`order`')]
class Order
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $firstName = null;

    #[ORM\Column(length: 255)]
    private ?string $lastName = null;

    #[ORM\Column(length: 255)]
    private ?string $telephone = null;

    #[ORM\Column(length: 255)]
    private ?string $addresse = null;


    #[ORM\Column]
    private ?\DateTimeImmutable $createdAt = null;

    #[ORM\ManyToOne(inversedBy: 'orders')]
    private ?City $ville = null;

    #[ORM\Column]
    private ?bool $payOnDelivery = null;

    /**
     * @var Collection<int, ProduitsCommande>
     */
    #[ORM\OneToMany(targetEntity: ProduitsCommande::class, mappedBy: 'commande', orphanRemoval: true)]
    private Collection $produitsCommandes;

    #[ORM\Column]
    private ?float $prixTotal = null;

    #[ORM\Column(nullable: true)]
    private ?bool $isCompleted = null;

    #[ORM\Column(length: 255)]
    private ?string $email = null;

    public function __construct()
    {
        $this->produitsCommandes = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFirstName(): ?string
    {
        return $this->firstName;
    }

    public function setFirstName(string $firstName): static
    {
        $this->firstName = $firstName;

        return $this;
    }

    public function getLastName(): ?string
    {
        return $this->lastName;
    }

    public function setLastName(string $lastName): static
    {
        $this->lastName = $lastName;

        return $this;
    }

    public function getTelephone(): ?string
    {
        return $this->telephone;
    }

    public function setTelephone(string $telephone): static
    {
        $this->telephone = $telephone;

        return $this;
    }

    public function getAddresse(): ?string
    {
        return $this->addresse;
    }

    public function setAddresse(string $addresse): static
    {
        $this->addresse = $addresse;

        return $this;
    }



    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeImmutable $createdAt): static
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getVille(): ?City
    {
        return $this->ville;
    }

    public function setVille(?City $ville): static
    {
        $this->ville = $ville;

        return $this;
    }

    public function isPayOnDelivery(): ?bool
    {
        return $this->payOnDelivery;
    }

    public function setPayOnDelivery(bool $payOnDelivery): static
    {
        $this->payOnDelivery = $payOnDelivery;

        return $this;
    }

    /**
     * @return Collection<int, ProduitsCommande>
     */
    public function getProduitsCommandes(): Collection
    {
        return $this->produitsCommandes;
    }

    public function addProduitsCommande(ProduitsCommande $produitsCommande): static
    {
        if (!$this->produitsCommandes->contains($produitsCommande)) {
            $this->produitsCommandes->add($produitsCommande);
            $produitsCommande->setCommande($this);
        }

        return $this;
    }

    public function removeProduitsCommande(ProduitsCommande $produitsCommande): static
    {
        if ($this->produitsCommandes->removeElement($produitsCommande)) {
            // set the owning side to null (unless already changed)
            if ($produitsCommande->getCommande() === $this) {
                $produitsCommande->setCommande(null);
            }
        }

        return $this;
    }

    public function getPrixTotal(): ?float
    {
        return $this->prixTotal;
    }

    public function setPrixTotal(float $prixTotal): static
    {
        $this->prixTotal = $prixTotal;

        return $this;
    }

    public function isCompleted(): ?bool
    {
        return $this->isCompleted;
    }

    public function setIsCompleted(?bool $isCompleted): static
    {
        $this->isCompleted = $isCompleted;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): static
    {
        $this->email = $email;

        return $this;
    }
}
