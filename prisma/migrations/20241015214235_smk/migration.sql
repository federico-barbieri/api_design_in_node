/*
  Warnings:

  - You are about to drop the `Product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Update` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `UpdatePoint` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_belongsToId_fkey";

-- DropForeignKey
ALTER TABLE "Update" DROP CONSTRAINT "Update_productId_fkey";

-- DropForeignKey
ALTER TABLE "UpdatePoint" DROP CONSTRAINT "UpdatePoint_updateId_fkey";

-- DropTable
DROP TABLE "Product";

-- DropTable
DROP TABLE "Update";

-- DropTable
DROP TABLE "UpdatePoint";

-- DropTable
DROP TABLE "User";

-- DropEnum
DROP TYPE "UPDATE_STATUS";

-- CreateTable
CREATE TABLE "Artwork" (
    "id" TEXT NOT NULL,
    "object_number" TEXT NOT NULL,
    "acquisition_date" TIMESTAMP(3),
    "brightness" DOUBLE PRECISION,
    "colortemp" DOUBLE PRECISION,
    "contrast" DOUBLE PRECISION,
    "created" TIMESTAMP(3) NOT NULL,
    "modified" TIMESTAMP(3) NOT NULL,
    "on_display" BOOLEAN NOT NULL,
    "enrichment_url" TEXT,
    "frontend_url" TEXT,
    "iiif_manifest" TEXT,
    "image_native" TEXT,
    "image_thumbnail" TEXT,
    "public_domain" BOOLEAN NOT NULL,
    "responsible_department" TEXT,
    "rights" TEXT,
    "entropy" DOUBLE PRECISION,
    "saturation" DOUBLE PRECISION,
    "has_3d_file" BOOLEAN NOT NULL,
    "has_image" BOOLEAN NOT NULL,

    CONSTRAINT "Artwork_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Artist" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Artist_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Artwork_Artist" (
    "artwork_id" TEXT NOT NULL,
    "artist_id" INTEGER NOT NULL,

    CONSTRAINT "Artwork_Artist_pkey" PRIMARY KEY ("artwork_id","artist_id")
);

-- CreateTable
CREATE TABLE "Color" (
    "id" SERIAL NOT NULL,
    "artwork_id" TEXT NOT NULL,
    "hex_value" TEXT NOT NULL,

    CONSTRAINT "Color_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Dimension" (
    "id" SERIAL NOT NULL,
    "artwork_id" TEXT NOT NULL,
    "part" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "unit" TEXT NOT NULL,
    "value" TEXT NOT NULL,

    CONSTRAINT "Dimension_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ObjectName" (
    "id" SERIAL NOT NULL,
    "artwork_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "ObjectName_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Production" (
    "id" SERIAL NOT NULL,
    "artwork_id" TEXT NOT NULL,
    "creator_forename" TEXT NOT NULL,
    "creator_surname" TEXT NOT NULL,
    "creator_date_of_birth" TIMESTAMP(3),
    "creator_date_of_death" TIMESTAMP(3),
    "creator_nationality" TEXT,
    "production_period_start" TIMESTAMP(3) NOT NULL,
    "production_period_end" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Production_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Technique" (
    "id" SERIAL NOT NULL,
    "artwork_id" TEXT NOT NULL,
    "technique" TEXT NOT NULL,

    CONSTRAINT "Technique_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Title" (
    "id" SERIAL NOT NULL,
    "artwork_id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "language" TEXT NOT NULL,

    CONSTRAINT "Title_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ArtworkArtists" (
    "A" INTEGER NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Artwork_object_number_key" ON "Artwork"("object_number");

-- CreateIndex
CREATE UNIQUE INDEX "_ArtworkArtists_AB_unique" ON "_ArtworkArtists"("A", "B");

-- CreateIndex
CREATE INDEX "_ArtworkArtists_B_index" ON "_ArtworkArtists"("B");

-- AddForeignKey
ALTER TABLE "Artwork_Artist" ADD CONSTRAINT "Artwork_Artist_artwork_id_fkey" FOREIGN KEY ("artwork_id") REFERENCES "Artwork"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Artwork_Artist" ADD CONSTRAINT "Artwork_Artist_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "Artist"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Color" ADD CONSTRAINT "Color_artwork_id_fkey" FOREIGN KEY ("artwork_id") REFERENCES "Artwork"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dimension" ADD CONSTRAINT "Dimension_artwork_id_fkey" FOREIGN KEY ("artwork_id") REFERENCES "Artwork"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ObjectName" ADD CONSTRAINT "ObjectName_artwork_id_fkey" FOREIGN KEY ("artwork_id") REFERENCES "Artwork"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Production" ADD CONSTRAINT "Production_artwork_id_fkey" FOREIGN KEY ("artwork_id") REFERENCES "Artwork"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Technique" ADD CONSTRAINT "Technique_artwork_id_fkey" FOREIGN KEY ("artwork_id") REFERENCES "Artwork"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Title" ADD CONSTRAINT "Title_artwork_id_fkey" FOREIGN KEY ("artwork_id") REFERENCES "Artwork"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtworkArtists" ADD CONSTRAINT "_ArtworkArtists_A_fkey" FOREIGN KEY ("A") REFERENCES "Artist"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtworkArtists" ADD CONSTRAINT "_ArtworkArtists_B_fkey" FOREIGN KEY ("B") REFERENCES "Artwork"("id") ON DELETE CASCADE ON UPDATE CASCADE;
