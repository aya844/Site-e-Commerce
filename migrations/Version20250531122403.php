<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250531122403 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            CREATE TABLE produits_commande (id INT AUTO_INCREMENT NOT NULL, commande_id INT NOT NULL, produit_id INT NOT NULL, quantite INT NOT NULL, INDEX IDX_91DC5EAF82EA2E54 (commande_id), INDEX IDX_91DC5EAFF347EFB (produit_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE produits_commande ADD CONSTRAINT FK_91DC5EAF82EA2E54 FOREIGN KEY (commande_id) REFERENCES `order` (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE produits_commande ADD CONSTRAINT FK_91DC5EAFF347EFB FOREIGN KEY (produit_id) REFERENCES produits (id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE `order` ADD prix_total DOUBLE PRECISION NOT NULL
        SQL);
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            ALTER TABLE produits_commande DROP FOREIGN KEY FK_91DC5EAF82EA2E54
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE produits_commande DROP FOREIGN KEY FK_91DC5EAFF347EFB
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE produits_commande
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE `order` DROP prix_total
        SQL);
    }
}
