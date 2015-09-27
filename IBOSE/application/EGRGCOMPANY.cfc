/**
 * EGRGCOMPANY
 *
 * @author LEONELL
 * @date 5/13/15
 **/
component accessors=false output=false persistent=true table="EGRGCOMPANY" {
	property name="COMPANYCODE" fieldtype="id";
	property name="EGRGCOMPANYSETTINGS" cfc="EGRGCOMPANYSETTINGS" fieldtype="one-to-one" constrained="true" cascade="delete";
	property name="GLOBAL_DSN";
	property name="COMPANY_DSN";
	property name="SUBCO_DSN";
	property name="TRANSACT_DSN";
	property name="QUERY_DSN";
	property name="SITE_DSN";
	property name="VAR_DSN";
	property name="SUBNONCO_DSN";
}