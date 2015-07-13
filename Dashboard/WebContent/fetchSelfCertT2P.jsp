<%-- 
*For loading the Time to Permit breakdown for self cert projects

--%>

<head>
	
<script type="text/javascript">

var adtHttp;
var t;


function displayTasksSC() 
{
	console.log("Entering displayTasksSC()");
	document.getElementById("selfCertAverageTimesDiv").innerHTML = null;
		
	 adtHttp = GetXmlHttpObject();
	 
	if (adtHttp == null) 
	{
		  alert ("Browser does not support HTTP Request");
		  return;
	} 
	
	var url = "selfcertT2P_JSON.jsp";
	adtHttp.onreadystatechange = T2PSCstateChanged;
	adtHttp.open("GET",url,true);
	adtHttp.send(null);
	console.log("Exiting displayTasksSC()");
}
 


function T2PSCstateChanged() 
{ 
	console.log("Entering T2PSCstateChanged()");
	if (adtHttp.readyState == 4 || adtHttp.readyState=="complete") {

		var at = eval('(' + adtHttp.responseText + ')');
		var ctl = at.t2psc.length;		
		var t2p_sc = 0.00;

		var contentString = "<table id = 'selfCertAverageTimesTable' bgcolor='99CCFF' border = 'show' CELLPADDING='0' CELLSPACING='0' valign = 'top' align = 'center'>" + 
				"<tr><td colspan = 4 align=center><b>Self Cert Average Times</b></td></tr><tr style = 'background-color: #333333; color: white;'><td><b>Task</b></td><td><b>Avg Time</b></td><td><b>NumProjects</b></td><td><b>T2P</b></td></tr>";
		
		for (i=0; i <ctl; i++ ) 
		{    	    
    	    if (parseInt(at.t2psc[i].ordr)%2 == 0) 
    	    { 
    	    	contentString = contentString + "<tr bgcolor='FF8C00'> <td>" ;
    	    } 
    	    else 
    	    { 
    	    	if(i%2 == 0)
    	    	{
    	    		contentString = contentString + "<tr style = 'background-color: white;'><td>" ;
    	    	}
    	    	else
   	    		{
    	    		contentString = contentString + "<tr style = 'background-color: #B2B2B2;'><td>" ;
   	    		}
    	    }  

    	    if(at.t2psc[i].taskname.toUpperCase() === ("PrescreenResubmittalReview").toUpperCase())
			{
    	    	contentString = contentString + "Pres. Resubm. Review";
			}    	    
			else if(at.t2psc[i].taskname.toUpperCase() === ("Upload CertifiedCorrections").toUpperCase())
			{
				contentString = contentString +"Upload Cert. Corrections";
			}
			else if(at.t2psc[i].taskname.toUpperCase() === ("CertifiedCorrectionsReview").toUpperCase())
			{
				contentString = contentString +"Cert. Corrections Review";
			}
			else if(at.t2psc[i].taskname.toUpperCase() === ("CertifiedCorrectionsResubmittalReview").toUpperCase())
			{
				contentString = contentString + "Cert. Corrections Resubm. Review";
			}
			else if(at.t2psc[i].taskname.toUpperCase() === ("SelfCertificationCorrectionComplete").toUpperCase())
			{
				contentString = contentString +"Self Cert. Corrections Comp.";
			}
			else
			{
				contentString = contentString + at.t2psc[i].taskname;
			}
    	       	    
    	    contentString = contentString + "</td><td>"+at.t2psc[i].avgtm+"</td><td>" +at.t2psc[i].ct+"</td> <td>"+at.t2psc[i].t2p+"</td></tr>";
			
    	    t2p_sc = Number.parseFloat(t2p_sc) + Number.parseFloat(at.t2psc[i].t2p); 
    	      
		}		
		document.getElementById("selfCertAverageTimesDiv").innerHTML = contentString + "	<tr><td colspan=4 bgcolor='1E90FF'> Self Cert Time to Permit :" + Math.round(t2p_sc) + " days</td> </tr></table>";
 	}
	console.log("Exiting T2PSCstateChanged()");
}

</script>
