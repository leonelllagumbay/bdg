/**
 * GRGCOMPANY
 *
 * @author LEONELL
 * @date 5/13/15
 **/
component accessors=false output=false persistent=true table="GRGCOMPANY" {
	property name="COMPANYCODE" fieldtype="id";
	property name="EGRGCOMPANYSETTINGS" cfc="EGRGCOMPANYSETTINGS" fieldtype="one-to-one" constrained="true" cascade="delete";
	property name="ADDRESS";
	property name="COMPANYNAME";
	property name="BANKACCOUNTNOPBG";
	property name="BANKACCOUNTNOSSS";
	property name="BANKACCOUNTNOWTAX";
	property name="BANKCODEFORPBG";
	property name="BANKCODEFORSSS";
	property name="BANKCODEFORWTAX";
	property name="BUSINESSUNITCODE";
	property name="CITY1";
	property name="CITY2";
	property name="COMPANYORDER";
	property name="COMPANYTAG";
	property name="FAXNUMBER";
	property name="INDUSTRY";
	property name="SSSNUMBER";
	property name="NHIPNUMBER";
	property name="TELNUMBER1";
	property name="TELNUMBER2";
	property name="TELNUMBER3";
	property name="TIN";
	property name="DECLARANTNAME";
	property name="DECLARANTPOSITION";
	property name="RDOCODE";
	property name="ZIPCODE";
	property name="RRTREE";
	property name="SECTIONCODE";
	property name="SSSEDIBRANCHCODE";
	property name="SSSEDILOCCODE";
	property name="DRIVERNAME";
	property name="DATALOCATIONCODE";
	property name="RECDATECREATED";
}