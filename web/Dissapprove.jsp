<%-- 
    Document   : End
    Created on : 8 Jun, 2016, 12:15:33 AM
    Author     : Suryansh
--%>
<%@page import="java.util.Properties"%>  
<%@page import="javax.mail.*"%>  
<%@page import="javax.mail.internet.*"%>  


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
                             </div> 
                             </div> 
    <%
//        out.println("Entered ENd");
        String status = "dissaprove";
        String comment = request.getParameter("acomment");
        String id = request.getParameter("id");
//        out.println("id is " + id);
        
        
        
        
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
       
       
       String query = "update requests set statusauth =" + "'" +status + "'"+ ", comments = "+ "'" +comment + "'"+ " where r_id = " + id  ;
       
        
//       String sql = " delete from requests where requests.r_id = 1924673318 ; ";
        
      
//      out.println(query);
      stmt.executeUpdate(query);
//      out.println("Done"); 
      
//      System.out.println("Hey"); 
      conn.close();
    }
    catch (Exception e)
    {
      out.println("We have an aexception");
    }
       out.println("DISSAPPROVED");
       %>
</body>
</html>
