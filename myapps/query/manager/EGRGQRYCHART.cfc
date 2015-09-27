/**
 * EGRGQRYCHART
 *
 * @author LEONELL
 * @date 3/28/15
 **/
component accessors=true output=false persistent=true table="EGRGQRYCHART" {
	property name="CHARTCODE" fieldtype="id" generator="native";
	property name="EQRYCODE";
	property name="CHARTLABEL";
	property name="BOXFILL";
	property name="BOXSTROKE";
	property name="BOXSTROKEWIDTH";
	property name="BOXZINDEX";
	property name="ITEMSPACING";
	property name="LABELCOLOR";
	property name="LABELFONT";
	property name="LEGENDPOSITION";
	property name="CHARTUPDATE";
	property name="VISIBLE";
	property name="X";
	property name="Y";
	property name="ALLOWFUNCTIONS";
	property name="DEFAULTSORTDIRECTION";
	property name="LEGENDITEMLISTENERS";
	property name="SORTROOT";
	property name="SORTERS";
	property name="MASK";
	property name="CHARTEXTRA";
	property name="EGRGQRYCHARTAXIS" cfc="EGRGQRYCHARTAXIS" type="array" fieldtype="one-to-many" fkcolumn="EQRYCODEFK" cascade="all-delete-orphan";
	property name="EGRGQRYCHARTSERIES" cfc="EGRGQRYCHARTSERIES" type="array" fieldtype="one-to-many" fkcolumn="EQRYCODEFK" cascade="all-delete-orphan";
}