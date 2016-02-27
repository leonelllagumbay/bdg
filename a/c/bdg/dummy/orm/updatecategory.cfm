<cfscript>

MyCategory = EntityLoadByPk( "Category", 2);
MyCategory.setTitle( "new title 2" );
EntitySave( MyCategory );

// ORMFlush();
// ORMClearSession();
// Enter transactions

/*
transaction {
	MyCategoryA = EntityLoadByPK( "Category", 1);
	MyCategoryA.setTitle( "" );

	// do some validation
	if ( MyCategoryA.getTitle() != "" ) {
		transaction action = "commit";
	} else {
		transaction action = "rollback";
	}
}
* */


</cfscript>