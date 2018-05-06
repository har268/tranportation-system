<%-- 
    Document   : Second
    Created on : 6 Jun, 2016, 11:33:06 PM
    Author     : Suryansh
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>

<%--<%@page import="com.mysql.jdbc.Connection"%>--%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Random"%>
<%@page import="java.lang.StrictMath"%>
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
		</div>     
              </div>                   

        <% 
//            out.print("Registered");
            
            Random random = new Random();
            
            int req_id = random.nextInt(Integer.MAX_VALUE) + 1;
            
            
//            out.println("Your random id is " + req_id);
            
            
            String eid = request.getParameter("id");
//            out.println(eid);
            
            String type = request.getParameter("cabtype");
//            out.println(type);
            
            String auth = request.getParameter("auth");
//            out.println(auth);
            
            String aname = request.getParameter("name");
//            out.println(aname);
            String fdate = request.getParameter("fdate");
            String tdate = request.getParameter("tdate");
            String req = request.getParameter("req");
            String loc = request.getParameter("loc");
//            out.println(loc);
//            Object obj = loc;
            String reas = request.getParameter("reason");
//            out.println(reas);
            String pick = request.getParameter("pick");
            String drop = request.getParameter("drop");
            String authid = " ";
//            String place = "Delhi";
            String place = session.getAttribute("place").toString();
//            out.println(place);
            
//            out.println("Values taken");
            
            
            







            
            try 
                
            {
//                out.println("We have entered second's try");
                
                String myDriver = "com.mysql.jdbc.Driver";
      String myUrl = "jdbc:mysql://localhost/choudhary";
      Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
      Statement stmt = conn.createStatement();
      String sql = " select e_id from employee where employee.e_name = " + "'"+aname+"'"  ;
//      out.println("Selected auth's id");
      
//      out.println(sql);
      
      
      ResultSet rs = stmt.executeQuery(sql);
      
      while(rs.next())
        {
//            out.println("While loop is on");
             authid = rs.getString("e_id");
//             out.println("auth_id is " + authid);
//             session.setAttribute("authid", authid);
        }
            }
            catch(Exception e)
            {
                out.println("First Phase Exception buddy");
                
            }
      
            
try
    {
      // create a mysql database connection
//      out.println("Inserting");
      
      String myDriver = "com.mysql.jdbc.Driver";
      String myUrl = "jdbc:mysql://localhost/choudhary";
      Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
      
      // create a sql date object so we can use it in our INSERT statement
      
      // the mysql insert statement
       String query = " insert into requests (r_id, e_id, typ, auth_post, auth_name, startdate, enddate, type_of, location, pickup, dro, reason, Auth_id)"
        + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?)";
//      out.println(query);
      
      // create the mysql insert preparedstatement
      PreparedStatement  preparedStmt = conn.prepareStatement(query);
      
               preparedStmt.setInt (1, req_id);
         preparedStmt.setString (2, eid);
         preparedStmt.setString (3, type);
         preparedStmt.setString (4, auth);
         preparedStmt.setString (5, aname);
         preparedStmt.setString (6, fdate);
         preparedStmt.setString (7, tdate);
         preparedStmt.setString (8, req);
         preparedStmt.setString (9, loc);
         preparedStmt.setString (10, pick);
         preparedStmt.setString (11, drop);
         preparedStmt.setString (12, reas);
         preparedStmt.setString (13, authid);

//       out.println("Values inserted");
      // execute the preparedstatement
      preparedStmt.execute();
//      out.println("Hey"); 
      conn.close();
    }
    catch (Exception e)
    {
     out.println("Got an exception!");
      
    }            


            
                
            try 
                
            {
//                out.println("We have entered second's try");
                
                String myDriver = "com.mysql.jdbc.Driver";
      String myUrl = "jdbc:mysql://localhost/choudhary";
      Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
      Statement stmt = conn.createStatement();
      String sql = " update requests set statusauth = 'cancel', statustran = 'cancel' " + " where requests.location =" + "'"+place+"'" + " and requests.r_id = " + "'"+req_id+"'"  ;
//      out.println(sql);
      
//      out.println(sql);
      
      
       stmt.executeUpdate(sql);
       
//       out.println("Query executed");
      
            }
            
            catch(Exception e)
            {
                out.println("Exception Update buddy");
                
            }

      
        try 
                
            {
//                out.println("We have entered second's try");
                
                String myDriver = "com.mysql.jdbc.Driver";
      String myUrl = "jdbc:mysql://localhost/choudhary";
      Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
      Statement stmt = conn.createStatement();
      String sql = " select statustran from requests where r_id = " + "'"+req_id+"'" ;
//      out.println("Selected auth's id");
      
//      out.println(sql);
      
      
       ResultSet rs = stmt.executeQuery(sql);
//       out.println("Executed");
       while(rs.next())
       {
//           out.println("Entered While");
//           String author = rs.getString("statusauth");
           String tran = rs.getString("statustran");
//           out.println(tran + " Value Entered");
           
           if(tran == null)
           {
               out.println("Registered");
           }
               
           else
           {
             
               out.println("We have stopped Services");
               
             
           }
           
       
      
            }
            }
        
       
            catch(Exception e)
                    
            {
                out.println("Exception Last buddy");
                
            }

      








//            
//else
//            {
//                out.println("All Services for the Requested place have been stopped");
//            }
    %>
    
    
    
            </body>
</html>
