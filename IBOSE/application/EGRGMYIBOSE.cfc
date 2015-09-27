/**
 * EGRGMYIBOSE
 *
 * @author LEONELL
 * @date 5/13/15
 **/
component accessors=false output=false persistent=true table="EGRGMYIBOSE" {
	property name="USERID" fieldtype="id";
	property name="EGRGUSERMASTER" cfc="EGRGUSERMASTER" fieldtype="one-to-one" constrained="true";
	property name="PERSONNELIDNO";
	property name="ISVISIBLE";
	property name="MYTHEME";
	property name="MYMESSAGE";
	property name="DEFAULTTHEME";
	property name="SIGNATURE";
	property name="AVATAR";
}