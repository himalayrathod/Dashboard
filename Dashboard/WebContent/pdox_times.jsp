<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.util.*"%>

<jsp:include page="fetchProjects.jsp" /> 

<jsp:include page="fetchSelfCertT2P.jsp" /> 
<jsp:include page="fetchCombinedCertT2P.jsp" /> 
<jsp:include page="fetchSprNonSelfCert.jsp" /> 
<jsp:include page="fetchTaskCount.jsp" /> 
<jsp:include page="fetchTaskByAge.jsp" /> 
<jsp:include page="fetchOwnerByTask.jsp" />

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
					   id = "table3Button" 
					   onClick = "displayTasksCC()" checked>
					   	      		
				<b>Regular SPR</b>
				<input type = "radio"
					   name = "tableButtons"
					   id = "table2Button"
					   onClick = "displayTasksSPR()">
					   
	   			<b>Self Cert</b>
				<input type = "radio"
					   name = "tableButtons"
					   id = "table1Button"
					   onClick = "displayTasksSC()" >
				<br>
			<td>
		</tr>
	
		<tr>
			<td>
				<div id = "combinedCertAverageDiv">	
					</div>
					
				<div id = "selfCertAverageTimesDiv"> 
					</div>
					
				<div id = "sprNonSelfCertAverageTimesDiv">	
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
					   id = "taskCountTableButton"
					   onClick = "displayTaskCount()" checked>
				
				<b>Task by Age</b>	
				<input type = "radio"
					   name = "taskQueueButtons"
					   id = "taskByAgeTableButton" 
					   onClick = "displayTaskByAge()">
				   
   				<b>Owner by Task Age</b>	
				<input type = "radio"
					   name = "taskQueueButtons"
					   id = "ownerByTaskAgeTableButton"
					   onClick = "displayOwnerByTask()">
			</td>
		</tr>
		
		<tr>
			<td>	
				<div id = "taskCountDiv">
					</div>
				
				<div id = "taskByAgeDiv">
					</div>
			
				<div id = "ownerByTaskAgeDiv">
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
					<p style= "font-size:8pt;" id="msgBoard"></p>
				</div>
			</td>
		</tr>
	</table>
</div>


