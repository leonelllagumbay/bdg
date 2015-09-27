/**
 * EGRGUSERGROUPS
 *
 * @author LEONELL
 * @date 5/13/15
 **/
component accessors=false output=false persistent=true table="EGRGUSERGROUPS" {
	property name="USERGRPID" fieldtype="id";
	property name="DESCRIPTION";
	property name="RECDATECREATED";
	property name="DATELASTUPDATE";
	property name="EGRGROLEINDEX" cfc="EGRGROLEINDEX" type="array" fieldtype="one-to-many" fkcolumn="USERGRPIDFK" cascade="all-delete-orphan";
}