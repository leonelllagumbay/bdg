/**
 * EGINPMSEMP
 *
 * @author LEONELL
 * @date 8/12/15
 **/
component accessors=false output=false persistent=true table="EGINPMSEMP" {
	property name="PMSEMPCODE" fieldtype="id";
	property name="RATERCODEFK";
	property name="PERSONNELIDNO";
	property name="RECDATECREATED";
	property name="EGINPMSEMPKRA" cfc="EGINPMSEMPKRA" type="array" fieldtype="one-to-many" fkcolumn="PMSEMPCODEFK" cascade="all-delete-orphan";
}