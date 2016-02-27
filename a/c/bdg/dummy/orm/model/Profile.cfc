<cfcomponent hint="I model an Author Profile" accessors="false" output="false" persistent="true">
	<!--- identifier --->
	<cfproperty name="id" fieldtype="id" setter="false" column="profile_pk" generator="native">

	<!--- properties --->
	<cfproperty name="nickname" ormType="string" length="50">
	<cfproperty name="bio" ormtype="text">

	<!--- one-to-one relationship with Author --->
	<cfproperty name="author" fieldtype="one-to-one" cfc="Author" fkcolumn="fk_authorid">
</cfcomponent>