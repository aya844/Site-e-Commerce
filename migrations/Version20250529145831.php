<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250529145831 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            CREATE TABLE produits_sous_categorie (produits_id INT NOT NULL, sous_categorie_id INT NOT NULL, INDEX IDX_1E1E0853CD11A2CF (produits_id), INDEX IDX_1E1E0853365BF48 (sous_categorie_id), PRIMARY KEY(produits_id, sous_categorie_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE produits_sous_categorie ADD CONSTRAINT FK_1E1E0853CD11A2CF FOREIGN KEY (produits_id) REFERENCES produits (id) ON DELETE CASCADE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE produits_sous_categorie ADD CONSTRAINT FK_1E1E0853365BF48 FOREIGN KEY (sous_categorie_id) REFERENCES sous_categorie (id) ON DELETE CASCADE
        SQL);
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            ALTER TABLE produits_sous_categorie DROP FOREIGN KEY FK_1E1E0853CD11A2CF
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE produits_sous_categorie DROP FOREIGN KEY FK_1E1E0853365BF48
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE produits_sous_categorie
        SQL);
    }
}
