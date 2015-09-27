/**
 * EGRGFOLDER
 *
 * @author LEONELL
 * @date 5/13/15
 **/
component accessors=false output=false persistent=true table="EGRGFOLDER" {
	property name="FOLDERID" fieldtype="id";
	property name="OBJECTIDFK";
	property name="FOLDERNAME";
	property name="FOLDERHINT";
	property name="PARENTFOLDERID";
	property name="FOLDERORDER";
	property name="FOLDERDEPTH";
	property name="FOLDERURL";
	property name="EXTRAS";
	property name="REMOVABLE";
	property name="PERSONNELIDNO";
	property name="APPROVED";
	property name="ACTIONBY";
	property name="EFORMID";
	property name="PROCESSID";
	property name="DATELASTUPDATE";
	property name="DATEACTIONWASDONE";
	property name="RECDATECREATED";
	property name="EGRGFILE" cfc="EGRGFILE" type="array" fieldtype="one-to-many" fkcolumn="FOLDERIDFK" cascade="all-delete-orphan";
}