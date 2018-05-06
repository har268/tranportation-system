<%-- 
    Document   : NewRequestRoute
    Created on : 1 Jul, 2016, 1:50:55 PM
    Author     : Suryansh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Scanner"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="templatemo_style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="templatemo_background_section_top">
		
			<div class="templatemo_container">
			<div id="templatemo_header" >
				

				<div id="templatemo_logo">

					<h1>Transport Change Requisition </h1>


       </div>           
        <%
            
            String idi = request.getParameter("id");
            String id = session.getAttribute("id").toString();
            if(idi== null)
            {
            idi=id;
            }
            
            
            
            String log = " ";
            String name = " " ;
            String gender = " ";
            String depart = " ";
            String fname = " ";
            
            
            String pname  = " ";
            
            String manager = " ";
           
            String dgm = " ";
            
            
            try
            {
                
//            out.print(id);
                String myDriver = "com.mysql.jdbc.Driver";
                String myUrl = "jdbc:mysql://localhost/choudhary";
                Class.forName(myDriver);
                Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
//                out.println("Connection made");
                
      // create a sql date object so we can use it in our INSERT statement
      
      // the mysql insert statement
      
                Statement stmt = conn.createStatement();
                String query = " select * from employee where employee.e_id= " + "'"+idi+"'";
//                out.println(query);
                ResultSet rs = stmt.executeQuery(query);
      
      // create the mysql insert preparedstatement
                       
            
        while(rs.next())
        {
             idi = rs.getString("e_id");
            name = rs.getString("e_name");
            gender = rs.getString("gender");
             depart = rs.getString("depart");
             pname = rs.getString("p_name");
             manager = rs.getString("manager");
             dgm = rs.getString("DGM");
            log = rs.getString("logic_level");
            
//            out.println("values are");
            
//            out.println("Id is " + id + "\n");
 
//            out.println("Name is " + name + "\n");
//            out.println("Gender is " + gender + "\n");
//            out.println("Department is " + depart + "\n");
//            out.println("Process Name is " + pname + "\n");
//            out.println("Manger's name is " + manager);
//            out.println("DGM's name is " + dgm);
//            out.println("Logical level is " + log);
//            
            
        %>
   <div id="templatemo_menu">
                		<div id="templatemo_menu_bg_l"></div>
                    <div id="templatemo_menu_bg_r">
                    	<ul>
	
                            <li class="current"><a id="new"  href="NewRequestRoute.jsp" ><b> New Request</b></a></li>  
                            <li><a id="on"  href="OnBehalfStatus.jsp"><b>On Behalf request</b></a></li>
                            <li><a id="history" href="newjsp.jsp"><b>Request History</b></a></li>
                            <li> <a id="pending" href="PendingSol.jsp"><b>Approve Request</b></a></li>
                            <li> <a id="thd" href="THDforward.jsp"><b>THD Request</b></a></li>
                        </ul>
                    </div>

                </div>
 </div>
</div>
<script type="text/javascript">

 if("<%=log%>"==="B"  || "<%=log%>"==="C" )
    {   
        if("<%=depart%>" === "TRANSPORT" || "<%=depart%>" === "transport")
        {
        document.getElementById('new').style.visibility = 'visible';
        document.getElementById('on').style.display = 'none';
        document.getElementById('history').style.visibility = 'visible';
        document.getElementById('pending').style.display = 'none';
        document.getElementById('thd').style.visibility = 'visible';
        }
        else 
        {
        document.getElementById('new').style.visibility = 'visible';
        document.getElementById('on').style.display = 'none';
        document.getElementById('history').style.visibility = 'visible';
        document.getElementById('pending').style.display = 'none';
        document.getElementById('thd').style.display = 'none';
            
        }   
}
if("<%=log%>"!=="B" && "<%=log%>"!=="C")
    {   
        
        if("<%=depart%>" === "TRANSPORT" || "<%=depart%>" === "transport")
        {
        document.getElementById('new').style.visibility = 'visible';
        document.getElementById('on').style.visibility = 'visible';
        document.getElementById('history').style.visibility = 'visible';
        document.getElementById('pending').style.visibility = 'visible';
        document.getElementById('thd').style.visibility = 'visible';
        }
        else 
        {
         document.getElementById('new').style.visibility = 'visible';
        document.getElementById('on').style.visibility = 'visible';
        document.getElementById('history').style.visibility = 'visible';
        document.getElementById('pending').style.visibility = 'visible';
        document.getElementById('thd').style.display = 'none';
            
        } 
}



    </script>
                
        <%
        }
        rs.close();
        
        stmt.close();
            }
            catch(Exception e)
            {
                out.println("You my friend have entered an exception");
            }
            
