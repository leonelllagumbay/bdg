/**
 * EGRGCOMPANYSETTINGS
 *
 * @author LEONELL
 * @date 5/13/15
 **/
component accessors=false output=false persistent=true table="EGRGCOMPANYSETTINGS" {
	property name="COMPANYCODE" fieldtype="id";
	property name="EGRGCOMPANY" cfc="EGRGCOMPANY" fieldtype="one-to-one" constrained="true" cascade="delete";
	property name="EGRGTHEMES" cfc="EGRGTHEMES" fieldtype="one-to-one" constrained="true" cascade="delete";
	property name="GRGCOMPANY" cfc="GRGCOMPANY" fieldtype="one-to-one" constrained="true" cascade="delete";
	property name="DESCRIPTION";
	property name="SLOGAN";
	property name="WEBSITEEMAILADD";
	property name="HOMEPAGE";
	property name="COMPANYTHEME";
	property name="ISACTIVE";
	property name="DBMS";
	property name="DBMSVERSION";
	property name="WEBDOMAIN";
	property name="TEMPLATECODE";
	property name="TEMPLATEDATACODE";
	property name="COMPANYDEFAULTAPP";
	property name="UNSTRUCDATALOC";
	property name="UNSTRUCTDATAMAP";
	property name="MAILSERVER";
	property name="EMAILUSERNAME";
	property name="EMAILPASSWORD";
	property name="EMAILTIMEOUT";
	property name="EMAILPORT";
	property name="EMAILUSETLS";
	property name="EMAILUSESSL";
	property name="EMAILTYPE";
	property name="LDAPSERVER";
	property name="LDAPPORT";
	property name="LDAPTIMEOUT";
	property name="LDAPSTARTROW";
	property name="LDAPSTART";
	property name="LDAPATTRIBUTES";
	property name="LDAPFILTERCONDITIONS";
	property name="LDAPSORTCONTROL";
	property name="LDAPSEPARATOR";
	property name="LDAPSECURE";
	property name="LDAPSCOPE";
	property name="LDAPRETURNASBINARY";
	property name="LDAPREFERRAL";
	property name="LDAPREBIND";
	property name="LDAPNAME";
	property name="LDAPMAXROWS";
	property name="LDAPFILTER";
	property name="LDAPDN";
	property name="LDAPDELIMITER";
	property name="LDAPSORT";
	property name="MOODLELOC";
	property name="OPENMEETINGSLOC";
	property name="EROOMSSERVER";
	property name="XMLPOPMAILSERVER";
	property name="XMLPOPMAILUSERNAME";
	property name="XMLPOPMAILPASSWORD";
	property name="WITHATTENDANCE";
	property name="WITHATTENDANCELOG";
	property name="DATELASTUPDATE";
	property name="RECDATECREATED";
}