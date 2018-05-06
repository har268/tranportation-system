
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
    <body>
    <%
        String id = request.getParameter("id");
//        out.println("ID of resued request is " + id);
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
        
            int req_id = random.nextInt(Integer.MAX_VALUE) + 1;
            
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
          
          req_id = rs.getInt("r_id");
           e_id = rs.getString("e_id");
          
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
          
//          out.println(reas);
            }
           }
        
    catch (Exception e)
    {
     out.println("Got an exception!");
      
    }            

try
    {
      // create a mysql database connection
      
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
         preparedStmt.setString (2, e_id);
         preparedStmt.setString (3, type);
         preparedStmt.setString (4, post);
         preparedStmt.setString (5, name);
         preparedStmt.setString (6, sdate);
         preparedStmt.setString (7, edate);
         preparedStmt.setString (8, type_of);
         preparedStmt.setString (9, loc);
         preparedStmt.setString (10, pick);
         preparedStmt.setString (11, drop);
         preparedStmt.setString (12, reas);
         preparedStmt.setString (13, authid);

//       out.println("Values inserted");
      // execute the preparedstatement
      
      preparedStmt.execute();
//      System.out.println("Hey"); 
      conn.close();
    }
    catch (Exception e)
    {
     out.println("Got an exception!");
      
    }            









//      String query = " insert into requests (r_id, e_id, typ, auth_post, auth_name, startdate, enddate, type_of, location, pickup, dro, reason, Auth_id)"
//        + " values ("+req_id+", '"+e_id+"', '"+type+"', '"+post+"', '"+name+"' , '"+sdate+"', '"+edate+"', '"+type_of+"', '"+loc+"', '"+pick+"', '"+drop+"', '"+reas+" ,'"+authid+"')";
//      
// 
//      
//      
//        
//      out.println(query);
//      
      // create the mysql insert preparedstatement
//      PreparedStatement  preparedStmt = conn.prepareStatement(query);
      
//               preparedStmt.setInt (1, req_id);
//         preparedStmt.setString (2, e_id);
//         preparedStmt.setString (3, type);
//         preparedStmt.setString (4, post);
//         preparedStmt.setString (5, name);
//         preparedStmt.setString (6, sdate);
//         preparedStmt.setString (7, edate);
//         preparedStmt.setString (8, type_of);
//         preparedStmt.setString (9, loc);
//         preparedStmt.setString (10, pick);
//         preparedStmt.setString (11, drop);
//         preparedStmt.setString (12, reas);
//         preparedStmt.setString (13, authid);
//
//       out.println("Values inserted");
//      // execute the preparedstatement
//      stmt.executeQuery(query);
//      
//      System.out.println("Hey"); 
//      conn.close();
//
%>
</body>
</html>





    
      