try
{
  String myDriver = "com.mysql.jdbc.Driver";
                String myUrl = "jdbc:mysql://localhost/choudhary";
                Class.forName(myDriver);
                Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
      
      // create a sql date object so we can use it in our INSERT statement
      
      // the mysql insert statement
//                out.println("Selecting manager's logical level");
                
                Statement stmt = conn.createStatement();
                String query = " select logic_level from employee where employee.e_name= " + "'"+manager+"'";
//                out.println(query);
                ResultSet rs = stmt.executeQuery(query);  
                while(rs.next())
                {
//                    out.println("While loop is on");
                    log=rs.getString("logic_level");
//                    out.println(log);
                }
}
catch(Exception e)
{
    out.println("Exceptions everywhere");
}
%>
       <div id="label">
<label>
                 
                      <input name="button" type="button" value="Initialization"> 	
                      	<input name="button"  type="button" value="Approve">
	<input type="button"  value="Acknowledgement">
                  
                  </label>
</div>
                <strong>
                <h3 align="center">New Request</h3>
                </strong></p>
     <script language="javascript" type="text/javascript">
function checkvalue(val) {
if (val === "regular")
{document.getElementById('cab_regular').style.display = 'block';
document.getElementById('cab_spot').style.display = 'none';
document.getElementById('pickup_time').style.display = 'none';
document.getElementById('drop_time').style.display = 'none';
document.getElementById('pickupanddrop_time').style.display = 'none';}
else if(val === "spot")
{document.getElementById('cab_spot').style.display = 'block';
document.getElementById('cab_regular').style.display = 'none';
document.getElementById('pickup_time').style.display = 'none';
document.getElementById('drop_time').style.display = 'none';
document.getElementById('pickupanddrop_time').style.display = 'none';
}
else{
document.getElementById('cab_regular').style.display = 'none';
document.getElementById('cab_spot').style.display = 'none';
document.getElementById('pickup_time').style.display = 'none';
document.getElementById('drop_time').style.display = 'none';
document.getElementById('pickupanddrop_time').style.display = 'none';
}}
</script><script>
function checkvalue1(val1) {
if (val1 === "pickup")
{document.getElementById('pickup_time').style.display = 'block';
document.getElementById('drop_time').style.display = 'none';
document.getElementById('pickupanddrop_time').style.display = 'none';}
else if(val1 === "drop")
{document.getElementById('pickup_time').style.display = 'none';
document.getElementById('drop_time').style.display = 'block';
document.getElementById('pickupanddrop_time').style.display = 'none';
}
else{
document.getElementById('pickup_time').style.display = 'none';
document.getElementById('drop_time').style.display = 'none';
document.getElementById('pickupanddrop_time').style.display = 'block';
}}
</script>
         
<form action="Second.jsp" id="main" >
  <table align="center" width=600>
<tr>
<td>Employee Id:</td>
<td> <input type="text" name="id" value="<%=idi%>"></td>
</tr>
<tr>
<td>Employee Name:</td>
<td><input type="text" name="ename" readonly value="<%=name%>"></td>
</tr>
<tr>
<td>Gender:</td>
<td><input type="text" name="gen" readonly value="<%=gender%>"></td>
</tr>
<tr>
<td>LOB:</td>
<td><input type="text" name="lob" readonly value="<%=depart%>"></td>

</tr>
<tr>
<td>Process Name:</td>
<td><input type="text" name="pname" readonly value="<%=pname%>"></td>
</tr>
</table>
 

<table align="center" width=600px>
<tr>
<td>Cab Type:</td>

