--------------------------------------------------------
-- Archivo creado  - domingo-abril-10-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ALUMNOS
--------------------------------------------------------

  CREATE TABLE "ALUMNOS" 
   (	"CODALUM" NUMBER, 
	"NOMALUM" VARCHAR2(30), 
	"FNAC" DATE, 
	"CURSO" VARCHAR2(25), 
	"SUSPENSOS" NUMBER(5,0)
   ) ;
--------------------------------------------------------
--  DDL for Table ASIGNATURAS
--------------------------------------------------------

  CREATE TABLE "ASIGNATURAS" 
   (	"CODASIG" NUMBER, 
	"NOMASIG" VARCHAR2(30), 
	"PROF" VARCHAR2(30), 
	"HORAS" NUMBER, 
	"CURSO" VARCHAR2(10), 
	"ANTERIOR" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table NOTAS
--------------------------------------------------------

  CREATE TABLE "NOTAS" 
   (	"CODALUM" NUMBER(8,0), 
	"CODASIG" NUMBER(8,0), 
	"NOTA" NUMBER(2,0)
   ) ;
REM INSERTING into ALUMNOS
SET DEFINE OFF;
Insert into ALUMNOS (CODALUM,NOMALUM,FNAC,CURSO,SUSPENSOS) values ('11345','Marta Díaz',to_date('12/12/91','DD/MM/RR'),'DAM1','0');
Insert into ALUMNOS (CODALUM,NOMALUM,FNAC,CURSO,SUSPENSOS) values ('10234','Luis Sanz',to_date('03/02/90','DD/MM/RR'),'ASIR1','2');
Insert into ALUMNOS (CODALUM,NOMALUM,FNAC,CURSO,SUSPENSOS) values ('11356','ANA López',to_date('05/04/90','DD/MM/RR'),'ASIR1',null);
Insert into ALUMNOS (CODALUM,NOMALUM,FNAC,CURSO,SUSPENSOS) values ('11404','Pedro SANZ',to_date('05/02/90','DD/MM/RR'),'DAM1','0');
Insert into ALUMNOS (CODALUM,NOMALUM,FNAC,CURSO,SUSPENSOS) values ('12033','LUIS Somalo',to_date('03/03/94','DD/MM/RR'),'DAM2',null);
Insert into ALUMNOS (CODALUM,NOMALUM,FNAC,CURSO,SUSPENSOS) values ('11358','Juan Vidal',to_date('02/02/95','DD/MM/RR'),'ASIR1',null);
Insert into ALUMNOS (CODALUM,NOMALUM,FNAC,CURSO,SUSPENSOS) values ('12100','Olga Martín',to_date('03/05/93','DD/MM/RR'),'DAM1',null);
Insert into ALUMNOS (CODALUM,NOMALUM,FNAC,CURSO,SUSPENSOS) values ('12101','Mario CAsas',to_date('05/07/92','DD/MM/RR'),'DAM1','1');
Insert into ALUMNOS (CODALUM,NOMALUM,FNAC,CURSO,SUSPENSOS) values ('12110','María Baez',to_date('13/11/89','DD/MM/RR'),'DAM2',null);
Insert into ALUMNOS (CODALUM,NOMALUM,FNAC,CURSO,SUSPENSOS) values ('12111','Ruth Velez',to_date('12/12/90','DD/MM/RR'),'DAM1',null);
REM INSERTING into ASIGNATURAS
SET DEFINE OFF;
Insert into ASIGNATURAS (CODASIG,NOMASIG,PROF,HORAS,CURSO,ANTERIOR) values ('10','GBD','Juan Bravo','5','ASIR1','12');
Insert into ASIGNATURAS (CODASIG,NOMASIG,PROF,HORAS,CURSO,ANTERIOR) values ('12','Lmarcas','Luisa Casado','3','ASIR1','11');
Insert into ASIGNATURAS (CODASIG,NOMASIG,PROF,HORAS,CURSO,ANTERIOR) values ('14','SOL','Andrés Ortiz','4','ASIR1',null);
Insert into ASIGNATURAS (CODASIG,NOMASIG,PROF,HORAS,CURSO,ANTERIOR) values ('20','SOP','Juan Bravo','5','ASIR1','14');
Insert into ASIGNATURAS (CODASIG,NOMASIG,PROF,HORAS,CURSO,ANTERIOR) values ('22','AdmBD','LUISA Martín','3','ASIR2','10');
Insert into ASIGNATURAS (CODASIG,NOMASIG,PROF,HORAS,CURSO,ANTERIOR) values ('13','Lmarcas','Luisa Casado','3','DAM1','11');
Insert into ASIGNATURAS (CODASIG,NOMASIG,PROF,HORAS,CURSO,ANTERIOR) values ('11','Inglés','Juan Bravo','2','ASIR1',null);
Insert into ASIGNATURAS (CODASIG,NOMASIG,PROF,HORAS,CURSO,ANTERIOR) values ('15','BD','Juan Bravo','6','DAM1','11');
REM INSERTING into NOTAS
SET DEFINE OFF;
Insert into NOTAS (CODALUM,CODASIG,NOTA) values ('10234','10','5');
Insert into NOTAS (CODALUM,CODASIG,NOTA) values ('10234','12','4');
Insert into NOTAS (CODALUM,CODASIG,NOTA) values ('11356','10','5');
Insert into NOTAS (CODALUM,CODASIG,NOTA) values ('11356','12','5');
Insert into NOTAS (CODALUM,CODASIG,NOTA) values ('10234','11','1');
Insert into NOTAS (CODALUM,CODASIG,NOTA) values ('12111','13','6');
Insert into NOTAS (CODALUM,CODASIG,NOTA) values ('11345','13','7');
Insert into NOTAS (CODALUM,CODASIG,NOTA) values ('12101','13','4');
Insert into NOTAS (CODALUM,CODASIG,NOTA) values ('12100','13','6');
Insert into NOTAS (CODALUM,CODASIG,NOTA) values ('12101','15','7');
Insert into NOTAS (CODALUM,CODASIG,NOTA) values ('12100','15','5');
Insert into NOTAS (CODALUM,CODASIG,NOTA) values ('11345','15','7');
Insert into NOTAS (CODALUM,CODASIG,NOTA) values ('11404','13','6');
Insert into NOTAS (CODALUM,CODASIG,NOTA) values ('11404','15','7');
--------------------------------------------------------
--  Constraints for Table NOTAS
--------------------------------------------------------

  ALTER TABLE "NOTAS" MODIFY ("NOTA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ASIGNATURAS
--------------------------------------------------------

  ALTER TABLE "ASIGNATURAS" ADD CONSTRAINT "ASIGNATURAS_PK" PRIMARY KEY ("CODASIG") ENABLE;
--------------------------------------------------------
--  Constraints for Table ALUMNOS
--------------------------------------------------------

  ALTER TABLE "ALUMNOS" ADD CONSTRAINT "ALUMNOS_PK" PRIMARY KEY ("CODALUM") ENABLE;
