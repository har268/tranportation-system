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
//            out.println("Entered UpdateFinal");
            
            String id = request.getParameter("req_id");
            out.println("Your Request id is " + id);
            
            String idi = request.getParameter("rid");
//            out.println("Old Random ID is " + idi);
            
            String eid = request.getParameter("id");
//            out.println(eid);
            
            String type = request.getParameter("type");
//            out.println(type);
            
            String auth = request.getParameter("auth");
//            out.println(auth);
            
            String aname = request.getParameter("name");
            String fdate = request.getParameter("fdate");
            String tdate = request.getParameter("tdate");
            String req = request.getParameter("req");
            String loc = request.getParameter("loc");
//            out.println(loc);
            String reas = request.getParameter("reason");
            String pick = request.getParameter("pick");
            String drop = request.getParameter("drop");
            String authid = " ";
            String plac = " ";
            plac = session.getAttribute("place").toString();
  
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
             
        }
            }
            catch(Exception e)
            {
                out.println("Exception buddy");
                
            }
            
            if(!idi.equalsIgnoreCase(id))
            {
      
//            out.println("New ID");
try
    {
      // create a mysql database connection
//      out.println("Inserting");
      
      String myDriver = "com.mysql.jdbc.Driver";
      String myUrl = "jdbc:mysql://localhost/choudhary";
      Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
      
      // create a sql date object so we can use it in our INSERT statement
//      out.println("Connection made");
      
      // the mysql insert statement
       String query = " insert into requests (r_id, e_id, typ, auth_post, auth_name, startdate, enddate, type_of, location, pickup, dro, reason, Auth_id)"
        + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?)";
//      out.println(query);
      
      // create the mysql insert preparedstatement
      PreparedStatement  preparedStmt = conn.prepareStatement(query);
      
         preparedStmt.setString (1, id);
         
         
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
//      System.out.println("Done insetion"); 
      conn.close();
    }
    catch (Exception e)
    {
     out.println("Got an exception!");
      
    }            
     
            }
            
else
            {
                 try
    {
      // create a mysql database connection
      String myDriver = "com.mysql.jdbc.Driver";
      String myUrl = "jdbc:mysql://localhost/choudhary";
      
//      out.println("Going for Connection");
      
      Class.forName(myDriver);
//      out.println("Connection started");
      Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
//      out.println("Connection made");
      
      Statement stmt = conn.createStatement();
      
      // create a sql date object so we can use it in our INSERT statement
      
      // the mysql insert statement
//       String query = " update into requests " + " values ("+status + "," +comment+ ");
       
       
       String query = "update requests set r_id =" + "'" +id + "'"+ ", e_id = "+ "'" +eid+ "',"+ " type_of = " + "'"+type+"'" +", auth_post="+"'"+auth+ "'" + ", auth_name="+"'"+aname+ "'" + ", startdate=" + "'"+fdate+"'" + ", enddate=" + "'"+tdate+"'" + ", type_of=" + "'"+req+"'" +", location=" + "'"+loc+"'" + ", reason=" + "'"+reas+"'" +", pickup=" + "'"+pick+"'" +", dro=" + "'"+drop+"'" + ", auth_id=" + "'"+authid+"'" + "where r_id = " + idi ;
//       out.println(query);
        
//       String sql = " delete from requests where requests.r_id = 1924673318 ; ";
        
      
//      out.println(query);
      stmt.executeUpdate(query);
//      out.println("Done"); 
      
      System.out.println("Hey"); 
      conn.close();
      out.println("APPROVED");
    }
    catch (Exception e)
    {
      out.println("We have an aexception");
    }
      
            }
            





         try 
                
            {
//                out.println("We have entered second's try");
                
                String myDriver = "com.mysql.jdbc.Driver";
      String myUrl = "jdbc:mysql://localhost/choudhary";
      Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
      Statement stmt = conn.createStatement();
      String sql = " update requests set statusauth = 'cancel', statustran = 'cancel' " + " where requests.location =" + "'"+plac+"'" + " and requests.r_id = " + "'"+id+"'"  ;
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
      String sql = " select statustran from requests where r_id = " + "'"+id+"'" ;
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
             
               out.println("Sorry, but your request has been cancelled as we have stopped Services");
               
             
           }
           
       
      
            }
            }
        
       
            catch(Exception e)
                    
            {
                out.println("Exception Last buddy");
                
            }






    %>
    
     
</html>
