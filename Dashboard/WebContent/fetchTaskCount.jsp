<%-- 
*For loading the Time to Permit breakdown for self cert projects

--%>

<head>
	
<script type="text/javascript">

var adtHttp;
var t;


function displayTaskCount() 
{
	console.log("Entering displayTasksCount()");
	document.getElementById("taskCountDiv").innerHTML = null;
		
	 adtHttp = GetXmlHttpObject();
	 
	if (adtHttp == null) {
	  alert ("Browser does not support HTTP Request");
	  return;} 
	
	 var url = "taskCount_JSON.jsp";
	 adtHttp.onreadystatechange = TaskCountStateChanged;
	 adtHttp.open("GET",url,true);
	 adtHttp.send(null);

	 console.log("Exiting displayTasksCount()"); 
 }
 


function TaskCountStateChanged() 
{ 	
	console.log("Entering TaskCountStateChanged()");
	if (adtHttp.readyState == 4 || adtHttp.readyState=="complete") {

		var at = eval('(' + adtHttp.responseText + ')');
		var ctl = at.taskCount.length;		

		var contentString = "<table id = 'taskCountTable' bgcolor='99CCFF' CELLPADDING='0' CELLSPACING='0' valign = 'top' align = 'center'>" + 
				"<tr><td colspan = 4 align=center><b>Combined Total of All Task Queue</b></td></tr><tr style = 'background-color: #333333; color: white;'><td><b>Task</b></td><td><b>SPR</b></td><td><b>DS</b></td><td><b>Zoning</b></td></tr>";
		
		for (i=0; i <ctl; i++ ) 
		{    	       
   	    	if(i%2 == 0)
   	    	{
   	    		contentString = contentString + "<tr style = 'background-color: white;'><td>" ;
   	    	}
   	    	else
  	    	{
   	    		contentString = contentString + "<tr style = 'background-color: #B2B2B2;'><td>" ;
  	    	}
   	     

    	    if(at.taskCount[i].taskname.toUpperCase() === ("CertifiedCorrectionsResubmittalReview").toUpperCase())
			{
    	    	contentString = contentString + "Cert. Corr. Resub. Review";
			}    	    
			else if(at.taskCount[i].taskname.toUpperCase() === ("CertifiedCorrectionsReview").toUpperCase())
			{
				contentString = contentString +"Cert. Corr. Review";
			}
			else if(at.taskCount[i].taskname.toUpperCase() === ("PrescreenResubmittalReview").toUpperCase())
			{
				contentString = contentString +"Prescrn Resubm. Review";
			}
			else if(at.taskCount[i].taskname.toUpperCase() === ("SelfCertificationResubmit").toUpperCase())
			{
				contentString = contentString + "Self Cert. Resubm.";
			}
			else
			{
				contentString = contentString + at.taskCount[i].taskname;
			}
    	    
    	    contentString = contentString + "</td><td>";
    	    
    	    if(at.taskCount[i].SPR != "null")
    	    {
    	    	contentString = contentString + at.taskCount[i].SPR;
    	   	}
    	    
    	    contentString = contentString + "</td><td>";
    	    
    	    if(at.taskCount[i].DS != "null")
    	    {
    	    	contentString = contentString + at.taskCount[i].DS;
    	   	}
    	    
    	    contentString = contentString + "</td><td>";
    	    
    	    if(at.taskCount[i].Zoning != "null")
   	    	{
    	    	contentString = contentString + at.taskCount[i].Zoning + "</td>";
   	    	}
    	    
    	   // contentString = contentString + "</td><td>";
     	}
		document.getElementById("taskCountDiv").innerHTML = contentString + " </table>";
 	}
	console.log("Exiting TaskCountStateChanged()");
}
</script>
