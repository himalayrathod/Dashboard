<%
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", 0); // prevents caching at the Proxy cache
%>

<%-- Created for AJAX/JSON loading of Project Names --%>


<%@ page contentType="text/plain" %>
<%@ page import="dashboard.*" %>

<%
String age = request.getParameter("range");
String[] temp = age.split("-");

String col[][] =  DatabaseManager.getPrjNameForTaskAndAge(request.getParameter("tname"), Integer.parseInt(temp[0]), Integer.parseInt(temp[1]));  
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
 "HeaderName": "<%="Task Age"%>",
 "Range": "<%=age%>",
 <%if (j < (ctr-1)) {out.println ("},");}  else {out.println ("}");}%>
<%}%>
<%out.println ("]"); %>
<%out.println ("}"); %>