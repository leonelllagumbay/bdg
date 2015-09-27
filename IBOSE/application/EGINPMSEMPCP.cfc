/**
 * EGINPMSEMPCP
 *
 * @author LEONELL
 * @date 8/12/15
 **/
component accessors=false output=false persistent=true table="EGINPMSEMPCP" {
	property name="CPCODE" fieldtype="id";
	property name="KRACODEFK";
	property name="STRENGTHS";
	property name="CAREERPATHSHORTTERM";
	property name="CAREERPATHMEDIUMTERM";
	property name="CAREERPATHLONGTERM";
	property name="COMMENTS";
	property name="EGINPMSEMPCPITEMS" cfc="EGINPMSEMPCPITEMS" type="array" fieldtype="one-to-many" fkcolumn="CPCODEFK" cascade="all-delete-orphan";
}