/*
  Warnings:

  - You are about to drop the column `acquisition_date` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `brightness` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `colortemp` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `contrast` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `created` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `enrichment_url` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `entropy` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `frontend_url` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `has_3d_file` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `has_image` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `iiif_manifest` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `image_native` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `image_thumbnail` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `modified` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `on_display` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `public_domain` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `responsible_department` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `rights` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the column `saturation` on the `Artwork` table. All the data in the column will be lost.
  - You are about to drop the `Artist` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Artwork_Artist` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Color` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Dimension` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ObjectName` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Production` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Technique` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Title` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_ArtworkArtists` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Artwork_Artist" DROP CONSTRAINT "Artwork_Artist_artist_id_fkey";

-- DropForeignKey
ALTER TABLE "Artwork_Artist" DROP CONSTRAINT "Artwork_Artist_artwork_id_fkey";

-- DropForeignKey
ALTER TABLE "Color" DROP CONSTRAINT "Color_artwork_id_fkey";

-- DropForeignKey
ALTER TABLE "Dimension" DROP CONSTRAINT "Dimension_artwork_id_fkey";

-- DropForeignKey
ALTER TABLE "ObjectName" DROP CONSTRAINT "ObjectName_artwork_id_fkey";

-- DropForeignKey
ALTER TABLE "Production" DROP CONSTRAINT "Production_artwork_id_fkey";

-- DropForeignKey
ALTER TABLE "Technique" DROP CONSTRAINT "Technique_artwork_id_fkey";

-- DropForeignKey
ALTER TABLE "Title" DROP CONSTRAINT "Title_artwork_id_fkey";

-- DropForeignKey
ALTER TABLE "_ArtworkArtists" DROP CONSTRAINT "_ArtworkArtists_A_fkey";

-- DropForeignKey
ALTER TABLE "_ArtworkArtists" DROP CONSTRAINT "_ArtworkArtists_B_fkey";

-- AlterTable
ALTER TABLE "Artwork" DROP COLUMN "acquisition_date",
DROP COLUMN "brightness",
DROP COLUMN "colortemp",
DROP COLUMN "contrast",
DROP COLUMN "created",
DROP COLUMN "enrichment_url",
DROP COLUMN "entropy",
DROP COLUMN "frontend_url",
DROP COLUMN "has_3d_file",
DROP COLUMN "has_image",
DROP COLUMN "iiif_manifest",
DROP COLUMN "image_native",
DROP COLUMN "image_thumbnail",
DROP COLUMN "modified",
DROP COLUMN "on_display",
DROP COLUMN "public_domain",
DROP COLUMN "responsible_department",
DROP COLUMN "rights",
DROP COLUMN "saturation";

-- DropTable
DROP TABLE "Artist";

-- DropTable
DROP TABLE "Artwork_Artist";

-- DropTable
DROP TABLE "Color";

-- DropTable
DROP TABLE "Dimension";

-- DropTable
DROP TABLE "ObjectName";

-- DropTable
DROP TABLE "Production";

-- DropTable
DROP TABLE "Technique";

-- DropTable
DROP TABLE "Title";

-- DropTable
DROP TABLE "_ArtworkArtists";
