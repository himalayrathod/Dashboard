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


     String col[][] =  DatabaseManager.getQueueAgeSplit(); 
int ctr = col.length; %>

<%out.println ("{"); %>
"taskByAge": [
<%for (int j = 0; j < ctr; j++) { %>
 <%out.println ("{"); %>
 "taskname": "<%=col[j][0]%>",
 "ct": "<%=col[j][1]%>", 
 "zeroTo4": "<%=col[j][2]%>",
 "fiveTo10": "<%=col[j][3]%>",
 "elevenTo15": "<%=col[j][4]%>",
 "sixteenTo20": "<%=col[j][5]%>",
 "twentyoneTo30": "<%=col[j][6]%>",
 "thirtyoneTo50": "<%=col[j][7]%>",
 "fiftyoneTo100": "<%=col[j][8]%>",
 "hundredandonePlus": "<%=col[j][9]%>",
  <%if (j < (ctr-1)) {out.println ("},");}  else {out.println ("}");}%>
<%}%>
<%out.println ("]"); %>
<%out.println ("}"); %>