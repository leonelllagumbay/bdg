<cfcomponent hint="I model an Author" accessors="false" output="false" persistent="true">
	<cfproperty name="id" fieldtype="id" setter="false" column="author_pk" generator="native">
	<cfproperty name="firstname" length="50" default="Leonell">
	<cfproperty name="lastname" length="50" default="Lagumbay">
	<!--- one Author can have many Posts --->
	<cfproperty name="posts" fieldtype="one-to-many" cfc="Post" fkcolumn="fk_authorid" type="array"
				singularname="post" orderby="datepublished desc">

	<!--- define a one-to-one relationship with Profile --->
	<cfproperty name="profile" fieldtype="one-to-one" cfc="Profile" mappedby="author">

	<cffunction name="init" returntype="Any">
		<cfset variables.firstname = "" />
		<cfset variables.lastname = "" />
		<cfset variables.posts = [ ] />
	</cffunction>
</cfcomponent>