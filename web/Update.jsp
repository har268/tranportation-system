
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>

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
        String id = request.getParameter("id");
//        out.println("rid is " + id);
        
        
        int req_id = 0;
        
        
        
        Random random = new Random();
        
        String type= " ";
        String name = " ";
        String post = " ";
        String sdate= " ";
        String e_id = " ";
        String edate = " ";
        String type_of = " ";
        String loc = " ";
        String pick = " ";
        String drop = " ";
        String reas = " ";
        String authid = " ";
        String plac = " ";
        plac = session.getAttribute("place").toString();
        
//        out.println("Null Values initialised");
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
      String query = " select * from requests where requests.r_id = " + id  ;
      ResultSet rs = stmt.executeQuery(query);
      
      while(rs.next())
      {
//          out.println("While loop is on");
          
          String adec = rs.getString("statusauth");
//          out.println(adec);
          if(adec == null)
          {
              req_id = rs.getInt("r_id");
//              out.println("id is same");
           
          }

          else
          {
          
              req_id = random.nextInt(Integer.MAX_VALUE) + 1;
//              out.println("Id is changed");
              
              
          }
//          out.println("New Request id is " + req_id);
          e_id = rs.getString("e_id");
          
           type = rs.getString("typ");
           post = rs.getString("auth_post");
           name = rs.getString("auth_name");
//           out.println(name);
           sdate = rs.getString("startdate");
           edate = rs.getString("enddate");
           type_of = rs.getString("type_of");
           loc = rs.getString("location");
           pick = rs.getString("pickup");
           drop = rs.getString("dro");
          reas = rs.getString("reason");
           authid = rs.getString("auth_id");
          
//          out.println(reas);
          
//          out.println("Values put in variables");
            }
           }
        
    catch (Exception e)
    {
     out.println("Got an exception!");
      
    }    

//out.println("Taking values from employee table");
//            String log = " ";
            String ename = " " ;
            
            String gender = " ";
           // String depart = " ";
            String fname = " ";
            
            
            String pname  = " ";
            
            String manager = " ";
           
            String dgm = " ";
//            out.println("Null done");

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
                String query = " select * from employee where employee.e_id= " + e_id;
//                out.println(query);
                ResultSet rs = stmt.executeQuery(query);
      
      // create the mysql insert preparedstatement
                       
            
        while(rs.next())
        {
             e_id = rs.getString("e_id");
            ename = rs.getString("e_name");
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
            
            
        }
        rs.close();
        
        stmt.close();
            }
            catch(Exception e)
            {
                out.println("You my friend have entered an exception");
            }
 




          
      

  
    %>
    
    
                     

<!--  <table align="center" width=600>
<tr>
<td>Employee Id:</td>
<td> <input type="text" name="eid" value="<%=e_id%>"></td>
</tr>
<tr>
<td>Employee Name:</td>
<td><input type="text" name="ename" readonly value="<%=ename%>"></td>
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

             
                 Cab type: <input type="text" name="type" value="<%=type%>"><br>
             
             Approving Authority: <input type="text" name="auth" value="<%=post%>"><br>
             
             Approving Authority Name: <input type="text" name="name" value="<%=name%>"><br>
             
             Date From <input type="date" name="fdate" value="<%=sdate%>"><br>
             
             Date To <input type="date" name="tdate" value="<%=edate%>"><br>
             
             Request For <input type="text" name="req" value="<%=type_of%>"><br>
             
             Pickup Timing <input type="time" name="pick" value="<%=pick%>"><br>
             
             Drop Timing <input type="time" name="drop" value="<%=drop%>"> <br>
             
             Location <input type="text" name="loc" value="<%=loc%>"><br>
             
             Authority Id <input type="text" name="authid"><br>
             
             Reason <input type="text" name="reason" value="<%=reas%>"><br>
             New Request ID <input type="text" name="req_id" value="<%=req_id%>"><br>
             Old Request ID <input type="text" name="rid" value="<%=id%>"><br>
             
             
             <input type="submit" value="submist"><br>
             </form>-->
             
      <div id="label">
<label>
                 
                      <input name="button" type="button" value="Initialization"> 	
                      	<input name="button"  type="button" value="Approve">
	<input type="button"  value="Acknowledgement">
                  
                  </label>
</div> 
                
                <strong>
                <h3 align="center">Update Request History</h3>
                </strong></p>
             
<form action="UpdateFinal.jsp">
  <table align="center" width=600>
<tr>
<td>Id:</td>
<td> <input type="text" name="id" readonly value="<%=e_id%>"></td>
</tr>
<tr>
    <td>Employee Name:</td>
    <td><input type="text" name="ename" readonly value="<%=ename%>"></td></tr>
<tr>
<td>Cab Type:</td>
<td><input type="text" name="type" value="<%=type%>"></td>
</tr>
<tr>
    <td>Approving Authority:</td>
    <td><input type="text" name="auth" value="<%=post%>"></td>
</tr>
<tr>
<td>Approving Authority Name:</td>
<td> <input type="text" name="name" value="<%=name%>"></td>
</tr>
<tr>
<td>Required From:</td>
<td><input type="date" name="fdate" value="<%=sdate%>"></td>
</tr>
<tr>
<td>Required Till:</td>
<td><input type="date" name="tdate" value="<%=edate%>"></td>
</tr>
<tr>
<td>Location:</td>
<td><input type="text" name="loc" value="<%=loc%>"></td>
</tr>
<tr><td>Request For:</td>
<td><input type="text" name="req" value="<%=type_of%>"></td>
</tr>
<tr>
<td>Pickup :</td>
<td><input type="time" name="pick" value="<%=pick%>"></td>
</tr>
<tr>
<td>Drop :</td>
<td><input type="time" name="drop" value="<%=drop%>"></td>
</tr>
<tr>
<td>Reason :</td>
<td><input type="text" name="reason" value="<%=reas%>"></td>
</tr>

<tr>
<td>New Request ID:</td>
<td> <input type="text" name="req_id" value="<%=req_id%>"></td>
</tr>

<tr>
<td>Old Request ID:</td>
<td> <input type="text" name="rid" value="<%=id%>"></td>
</tr>


<tr>
<td>Update</td>
<td><input type="submit" value="update" ></td>
</tr>



</table>
 
</form>


  

</body>

        
        
</html>
