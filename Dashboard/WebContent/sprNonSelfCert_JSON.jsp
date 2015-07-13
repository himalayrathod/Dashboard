<%
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", 0); // prevents caching at the Proxy cache
%>

<%-- FOR AJAX/JSON loading of the Time To Permit Breakdown of Task for Self Cert Projects
Used for the loading the results seamlessly to the the DIV in the dashboard main page
--%>



<%@ page contentType="text/plain" %>
<%@ page import="dashboard.*" %>

<%


     String col[][] =  DatabaseManager.getT2P_SPR_NonSelfCert(); 
int ctr = col.length; %>

<%out.println ("{"); %>
"t2pspr": [
<%for (int j = 0; j < ctr; j++) { %>
 <%out.println ("{"); %>
 "taskname": "<%=col[j][0]%>",
 "avgtm": "<%=col[j][1]%>", 
 "ct": "<%=col[j][2]%>",
 "t2p": "<%=col[j][3]%>",
 "ordr": "<%=col[j][4]%>",
 <%if (j < (ctr-1)) {out.println ("},");}  else {out.println ("}");}%>
<%}%>
<%out.println ("]"); %>
<%out.println ("}"); %>