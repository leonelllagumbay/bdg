/**
 * EGINPMSEMPKRA
 *
 * @author LEONELL
 * @date 8/12/15
 **/
component accessors=false output=false persistent=true table="EGINPMSEMPKRA" {
	property name="KRACODE" fieldtype="id";
	property name="PMSEMPCODEFK";
	property name="ASSESSMENTPERIODFROM";
	property name="ASSESSMENTPERIODTO";
	property name="PURPOSEOFPA";
	property name="OTHERCOMMENTS";
	property name="EGINPMSEMPKRAITEMS" cfc="EGINPMSEMPKRAITEMS" type="array" fieldtype="one-to-many" fkcolumn="KRACODEFK" cascade="all-delete-orphan";
	property name="EGINPMSEMPBA" cfc="EGINPMSEMPBA" type="array" fieldtype="one-to-many" fkcolumn="KRACODEFK" cascade="all-delete-orphan";
	property name="EGINPMSEMPCP" cfc="EGINPMSEMPCP" type="array" fieldtype="one-to-many" fkcolumn="KRACODEFK" cascade="all-delete-orphan";
	property name="EGINPMSEMPOPR" cfc="EGINPMSEMPOPR" type="array" fieldtype="one-to-many" fkcolumn="KRACODEFK" cascade="all-delete-orphan";

}