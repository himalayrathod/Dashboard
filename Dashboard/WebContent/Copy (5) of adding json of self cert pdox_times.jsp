<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.util.*"%>

<jsp:include page="fetchProjects.jsp" /> 

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

<div id = "averagePermitTimesTableDIV">
<form id = "table_selection" onClick = "table_selected()" >
	<table id = "averagePermitTimesTable" style="outline: thin solid"  align = "center">
		<tr style = "line-height: 3px">
			<td style = "height: 6px" valign = "top" align = "center">
				<h3>Average Task Times</h3>
			</td>
		</tr>
		
		<tr style = "line-height: 3px"> 
			<td style = "height: 3px;" align = "center">
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
			<div id = "combinedCertAverageDiv">	
				<table  id = "combinedCertAverageTable" bgcolor="99CCFF" border = "show"
						CELLPADDING="0" CELLSPACING="0" valign = "top" align = "center">
					<tr><td colspan = 4 align=center><b>Combined Cert Average Times</b></td></tr>
					
					<tr style = "background-color: #333333; color: white;">
						<td><b>Task</b></td><td><b>Avg Time</b></td><td><b>#Projects</b></td><td><b>T2P</b></td>
					</tr>
							<% for(int i = 0; i < c.length; i++) 
							   { 
							   		if (Integer.parseInt(c[i][4])%2 == 0) 
							   		{
							 %> 
							 			<tr bgcolor="FF8C00"> 
							<%		} 
									else 
								  	{
								   		if(i%2 == 0)
					 			   		{
					 				%>
					 						<tr style = "background-color: white;">
					 				<%			
					 			   		}
					 			   		else
					 			   		{
					 				%>
					 			   		<tr style = "background-color: #B2B2B2;">
					 			   	<%	
					 			   		}
					 			   	%>
								 
							<%
									} 
							 %>
				
							<td>
									<%	
										//print out the name of the tasks for the Combined Cert Average Times table
										
										//Names that are too long are shortened 
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
			</div>
			
		<div id = "selfCertAverageTimesDiv">
				<table id = "selfCertAverageTimesTable" bgcolor="99CCFF" border = "show" 
						CELLPADDING="0" CELLSPACING="0" valign = "top" align = "center">
					<tr><td colspan = 4 align=center><b>Self Cert Average Times</b></td></tr>
					
					<tr style = "background-color: #333333; color: white;">
						<td><b>Task</b></td><td><b>Avg Time</b></td><td><b>#Projects</b></td><td><b>T2P</b></td>
					</tr>
							<!-- This loop adds the names underneath the task column in the Self Cert Average Times table3-->
							<% for(int i = 0; i < d.length; i++) 
							   {
									if (Integer.parseInt(d[i][4])%2 == 0) 
							   		{
							 %> 
							 			<tr bgcolor="FF8C00"> 
							<%		} 
									else 
								  	{
								   		if(i%2 == 0)
					 			   		{
					 				%>
					 						<tr style = "background-color: white;">
					 				<%			
					 			   		}
					 			   		else
					 			   		{
					 				%>
					 			   		<tr style = "background-color: #B2B2B2;">
					 			   	<%	
					 			   		}
					 			   	%>
								 
							<%
									} 
							 %>
									
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
			</div>
			
		<div id = "sprNonSelfCertAverageTimesDiv">	
				<table  id = "sprNonSelfCertAverageTimesTable" bgcolor="99CCFF" border = "show"
						CELLPADDING="0" CELLSPACING="0" valign = "top" align = "center">
					<tr><td colspan = 4 align=center><b>SPR Non-Self Cert Average Times</b></td></tr>
					
					<tr style = "background-color: #333333; color: white;">
						<td><b>Task</b></td><td><b>Avg Time</b></td><td><b>#Projects</b></td><td><b>T2P</b></td>
					</tr>
							<% for(int i = 0; i < n.length; i++) 
							   { 
							   		if (Integer.parseInt(n[i][4])%2 == 0) 
							   		{
							 %> 
							 			<tr bgcolor="FF8C00"> 
							<%		} 
									else 
								  	{
								   		if(i%2 == 0)
					 			   		{
					 				%>
					 						<tr style = "background-color: white;">
					 				<%			
					 			   		}
					 			   		else
					 			   		{
					 				%>
					 			   		<tr style = "background-color: #B2B2B2;">
					 			   	<%	
					 			   		}
					 			   	%>
								 
							<%
									} 
							 %>
									
									
									
									
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
				</div>		
			</td>
		</tr>
	</table>
</form>
</div>	
	
	
<div id = "taskQueueTableDIV">	
<form id = "taskQueForm" onClick = "task_table_selected()">
	<table id = "taskQueueTable"  style="outline: thin solid;" align = "center">
		<tr style = "line-height: 3px">
			<td style = "height: 3px;" valign = "top" align = "center">
				<h3>Task Queue Split</h3>
			</td>
		</tr>
	
		<tr style = "line-height: 3px">
			<td  style = "height: 3px;" valign = "top" align = "center">
				
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
		
		<tr>
		<td>	
		<div id = "taskCountDiv">
				<table id = "taskCountTable" CELLPADDING="0" CELLSPACING="0" 
						valign = "top" align = "center">
				<tr>
					<td colspan = 4 align = "center"><b>Combined Total of All Task Queue</b></td>
				</tr>
				<tr style = "background-color: #333333; color: white;">
					<td><b>Task</b></td><td><b>SPR</b></td><td><b>DS</b></td><td><b>Zoning</b></td>
				</tr>
	
				<% for(int i = 0; i < taskqueue.length; i++) 
	 			   { 
	 			   		if(i%2 == 0)
	 			   		{
	 			%>
	 						<tr style = "background-color: white;">
	 				<%			
	 			   		}
	 			   		else
	 			   		{
	 				%>
	 			   		<tr style = "background-color: #B2B2B2;">
	 			   	<%	
	 			   		}
	 			   	%>
						<td>
						<% if (taskqueue[i][0] !=null) 
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
				</div>
		
		
		
			<div id = "taskByAgeDiv">
				<table id = "taskByAgeTable" CELLPADDING="0" CELLSPACING="0" 
						valign = "top" align = "center">
				<tr>
					<td colspan = 10 align = "center"><b>Task Split by Age</b></td>
				</tr>
				
				<tr style = "background-color: #333333; color: white;">
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
	
	
	 			<% for(int i = 0; i < queueAge.length; i++) 
		 			 { 
		 			   		if(i%2 == 0)
		 			   		{
		 			%>
		 						<tr style = "background-color: white;">
		 				<%			
		 			   		}
		 			   		else
		 			   		{
		 				%>
		 			   		<tr style = "background-color: #B2B2B2;">
		 			   	<%	
		 			   		}
		 			   	%>		
		 			   	
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
						
						<td><%if (queueAge[i][2] !=null) {out.println("<label  onClick='displayPrjs(\""+queueAge[i][0]+"\", \"0-4\");' value='"+queueAge[i][2]+"'>"+queueAge[i][2]+"</label>");} %></td>
						<td><%if (queueAge[i][3] !=null) {out.println("<label  onClick='displayPrjs(\""+queueAge[i][0]+"\", \"5-10\");' value='"+queueAge[i][3]+"'>"+queueAge[i][3]+"</label>");} %></td>
						<td><%if (queueAge[i][4] !=null) {out.println("<label  onClick='displayPrjs(\""+queueAge[i][0]+"\", \"11-15\");' value='"+queueAge[i][4]+"'>"+queueAge[i][4]+"</label>");} %></td>
						<td><%if (queueAge[i][5] !=null) {out.println("<label  onClick='displayPrjs(\""+queueAge[i][0]+"\", \"16-20\");' value='"+queueAge[i][5]+"'>"+queueAge[i][5]+"</label>");} %></td>
						<td><%if (queueAge[i][6] !=null) {out.println("<label  onClick='displayPrjs(\""+queueAge[i][0]+"\", \"21-30\");' value='"+queueAge[i][6]+"'>"+queueAge[i][6]+"</label>");} %></td>
						<td><%if (queueAge[i][7] !=null) {out.println("<label  onClick='displayPrjs(\""+queueAge[i][0]+"\", \"31-50\");' value='"+queueAge[i][7]+"'>"+queueAge[i][7]+"</label>");} %></td>
						<td><%if (queueAge[i][8] !=null) {out.println("<label  onClick='displayPrjs(\""+queueAge[i][0]+"\", \"51-100\");' value='"+queueAge[i][8]+"'>"+queueAge[i][8]+"</label>");} %></td>
						<td><%if (queueAge[i][9] !=null) {out.println("<label  onClick='displayPrjs(\""+queueAge[i][0]+"\", \"101-1000\");' value='"+queueAge[i][9]+"'>"+queueAge[i][9]+"</label>");} %></td>
					</tr>
				<% } %>
				</table>
			</div>
		
		
		
			<div id = "ownerByTaskAgeDiv">
				<table  id = "ownerByTaskAgeTable" CELLPADDING="0" CELLSPACING="0" 
						valign = "top" align = "center">
				<!--
					<tr>
						<td colspan = 10>
					 		<div id = "ownerByTaskAgeTableTHEAD" style = "width: 225px; position: fixed;">
								<table border = show>
				 -->
				 					<tr>
										<td colspan = 10 align = "center"><b>Task Split by Owner Name</b></td>
									</tr>
									
									<tr style = "background-color: #333333; color: white;">
										<td ><b>Owner Name</b></td>
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
				<!-- 					
								</table>
							</div>
						</td>
					</tr>
				 -->
				 
				 	
					
				<!-- 
					<div id = "ownerByTaskAgeTableTBODY">
			 			<table>
			 	 -->	
			 			<% for(int i = 0; i < ownerTask.length; i++)    
			 			{ 
			 			   		if(i%2 == 0)
			 			   		{
			 			%>
			 						<tr style = "background-color: white;">
			 				<%			
			 			   		}
			 			   		else
			 			   		{
			 				%>
			 			   		<tr style = "background-color: #B2B2B2;">
			 			   	<%	
			 			   		}
			   				%>
								<td>
						
								<% if (ownerTask[i][0] !=null) 
								{		
									out.println(ownerTask[i][0]);
								} 
								%>  
								</td> 
														
								<td><% if (ownerTask[i][1] !=null) {out.println(ownerTask[i][1]);} %></td> 
								
								
								<% 
								if(ownerTask[i][10].equalsIgnoreCase("P"))
								{
								%>
									<td><% if (ownerTask[i][2] !=null) {out.println("<label  onClick='displayPrjsOwnerIndividualTask(\""+ownerTask[i][0]+"\", \"0-4\");' value='"+ownerTask[i][2]+"'>"+ownerTask[i][2]+"</label>"); } %></td>
									<td><% if (ownerTask[i][3] !=null) {out.println("<label  onClick='displayPrjsOwnerIndividualTask(\""+ownerTask[i][0]+"\", \"5-10\");' value='"+ownerTask[i][3]+"'>"+ownerTask[i][3]+"</label>");} %></td>
									<td><% if (ownerTask[i][4] !=null) {out.println("<label  onClick='displayPrjsOwnerIndividualTask(\""+ownerTask[i][0]+"\", \"11-15\");' value='"+ownerTask[i][4]+"'>"+ownerTask[i][4]+"</label>");} %></td>
									<td><% if (ownerTask[i][5] !=null) {out.println("<label  onClick='displayPrjsOwnerIndividualTask(\""+ownerTask[i][0]+"\", \"16-20\");' value='"+ownerTask[i][5]+"'>"+ownerTask[i][5]+"</label>");} %></td>
									<td><% if (ownerTask[i][6] !=null) {out.println("<label  onClick='displayPrjsOwnerIndividualTask(\""+ownerTask[i][0]+"\", \"21-30\");' value='"+ownerTask[i][6]+"'>"+ownerTask[i][6]+"</label>");} %></td>
									<td><% if (ownerTask[i][7] !=null) {out.println("<label  onClick='displayPrjsOwnerIndividualTask(\""+ownerTask[i][0]+"\", \"31-50\");' value='"+ownerTask[i][7]+"'>"+ownerTask[i][7]+"</label>");} %></td>
									<td><% if (ownerTask[i][8] !=null) {out.println("<label  onClick='displayPrjsOwnerIndividualTask(\""+ownerTask[i][0]+"\", \"51-100\");' value='"+ownerTask[i][8]+"'>"+ownerTask[i][8]+"</label>");} %></td>
									<td><% if (ownerTask[i][9] !=null) {out.println("<label  onClick='displayPrjsOwnerIndividualTask(\""+ownerTask[i][0]+"\", \"101-1000\");' value='"+ownerTask[i][9]+"'>"+ownerTask[i][9]+"</label>");} %></td>									
								
								<%
								}
								else
								{
								%>
									<td><% if (ownerTask[i][2] !=null) {out.println("<label  onClick='displayPrjsOwnerGroupTask(\""+ownerTask[i][0]+"\", \"0-4\");' value='"+ownerTask[i][2]+"'>"+ownerTask[i][2]+"</label>"); } %></td>
									<td><% if (ownerTask[i][3] !=null) {out.println("<label  onClick='displayPrjsOwnerGroupTask(\""+ownerTask[i][0]+"\", \"5-10\");' value='"+ownerTask[i][3]+"'>"+ownerTask[i][3]+"</label>");} %></td>
									<td><% if (ownerTask[i][4] !=null) {out.println("<label  onClick='displayPrjsOwnerGroupTask(\""+ownerTask[i][0]+"\", \"11-15\");' value='"+ownerTask[i][4]+"'>"+ownerTask[i][4]+"</label>");} %></td>
									<td><% if (ownerTask[i][5] !=null) {out.println("<label  onClick='displayPrjsOwnerGroupTask(\""+ownerTask[i][0]+"\", \"16-20\");' value='"+ownerTask[i][5]+"'>"+ownerTask[i][5]+"</label>");} %></td>
									<td><% if (ownerTask[i][6] !=null) {out.println("<label  onClick='displayPrjsOwnerGroupTask(\""+ownerTask[i][0]+"\", \"21-30\");' value='"+ownerTask[i][6]+"'>"+ownerTask[i][6]+"</label>");} %></td>
									<td><% if (ownerTask[i][7] !=null) {out.println("<label  onClick='displayPrjsOwnerGroupTask(\""+ownerTask[i][0]+"\", \"31-50\");' value='"+ownerTask[i][7]+"'>"+ownerTask[i][7]+"</label>");} %></td>
									<td><% if (ownerTask[i][8] !=null) {out.println("<label  onClick='displayPrjsOwnerGroupTask(\""+ownerTask[i][0]+"\", \"51-100\");' value='"+ownerTask[i][8]+"'>"+ownerTask[i][8]+"</label>");} %></td>
									<td><% if (ownerTask[i][9] !=null) {out.println("<label  onClick='displayPrjsOwnerGroupTask(\""+ownerTask[i][0]+"\", \"101-1000\");' value='"+ownerTask[i][9]+"'>"+ownerTask[i][9]+"</label>");} %></td>									
								<%
								}
								%>
								
							</tr>
						<% } %>
				<!-- 	
						</table>
					</div>
				 
					</td>
					</tr>
				 -->	
				</table>
			</div>
		</td>
		</tr>
	</table>
</form>
</div>

<div id = "messageBoardDIV">
	<table id = "messageBoardTable" >
		<tr>
			<td valign = top>
				<div id = "messageBoardTableScrollDIV">
			<!-- 		<font style="font-size:14px;"  face=sans-serif color = "#585858">  -->
					
						<p style= "font-size:8pt;" id="msgBoard"></p>
					
			<!-- 		</font> -->
				</div>
			</td>
		</tr>
	</table>
</div>
