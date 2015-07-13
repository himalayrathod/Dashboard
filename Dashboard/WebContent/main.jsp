<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Department of Buildings Dashboard</title>

<link rel = "stylesheet" href = "stylePage.css">

<script type = "text/javascript" src = "jquery-1.11.3.js"></script>

<script>
	
    function showHideLinkOnClickFunction()
    {	
    	var showHideTable = document.getElementById("quickStatisticsTable");
    	
    	if(showHideTable.style.display == 'none')
   		{
    		showHideTable.style.display = 'block';	
   		}
    	else
   		{
   			showHideTable.style.display = 'none';
   		}
    }
    
    function displaySearchResult()
    {
		var searchThisProject = document.getElementById("searchThisForUserInputId").value;
    	searchProject(searchThisProject);       	
    }

//Funtion remote button selection to display tables in Average Tesk Time table
   	
    
   	function table_selected()
    {
        var table1Selected = document.getElementById("table1Button").checked;
        var table2Selected = document.getElementById("table2Button").checked;
        var table3Selected = document.getElementById("table3Button").checked;
        
        var table1 = document.getElementById("selfCertAverageTimesDiv");
        var table2 = document.getElementById("sprNonSelfCertAverageTimesDiv");
        var table3 = document.getElementById("combinedCertAverageDiv");
        
        if(table1Selected == true && table2Selected == false && table3Selected == false)
        {
            table1.style.display = 'block';
            table2.style.display = 'none'; 
            table3.style.display = 'none';
            console.log("beforesc main script");
          //  displayTasksSC();
            console.log("aftersc main script");
        }
        else if(table1Selected == false && table2Selected == false && table3Selected == true)
        {
            table1.style.display = 'none';
            table2.style.display = 'none';
            table3.style.display = 'block';
            console.log("ccbefore main script");
          //  displayTasksCC();
            console.log("ccafter main script");
        }
        else
        {
            table1.style.display = 'none';
            table2.style.display = 'block';
            table3.style.display = 'none';
            console.log("sprbefore main script");
         //   displayTasksSPR();
            console.log("sprafter main script ");
            
        }
           
    }
    
    /*
	function one()
	{
		displayTaskCount();
	}
	
	function two()
	{
		displayTasksCC();
	}
	
	
	window.onload = function three() {
		one();
		two();
	};
	*/
    
    //Funtion to display the different tables selected in Task Queue Split table
    function task_table_selected()
    {
    	var sumOfAllTableSelected = document.getElementById("taskCountTableButton").checked;
        var taskSplitByAgeTableSelected = document.getElementById("taskByAgeTableButton").checked;
        var ownerByTaskAgeTableButton = document.getElementById("ownerByTaskAgeTableButton").checked;
        
        var table1 = document.getElementById("taskCountDiv");
        var table2 = document.getElementById("taskByAgeDiv");
        var table3 = document.getElementById("ownerByTaskAgeDiv");
                
        if(sumOfAllTableSelected == true && taskSplitByAgeTableSelected == false && ownerByTaskAgeTableButton == false)
        {
            table1.style.display = 'block';
            table2.style.display = 'none'; 
            table3.style.display = 'none';
            console.log("before taskCount");
            //displayTaskCount();
            console.log("after taskCount");
        }
        else if(sumOfAllTableSelected == false && taskSplitByAgeTableSelected == true && ownerByTaskAgeTableButton == false)
        {
            table1.style.display = 'none';
            table2.style.display = 'block'; 
            table3.style.display = 'none';
            console.log("before taskByAge");
            //displayTaskByAge();
            console.log("after taskByAge");
      	}
        else
        {
            table1.style.display = 'none';
            table2.style.display = 'none';
            table3.style.display = 'block';
   		}  
    }
/*
   	function e() 
   	{
   		displayTaskCount();
   		displayTasksCC();
   	}

	window.onload = e;
   
	Xzxczxc
	*/
</script>

</head>

<body>
<div id = "centerDIV">
<table id = "mainBackgroundTable"  align = "center">
	<tr> 
		<td>
			<div id = "headerOfPage">
				<div style = "padding-left: 5px; padding-top: 15px; float: left;">
					<img alt="" height= 70 width=70 src="img/city_logo.jpg">
				</div>
				
				<div style = "align: center; float: left; padding-left: 100px;">
					<h2 style="padding-left: 265px;">City of Chicago</h2>
					<h2 style = "padding-left: 45px;">Department of Buildings Permits and Inspections Dashboard</h2>
				</div>
				
				<div style = "padding-left: 80px;  padding-top: 15px; float: left;">
					<img alt="" height= 70 width=160 src="img/dob_logo_full.jpg">
					
				</div>
			</div>
		</td>
	</tr>	
	
	<tr> 
		<td  colspan=3 align = left bgcolor = "#FFF0E0" valign = center > <jsp:include page="h7_main.jsp" /></td>
	</tr>	
	    
	<tr>
		<td>
			<div id = "overallStatisticsDataChartDIV">
				<table id = "overallStatisticsDataChartTable">
					<tr>
						<td>
							<p style = "font-size: 20pt; text-align: center;">Interactive Chart Under Construction</p>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
	
	<tr> 
		<td colspan=3 align = left bgcolor = "#FFF0E0" valign = center > <jsp:include page="pdox_times.jsp" /></td>
	</tr> 
	
	<!-- 
	<tr>
		<td colspan = 3 style = "background-color: #FFF0E0" valign = center">
			<div id = "navigationMenuDIV">
				<table id = "navigationMenuTable">
					<tr>
						<td>
							<ul id = "navigationMenuUL">
								<li class = "navigationMenuLI"><a href = "#" title = "All">All</a></li>
								<li class = "navigationMenuLI"><a href = "#" title = "Regular SPR">Regular SPR</a></li>
								<li class = "navigationMenuLI"><a href = "#" title = "Self Cert">Self Cert</a></li>
								<li class = "navigationMenuLI"><a href = "#" title = "Task Count">Task Count</a></li>
								<li class = "navigationMenuLI"><a href = "#" title = "Task By Age">Task By Age</a></li>
								<li class = "navigationMenuLI"><a href = "#" title = "Owner By Task Age">Owner By Task Age</a></li>
							</ul>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
 -->
	<tr style = "background-color: #FFF0E0;">
		<td>
			<p style = "text-align: center;">
				<a href = "http://www.cityofchicago.org/buildings" title = "DOB">Departments of Buildings</a> ||  
				<a href = "http://10.220.30.129:8080/Dashboard/main.jsp" title = "Home">Dashboard</a>
			</p>
		</td>
	</tr>
</table>
</div>

</body>

</html>

<!-- End of File -->