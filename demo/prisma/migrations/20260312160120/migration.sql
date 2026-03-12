-- CreateTable
CREATE TABLE "Client" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT,
    "email" TEXT,
    "street" TEXT,
    "locality" TEXT,
    "administrativeDivision" TEXT,
    "postalCode" TEXT,
    "country" TEXT,
    "latitude" DOUBLE PRECISION,
    "longitude" DOUBLE PRECISION,
    "parentClientId" TEXT,
    "operatingHours" JSONB,
    "accessInstructions" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Client_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Client" ADD CONSTRAINT "Client_parentClientId_fkey" FOREIGN KEY ("parentClientId") REFERENCES "Client"("id") ON DELETE SET NULL ON UPDATE CASCADE;
