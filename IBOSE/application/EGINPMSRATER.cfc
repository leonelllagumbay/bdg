/**
 * EGINPMSRATER
 *
 * @author LEONELL
 * @date 8/12/15
 **/
component accessors=false output=false persistent=true table="EGINPMSRATER" {
	property name="RATERCODE" fieldtype="id";
	property name="PMSCODEFK";
	property name="RATERPID";
	property name="EGINPMSEMP" cfc="EGINPMSEMP" type="array" fieldtype="one-to-many" fkcolumn="RATERCODEFK" cascade="all-delete-orphan";
}