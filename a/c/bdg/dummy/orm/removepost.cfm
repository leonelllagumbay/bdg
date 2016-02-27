<cfscript>
transaction
{
	// get an existing Author
	SomeAuthor = EntityLoadByPK( "Author", 1 );

	// get an existing Post
	SomePost = EntityLoadByPK( "Post", 8 );

	SomeAuthor.removePost( SomePost );

}

WriteDump( SomeAuthor );
</cfscript>