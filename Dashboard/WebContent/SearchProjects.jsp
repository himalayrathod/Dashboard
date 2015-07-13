<%
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", 0); // prevents caching at the Proxy cache
%>

<%-- Created for AJAX/JSON loading of Project Names --%>


<%@ page contentType="text/plain" %>
<%@ page import="dashboard.*" %>

<%


String searchThis = request.getParameter("tname");

String col[][] =  DatabaseManager.getPrjActivityDetails(request.getParameter("tname"));  
int ctr = col.length;
%>


<%out.println ("{"); %>
"tap": [
<%for (int j = 0; j < ctr; j++) { %>
 <%out.println ("{"); %>
 "Name": "<%=col[j][0]%>",
 "TaskName": "<%=col[j][1]%>", 
 "ProjectID": "<%=col[j][2]%>",
 "Dif": "<%=col[j][3]%>",
 "HeaderName": "<%="Search Project"%>",
 "SearchName": "<%=searchThis%>",
 <%if (j < (ctr-1)) {out.println ("},");}  else {out.println ("}");}%>
<%}%>
<%out.println ("]"); %>
<%out.println ("}"); %>