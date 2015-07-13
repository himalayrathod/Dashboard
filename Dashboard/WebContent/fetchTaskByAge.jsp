<%-- 
*For loading the Time to Permit breakdown for self cert projects

--%>

<head>
	
<script type="text/javascript">

var adtHttp;
var t;


function displayTaskByAge() 
{
	console.log("Entering displayTaskByAge()");
	document.getElementById("taskByAgeDiv").innerHTML = null;
		
	 adtHttp = GetXmlHttpObject();
	 
	if (adtHttp == null) {
	  alert ("Browser does not support HTTP Request");
	  return;} 
	
	 var url = "taskByAge_JSON.jsp";
	 adtHttp.onreadystatechange = TaskByAgeStateChanged;
	 adtHttp.open("GET",url,true);
	 adtHttp.send(null);
	console.log("Exiting displayTaskByAge()");
}
 


function TaskByAgeStateChanged() 
{ 	
	console.log("Entering TaskByAgeStateChanged()");
	if (adtHttp.readyState == 4 || adtHttp.readyState=="complete") {

		var at = eval('(' + adtHttp.responseText + ')');
		var ctl = at.taskByAge.length;		
	
		var contentString = "<table id = 'taskByAgeTable' CELLPADDING='0' CELLSPACING='0' valign = 'top' align = 'center'>" + 
				"<tr><td colspan = 10 align=center><b>Task Split by Age</b></td></tr><tr style = 'background-color: #333333; color: white;'>" +
				"<td><b>Task</b></td><td><b>Total</b></td><td><b>0-4</b></td><td><b>5-10</b></td>" + 
				"<td><b>11-15</b></td><td><b>16-20</b></td><td><b>21-30</b></td><td><b>31-50</b></td>" +
				"<td><b>51-100</b></td><td><b>101+</b></td></tr>";
		
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
   	     

    	    if(at.taskByAge[i].taskname.toUpperCase() === ("CertifiedCorrectionsResubmittalReview").toUpperCase())
			{
    	    	contentString = contentString + "Cert. Corr. Resub. Review";
			}    	    
			else if(at.taskByAge[i].taskname.toUpperCase() === ("CertifiedCorrectionsReview").toUpperCase())
			{
				contentString = contentString +"Cert. Corr. Review";
			}
			else if(at.taskByAge[i].taskname.toUpperCase() === ("PrescreenResubmittalReview").toUpperCase())
			{
				contentString = contentString +"Prescrn Resubm. Review";
			}
			else if(at.taskByAge[i].taskname.toUpperCase() === ("SelfCertificationResubmit").toUpperCase())
			{
				contentString = contentString + "Self Cert. Resubm.";
			}
			else
			{
				contentString = contentString + at.taskByAge[i].taskname;
			}
    	       	    
    	    contentString = contentString + "</td><td>" + at.taskByAge[i].ct;
    	    
    	    
    	    contentString = contentString + "</td><td>";
    	    
    	    if(at.taskByAge[i].zeroTo4 != "null")
  	    	{
  	    		contentString = contentString + 
  	    				"<label  onClick='displayPrjs(\"" + at.taskByAge[i].taskname +
  	    				"\", \"0-4\");' value='" +
  	    				at.taskByAge[i].zeroTo4 + "'>" + at.taskByAge[i].zeroTo4 + "</label>"; 
  	    	}
    	    
    	    contentString = contentString + "</td><td>";
    	    
    	    if(at.taskByAge[i].fiveTo10 != "null")
    	    {
    	    	contentString = contentString + 
  				"<label  onClick='displayPrjs(\"" + at.taskByAge[i].taskname +
  				"\", \"5-10\");' value='" +
  				at.taskByAge[i].fiveTo10 + "'>" + at.taskByAge[i].fiveTo10+ "</label>"; 
  	    	}
    	    
    	    contentString = contentString + "</td><td>";
    	    
    	    if(at.taskByAge[i].elevenTo15 != "null")
    	    {
    	    	contentString = contentString + 
  				"<label  onClick='displayPrjs(\"" + at.taskByAge[i].taskname +
  				"\", \"11-15\");' value='" +
  				at.taskByAge[i].elevenTo15 + "'>" + at.taskByAge[i].elevenTo15+ "</label>";
  			}
    	    
    	    contentString = contentString + "</td><td>";
    	    
    	    if(at.taskByAge[i].sixteenTo20 != "null")
    	    {
    	    	contentString = contentString + 
  				"<label  onClick='displayPrjs(\"" + at.taskByAge[i].taskname +
  				"\", \"16-20\");' value='" +
  				at.taskByAge[i].sixteenTo20 + "'>" + at.taskByAge[i].sixteenTo20+ "</label>";
  			}
    	    
    	    contentString = contentString + "</td><td>";
    	    
    	    if(at.taskByAge[i].twentyoneTo30 != "null")
    	    {
    	    	contentString = contentString + 
  				"<label  onClick='displayPrjs(\"" + at.taskByAge[i].taskname +
  				"\", \"21-30\");' value='" +
  				at.taskByAge[i].twentyoneTo30 + "'>" + at.taskByAge[i].twentyoneTo30+ "</label>";
    	    }
    	    
    	    contentString = contentString + "</td><td>";
    	    		
    	    if(at.taskByAge[i].thirtyoneTo50 != "null")
    	    {
    	    	contentString = contentString + 
  				"<label  onClick='displayPrjs(\"" + at.taskByAge[i].taskname +
  				"\", \"31-50\");' value='" +
  				at.taskByAge[i].thirtyoneTo50 + "'>" + at.taskByAge[i].thirtyoneTo50+ "</label>";
  			}	
    	    
    	    contentString = contentString + "</td><td>";
    	    
    	    if(at.taskByAge[i].fiftyoneTo100 != "null")
    	    {
    	    	contentString = contentString + 
  				"<label  onClick='displayPrjs(\"" + at.taskByAge[i].taskname +
  				"\", \"51-100\");' value='" +
  				at.taskByAge[i].fiftyoneTo100 + "'>" + at.taskByAge[i].fiftyoneTo100+ "</label>";
    	    }
    	    
    	    contentString = contentString + "</td><td>";
    	    
    	    if(at.taskByAge[i].hundredandonePlus != "null")
    	    {
    	    	contentString = contentString + 
  				"<label  onClick='displayPrjs(\"" + at.taskByAge[i].taskname +
  				"\", \"101-1000\");' value='" +
  				at.taskByAge[i].hundredandonePlus + "'>" + at.taskByAge[i].hundredandonePlus+ "</label>";
    	    }   
		}
		document.getElementById("taskByAgeDiv").innerHTML = contentString + " </table>";
		
 	}
	
	console.log("Exiting TaskByAgeStateChanged()");
}

</script>
