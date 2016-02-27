<cfscript>
transaction {
	// load a Post
	SomePost = EntityLoadByPK( "Post", 3 );
	// load an Author
	SomeAuthor = EntityLoadByPK( "Author", 1 );

	// set the relationship
	SomePost.setAuthor( SomeAuthor );

}
WriteDump(SomeAuthor);
</cfscript>