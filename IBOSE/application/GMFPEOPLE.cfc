/**
 * GMFPEOPLE
 *
 * @author LEONELL
 * @date 5/13/15
 **/
component accessors=false output=false persistent=true table="GMFPEOPLE" {
	property name="USERID" fieldtype="id";
	property name="EGRGUSERMASTER" cfc="EGRGUSERMASTER" fieldtype="one-to-one" constrained="true";
	property name="SALUTATION";
	property name="FIRSTNAME";
	property name="MIDDLENAME";
	property name="GUID";
	property name="LASTNAME";
	property name="NICKNAME";
	property name="SUFFIX";
	property name="PAGIBIGNUMBER";
	property name="SSSNUMBER";
	property name="TIN";
	property name="RECCREATEDBY";
	property name="RECDATECREATED";
	property name="DATELASTUPDATE";
	property name="HOTLINE";
	property name="HOTLINEPHONE";
	property name="COMPANYCODE";
	property name="SUBCOMPANYCODE";
	property name="HOTLINECELLPHONE";
	property name="HOTLINEFAX";
	property name="HOTLINEEMAIL";
	property name="MEMO";
	property name="ISACTIVE";

}