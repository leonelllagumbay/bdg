component
{
	public void function setGlobalSettings()
	{
		try
        {
        	if(Not isdefined("session.global_dsn")) {

        		Settings = StructNew();

				GlobalSettings = CreateObject("component","globalsettings.Config");
				Settings = GlobalSettings.getInitConfig();

				applicationName = Settings["MAIN_APPLICATION_NAME"];
				applicationVersion = Settings["APPLICATION_VERSION"];
				globalDatabase = Settings["GLOBAL_DATABASE_NAME"];
				session.global_dsn = Settings["GLOBAL_DATABASE_NAME"];
				dateInstalled = Settings["DATE_INSTALLED"];
				dateUnInstalled = Settings["DATE_UNINSTALLED"];
				expirationDate = Settings["EXPIRATION_DATE"];
				dateNofityBeforeExp = Settings["DATE_NOTIF_BEFORE_EXP"];
				emailToExp = Settings["EXPIRATION_NOTIF_TO"];
				licensedToCompany = Settings["COMPANY_LICENSED_TO"];
				dbms = Settings["MAIN_DBMS"];
				session.dbms = Settings["MAIN_DBMS"];
				dbmsversion = Settings["DBMS_VERSION"];
				session.dbmsversion = Settings["DBMS_VERSION"];
				appMaxUsers = Settings["MAX_APP_USER"];
				appMaxSignedIn = Settings["MAX_SIGNEDIN_USER"];
				appSignature = Settings["GLOBAL_APP_SIGNATURE"];
				defaultCompany = Settings["DEFAULT_COMPANY"];
				/**session.companycode or client.companycode will be replaced upon login to a different company.
				*  This is useful for remembering the user's company cover page.
				* */
				session.companycode=defaultCompany;
				client.companycode=defaultCompany;
				superUserName = Settings["SUPER_USER_NAME"];
				comment = Settings["COMMENTS"];
				unDBpathmapping = Settings["UNDBPATHMAPPING"];
				session.unDBpathmapping = Settings["UNDBPATHMAPPING"];

				expirationDate = dateformat(expirationDate, "YYYY-MM-DD");
				datenow = dateformat(now(), "YYYY-MM-DD");

				diff = dateDiff("d", datenow, expirationDate);
				diffB = dateDiff("d", datenow, dateNofityBeforeExp);

				if(diff < 0) {
					savecontent variable="mailBody"{
		                WriteOutput("#licensedToCompany# iBOS/e expires on #expirationDate#");
		            }
					mailObj = new mail();
					mailObj.setFrom("leonelllagumbay@gmail.com");
					mailObj.setTo("#emailToExp#");
					mailObj.setSubject("#licensedToCompany# iBOS/e expires");
					mailObj.send(body=mailBody);

					throw (message = "OR product has reached the expiration date.", type = "Contract", detail="Product is expired. Please renew the product to continue the service.");
				} else if(diffb < 0) {
					savecontent variable="mailBody"{
		                WriteOutput("#licensedToCompany# iBOS/e product will expire on #expirationDate#");
		            }
					mailObj = new mail();
					mailObj.setFrom("leonelllagumbay@gmail.com");
					mailObj.setTo("#emailToExp#");
					mailObj.setSubject("#licensedToCompany# iBOS/e product will expire on #expirationDate#");
					mailObj.send(body=mailBody);
				} else {
					//check if max user login was reached;
					//appMaxSignedIn
				}
			}
        }
        catch(Any e)
        {
        	throw (message = "App config error: Global settings are undefined! #e.message#", type = "Setting", detail="App config error: Global settings are undefined! #e.message#");
        }

    }

}