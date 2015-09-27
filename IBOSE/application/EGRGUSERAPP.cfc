/**
 * EGRGUSERAPP
 *
 * @author LEONELL
 * @date 7/2/15
 **/
component accessors=false output=false persistent=true table="EGRGUSERAPP" {
	property name="APPID" fieldtype="id";
	property name="EGRGAPPREGION" cfc="EGRGAPPREGION" type="array" fieldtype="one-to-many" fkcolumn="APPIDFK" cascade="all-delete-orphan";
	property name="FOLDERIDFK";
	property name="TABIDFK";
	property name="OBJECTIDFK";
	property name="SCRIPTREQUIRES";
	property name="NAMEORTITLE";
	property name="APPORDER";
	property name="EXTNAMESPACE";
	property name="EXTCONTROLLERS";
	property name="URLIFNOTEXT";
	property name="APISCRIPTSOURCE";
	property name="APPICON";
	property name="EXTRACSS";
	property name="EXTRACODE";
	property name="PERSONNELIDNO";
	property name="APPROVED";
	property name="ACTIONBY";
	property name="EFORMID";
	property name="PROCESSID";
	property name="DATELASTUPDATE";
	property name="DATEACTIONWASDONE";
	property name="RECDATECREATED";
}