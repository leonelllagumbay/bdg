<cfscript>
MyCategory = EntityLoadByPk( "Category", 1 );
EntityDelete( MyCategory );

StructDelete( variables, "MyCategory" );
</cfscript>