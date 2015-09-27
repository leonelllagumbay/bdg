/**
 * EGRGFILE
 *
 * @author LEONELL
 * @date 5/13/15
 **/
component accessors=false output=false persistent=true table="EGRGFILE" {
	property name="FILEID" fieldtype="id";
	property name="FILENAME";
	property name="FILEEXTENSION";
	property name="FILECAPTION";
	property name="SORTORDER";
	property name="OBJECTIDFK";
	property name="FOLDERIDFK";
	property name="FILESIZE";
	property name="RECCREATEDBY";
	property name="RECDATECREATED";
	property name="DATELASTUPDATE";
	property name="DATEACTIONWASDONE";
	property name="PERSONNELIDNO";
	property name="APPROVED";
	property name="ACTIONBY";
	property name="EFORMID";
	property name="PROCESSID";
	property name="EGRTSHAREDFILE" type="array" fieldtype="one-to-many" cfc="EGRTSHAREDFILE" fkcolumn="FILEID";
	property name="EGRTGROUPSHAREDFILE" type="array" fieldtype="one-to-many" cfc="EGRTGROUPSHAREDFILE" fkcolumn="FILEID";
}