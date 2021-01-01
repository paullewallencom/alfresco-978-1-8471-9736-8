package com.ccs.credential.postgre;
import org.alfresco.webservice.authentication.AuthenticationFault;
import org.alfresco.webservice.types.NamedValue;
import org.alfresco.webservice.types.Store;
import org.alfresco.webservice.util.AuthenticationUtils;
import org.alfresco.webservice.util.Constants;
import org.alfresco.webservice.util.WebServiceFactory;
import org.alfresco.webservice.administration.NewUserDetails;
/**
 * create user through webservice
 * @author Amita Bhandari
 *
 */
public class TestUserWebServices
{
    protected static Store store;
    private String userName = null;
    private String password = null;
    public static void main(String args[]) throws Exception
    {
        try
        {
            AuthenticationUtils.startSession("admin", "admin");
            TestUserWebServices test = new TestUserWebServices();
            test.createUsers();
        } catch (AuthenticationFault e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
    
    private void createUsers() throws Exception
    {
        this.userName = "amiranda" ;
        this.password ="amiranda";
        Store store = new Store(Constants.WORKSPACE_STORE, "SpacesStore");
        String homeFolder = store.getScheme() + "://" + store.getAddress() + "/app:company_home/app:user_homes"  ;      
        NewUserDetails[] newUsers = new NewUserDetails[] {
                new NewUserDetails(
                        this.userName, 
                        this.password,
                        createPersonProperties(homeFolder, "Amy", "Jane", "Miranda", "amiranda@localhost.com", "cignex"))};

        // Create the new users
        WebServiceFactory.getAdministrationService().createUsers(newUsers);
    }
    
    private NamedValue[] createPersonProperties(
            String homeFolder,
            String firstName, 
            String middleName, 
            String lastName, 
            String email,
            String orgId)
    {
        // Create the new user objects
        return new NamedValue[] {
                new NamedValue(Constants.PROP_USER_HOMEFOLDER, false, homeFolder, null),
                new NamedValue(Constants.PROP_USER_FIRSTNAME, false, firstName, null),
                new NamedValue(Constants.PROP_USER_MIDDLENAME, false, middleName, null),
                new NamedValue(Constants.PROP_USER_LASTNAME, false, lastName, null),
                new NamedValue(Constants.PROP_USER_EMAIL, false, email, null),
                new NamedValue(Constants.PROP_USER_ORGID, false, orgId, null) };
    }
    
}
