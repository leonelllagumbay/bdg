<cfscript>
MyCategory = EntityNew( "Category" );
MyCategory.setTitle( "Category B" );
EntitySave( MyCategory );
</cfscript>