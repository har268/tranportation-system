

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
        <link href="rg1.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            
            
        String dec = " ";
        int a = 0;    
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
          int rid = rs.getInt("r_id");
          int e_id = rs.getInt("e_id");
          String type = rs.getString("typ");
          String post = rs.getString("auth_post");
          String name = rs.getString("auth_name");
          String sdate = rs.getString("startdate");
          String edate = rs.getString("enddate");
          String type_of = rs.getString("type_of");
          String loc = rs.getString("location");
          String pick = rs.getString("pickup");
          String drop = rs.getString("dro");
          String reas = rs.getString("reason");
          String authid = rs.getString("auth_id");
      
          
          out.println("Request id is" + rid);
          out.println("Employee Id is " + e_id);
          out.println("type " + type);
          out.println("auth_post" + post);
          out.println("startdate is " +sdate );
          out.println("Reason is " +reas);
          
          
          
      }
      
//      out.print("All queries done");
           }
           catch(Exception e)
           {
               out.print("You have reached an exception");
                       
           }
        
        
        %>
        <div class="pen-title">
  <h1>THD Authority</h1>
</div>
<!-- Form Module-->
<div class="module form-module">
  <div class="toggle">
     
  </div>
  <div class="form">
    <h2>Operation to be Performed</h2>
    <form action="THDEnd.jsp">
            Status: <input type="text" name="status">
            
            Id: <input type="text" name = "id" value="<%=id%>">
      
	  <pre>
  <a href="THDEnd.jsp">
  <button type="Submit">Submit</button></a>
      </pre>
    </form>
  </div>
        
             
        </body>
</html>
