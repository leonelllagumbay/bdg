<cfscript>
transaction
{
	// create a new Author
	/*SomeAuthor = EntityNew( "Author" );
	SomeAuthor.setFirstName( "John" );
	SomeAuthor.setLastName( "Whish" );*/

	// get an existing author
	SomeAuthor = EntityLoadByPK( "Author", 1 );

	// create a new Post
	SomePostC = EntityNew( "Post" );
	SomePostC.setTitle( "Post A" );
	SomePostC.setContent( "Lorem ipsum dolor amet a." );
	SomePostC.setIsPublished( true );
	SomePostC.setDatePublished( Now() );
	//EntitySave( SomePost );

	// create a new Post
	SomePostD = EntityNew( "Post" );
	SomePostD.setTitle( "Post C" );
	SomePostD.setContent( "Lorem ipsum dolor amet b." );
	SomePostD.setIsPublished( true );
	SomePostD.setDatePublished( Now() );
	//EntitySave( SomePost );

	EntitySave( SomePostC );
	EntitySave( SomePostD );

	// add the Post to the Author
	//SomeAuthor.addPost( SomePost );

	// set the Author posts
	postsArray = [ SomePostC, SomePostD ];
	SomeAuthor.setPosts( postsArray );


	// save the new Author
	//EntitySave( SomeAuthor );

	// save the new Post
	//EntitySave( SomePost );
}

WriteDump( SomeAuthor );
</cfscript>