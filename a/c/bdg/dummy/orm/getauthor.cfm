<cfscript>
// load a Post
SomePost = EntityLoadByPK( "Post", 1 );

// has it got an Author?
if ( SomePost.hasAuthor() ) {
	// show the Author
	WriteDump( SomePost.getAuthor() );

} else {
	WriteDump( "Post has no Author" );

}
</cfscript>