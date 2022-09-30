--CREATE TYPE SEX AS ENUM (
  --'male',
  --'female'
--);

--CREATE TYPE COURSES AS ENUM (
  --'salvation',
  --'dicipelship',
  --'servant'
--);

--CREATE TYPE nav_type AS ENUM (
  --'about_drop_down',
  --'main_navigation',
  --'ministries_drop'
--);

--CREATE TYPE Grade AS ENUM (
  --'KG',
  --'Elementary',
  --'High_school',
  --'Preparatory',
  --'University'
--);

--CREATE TYPE video_type AS ENUM (
  --'choir',
  --'worship',
  --'sunday_preaching',
  --'tuesday_preaching',
  --'Training',
  --'fellowship'
--);

CREATE TABLE meba (
  "meba_id" INT PRIMARY KEY,
  "meba_date" date NOT NULL,
  "meba_amount" float NOT NULL
);

CREATE TABLE asrat (
  "asrat_id" INT PRIMARY KEY,
  "asrat_date" date NOT NULL,
  "asrat_amount" float NOT NULL,
  "member_id" INT NOT NULL
);

CREATE TABLE address (
  "address_id" INT PRIMARY KEY,
  "country" VARCHAR(60) NOT NULL,
  "city" VARCHAR(60) NOT NULL,
  "kebele" INT NOT NULL,
  "special_name" VARCHAR(200) NOT NULL
);

CREATE TABLE "families" (
  "family_id" INT PRIMARY KEY,
  "family_name" VARCHAR(100) NOT NULL
);

CREATE TABLE "role" (
  "role_id" SERIAL PRIMARY KEY,
  "role_name" VARCHAR(255) NOT NULL
);

CREATE TABLE "agelgayoch" (
  "agelgayoch_id" INT PRIMARY KEY,
  "member_id" INT NOT NULL,
  "role_id" INT NOT NULL,
  "full_time" boolean NOT NULL,
  "description_en" text NOT NULL,
  "description_am" text NOT NULL
);

CREATE TABLE "church" (
  "church_id" INT PRIMARY KEY,
  "address_id" INT NOT NULL,
  "agelgayoch_id" INT NOT NULL
);

CREATE TABLE "members" (
  "member_id" INT PRIMARY KEY,
  "first_name_en" VARCHAR(255) NOT NULL,
  "middle_name_en" VARCHAR(255) NOT NULL,
  "last_name_en" VARCHAR(255) NOT NULL,
  "first_name_am" VARCHAR(255) NOT NULL,
  "middle_name_am" VARCHAR(255) NOT NULL,
  "last_name_am" VARCHAR(255) NOT NULL,
  "image" VARCHAR(255) NOT NULL,
  "phone" INT NOT NULL,
  "sex" SEX NOT NULL,
  "student" Grade NOT NULL,
  "birth_date" date NOT NULL,
  "email" VARCHAR(255) UNIQUE NOT NULL,
  "occupation" VARCHAR(255) NOT NULL,
  "joined_date" date NOT NULL,
  "address_id" INT NOT NULL,
  "family_id" INT,
  "church_id" INT NOT NULL,
  "baptized" boolean NOT NULL
);

CREATE TABLE "ministries" (
  "ministry_id" INT PRIMARY KEY,
  "ministry_image" text NOT NULL,
  "ministry_name_en" VARCHAR(100) NOT NULL,
  "ministry_name_am" VARCHAR(100) NOT NULL,
  "leader_en" text[] NOT NULL,
  "leader_am" text[] NOT NULL,
  "agelgayoch_id" INT NOT NULL,
  "ministry_description_en" text NOT NULL,
  "ministry_description_am" text NOT NULL
);

CREATE TABLE "students" (
  "student_id" INT,
  "courses" COURSES NOT NULL,
  "agelgayoch_id" INT NOT NULL,
  "start_date" date NOT NULL,
  "end_date" date NOT NULL
);

CREATE TABLE "admins" (
  "admin_id" INT PRIMARY KEY,
  "member_id" INT NOT NULL,
  "username" VARCHAR(100) NOT NULL,
  "password" VARCHAR(250) NOT NULL
);

CREATE TABLE "navigation" (
  "navigation_id" INT PRIMARY KEY,
  "navigation_type" nav_type NOT NULL,
  "navigation_name_en" VARCHAR(250) NOT NULL,
  "navigation_name_am" VARCHAR(250) NOT NULL
);

CREATE TABLE "weekly_programme" (
  "programme_id" INT PRIMARY KEY,
  "programme_name_en" VARCHAR(250) NOT NULL,
  "programme_name_am" VARCHAR(250) NOT NULL,
  "ministry_id" INT NOT NULL,
  "programme_description_en" VARCHAR(250) NOT NULL,
  "programme_description_am" VARCHAR(250) NOT NULL,
  "day" VARCHAR(100) NOT NULL,
  "start_time" VARCHAR(50) NOT NULL,
  "end_time" VARCHAR(50) NOT NULL
);

CREATE TABLE "news" (
  "news_id" INT PRIMARY KEY,
  "news_name" VARCHAR(100) NOT NULL,
  "subtitel" VARCHAR(100) NOT NULL,
  "news_date" date NOT NULL,
  "news_description" text NOT NULL,
  "news_type" VARCHAR(250) NOT NULL
);

CREATE TABLE "blog" (
  "blog_id" INT PRIMARY KEY,
  "blog_image" text NOT NULL,
  "blog_titel_en" VARCHAR(100) NOT NULL,
  "blog_titel_am" VARCHAR(100) NOT NULL,
  "author_en" VARCHAR(100) NOT NULL,
  "author_am" VARCHAR(100) NOT NULL,
  "subtitel_en" VARCHAR(250) NOT NULL,
  "subtitel_am" VARCHAR(250) NOT NULL,
  "posted_date" date NOT NULL,
  "tag" VARCHAR(50) NOT NULL
);

CREATE TABLE "video" (
  "video_id" INT PRIMARY KEY,
  "video" text NOT NULL,
  "video_title" VARCHAR(250) NOT NULL,
  "video_description" VARCHAR(250) NOT NULL,
  "video_type" video_type NOT NULL,
  "series_name" VARCHAR(250) NOT NULL
);

ALTER TABLE "agelgayoch" ADD FOREIGN KEY ("member_id") REFERENCES "members" ("member_id");

ALTER TABLE "agelgayoch" ADD FOREIGN KEY ("role_id") REFERENCES "role" ("role_id");

ALTER TABLE "church" ADD FOREIGN KEY ("address_id") REFERENCES "address" ("address_id");

ALTER TABLE "church" ADD FOREIGN KEY ("agelgayoch_id") REFERENCES "agelgayoch" ("agelgayoch_id");

ALTER TABLE "members" ADD FOREIGN KEY ("address_id") REFERENCES "address" ("address_id");

ALTER TABLE "members" ADD FOREIGN KEY ("family_id") REFERENCES "families" ("family_id");

ALTER TABLE "members" ADD FOREIGN KEY ("church_id") REFERENCES "church" ("church_id");

ALTER TABLE "admins" ADD FOREIGN KEY ("member_id") REFERENCES "members" ("member_id");

ALTER TABLE "asrat" ADD FOREIGN KEY ("member_id") REFERENCES "members" ("member_id");

ALTER TABLE "ministries" ADD FOREIGN KEY ("agelgayoch_id") REFERENCES "agelgayoch" ("agelgayoch_id");

ALTER TABLE "weekly_programme" ADD FOREIGN KEY ("ministry_id") REFERENCES "ministries" ("ministry_id");
