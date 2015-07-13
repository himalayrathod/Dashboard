<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Department of Buildings Dashboard</title>

	<style>
		#mainBackgroundTable
		{
			width : 1100px;	
		}
		
		#table1, #table2
		{
			display: none;
		}
		
		#averagePermitTimesTable
		{
			float: left;
			top : 20px;
			width: 400px;
			height : 850px;	
			padding: 10px;
    	}
		
		#taskQueueTable
		{	    
		    float: left;
		    top: 20px;
		    width: 600px;
		    height : 850px;
		 	padding: 10px;
		 	
    	}
    	
    	#taskCountTableOuterTableRow
    	{ 		
    		padding-top: 50px;	
    		height : 300px;
            padding-left : 50px;
            width: 100%;
    	}
    	
    	#taskByAgeTableOuterTableRow
    	{
    		padding-top: 50px;
    		height: 300px;
    		padding-left: 50px;
    	}
    	
    	#ownerByTaskAgeTableOuterTableRow
    	{
    		padding-top: 50px;
    		height: 300px;
    		padding-left: 50px;
			
    	}
    	
    	#taskCountTable
    	{
    		
    	}
    	
		#taskByAgeTable
		{
			display: none;
			
		
		}
		
		#ownerByTaskAgeTable
		{
			display: none;
			overflow-y: auto;
		}
		
	}
	</style>

    <script>
    function table_selected()
    {
        var table1Selected = document.getElementById("table1Button").checked;
        var table2Selected = document.getElementById("table2Button").checked;
        var table3Selected = document.getElementById("table3Button").checked;
        
        var table1 = document.getElementById("table1");
        var table2 = document.getElementById("table2");
        var table3 = document.getElementById("table3");
        
        if(table1Selected == true && table2Selected == false && table3Selected == false)
        {
            table1.style.display = 'block';
            table2.style.display = 'none'; 
            table3.style.display = 'none';
        }
        else if(table1Selected == false && table2Selected == true && table3Selected == false)
        {
            table1.style.display = 'none';
            table2.style.display = 'block';
            table3.style.display = 'none';
        }
        else
        {
            table1.style.display = 'none';
            table2.style.display = 'none';
            table3.style.display = 'block';
        }   
    }
    
    function task_table_selected()
    {
    	var sumOfAllTableSelected = document.getElementById("taskCountTableButton").checked;
        var taskSplitByAgeTableSelected = document.getElementById("taskByAgeTableButton").checked;
        var ownerByTaskAgeTableButton = document.getElementById("ownerByTaskAgeTableButton").checked;
                
        var table1 = document.getElementById("taskCountTable");
        var table2 = document.getElementById("taskByAgeTable");
        var table3 = document.getElementById("ownerByTaskAgeTable");
        
        var taskCountRow = document.getElementById("taskCountTableOuterTableRow");
        var taskByAgeRow = document.getElementById("taskByAgeTableOuterTableRow");
        
        var ownerByAgeRow = document.getElementById("ownerByTaskAgeTable");
        
                
        if(sumOfAllTableSelected == true && taskSplitByAgeTableSelected == false && ownerByTaskAgeTableButton == false)
        {
            table1.style.display = 'block';
            table2.style.display = 'none'; 
            table3.style.display = 'none';
            
            taskCountRow.style.height = '500px';
            taskCountRow.style.width = '200px';
            
            
            taskByAgeRow.style.height = '0';
            taskByAgeRow.style.padding.top = '0';
            
            ownerByAgeRow.style.height = '0';
            ownerByAgeRow.style.padding.left = '0';
            ownerByAgeRow.style.padding.top = '0';
        }
        else if(sumOfAllTableSelected == false && taskSplitByAgeTableSelected == true && ownerByTaskAgeTableButton == false)
        {
            table1.style.display = 'none';
            table2.style.display = 'block'; 
            table3.style.display = 'none';
        
            taskCountRow.style.height = '0';
            taskCountRow.style.padding.left = '0';
            taskCountRow.style.padding.top = '0';
                        
            taskByAgeRow.style.height = '500px';
            taskByAgeRow.style.padding.top = '50px';
            

            ownerByAgeRow.style.height = '0';
            ownerByAgeRow.style.padding.left = '0';
            ownerByAgeRow.style.padding.top = '0';
        }
        else
        {
            table1.style.display = 'none';
            table2.style.display = 'none';
            table3.style.display = 'block';
            
            taskCountRow.style.height = '0';
            taskCountRow.style.padding.left = '0';
            taskCountRow.style.padding.top = '0';
                        
            taskByAgeRow.style.height = '0';
            taskByAgeRow.style.padding.top = '0';
            
            ownerByAgeRow.style.height = '500px';
            ownerByAgeRow.style.padding.left = '50px';
            ownerByAgeRow.style.padding.top = '50px';
        }  
    }
    
</script>
</head>

<body>
<center>
<table id = "mainBackgroundTable" CELLPADDING="0" CELLSPACING="0" align = "center">
	<tr> 
		<td> 
			<img alt="city_logo" height= 70 width=70 src="img/city_logo.jpg">
		</td>
		<td align=center>
			<h2>City of Chicago <br> Department of Buildings Permits and Inspections Dashboard</h2>
		</td>
		<td> 
			<img alt="dob_logo" height= 70 width=160 src="img/dob_logo_full.jpg">
		</td>
	</tr>
<!-- 
	<tr>
		<td align = left>
		<div class = "nav">
			<ul class = "hoverUL">
				<li class = "hoverLI"><a href = "main.jsp" title = "Home">Home</a></li>
				<li class = "hoverLI"><a href = "statisticsTab.jsp" title = "Statistics">Statistics</a></li>
			</ul>
		</div>
		</td>
	</tr> hi
-->	
	
	<tr> 
		<td  colspan=3 align = left bgcolor = "#E3E3E3" valign = center > <jsp:include page="h7_main.jsp" /></td>
	</tr>	
	
	<tr> 
		<td colspan=3 align = left bgcolor = "#E3E3E3" valign = center > <jsp:include page="pdox_times.jsp" /></td>
	</tr>


 
</table>
</center>

</body>
</html>

<!-- End of File -->