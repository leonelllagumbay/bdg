/**
 * Preview
 *
 * @author LEONELL
 * @date 3/31/15
 **/
component accessors=true output=false persistent=false ExtDirect="true" {
	public struct function getFormDefinition(required string querycode) ExtDirect="true" {

		var returnedStruct = StructNew();
		return returnedStruct;
	}
}
