

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.util.*"%>

<% String d[] = dashboard.DatabaseManager.getQueue(); 
String flowqueue[][] = dashboard.DatabaseManager.getWorkflowQueue(); 
String taskqueue[][] = dashboard.DatabaseManager.getPdoxTasksQueue(); 
%>






<table>
	<tr>
		<td>
			Current ProjectDox queue:  <b><%=d[1]%></b> tasks from <b><%=d[0]%></b> projects
		</td>
	</tr>
	<tr>
		<td>Queue Split</td>
	</tr>
	<tr>
		<td>
			<% for(int i = 0; i < flowqueue.length; i++) { %>
			<%=flowqueue[i][0] %> <b><%=flowqueue[i][2]%></b> tasks from <b><%=flowqueue[i][1] %></b> projects <br>
			<% } %>
		</td>
	</tr>
	<tr>
		<td>Task Queue Split</td>
	</tr>
	<tr>
		<td>
			<table border>
			<tr>
				<td>Task</td><td>SPR</td><td>DS</td><td>Zoning</td>
			</tr>
			<% for(int i = 0; i < taskqueue.length; i++) { %>
				<tr>
					<td><%if (taskqueue[i][0] !=null) {out.println(taskqueue[i][0]);} %>  </td> <td><b><%if (taskqueue[i][1] !=null) {out.println(taskqueue[i][1]);}%></b> </td> <td> <b><%if (taskqueue[i][2] !=null) {out.println(taskqueue[i][2]);} %></b> </td><td> <b><%if (taskqueue[i][3] !=null) {out.println(taskqueue[i][3]);} %></b> </td>
				</tr>
			<% } %>
			</table>
		</td>
	</tr>

</table>

