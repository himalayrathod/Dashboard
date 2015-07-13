

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.util.*"%>

<% String d[][] = dashboard.DatabaseManager.getT2P_SPR_SelfCert();  
   String n[][] = dashboard.DatabaseManager.getT2P_SPR_NonSelfCert();  
   String c[][] = dashboard.DatabaseManager.getT2P_All();  
   Double t2p_sc =0.0;
   Double t2p_spr =0.0;
   Double t2p_All = 0.0;
%>


<form id = "table_selection"
	  onClick = "table_selected()" >


		   	
	<table>
		<tr> 
			<td>
			<br>
		
			<b>All Non-Self Cert Average Times</b>
			<input type = "radio"
				   name = "tableButtons"
				   id = "table3Button" checked>
			<br>
				   
			<b>Self Cert Average Times</b>
			<input type = "radio"
				   name = "tableButtons"
				   id = "table1Button" >
			
			<br>
			
			<b>SPR Non-Self Cert Average Times</b>
			<input type = "radio"
				   name = "tableButtons"
				   id = "table2Button" >
			<br>
			<br>
			
			<td>
		</tr>
		
		<tr>
			<td>	
				<table  id = "table3" bgcolor="99CCFF">
					<tr><td align=center><b>Combined Cert Average Times</b></td></tr>
					<tr bgcolor="1E90FF">
						<td>Task</td><td>Avg Time</td><td>#Projects</td><td>T2P</td>
					</tr>
							<% for(int i = 0; i < c.length; i++) { %>
								<%if (Integer.parseInt(c[i][4])%2 == 0) {%> <tr bgcolor="FF8C00"> <%} else {%> <tr> <%} %>
									<td><%=c[i][0]%> </td><td><%=c[i][1]%></td><td> <%=c[i][2]%></td> <td> <%=c[i][3]%></td></tr>
									<% t2p_All = t2p_All+Double.parseDouble(c[i][3]); } %>
									<tr bgcolor="1E90FF"><td colspan=4> Combined SPR Time to Permit : <%=Math.round(t2p_All)%> days</td> </tr>
				</table>		
			</td>			
		</tr>
			
		<tr>
			<td>
				<table id = "table1" bgcolor="99CCFF">
					<tr><td align=center><b>Self Cert Average Times</b></td></tr>
					<tr bgcolor="1E90FF">
						<td>Task</td><td>Avg Time</td><td>#Projects</td><td>T2P</td>
					</tr>
							<% for(int i = 0; i < d.length; i++) { %>
								<%if (Integer.parseInt(d[i][4])%2 == 0) {%> <tr bgcolor="FF8C00"> <%} else {%> <tr> <%} %>
									<td><%=d[i][0]%> </td><td><%=d[i][1]%></td><td> <%=d[i][2]%></td> <td> <%=d[i][3]%></td></tr>
							<% t2p_sc = t2p_sc+Double.parseDouble(d[i][3]); } %>
								<tr><td colspan=4 bgcolor="1E90FF"> Self Cert Time to Permit : <%=Math.round(t2p_sc)%> days</td> </tr>
				</table>		
			</td>
		</tr>
			
		<tr>
			<td>	
				<table  id = "table2" bgcolor="99CCFF">
					<tr><td align=center><b>SPR Non-Self Cert Average Times</b></td></tr>
					<tr bgcolor="1E90FF">
						<td>Task</td><td>Avg Time</td><td>#Projects</td><td>T2P</td>
					</tr>
							<% for(int i = 0; i < n.length; i++) { %>
								<%if (Integer.parseInt(n[i][4])%2 == 0) {%> <tr bgcolor="FF8C00"> <%} else {%> <tr> <%} %>
									<td><%=n[i][0]%> </td><td><%=n[i][1]%></td><td> <%=n[i][2]%></td> <td> <%=n[i][3]%></td></tr>
									<% t2p_spr = t2p_spr+Double.parseDouble(n[i][3]); } %>
									<tr bgcolor="1E90FF"><td colspan=4> Regular SPR Time to Permit : <%=Math.round(t2p_spr)%> days</td> </tr>
				</table>		
			</td>
		</tr>
	</table>
	<br>
	<br>
</form>
	