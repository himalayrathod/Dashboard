<%-- 
*For loading the Time to Permit breakdown for self cert projects

--%>

<head>
	
<script type="text/javascript">

var adtHttp;
var t;


function displayOwnerByTask() 
{
	console.log("Entering displayownerByTask()");
	//document.getElementById("ownerByTaskDiv").innerHTML = null;
		
	 adtHttp = GetXmlHttpObject();
	 
	if (adtHttp == null) {
	  alert ("Browser does not support HTTP Request");
	  return;} 
	
	 var url = "ownerByTask_JSON.jsp";
	 adtHttp.onreadystatechange = ownerByTaskStateChanged;
	 adtHttp.open("GET",url,true);
	 adtHttp.send(null);
	console.log("Exiting displayownerByTask()");
}
 


function ownerByTaskStateChanged() 
{ 	
	console.log("Entering ownerByTaskStateChanged()");
	if (adtHttp.readyState == 4 || adtHttp.readyState=="complete") {

		var at = eval('(' + adtHttp.responseText + ')');
		var ctl = at.ownerByTask.length;		
	
		var contentString = "<table id = 'ownerByTaskAgeTable' CELLPADDING='0' CELLSPACING='0' valign = 'top' align = 'center'>" + 
				"<tr><td colspan = 10 align=center><b>Task Split by Owner Name</b>" + 
				
				
				"</td></tr><tr style = 'background-color: #333333; color: white;'>" +
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
   	   
    	    
    	    if(at.ownerByTask[i].taskname != "null")
   			{
   	    		contentString = contentString + at.ownerByTask[i].taskname;
   	    	}
    	    
    	    contentString = contentString + "</td><td>";
    	    
    	    if(at.ownerByTask[i].ct != "null")
   			{
   	    		contentString = contentString + at.ownerByTask[i].ct;
   	    	}
    	    
    	    contentString = contentString + "</td><td>";
    	    
    	    if(at.ownerByTask[i].typeOfTeam == "P" || at.ownerByTask[i].typeOfTeam == "p")
    	    {    	    	
    	    	console.log("Inside if...p");
    	    	if(at.ownerByTask[i].zeroTo4 != "null")
      	    	{
      	    		contentString = contentString + 
      	    				"<label  onClick='displayPrjsOwnerIndividualTask(\"" + at.ownerByTask[i].taskname +
      	    				"\", \"0-4\");' value='" +
      	    				at.ownerByTask[i].zeroTo4 + "'>" + at.ownerByTask[i].zeroTo4 + "</label>"; 
      	    	}
        	    
        	    contentString = contentString + "</td><td>";
        	    
        	    if(at.ownerByTask[i].fiveTo10 != "null")
        	    {
        	    	contentString = contentString + 
      				"<label  onClick='displayPrjsOwnerIndividualTask(\"" + at.ownerByTask[i].taskname +
      				"\", \"5-10\");' value='" +
      				at.ownerByTask[i].fiveTo10 + "'>" + at.ownerByTask[i].fiveTo10+ "</label>"; 
      	    	}
        	    
        	    contentString = contentString + "</td><td>";
        	    
        	    if(at.ownerByTask[i].elevenTo15 != "null")
        	    {
        	    	contentString = contentString + 
      				"<label  onClick='displayPrjsOwnerIndividualTask(\"" + at.ownerByTask[i].taskname +
      				"\", \"11-15\");' value='" +
      				at.ownerByTask[i].elevenTo15 + "'>" + at.ownerByTask[i].elevenTo15+ "</label>";
      			}
        	    
        	    contentString = contentString + "</td><td>";
        	    
        	    if(at.ownerByTask[i].sixteenTo20 != "null")
        	    {
        	    	contentString = contentString + 
      				"<label  onClick='displayPrjsOwnerIndividualTask(\"" + at.ownerByTask[i].taskname +
      				"\", \"16-20\");' value='" +
      				at.ownerByTask[i].sixteenTo20 + "'>" + at.ownerByTask[i].sixteenTo20+ "</label>";
      			}
        	    
        	    contentString = contentString + "</td><td>";
        	    
        	    if(at.ownerByTask[i].twentyoneTo30 != "null")
        	    {
        	    	contentString = contentString + 
      				"<label  onClick='displayPrjsOwnerIndividualTask(\"" + at.ownerByTask[i].taskname +
      				"\", \"21-30\");' value='" +
      				at.ownerByTask[i].twentyoneTo30 + "'>" + at.ownerByTask[i].twentyoneTo30+ "</label>";
        	    }
        	            	    
        	    contentString = contentString + "</td><td>";
        	    		
        	    if(at.ownerByTask[i].thirtyoneTo50 != "null")
        	    {
        	    	contentString = contentString + 
      				"<label  onClick='displayPrjsOwnerIndividualTask(\"" + at.ownerByTask[i].taskname +
      				"\", \"31-50\");' value='" +
      				at.ownerByTask[i].thirtyoneTo50 + "'>" + at.ownerByTask[i].thirtyoneTo50+ "</label>";
      			}	
        	    
        	    contentString = contentString + "</td><td>";
        	    
        	    if(at.ownerByTask[i].fiftyoneTo100 != "null")
        	    {
        	    	contentString = contentString + 
      				"<label  onClick='displayPrjsOwnerIndividualTask(\"" + at.ownerByTask[i].taskname +
      				"\", \"51-100\");' value='" +
      				at.ownerByTask[i].fiftyoneTo100 + "'>" + at.ownerByTask[i].fiftyoneTo100+ "</label>";
        	    }
        	    
        	    contentString = contentString + "</td><td>";
        	    
        	    if(at.ownerByTask[i].hundredandonePlus != "null")
        	    {
        	    	contentString = contentString + 
      				"<label  onClick='displayPrjsOwnerIndividualTask(\"" + at.ownerByTask[i].taskname +
      				"\", \"101-1000\");' value='" +
      				at.ownerByTask[i].hundredandonePlus + "'>" + at.ownerByTask[i].hundredandonePlus+ "</label>";
        	    }   
    	    	
    	    }
    	    else
    	    {
    	    	console.log("Inside else...");
    	    	if(at.ownerByTask[i].zeroTo4 != "null")
      	    	{
      	    		contentString = contentString + 
   	    				"<label  onClick='displayPrjsOwnerGroupTask(\"" + at.ownerByTask[i].taskname +
   	    				"\", \"0-4\");' value='" +
   	    				at.ownerByTask[i].zeroTo4 + "'>" + at.ownerByTask[i].zeroTo4 + "</label>"; 
      	    	}
        	    
        	    contentString = contentString + "</td><td>";
        	    
        	    if(at.ownerByTask[i].fiveTo10 != "null")
        	    {
        	    	contentString = contentString + 
	      				"<label  onClick='displayPrjsOwnerGroupTask(\"" + at.ownerByTask[i].taskname +
	      				"\", \"5-10\");' value='" +
	      				at.ownerByTask[i].fiveTo10 + "'>" + at.ownerByTask[i].fiveTo10+ "</label>"; 
      	    	}
        	    
        	    contentString = contentString + "</td><td>";
        	    
        	    if(at.ownerByTask[i].elevenTo15 != "null")
        	    {
        	    	contentString = contentString + 
	      				"<label  onClick='displayPrjsOwnerGroupTask(\"" + at.ownerByTask[i].taskname +
	      				"\", \"11-15\");' value='" +
	      				at.ownerByTask[i].elevenTo15 + "'>" + at.ownerByTask[i].elevenTo15+ "</label>";
      			}
        	    
        	    contentString = contentString + "</td><td>";
        	    
        	    if(at.ownerByTask[i].sixteenTo20 != "null")
        	    {
        	    	contentString = contentString + 
	      				"<label  onClick='displayPrjsOwnerGroupTask(\"" + at.ownerByTask[i].taskname +
	      				"\", \"16-20\");' value='" +
	      				at.ownerByTask[i].sixteenTo20 + "'>" + at.ownerByTask[i].sixteenTo20+ "</label>";
      			}
        	    
        	    contentString = contentString + "</td><td>";
        	    
        	    if(at.ownerByTask[i].twentyoneTo30 != "null")
        	    {
        	    	contentString = contentString + 
	      				"<label  onClick='displayPrjsOwnerGroupTask(\"" + at.ownerByTask[i].taskname +
	      				"\", \"21-30\");' value='" +
	      				at.ownerByTask[i].twentyoneTo30 + "'>" + at.ownerByTask[i].twentyoneTo30+ "</label>";
        	    }
        	    
        	    contentString = contentString + "</td><td>";
        	    		
        	    if(at.ownerByTask[i].thirtyoneTo50 != "null")
        	    {
        	    	contentString = contentString + 
	      				"<label  onClick='displayPrjsOwnerGroupTask(\"" + at.ownerByTask[i].taskname +
	      				"\", \"31-50\");' value='" +
	      				at.ownerByTask[i].thirtyoneTo50 + "'>" + at.ownerByTask[i].thirtyoneTo50+ "</label>";
      			}	
        	    
        	    contentString = contentString + "</td><td>";
        	    
        	    if(at.ownerByTask[i].fiftyoneTo100 != "null")
        	    {
        	    	contentString = contentString + 
	      				"<label  onClick='displayPrjsOwnerGroupTask(\"" + at.ownerByTask[i].taskname +
	      				"\", \"51-100\");' value='" +
	      				at.ownerByTask[i].fiftyoneTo100 + "'>" + at.ownerByTask[i].fiftyoneTo100+ "</label>";
        	    }
        	    
        	    contentString = contentString + "</td><td>";
        	    
        	    if(at.ownerByTask[i].hundredandonePlus != "null")
        	    {
        	    	contentString = contentString + 
	      				"<label  onClick='displayPrjsOwnerGroupTask(\"" + at.ownerByTask[i].taskname +
	      				"\", \"101-1000\");' value='" +
	      				at.ownerByTask[i].hundredandonePlus + "'>" + at.ownerByTask[i].hundredandonePlus+ "</label>";
        	    }  
    	    	
    	    }
    	    
    	    
		}
		document.getElementById("ownerByTaskAgeDiv").innerHTML = contentString + " </table>";
//		document.getElementById("ownerByTaskAgeDiv").innerHTML = contentString + " </table>";
		
 	}
	
	console.log("Exiting ownerByTaskStateChanged()");
}

</script>
