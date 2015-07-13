

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


<% String q[] = dashboard.DatabaseManager.getQueue(); 
String flowqueue[][] = dashboard.DatabaseManager.getWorkflowQueue(); 
String taskqueue[][] = dashboard.DatabaseManager.getPdoxTasksQueue(); 
%>

<br>
<br>

<form id = "table_selection"
	  onClick = "table_selected()" >
	<table class = "inlineIt" bgcolor = "#c9c9c9" style="outline: thin solid">
		<tr>
			<td align = "center">
				<h3>Average Task Times</h3>
			</td>
		</tr>
		
		<tr> 
			<td align = "center">
			<b>All</b>
			<input type = "radio"
				   name = "tableButtons"
				   id = "table3Button" checked>
				   			
			<b>Regular SPR</b>
			<input type = "radio"
				   name = "tableButtons"
				   id = "table2Button" >
				   
   			<b>Self Cert</b>
			<input type = "radio"
				   name = "tableButtons"
				   id = "table1Button" >
			<br>
			<td>
		</tr>
	
	
	
		<tr>
			<td>	
				<table  id = "table3" bgcolor="99CCFF" border>
					<tr><td colspan = 4 align=center><b>Combined Cert Average Times</b></td></tr>
					<tr bgcolor="1E90FF">
						<td>Task</td><td>Avg Time</td><td>#Projects</td><td>T2P</td>
					</tr>
							<% for(int i = 0; i < c.length; i++) { %>
								<%if (Integer.parseInt(c[i][4])%2 == 0) {%> <tr bgcolor="FF8C00"> <%} else {%> <tr> <%} %>
									<td>
									<%
										if(c[i][0].equalsIgnoreCase("PrescreenResubmittalReview"))
										{
											out.println("Pres. Resubm. Review");
										}
										else if(c[i][0].equalsIgnoreCase("UploadCertifiedCorrections"))
										{
											out.println("Upload Cert. Corrections");
										}
										else if(c[i][0].equalsIgnoreCase("CertifiedCorrectionsReview"))
										{
											out.println("Cert. Corrections Review");
										}
										else if(c[i][0].equalsIgnoreCase("CertifiedCorrectionsResubmittalReview"))
										{
											out.println("Cert. Corrections Resubm. Review");
										}
										else if(c[i][0].equalsIgnoreCase("SelfCertificationCorrectionComplete"))
										{
											out.println("Self Cert. Corrections Comp.");
										}
										else
										{
											out.println(c[i][0]);
										}
								
									%>
									</td>
									<td><%=c[i][1]%></td><td> <%=c[i][2]%></td> <td> <%=c[i][3]%></td></tr>
									<% t2p_All = t2p_All+Double.parseDouble(c[i][3]); } %>
									<tr bgcolor="1E90FF"><td colspan=4> Combined SPR Time to Permit : <%=Math.round(t2p_All)%> days</td> </tr>
				</table>		
			</td>			
		</tr>
			
		<tr>
			<td>
				<table id = "table1" bgcolor="99CCFF" border = "show">
					<tr><td colspan = 4 align=center><b>Self Cert Average Times</b></td></tr>
					<tr bgcolor="1E90FF">
						<td>Task</td><td>Avg Time</td><td>#Projects</td><td>T2P</td>
					</tr>
							<% for(int i = 0; i < d.length; i++) { %>
								<%if (Integer.parseInt(d[i][4])%2 == 0) {%> <tr bgcolor="FF8C00"> <%} else {%> <tr> <%} %>
									<td>
									<%
										if(d[i][0].equalsIgnoreCase("PrescreenResubmittalReview"))
										{
											out.println("Pres. Resubm. Review");
										}
										else if(d[i][0].equalsIgnoreCase("Upload CertifiedCorrections"))
										{
											out.println("Upload Cert. Corrections");
										}
										else if(d[i][0].equalsIgnoreCase("CertifiedCorrectionsReview"))
										{
											out.println("Cert. Corrections Review");
										}
										else if(d[i][0].equalsIgnoreCase("CertifiedCorrectionsResubmittalReview"))
										{
											out.println("Cert. Corrections Resubm. Review");
										}
										else if(d[i][0].equalsIgnoreCase("SelfCertificationCorrectionComplete"))
										{
											out.println("Self Cert. Corrections Comp.");
										}
										else
										{
											out.println(d[i][0]);
										}
									%> 
									</td><td><%=d[i][1]%></td><td> <%=d[i][2]%></td> <td> <%=d[i][3]%></td></tr>
							<% t2p_sc = t2p_sc+Double.parseDouble(d[i][3]); } %>
								<tr><td colspan=4 bgcolor="1E90FF"> Self Cert Time to Permit : <%=Math.round(t2p_sc)%> days</td> </tr>
				</table>		
			</td>
		</tr>
			
		<tr>
			<td>	
				<table  id = "table2" bgcolor="99CCFF" border = "show">
					<tr><td colspan = 4 align=center><b>SPR Non-Self Cert Average Times</b></td></tr>
					<tr bgcolor="1E90FF">
						<td>Task</td><td>Avg Time</td><td>#Projects</td><td>T2P</td>
					</tr>
							<% for(int i = 0; i < n.length; i++) { %>
								<%if (Integer.parseInt(n[i][4])%2 == 0) {%> <tr bgcolor="FF8C00"> <%} else {%> <tr> <%} %>
									<td>
									<%
										if(n[i][0].equalsIgnoreCase("PrescreenResubmittalReview"))
										{
											out.println("Pres. Resubm. Review");
										}
										else if(n[i][0].equalsIgnoreCase("Upload CertifiedCorrections"))
										{
											out.println("Upload Cert. Corrections");
										}
										else if(n[i][0].equalsIgnoreCase("CertifiedCorrectionsReview"))
										{
											out.println("Cert. Corrections Review");
										}
										else if(n[i][0].equalsIgnoreCase("CertifiedCorrectionsResubmittalReview"))
										{
											out.println("Cert. Corrections Resubm. Review");
										}
										else if(n[i][0].equalsIgnoreCase("SelfCertificationCorrectionComplete"))
										{
											out.println("Self Cert. Corrections Comp.");
										}
										else
										{
											out.println(n[i][0]);
										}
											
									%> </td><td><%=n[i][1]%></td><td> <%=n[i][2]%></td> <td> <%=n[i][3]%></td></tr>
									<% t2p_spr = t2p_spr+Double.parseDouble(n[i][3]); } %>
									<tr bgcolor="1E90FF"><td colspan=4> Regular SPR Time to Permit : <%=Math.round(t2p_spr)%> days</td> </tr>
				</table>		
			</td>
		</tr>
	</table>
