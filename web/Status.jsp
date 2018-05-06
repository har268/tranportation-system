
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
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
        String id = request.getParameter("id");
//        out.println("We have req_id as " + id);
        String dec = " ";
        int a = 0;    
         int rid = 0;
        
          String comment = " ";
          
          String type = " ";
          
          
          String ename = " ";
          String post = " ";
          String name = " ";
          String sdate = " ";
          String edate = " ";
          String type_of = " ";
          String loc = " ";
          String pick = " ";
          String drop = " ";
          String reas = " ";
          String authid = " ";
          String adec = " ";
          String tdec = " ";
             String log = " ";
            String depart = " ";
          
   try    
    {
      // create a mysql database connection
      String myDriver = "com.mysql.jdbc.Driver";
      String myUrl = "jdbc:mysql://localhost/choudhary";
      Class.forName(myDriver);      
      Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
      Statement stmt = conn.createStatement();
      
      // create a sql date object so we can use it in our INSERT statement
      
      // the mysql insert statement
//       String query = " select * from requests where requests.e_id = " +id ;
//         ResultSet rs = stmt.executeQuery(query);
         
         
                String query = " select * from employee where employee.e_id= " + "'"+id+"'";
//                out.println(query);
                ResultSet rs = stmt.executeQuery(query);
       
       
       while(rs.next())
      { 
         
          
        // rid = rs.getInt("r_id");
               //   out.println("before");
           id = rs.getString("e_id");
           
          // out.println(id);
              //     out.println("after");
          // type = rs.getString("typ");
          // post = rs.getString("auth_post");
          // ename = rs.getString("auth_name");
         //  sdate = rs.getString("startdate");
         //  edate = rs.getString("enddate");
          // type_of = rs.getString("type_of");
          //loc = rs.getString("location");
          // pick = rs.getString("pickup");
          // drop = rs.getString("dro");
          // reas = rs.getString("reason");
          // authid = rs.getString("auth_id");
          // adec = rs.getString("statusauth");
         //  tdec = rs.getString("statustran");
      //  out.println("issue");
            log = rs.getString("logic_level");
//out.println(log);
            depart = rs.getString("depart");
        //    out.println(depart);
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
    }
        catch(Exception e)
        {
            out.println("HAHA..!  We are exceptions");
            
        }
        %>
        
  <%        
        try
            
        {
             String myDriver = "com.mysql.jdbc.Driver";
//           out.print("First step made");
           
           String myUrl = "jdbc:mysql://localhost/choudhary";
           
           Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
//      out.print("Connection made");
      // create a sql date object so we can use it in our INSERT statement
      
      // the mysql insert statement
      
      Statement stmt = conn.createStatement();
       String query = " select statustran from requests where requests.r_id = " + id   ;
       
      ResultSet rs = stmt.executeQuery(query);
//      out.println("Executed");
      
      while(rs.next())
      {
//          out.println("Entering while");
          dec = rs.getString("statustran");
      }
      
      if (dec != null)
              {
                  a=1;
//                  out.println("You cannot do any changes now");
              }
      else
      {
          a=0;
      }
        }
        
        catch(Exception e)
        {
            out.println("Cannot find transport decision");
        }
          
      
      
        
            
        if (a==0)
        {
        
        
        try
           {
               
//           out.print("Making Connection");
           
           String myDriver = "com.mysql.jdbc.Driver";
//           out.print("First step made");
           
           String myUrl = "jdbc:mysql://localhost/choudhary";
           
           Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
//      out.print("Connection made");
      // create a sql date object so we can use it in our INSERT statement
      
      // the mysql insert statement
      
      Statement stmt = conn.createStatement();
       String query = " select * from requests where requests.r_id = " + id   ;
       
      ResultSet rs = stmt.executeQuery(query);
      
      while(rs.next())
      {
//          out.println("Entered first while");
          rid = rs.getInt("r_id");
           id = rs.getString("e_id");
          
           type = rs.getString("typ");
           post = rs.getString("auth_post");
           name = rs.getString("auth_name");
           sdate = rs.getString("startdate");
           edate = rs.getString("enddate");
           type_of = rs.getString("type_of");
           loc = rs.getString("location");
           pick = rs.getString("pickup");
           drop = rs.getString("dro");
           reas = rs.getString("reason");
           authid = rs.getString("auth_id");
           adec = rs.getString("statusauth");
           tdec = rs.getString("statustran");
           comment = rs.getString("comments");
//          out.println("Values accounted for");
//          out.println("Request id is" + rid);
//          out.println("Employee Id is " + id);
//          out.println("type " + type);
//          out.println("auth_post" + post);
//          out.println("startdate is " +sdate );
//          out.println("Approving Authority Decision is " + adec);
//          out.println("Transport authority decision is " + tdec);
 String qusql = "select e_name from employee where employee.e_id = " + "'"+id+"'";
           
           ResultSet sr = stmt.executeQuery(qusql);
//           out.println("Executed query for ename");
           while(sr.next())
           {
//               out.println("Second While");
               ename= sr.getString("e_name");
//               out.println(ename);
           }
          
          
      }
      
//      out.print("All queries done");
           }
           catch(Exception e)
           {
               out.println(" ");
                       
           }
        }
        
else
        {
            out.println("You are not authorised");
        }
        %>
        
       <div id="label">
<label>
                 
                      <input name="button" type="button" value="Initialization"> 	
                      	<input name="button"  type="button" value="Approve">
	<input type="button"  value="Acknowledgement">
                  
                  </label>
</div>
                <strong><h3 align="center">&nbsp;</h3>
                </strong>
                    <table align="center" cellpadding="0"  cellspacing="0" class="body_content">
      <tr>
        <td width=""  height="" valign="top">
            <table width=""  align="center" border="0" >
              <tr>
                <td colspan="2" valign="middle" align="center"></td>
              </tr>
              <tr>
                <td class="text">Request Id:</td>
                <td class="text"><input type="text"  id="rid" name="rid" style="width: 250px; height: 25px;" readonly value="<%=rid%>"></td>
              </tr>
              <tr>
                <td class="text">Employee Name:</td>
                <td class="text"><input type="text"  id="ename" name="ename" style="width: 250px; height: 25px;" readonly value="<%=ename%>"> </td>
                
              
              <tr>
                <td class="text">Cab Type:</td>
                <td class="text"><input type="text"  id="ctype" name="ctype"style="width: 250px; height: 25px;" readonly value="<%=type%>"></td>
             <td></td> <td class="text">Request Location</td>
                <td class="text"><input type="text"  id="rlocation" name="rlocation"style="width: 250px; height: 25px;" readonly value="<%=loc%>"></td>
			  </tr>
              <tr>
                <td class="text">Required Date:</td>
                             <td class="text">From:
                    <input type="text"  id="fdate" name="fdate"style="width: 250px; height: 25px;" readonly value="<%=sdate%>">                  </td>
                <td class="text">To:
                <input type="text"  id="tdate" name="tdate"style="width: 250px; height: 25px;" readonly value="<%=edate%>"></td>
              </tr>
              <tr>
                <td class="text">Request for</td>
                <td class="text"><input type="text"  id="rfor" name="rfor"style="width: 250px; height: 25px;" readonly value="<%=type_of%>"></td>
				<td></td> <td class="text">Reason</td>
                <td class="text"><input type="text"  id="reason" name="reason"style="width: 250px; height: 25px;" readonly value="<%=reas%>"></td>
              </tr>
              <tr>
                <td class="text">Pickup Shift Tymings</td>
                <td class="text"><input type="text"  id="pst" name="pst"style="width: 250px; height: 25px;" readonly value="<%=pick%>"></td>
              </tr>
              
              <tr>
                <td class="text">Drop Shift Tymings</td>
                <td class="text"><input type="text"  id="pst" name="pst"style="width: 250px; height: 25px;" readonly value="<%=drop%>"></td>
              </tr>
             
               
             
              <tr><td>Approval Comment:</td>  <td><textarea name="acomment" cols="26" rows="4" required> </textarea></td>
</tr>
         		
						
	<tr>			
						
<td>							      	
    			
						      	
<form action="End.jsp" onclick="myfunction()" >
      <input type="text" name="id1" value="<%=rid%>" style='display:none'>
       <input type="submit" value="Accept">
      
 </form>
</td>
<td>
<form action="Dissapprove.jsp"  onclick="reject()" >
      <input type="text" name="id" value="<%=rid%>" style='display:none' >
      <input type="submit" value="Reject">
   
 </form>
          
        </td>
      </tr>
    </table>

      <script>
    function myFunction() {
    if (confirm("Are you sure ?"))
{
location.href = 'End.jsp';
}
else
{
history.go(1);
}
} 
</script>


<script>
function reject() {
alert("Request Rejected");
    location.href = 'Dissapprove.jsp';
}
 </script>
 
 
    
 
 
              </body>
              
</html>
