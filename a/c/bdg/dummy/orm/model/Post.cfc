<cfcomponent accessors="false" output="false" persistent="true" table="posts"
	hint="I model a blog post using annotations
	      @persistent true
	      @table posts
	      ">
	<!--- identifier --->
	<cfproperty name="id" fieldtype="id" column="post_pk" generator="native"
				hint="
					@fieldtype id
					@column post_pk
					@generator native
				">

	<!--- properties --->
	<cfproperty name="title" length="150"
				hint="
					@ormtype string
					@length 150
				">
	<cfproperty name="content" ormtype="text">
	<cfproperty name="ispublished" ormtype="boolean">
	<cfproperty name="datepublished" ormtype="date">
	<cfproperty name="created" ormtype="timestamp">
	<cfproperty name="updated" ormtype="timestamp">

	<!--- many Post entities can have one Author entity --->
	<cfproperty name="Author" fieldtype="many-to-one" cfc="Author" fkcolumn="fk_authorid">

	<!--- define a many-to-many relationship with Category --->
	<cfproperty name="categories" fieldtype="many-to-many" cfc="Category"
				type="array" singularname="Category"
				fkcolumn="fk_postid" inversejoincolumn="fk_categoryid"
				linktable="posts_categories">
</cfcomponent>