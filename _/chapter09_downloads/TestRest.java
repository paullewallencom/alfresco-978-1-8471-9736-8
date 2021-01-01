package rest;
 



import java.util.ResourceBundle;

import org.restlet.Client;
import org.restlet.data.ChallengeResponse;
import org.restlet.data.ChallengeScheme;
import org.restlet.data.Method;
import org.restlet.data.Protocol;
import org.restlet.data.Request;
import org.restlet.data.Response;
import org.restlet.data.Status;


/**
*This class is Responsible for getting content from Alfresco.To run this code you need have jars of restlet API
* @author Rupesh Sawaliya
*
*/
public class TestRest {
 
	
	public static String USER_NAME="username";
	public static String PASSWORD="password";
	public static String REST_BUNDLE="restresource";
	public static String URL="url";
	/**
	 * This Method is making a call to webscript through Rest API
	 */
	public String getContent()
	{
		String _urlString=ResourceBundle.getBundle(REST_BUNDLE).getString(URL);
		
		System.out.println("This is the url correct: " + _urlString);
		String _content = null;
		try
		{
			Request _request = new Request(Method.GET, _urlString);
			_request.setChallengeResponse(new ChallengeResponse(ChallengeScheme.HTTP_BASIC, ResourceBundle.getBundle(REST_BUNDLE).getString(USER_NAME), ResourceBundle.getBundle(REST_BUNDLE).getString(PASSWORD)));
          
          Response _response = new Client(Protocol.HTTP).handle(_request);
          if(_request.getChallengeResponse() != null)
          	System.out.println("request.getChallengeResponse().getCredentials() :-> "+_request.getChallengeResponse().getCredentials());

          if (_response.getStatus().isSuccess()) 
          {
             
          	if(_response!=null)
              _content=_response.getEntity().getText();
          	else
              System.out.println("CONTENT :" + _content);
          } 
          else if (_response.getStatus().equals(Status.CLIENT_ERROR_UNAUTHORIZED)) 
          {
          	System.out.println("TestRest.java: Unauthorized access");
          } 
          else 
          {
          	System.out.println("TestRest.java: Unexpected status");
         }
		}
		catch (Exception _exception)
		{
			_exception.printStackTrace();
			//return rets;
		}
		
		return _content;
		
	} 
	
	
	
	public static void main(String[] _args) {
		TestRest testRest= new TestRest();
		System.out.println(testRest.getContent());
	}
	
	
}