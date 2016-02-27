<cfcomponent accessors="false" output="false" persistent="true" table="categories" hint="I model a blog category">
	<!--- identifier --->
	<cfproperty name="id" fieldtype="id" generator="native" column="category_pk" setter="false">
	<!--- properties --->
	<cfproperty name="title" length="100">

	<!--- many categories can have many posts --->
	<cfproperty name="posts" fieldtype="many-to-many" cfc="Post"
				type="array" singularname="post" orderby="datepublished desc"
				linktable="posts_categories"
				fkcolumn="fk_categoryid"
				inversejoincolumn="fk_postid">
</cfcomponent>