</form>
	
	
	
<form id = "taskQueForm">
	<table class = "inlineIt" bgcolor = "#8a7f8d" style="outline: thin solid">
		<tr>
			<td align = "center">
				<h3>Task Queue Split</h3>
			</td>
		</tr>
	
		<tr>
			<td  align = "center">
				<div id = "QueueSplitFormDiv">
					<b>SPR</b>	
					<input type = "radio"
						   name = "taskQueueButtons"
						   id = "table2Button" >
					   
					<b>Developer</b>		   
					<input type = "radio"
						   name = "taskQueueButtons"
						   id = "table2Button" >
				
					<b>Zoning</b>
					<input type = "radio"
						   name = "taskQueueButtons"
						   id = "table2Button" >			
				</div>
			</td>
		</tr>
	
		<tr>
			<td>
				<table border = "show">
				<tr>
					<td>Task</td><td>SPR</td><td>DS</td><td>Zoning</td>
				</tr>
	
	
	 			<% for(int i = 0; i < taskqueue.length; i++) { %>
					<tr>
						<td>
						<%if (taskqueue[i][0] !=null) 
						{
							if(taskqueue[i][0].equalsIgnoreCase("CertifiedCorrectionsResubmittalReview"))
							{
								out.println("Cert. Corr. Resub. Review");
							}
							else if(taskqueue[i][0].equalsIgnoreCase("CertifiedCorrectionsReview"))
							{
								out.println("Cert. Corr. Review");
							}
							else if(taskqueue[i][0].equalsIgnoreCase("PrescreenResubmittalReview"))
							{
								out.println("Prescrn Resubm. Review");
							}
							else if(taskqueue[i][0].equalsIgnoreCase("SelfCertificationResubmit"))
							{
								out.println("Self Cert. Resubm.");
							}
							else
							{
								out.println(taskqueue[i][0]);
							}
						} 
						%>  
						</td> 
						
						<td><b><%if (taskqueue[i][1] !=null) {out.println(taskqueue[i][1]);}%></b> </td> 
						<td> <b><%if (taskqueue[i][2] !=null) {out.println(taskqueue[i][2]);} %></b> </td>
						<td> <b><%if (taskqueue[i][3] !=null) {out.println(taskqueue[i][3]);} %></b> </td>
					</tr>
				<% } %>
				</table>
			</td>
		</tr>
		
		<tr>
			<td>
				<table border = "show">
				<tr>
					<td>Task</td><td>SPR</td><td>DS</td><td>Zoning</td>
				</tr>
	
	
	 			<% for(int i = 0; i < taskqueue.length; i++) { %>
					<tr>
						<td>
						<%if (taskqueue[i][0] !=null) 
						{
							if(taskqueue[i][0].equalsIgnoreCase("CertifiedCorrectionsResubmittalReview"))
							{
								out.println("Cert. Corr. Resub. Review");
							}
							else if(taskqueue[i][0].equalsIgnoreCase("CertifiedCorrectionsReview"))
							{
								out.println("Cert. Corr. Review");
							}
							else if(taskqueue[i][0].equalsIgnoreCase("PrescreenResubmittalReview"))
							{
								out.println("Prescrn Resubm. Review");
							}
							else if(taskqueue[i][0].equalsIgnoreCase("SelfCertificationResubmit"))
							{
								out.println("Self Cert. Resubm.");
							}
							else
							{
								out.println(taskqueue[i][0]);
							}
						} 
						%>  
						</td> 
						
						<td><b><%if (taskqueue[i][1] !=null) {out.println(taskqueue[i][1]);}%></b> </td> 
						<td> <b><%if (taskqueue[i][2] !=null) {out.println(taskqueue[i][2]);} %></b> </td>
						<td> <b><%if (taskqueue[i][3] !=null) {out.println(taskqueue[i][3]);} %></b> </td>
					</tr>
				<% } %>
				</table>
			</td>
		</tr>
		
		<tr>	
			<td>
				<% 
					for(int i = 0; i < flowqueue.length; i++) 
					{ 
					
				
				%>		
				<%=flowqueue[i][0] %> <b><%=flowqueue[i][2]%></b> tasks from <b><%=flowqueue[i][1] %></b> projects <br>
				<% } %>
			</td>
		</tr>
	</table>
</form>

<!-- End of File -->