<td></td><td></td><td></td><td></td><td></td><td>
<select name="cabtype" onclick='checkvalue(this.value)' width=200 >
<option>Select Cab Type</option>
<option value="regular">REGULAR</option>

<option value="spot">SPOT</option>

</select></td></tr></table>

<div id="cab_regular" style='display:none'>

<table align="center"  width=600px>
<tr>
<td>Approving Authority</td>
<td><input type="text" name="auth" readonly value="Manager"></td></tr>

<tr>
<td>Approving Authority Name</td>
<td>
    <select name="name">
        <option selected>Select Manager</option>
        
<%
try
{
    String myDriver = "com.mysql.jdbc.Driver";
                String myUrl = "jdbc:mysql://localhost/choudhary";
                Class.forName(myDriver);
                Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
      
      // create a sql date object so we can use it in our INSERT statement
      
      // the mysql insert statement
      
                Statement stmt = conn.createStatement();
                String query = " select e_name from employee where employee.logic_level= " + "'"+log+"'";
//                out.println("Selecting names of the logical level");
                ResultSet rs = stmt.executeQuery(query);
                while(rs.next())
                {
                    fname=rs.getString("e_name");
//                    out.println(fname);
                  %>
                    <option>  <%=fname%> </option>
                  <%
                    
                }
}
catch(Exception e)
{
    out.println("Exception in selecting name");
}
  %>
    
    </select>
   </td></tr>
       

<%
//try
//{
//    String myDriver = "com.mysql.jdbc.Driver";
//                String myUrl = "jdbc:mysql://localhost/choudhary";
//                Class.forName(myDriver);
//                Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
//      
//      // create a sql date object so we can use it in our INSERT statement
//      
//      // the mysql insert statement
//      
//                Statement stmt = conn.createStatement();
//                String query = " select e_name from employee where employee.logic_level= " + "'"+log+"'";
////                out.println("Selecting names of the logical level");
//                ResultSet rs = stmt.executeQuery(query);
//                while(rs.next())
//                {
//                    fname=rs.getString("e_name");
////                    out.println(fname);
////                    out.println(fname);
//                    
//                   
//                   
//                }
//}
//catch(Exception e)
//{
//    out.println("Exception in selecting name");
//}
//             %>
         
<!--<tr>
<td>Approving Authority Name</td>
<td><input type="text" name="name" readonly value="<%=fname%>"></td></tr>-->
          

       
         
	
  
        
    


<tr> <td>Required Date:</td><td> From<input type="date" name="fdate">
To
<input type="date" name="tdate"></td></tr>
<tr><td>Request For</td>
<td> <input type="radio" name="req" value="pickup" onchange='checkvalue1(this.value)' > pickup
  <input type="radio" name="req" value="drop" onchange='checkvalue1(this.value)'> drop
  <input type="radio" name="req" value="pickup&drop" onchange='checkvalue1(this.value)'> pickup&drop
</td></tr></table>
        
</div>
<div name="cab_spot" id="cab_spot" style='display:none'>
<table align="center" width=600>
<tr><td>Approving Authority</td>
    <td><input type="text" name="auth" readonly value="DGM"></td></tr>
    <tr><td>Required Date:</td><td>From<input type="date" name="fdate">
To
<input type="date" name="tdate"></td></tr>

<tr><td>Request For</td>
<td>
<input type="radio" name="req" value="pickup" onchange='checkvalue1(this.value)'> pickup
  <input type="radio" name="req" value="drop" onchange='checkvalue1(this.value)'> drop
  <input type="radio" name="req" value="pickup&drop" onchange='checkvalue1(this.value)'> pickup&drop

</td></tr></table>
    
</div>


<div id="pickup_time" style='display:none'>
<table align="center" width=600>
<tr><td>Request location</td>
<td><input type="text"  name="loc"></td></tr>
<tr><td>Pickup shift Timing</td>
<td>    
<input type="time" name="pick" value=""></td></tr>
<tr></tr><tr><td>Shift change Reason</td>
<td>    
<input type="text" name="reason" value=""></td></tr>
<tr></tr>
</table>
</div>
<div name="drop_time" id="drop_time"  style='display:none'>
<table align="center" width=600>

