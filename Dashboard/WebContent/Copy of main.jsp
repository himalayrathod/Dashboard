<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Department of Buildings Dashboard</title>

	<style>
		#table1, #table2
		{
			display: none;
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
    </script>




</head>
<body>



<center>
<table CELLPADDING="0" CELLSPACING="0"> 
	<tr> 
		<td> 
			<img alt="" height= 70 width=70 src="img/city_logo.jpg">
		</td>
		<td align=center>
			<h2>City of Chicago <br> Department of Buildings Permits and Inspections Dashboard</h2>
		</td>
		<td> 
			<img alt="" height= 70 width=160 src="img/dob_logo_full.jpg">
		</td>
	</tr>

	<tr> 
		<td  colspan=3 align = left bgcolor = "#E3E3E3" valign = center > <jsp:include page="h7_main.jsp" />  </td>
	</tr>	
	
	<tr> 
		<td colspan=3 align = left bgcolor = "#E3E3E3" valign = center > <jsp:include page="pdox_times.jsp" />  </td>
	</tr>


	<tr> 
		<td colspan=3 align = left bgcolor = "#E3E3E3" valign = center > <jsp:include page="pdox_queue.jsp" />  </td>
	</tr>
</table>
</center>

</body>
</html>