

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.util.*"%>

<% String c[] = dashboard.DatabaseManager.getT2P(); 
DateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
StringTokenizer st=new StringTokenizer(c[1],"-");
StringTokenizer st2=new StringTokenizer(c[2],"-");

String year1=st.nextToken();
String month1=st.nextToken();
String date1=st.nextToken();

String year2=st2.nextToken();
String month2=st2.nextToken();
String date2=st2.nextToken();
%>




<div id = "detailedStatisticsDIV">
<form>
	<table id = "detailedStatisticsTable">
		<tr>
			<td colspan = "2">
				<form id = "dateSelectionOptionForm">	
					Time To Permit : <b><%=c[0]%></b> days for SPR permits issued between 
	
					<input type = "date" id = "startDateInput" value = "<%=year1%>-<%=month1%>-<%=(date1).substring(0,2)%>"/>	
					and
					<input type = "date" id = "startDateInput" value = "<%=year2%>-<%=month2%>-<%=(date2).substring(0,2)%>"/>
					<input type = "submit" value = "Go!" id = "submit"/>	
				</form>
			</td>
		</tr>
		
		<tr>
			<td>
				Number of Permits issued: <b><%=c[3]%></b> 
		 		and Avg Applicant Time: <b><%=c[13]%></b> days
			</td>	
			
			<td style = "text-align: right;">
				<input type = "button" onclick = "showHideLinkOnClickFunction()" value = "Show More/Hide All">
			</td>
		</tr>
	</table>

	<div id = "quickStatisticsDIV">
		<table id = "quickStatisticsTable" style = "display: none;">
			<tr>
				<td>
					Slowest Permit: <b><%=c[4]%></b> days: Fastest Permit: <b><%=c[5]%></b> day(s)
				</td>	
			</tr>
		
			<tr>
				<td>
					<i>Number of Permits By Days to Permit</i>
					<table BORDER>
						<tr>
							<td>0-10</td><td>10-20</td><td>20-50</td><td>50-100</td><td>100-200</td><td>200-400</td><td>400+</td>
						</tr>
						<tr>
							<td><%=c[12]%></td><td><%=c[11]%></td><td><%=c[10]%></td><td><%=c[9]%></td><td><%=c[8]%></td><td><%=c[7]%></td><td><%=c[6]%></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	</form>
</div>

<div id = "searchProjectsDIV">
<form onsubmit = "displaySearchResult(); return false">
	<table id = "searchProjectsTable" >
		<tr>
			<td valign=top CELLSPACING = "0" CELLPADDING = "0">
				
					<p style = "font-size: 12px; color: white;"><b>Project Lookup</b></p> 
					<input id = "searchThisForUserInputId"type = "text" value = "" style = "width: 100%;">
					<br>
					<input type = "button" value = "Search" onclick = "displaySearchResult()" tabIndex = "-1">
			</td>
		</tr>
	</table>
</form>
</div>

<!-- End of File -->