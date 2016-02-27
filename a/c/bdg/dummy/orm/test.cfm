<cfscript>

//MyCategory = new model.Category();
MyCategory = EntityNew("Category");
MyPost = new model.Post();
WriteDump( MyCategory );
WriteDump( MyPost );

author = EntityNew( "Author" );
writeDump(author);

profile = EntityNew("Profile");
WriteDump(profile);

</cfscript>