CREATE TABLE "public.Branch_adress" (
	"branch_adr_id" serial NOT NULL,
	"country_id" serial NOT NULL,
	"region_id" serial NOT NULL,
	"city_id" serial NOT NULL,
	"street_id" serial(255) NOT NULL,
	"building_id" serial(255) NOT NULL,
	CONSTRAINT "Branch_adress_pk" PRIMARY KEY ("branch_adr_id","street_id","building_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.country" (
	"country_id" integer NOT NULL,
	"country_name" varchar(255) NOT NULL,
	CONSTRAINT "country_pk" PRIMARY KEY ("country_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.region" (
	"region_id" integer NOT NULL,
	"region_name" varchar(255) NOT NULL,
	CONSTRAINT "region_pk" PRIMARY KEY ("region_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.city" (
	"city_id" integer NOT NULL,
	"city_name" varchar(255) NOT NULL,
	CONSTRAINT "city_pk" PRIMARY KEY ("city_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.employee" (
	"emp_id" integer NOT NULL,
	"emp_name" serial(255) NOT NULL,
	"emp_lastname" varchar(255) NOT NULL,
	"emp_midlename" varchar(255) NOT NULL,
	"position_id" integer NOT NULL UNIQUE,
	"emp_salary" integer NOT NULL,
	"emp_branch_adress_id" integer NOT NULL,
	"emp_first_wd" DATE NOT NULL,
	"division_id" serial NOT NULL,
	CONSTRAINT "employee_pk" PRIMARY KEY ("emp_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.division" (
	"division_id" serial NOT NULL,
	"division_name_id" varchar(255) NOT NULL,
	"division_type_id" integer NOT NULL,
	CONSTRAINT "division_pk" PRIMARY KEY ("division_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.division type id" (
	"division_type_id" serial NOT NULL,
	"division_type_name" varchar(255) NOT NULL,
	CONSTRAINT "division type id_pk" PRIMARY KEY ("division_type_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.project_epm" (
	"project_id" integer NOT NULL,
	"emp_id" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.project_name" (
	"project_id" integer NOT NULL,
	"project_name" varchar(255) NOT NULL,
	CONSTRAINT "project_name_pk" PRIMARY KEY ("project_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.position" (
	"position_id" serial NOT NULL,
	"position_name" serial(255) NOT NULL,
	CONSTRAINT "position_pk" PRIMARY KEY ("position_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "country" ADD CONSTRAINT "country_fk0" FOREIGN KEY ("country_id") REFERENCES "Branch_adress"("country_id");

ALTER TABLE "region" ADD CONSTRAINT "region_fk0" FOREIGN KEY ("region_id") REFERENCES "Branch_adress"("region_id");

ALTER TABLE "city" ADD CONSTRAINT "city_fk0" FOREIGN KEY ("city_id") REFERENCES "Branch_adress"("city_id");

ALTER TABLE "employee" ADD CONSTRAINT "employee_fk0" FOREIGN KEY ("emp_branch_adress_id") REFERENCES "Branch_adress"("branch_adr_id");

ALTER TABLE "division" ADD CONSTRAINT "division_fk0" FOREIGN KEY ("division_id") REFERENCES "employee"("division_id");

ALTER TABLE "division type id" ADD CONSTRAINT "division type id_fk0" FOREIGN KEY ("division_type_id") REFERENCES "division"("division_type_id");

ALTER TABLE "project_epm" ADD CONSTRAINT "project_epm_fk0" FOREIGN KEY ("project_id") REFERENCES "project_name"("project_id");
ALTER TABLE "project_epm" ADD CONSTRAINT "project_epm_fk1" FOREIGN KEY ("emp_id") REFERENCES "employee"("emp_id");


ALTER TABLE "position" ADD CONSTRAINT "position_fk0" FOREIGN KEY ("position_id") REFERENCES "employee"("position_id");











