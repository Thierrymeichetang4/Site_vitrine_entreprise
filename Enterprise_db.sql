/*==============================================================*/
/* Nom de SGBD :  PostgreSQL 8                                  */
/* Date de création :  16/04/2024 18:21:06                      */
/*==============================================================*/


/*==============================================================*/
/* Table : admin                                                */
/*==============================================================*/
create table admin (
   idadmin              serial                not null,
   iddemande            int4                 not null,
   pseudo               varchar(254)         null,
   password             varchar(254)         null,
   constraint pk_admin primary key (idadmin)
);

/*==============================================================*/
/* Index : admin_pk                                             */
/*==============================================================*/
create unique index admin_pk on admin (
idadmin
);

/*==============================================================*/
/* Index : association3_fk                                      */
/*==============================================================*/
create  index association3_fk on admin (
iddemande
);

/*==============================================================*/
/* Table : client                                               */
/*==============================================================*/
create table client (
   idclient             serial                 not null,
   nom                  varchar(254)         null,
   mail                 varchar(254)         null,
   telephone            int4                 null,
   constraint pk_client primary key (idclient)
);

/*==============================================================*/
/* Index : client_pk                                            */
/*==============================================================*/
create unique index client_pk on client (
idclient
);

/*==============================================================*/
/* Table : demandeservice                                       */
/*==============================================================*/
create table demandeservice (
   iddemande            serial                  not null,
   idclient             int4                 not null,
   description          varchar(254)         null,
   constraint pk_demandeservice primary key (iddemande)
);

/*==============================================================*/
/* Index : demandeservice_pk                                    */
/*==============================================================*/
create unique index demandeservice_pk on demandeservice (
iddemande
);

/*==============================================================*/
/* Index : association2_fk                                      */
/*==============================================================*/
create  index association2_fk on demandeservice (
idclient
);

alter table admin
   add constraint fk_admin_associati_demandes foreign key (iddemande)
      references demandeservice (iddemande)
      on delete restrict on update restrict;

alter table demandeservice
   add constraint fk_demandes_associati_client foreign key (idclient)
      references client (idclient)
      on delete restrict on update restrict;

