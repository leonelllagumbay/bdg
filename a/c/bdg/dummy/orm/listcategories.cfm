<cfscript>
Author = EntityLoad( "Author", 23 );
WriteDump( var=Author, label="Author Label" );

categories = EntityLoad( "Category", 2, TRUE );
writeDump( categories );

categories = EntityLoadByPK( "Category", 3 );
writeDump( categories );

// load published posts
posts = EntityLoad( "Post", { ispublished=true } );
writeDump(posts);

posts = EntityLoad( "Post", { ispublished=true }, "datepublished desc, title asc" );
writeDump(posts);

author = EntityLoad( "Author" );
writeDump(author);


</cfscript>

<!--- get category entities order by title --->
<cfset categories = EntityLoad( "Category", {}, "title" )>
<cfoutput>
	<ul>
		<cfloop array="#categories#" index="theCategory">
			<li>
				#theCategory.getTitle()#
			</li>
		</cfloop>
	</ul>
</cfoutput>