

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

String queueAge[][] = dashboard.DatabaseManager.getQueueAgeSplit();
String ownerTask[][] = dashboard.DatabaseManager.getQueueOwnerByTaskAge();
%>

<br>
<br>

<form id = "table_selection" onClick = "table_selected()" >
	<table id = "averagePermitTimesTable" style="outline: thin solid"  align = "center">
		<tr style = "height: 20px;">
			<td align = "center">
				<h3>Average Task Times</h3>
			</td>
		</tr>
		
		<tr style = "height : 10px"> 
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
				<table  id = "table3" bgcolor="99CCFF" border = "show">
					<tr><td colspan = 4 align=center><b>Combined Cert Average Times</b></td></tr>
					
					<tr bgcolor="1E90FF">
						<td><b>Task</b></td><td><b>Avg Time</b></td><td><b>#Projects</b></td><td><b>T2P</b></td>
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
	
	
	
<form id = "taskQueForm" onClick = "task_table_selected()">
	<table id = "taskQueueTable"  style="outline: thin solid;" align = "center">
		<tr >
			<td style = "height: 20px;" valign = "top" align = "center">
				<h3>Task Queue Split</h3>
			</td>
		</tr>
	
		<tr >
			<td  style = "height: 12px;" valign = "top" align = "center">
				
				<b>Task Count</b>	
				<input type = "radio"
					   name = "taskQueueButtons"
					   id = "taskCountTableButton" checked>
				
				<b>Task by Age</b>	
				<input type = "radio"
					   name = "taskQueueButtons"
					   id = "taskByAgeTableButton">
				   
   				<b>Owner by Task Age</b>	
				<input type = "radio"
					   name = "taskQueueButtons"
					   id = "ownerByTaskAgeTableButton">
			</td>
		</tr>
			
		<tr id = "taskCountTableOuterTableRow" >
			<td>
				<table id = "taskCountTable" bgcolor="99CCFF" border = "show">
				<tr>
					<td colspan = 4 align = "center"><b>Combined Total of All Task Queue</b></td>
				</tr>
				<tr bgcolor="1E90FF">
					<td><b>Task</b></td><td><b>SPR</b></td><td><b>DS</b></td><td><b>Zoning</b></td>
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
						
						<td><%if (taskqueue[i][1] !=null) {out.println(taskqueue[i][1]);} %></td> 
						<td><%if (taskqueue[i][2] !=null) {out.println(taskqueue[i][2]);} %></td>
						<td><%if (taskqueue[i][3] !=null) {out.println(taskqueue[i][3]);} %></td>
					</tr>
				<% } %>
				</table>
			</td>
		</tr>
		
		<tr id = "taskByAgeTableOuterTableRow">
			<td>
				<table id = "taskByAgeTable" bgcolor="99CCFF" border = "show">
				<tr>
					<td colspan = 10 align = "center"><b>Task Split by Age</b></td>
				</tr>
				
				<tr bgcolor="1E90FF">
					<td><b>Task</b></td>
					<td><b>Total</b></td>
					<td><b>0-4</b></td>
					<td><b>5-10</b></td>
					<td><b>11-15</b></td>
					<td><b>16-20</b></td>
					<td><b>21-30</b></td>
					<td><b>31-50</b></td>
					<td><b>51-100</b></td>
					<td><b>101+</b></td>
				</tr>
	
	
	 			<% for(int i = 0; i < queueAge.length; i++) { %>
					<tr>
						<td>
						<%if (queueAge[i][0] !=null) 
						{
							if(queueAge[i][0].equalsIgnoreCase("CertifiedCorrectionsResubmittalReview"))
							{
								out.println("Cert. Corr. Resub. Review");
							}
							else if(queueAge[i][0].equalsIgnoreCase("CertifiedCorrectionsReview"))
							{
								out.println("Cert. Corr. Review");
							}
							else if(queueAge[i][0].equalsIgnoreCase("PrescreenResubmittalReview"))
							{
								out.println("Prescrn Resubm. Review");
							}
							else if(queueAge[i][0].equalsIgnoreCase("SelfCertificationResubmit"))
							{
								out.println("Self Cert. Resubm.");
							}
							else
							{
								out.println(queueAge[i][0]);
							}
						} 
						%>  
						</td> 
						
						<td><%if (queueAge[i][1] !=null) {out.println(queueAge[i][1]);} %></td> 
						<td><%if (queueAge[i][2] !=null) {out.println(queueAge[i][2]);} %></td>
						<td><%if (queueAge[i][3] !=null) {out.println(queueAge[i][3]);} %></td>
						<td><%if (queueAge[i][4] !=null) {out.println(queueAge[i][4]);} %></td>
						<td><%if (queueAge[i][5] !=null) {out.println(queueAge[i][5]);} %></td>
						<td><%if (queueAge[i][6] !=null) {out.println(queueAge[i][6]);} %></td>
						<td><%if (queueAge[i][7] !=null) {out.println(queueAge[i][7]);} %></td>
						<td><%if (queueAge[i][8] !=null) {out.println(queueAge[i][8]);} %></td>
						<td><%if (queueAge[i][9] !=null) {out.println(queueAge[i][9]);} %></td>
					</tr>
				<% } %>
				</table>
			</td>
		</tr>
		
		
		<tr id = "ownerByTaskAgeTableOuterTableRow">
			<td valign=top>
				<table  id = "ownerByTaskAgeTable" bgcolor="99CCFF" border = "show">
				<tr>
					<td colspan = 10 align = "center"><b>Task Split by Owner Name</b></td>
				</tr>
				
				<tr bgcolor="1E90FF">
					<td><b>Owner Name</b></td>
					<td><b>Total</b></td>
					<td><b>0-4</b></td>
					<td><b>5-10</b></td>
					<td><b>11-15</b></td>
					<td><b>16-20</b></td>
					<td><b>21-30</b></td>
					<td><b>31-50</b></td>
					<td><b>51-100</b></td>
					<td><b>101+</b></td>
				</tr>
	
			
	 			<% for(int i = 0; i < ownerTask.length; i++) { %>
					<tr>
						<td>
				
						<% if (ownerTask[i][0] !=null) 
						{		
							out.println(ownerTask[i][0]);
						} 
						%>  
						</td> 
												
						<td><% if (ownerTask[i][1] !=null) {out.println(ownerTask[i][1]);} %></td> 
						<td><% if (ownerTask[i][2] !=null) {out.println(ownerTask[i][2]);} %></td>
						<td><% if (ownerTask[i][3] !=null) {out.println(ownerTask[i][3]);} %></td>
						<td><% if (ownerTask[i][4] !=null) {out.println(ownerTask[i][4]);} %></td>
						<td><% if (ownerTask[i][5] !=null) {out.println(ownerTask[i][5]);} %></td>
						<td><% if (ownerTask[i][6] !=null) {out.println(ownerTask[i][6]);} %></td>
						<td><% if (ownerTask[i][7] !=null) {out.println(ownerTask[i][7]);} %></td>
						<td><% if (ownerTask[i][8] !=null) {out.println(ownerTask[i][8]);} %></td>
						<td><% if (ownerTask[i][9] !=null) {out.println(ownerTask[i][9]);} %></td>
					</tr>
				<% } %>
				
				</table>
			</td>
		</tr>
		
	</table>
</form>
