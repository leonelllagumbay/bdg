/**
 * EGINPMSCOMMENT
 *
 * @author LEONELL
 * @date 8/12/15
 **/
component accessors=false output=false persistent=true table="EGINPMSCOMMENT" {
	property name="COMMENTCODE" fieldtype="id" generator="native";
	property name="PMSCODEFK";
	property name="FROMUSERID";
	property name="TOUSERID";
	property name="CONTENT";
	property name="RECDATECREATED";
}