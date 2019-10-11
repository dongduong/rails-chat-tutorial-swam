-- -------------------------------------------------------------
-- TablePlus 2.0(200)
--
-- https://tableplus.com/
--
-- Database: postgres
-- Generation Time: 2019-10-10 23:46:33.6930
-- -------------------------------------------------------------


-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."ar_internal_metadata" (
    "key" varchar NOT NULL,
    "value" varchar,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("key")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS room_messages_id_seq;

-- Table Definition
CREATE TABLE "public"."room_messages" (
    "id" int8 NOT NULL DEFAULT nextval('room_messages_id_seq'::regclass),
    "room_id" int8,
    "user_id" int8,
    "message" text,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS rooms_id_seq;

-- Table Definition
CREATE TABLE "public"."rooms" (
    "id" int8 NOT NULL DEFAULT nextval('rooms_id_seq'::regclass),
    "name" varchar,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."schema_migrations" (
    "version" varchar NOT NULL,
    PRIMARY KEY ("version")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "id" int8 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    "email" varchar NOT NULL DEFAULT ''::character varying,
    "encrypted_password" varchar NOT NULL DEFAULT ''::character varying,
    "reset_password_token" varchar,
    "reset_password_sent_at" timestamp,
    "remember_created_at" timestamp,
    "username" varchar NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."ar_internal_metadata" ("key", "value", "created_at", "updated_at") VALUES ('environment', 'production', '2019-10-10 16:45:13.690651', '2019-10-10 16:45:13.690651');

INSERT INTO "public"."schema_migrations" ("version") VALUES ('20190404100700'),
('20190404102130'),
('20190404102347');

ALTER TABLE "public"."room_messages" ADD FOREIGN KEY ("room_id") REFERENCES "public"."rooms"("id");
ALTER TABLE "public"."room_messages" ADD FOREIGN KEY ("user_id") REFERENCES "public"."users"("id");
