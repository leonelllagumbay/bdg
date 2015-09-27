/**
 * EGINPMS
 *
 * @author LEONELL
 * @date 8/12/15
 **/
component accessors=false output=false persistent=true table="EGINPMS" {
	property name="PMSCODE" fieldtype="id";
	property name="PMSNAME";
	property name="FREQUENCY";
	property name="RECDATECREATED";
	property name="RECCREATEDBY";
	property name="EGINPMSRATER" cfc="EGINPMSRATER" type="array" fieldtype="one-to-many" fkcolumn="PMSCODEFK" cascade="all-delete-orphan";
	property name="EGINPMSCOMMENT" cfc="EGINPMSCOMMENT" type="array" fieldtype="one-to-many" fkcolumn="PMSCODEFK" cascade="all-delete-orphan";
}