<tr><td>Request location</td>
<td><input type="text"  name="loc"></td></tr>
<tr><td>Drop shift Timing</td>
<td>    
<input type="time" name="drop" value=""></td></tr>
<tr></tr><tr><td>Shift change Reason</td>
<td>    
<input type="text" name="reason" value=""></td></tr>
<tr></tr><tr><td>

</table>
</div>


<div  name="pickupanddrop_time" id="pickupanddrop_time"   style='display:none'>
<table align="center" width=600>
<tr><td>Request location</td>
<td><input type="text"  name="loc"></td></tr>

<tr><td>Pickup shift Timing</td>
<td>    
<input type="time" name="pick" value=""></td></tr>

<tr><td>Drop shift Timing</td>
<td>    
<input type="time" name="drop" value=""></td></tr>
<tr></tr><tr><td>Shift change Reason</td>
<td>    
<input type="text" name="reason" value=""></td></tr>
<tr></tr><tr><td>

</table>

</div>
             <table align="center" width=600>
        <div align="center">
            <tr><td>
          <input type="submit" value="submit" />  </td>
<td><input type="button" value="Cancel"></td></tr>
        </div> 
             </table>
<!-- <script language="javascript" type="text/javascript">
function checkvalue(val) {
if (val === "regular")
{document.getElementById('cab_regular').style.display = 'block';
document.getElementById('cab_spot').style.display = 'none';
document.getElementById('pick').style.display = 'none';
document.getElementById('drop').style.display = 'none';
document.getElementById('reason').style.display = 'none';
document.getElementById('location').style.display = 'none';}
else if(val === "spot")
{document.getElementById('cab_spot').style.display = 'block';
document.getElementById('cab_regular').style.display = 'none';
ocument.getElementById('pick').style.display = 'none';
document.getElementById('drop').style.display = 'none';
document.getElementById('reason').style.display = 'none';
document.getElementById('location').style.display = 'none';
}
else{
document.getElementById('cab_regular').style.display = 'none';
document.getElementById('cab_spot').style.display = 'none';
ocument.getElementById('pick').style.display = 'none';
document.getElementById('drop').style.display = 'none';
document.getElementById('reason').style.display = 'none';
document.getElementById('location').style.display = 'none';
}}
</script>
<script>
function checkvalue1(val1)
{
if (val1 === "pickup")
{
document.getElementById('location').style.display = 'block';
document.getElementById('pick').style.display = 'block';
document.getElementById('reason').style.display = 'block';
document.getElementById('drop').style.display = 'none';
}
else if(val1 === "drop")
{
document.getElementById('location').style.display = 'block';
document.getElementById('drop').style.display = 'block';
document.getElementById('reason').style.display = 'block';
document.getElementById('pick').style.display = 'none';
}
else 
{
document.getElementById('location').style.display = 'block';
document.getElementById('pick').style.display = 'block';
document.getElementById('drop').style.display = 'block';
document.getElementById('reason').style.display = 'block';

}
}
//else  {
//ddocument.getElementById('location').style.display = 'none';
//document.getElementById('drop').style.display = 'none';
//document.getElementById('reason').style.display = 'none';
//document.getElementById('pick').style.display = 'none';
//}
    

</script>-->

<!--                    <div id='location' style='display:none'>
                        <table align="center" width=600>
<tr><td>Request location</td>
<td><input type="text"  name="loc" value=""></td></tr>
                        </table>
                    </div>
                     <div id='pick' style='display:none'>
                        <table align="center" width=600>
<tr><td>Pickup  Shift Timing</td>
<td><input type="time"  name="pick" value=""></td></tr>
                        </table>
                    </div>
 <div id='drop' style='display:none'>
                        <table align="center" width=600>
                            <tr><td>Drop Shift Timing</td>
<td><input type="time"  name="drop" value=""></td></tr>
                        </table>
                    </div>
                     <div id='reason' style='display:none'>
                        <table align="center" width=600>
<tr><td>Shift change reason</td>
<td><input type="text"  name="reason" value=""></td></tr>
                        </table>
                    </div>-->
        </form>




</body>
</html>          
