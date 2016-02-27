<cfscript>
transaction {
	MyProfile = EntityNew( "Profile" )	;
	MyProfile.setNickname( "Onel" );
	MyProfile.setBio( "Age: 36" );

	MyAuthor  = EntityNew( "Author" );
	MyAuthor.setFirstname("Leonell");

	MyProfile.setAuthor( MyAuthor );

	EntitySave( MyProfile );
	EntitySave( MyAuthor );

}
WriteDump( MyProfile );
</cfscript>