-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/frYppn
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "alcohol_vs" (
    "ID" SERIAL   NOT NULL,
    "country" TEXT   NOT NULL,
    "year" INT   NOT NULL,
    "litres_per_capita_average" DEC   NOT NULL,
    "happiness_score" DEC   NOT NULL,
    "gdp_per_capita" DEC   NOT NULL,
    "healthy_life_expectancy" DEC   NOT NULL,
    CONSTRAINT "pk_alcohol_vs" PRIMARY KEY (
        "ID"
     )
);

