/**
 * EGRGUSERMASTER
 *
 * @author LEONELL
 * @date 5/13/15
 **/
component accessors=false output=false persistent=true table="EGRGUSERMASTER" {
	property name="USERID" fieldtype="id";
	property name="GMFPEOPLE" cfc="GMFPEOPLE" fieldtype="one-to-one" cascade="delete";
	property name="EGRGMYIBOSE" cfc="EGRGMYIBOSE" fieldtype="one-to-one" cascade="delete";
	property name="USERTYPE";
	property name="PROFILENAME";
	property name="GUID";
	property name="MAXDRIVESIZE";
	property name="DISABLEACCOUNT";
	property name="PASSWORD";
	property name="DATEPASSWORD";
	property name="PASSQUESTION";
	property name="PASSANSWER";
	property name="CHANGEPWDNEXTLOGON";
	property name="CANNOTCHANGEPWD";
	property name="PWDNEVEREXPIRES";
	property name="USERCANRESETUSING";
	property name="MAXPASSWORDAGE";
	property name="MINPASSWORDAGE";
	property name="MINPASSWORDLENGTH";
	property name="PWDMUSTMEETCOMPLEXITY";
	property name="ACCOUNTLOCKOUTDURATION";
	property name="ACCOUNTLOCKOUTTHRESHHOLD";
	property name="RESETACCOUNTLOCKOUTCOUNTERAFTER";
	property name="RESETPASSWORD";
	property name="SETNEWPASSWORD";
	property name="PWDCOUNTFAILEDATTEMPT";
	property name="DATELASTFAILEDATTEMPT";
	property name="GOOGLEEMAIL";
	property name="DATELASTUPDATE";
	property name="RECDATECREATED";
	property name="DEFAULTAPPID";
	property name="NOOFERRLOGINS";
	property name="NOOFLOGIN";
	property name="ALTERNATEAPPROVER";
	property name="LOGINCOUNTER";
	property name="OLDPASSWORD";
	property name="ISLOGGEDIN";
	property name="ADUSERNAME";

}