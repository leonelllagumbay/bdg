/**
 * EGRGTHEMES
 *
 * @author LEONELL
 * @date 5/13/15
 **/
component accessors=false output=false persistent=true table="EGRGTHEMES" {
	property name="COMPANYCODE" fieldtype="id";
	property name="EGRGCOMPANYSETTINGS" cfc="EGRGCOMPANYSETTINGS" fieldtype="one-to-one" constrained="true" cascade="delete";
	property name="DESCRIPTION";
	property name="COMPANYLOGO";
	property name="MYIBOSELOGO";
}