/**
 * EGRGLIVEBOARD
 *
 * @author LEONELL
 * @date 6/29/15
 **/
component accessors=true output=false persistent=true table="EGRGLIVEBOARD"
{
	property name="LIVEBOARDCODE" fieldtype="id";
	property name="LBTITLE";
	property name="LIVEBOARDDESC";
	property name="TABLECOLUMNS";
	property name="TABLEITEMCLS";
	property name="TABLEATTRS";
	property name="TABLETDATTRS";
	property name="TABLETRATTRS";
	property name="LBSTATUS";
	property name="WIDTH";
	property name="HEIGHT";
	property name="LBEXTRA";
	property name="LBLAYOUTEXTRA";
	property name="RECDATECREATED";
	property name="RECCREATEDBY";
	property name="EGRGLIVEBOARDITEM" cfc="EGRGLIVEBOARDITEM" type="array" fieldtype="one-to-many" fkcolumn="LIVEBOARDCODE" cascade="all-delete-orphan";
}