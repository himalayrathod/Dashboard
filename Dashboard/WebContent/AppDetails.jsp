

<%-- Displays the project task details --%>


<%@ page contentType="text/html" %>
<%@ page import="dashboard.*" %>

<%
String age = request.getParameter("prj");


     String col[][] =  DatabaseManager.getPrjActivityDetails(request.getParameter("prj"));  
int ctr = col.length; %>

<html>

	<style>
	
	#mainTable tr td
	{
		border: 1.5px solid gray;
		
		outline: thin solid;
		font-family: "Times New Roman", Times, serif;
	}
	
	#mainTable
	{
		background-color: #E3E3E3;
		
	}
	</style>
	
	
	<table id = "mainTable" align = "center">
		<tr style = "text-align: center; background-color: gray; font-size: 24px;">
			<td colspan = 9 style = "vertical-align: top; "><b><%=col[0][0]%></b></td>
		</tr>
		
		 <tr style = "background-color: gray;"> 
			 <td><b>FlowInstanceName</b></td>
			 <td><b>TaskName</b></td>
			 <td><b>TaskStatus</b></td>
			 <td><b>DateCreated</b></td>
			 <td><b>DateUpdated</b></td>
			 <td><b>GroupName</b></td>
			 <td><b>TaskUser</b></td>
			 <td><b>ReviewCycle</b></td>
			 <td><b>CompletedDays</b></td>
		 </tr>

		<% int sumOfCompletedDays = 0;%>
		
		<%for (int j = 0; j < ctr; j++) 
		{ 	
			if(col[j][6].equalsIgnoreCase("Applicant")) // if the groupName is "Applicant"
			{
				if(col[j][9] != null)
				{
					sumOfCompletedDays = Integer.parseInt(col[j][9]) + sumOfCompletedDays;
				}
		%>
			<tr style = "background-color: #1E90FF;">
				 <td><%=col[j][1]%> </td>
				 <td><%=col[j][2]%></td>
				 <td><%=col[j][3]%></td>
				 <td><%=col[j][4]%></td>
				 <td><%=col[j][5]%> </td>
				 <td><%=col[j][6]%></td>
				 <td><%=col[j][7]%></td>
				 <td><%=col[j][8]%></td>
				 <td><%=col[j][9]%> </td>
			</tr>
		<%
			}
			else if(col[j][3].equalsIgnoreCase("Pending")) // if the TaskStatus is "Pending"
			{
		%>
			<tr style = "color: #FF8080;">
				 <td><%=col[j][1]%> </td>
				 <td><%=col[j][2]%></td>
				 <td><%=col[j][3]%></td>
				 <td><%=col[j][4]%></td>
				 <td><%=col[j][5]%> </td>
				 <td><%=col[j][6]%></td>
				 <td><%=col[j][7]%></td>
				 <td><%=col[j][8]%></td>
				 <td><%=col[j][9]%> </td>
			</tr>
		<%
			} 
			else if(col[j][1].toLowerCase().contains("zoning"))
			{
		%>
			
				<tr style = "background-color: black;">
					<td colspan = 10>.</td>
				</tr>
				
				<tr style = "background-color: black;">
					<td colspan = 10 style = "color: white; text-aling: center;">Zoning</td>
				</tr>
				
				<tr>
					<td><%=col[j][1]%> </td>
					<td><%=col[j][2]%></td>
					<td><%=col[j][3]%></td>
					<td><%=col[j][4]%></td>
					<td><%=col[j][5]%> </td>
					<td><%=col[j][6]%></td>
					<td><%=col[j][7]%></td>
					<td><%=col[j][8]%></td>
					<td><%=col[j][9]%></td>
				</tr>
		<%
			}
			else // everything else 
			{
		%>
		
			<tr>
				 <td><%=col[j][1]%> </td>
				 <td><%=col[j][2]%></td>
				 <td><%=col[j][3]%></td>
				 <td><%=col[j][4]%></td>
				 <td><%=col[j][5]%> </td>
				 <td><%=col[j][6]%></td>
				 <td><%=col[j][7]%></td>
				 <td><%=col[j][8]%></td>
				 <td><%=col[j][9]%> </td>
			</tr>
			<%}%>	
		<%}%>

		<tr style = "text-align: right; background-color: gray;">
			<td colspan = 9>Applicant's Total Days Completed: <b><%=sumOfCompletedDays%></b></td>
		</tr>

	</table>
</html>








