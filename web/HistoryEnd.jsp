    <%-- 
    Document   : HistoryEnd
    Created on : 10 Jun, 2016, 1:46:00 AM
    Author     : Suryansh
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        String id = request.getParameter("id");
//        out.println(id);
        
        int rid = 0;
        
        
          
          String type = " ";
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
          
        
        try
    {
      // create a mysql database connection
      String myDriver = "com.mysql.jdbc.Driver";
      String myUrl = "jdbc:mysql://localhost/choudhary";
      Class.forName(myDriver);      
      Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
      Statement stmt = conn.createStatement();
      
      // create a sql date object so we can use it in our INSERT statement
//      out.println("Connection made");
      // the mysql insert statement
       String query = " select * from requests where requests.e_id = " + id ;
       
//       out.println(query);
       
         ResultSet rs = stmt.executeQuery(query);
         
       
       
       while(rs.next())
      {
//          out.println("Entering while");
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
          
//          
//          out.println("Request id is" + rid);
//          out.println("Employee Id is " + id);
//          out.println("type " + type);
//          out.println("auth_post" + post);
//          
//          out.println("startdate is " +sdate );
//          out.println("Approving Authority Decision is " + adec);
//          out.println("Transport authority decision is " + tdec);
//          
          
          
      }
    }
        catch(Exception e)
        {
            out.println("HAHA..! We are exceptions");
            
        }
        %>
        
       
        <div class="navbar navbar-inverse">
    <div class="container">
      <div class="navbar-header">            
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="navbar-collapse collapse">
              <div align="right"><a href="NewRequestRoute.jsp"> New Request	</a>  <a href="OnBehalfStatus.jsp">On Behalf request	</a>  <a href="newjsp.jsp">Request History</a>  <a href="PendingSol.jsp">Approve Request</a> <a href="THDforward.jsp">THD Request </a></div>
            </div>
</div>

     <blockquote>`
       <blockquote>
         <blockquote>
           <h3>Request History</h3>
         </blockquote>
       </blockquote>
     </blockquote>
        <div  align="center" STYLE=" height: 200px; width: 1080px; font-size: 17px; overflow: auto;">
<table align="center" border="1">
      <tr>
        <td width="48">Request ID</td>
        
        <td width="76">Employee ID </td>
        <td width="80">Cab Type </td>
        <td width="85">Required Date </td>
        <td width="100">Location</td>
        <td width="117">Request for </td>
        <!--<td width="133">Status</td>-->
        <td width="147">Approved Authority</td>
        <td width="147">Transport Approval</td>
        
      </tr>
	   <tr>
        <td  width="48"><%=rid%></td>
        <td width="76"><%=id%></td>
        <td width="80"><%=type%></td>
        <td width="85"><%=sdate%> </td>
        <td width="100"><%=loc%></td>
        <td width="117"><%=type_of%> </td>
        <td width="133"><%=adec%></td>
        <td width="147"><%=tdec%></td>
        <!--<td width="163"><%=adec%> </td>-->
        
<td>
    <form action="Update.jsp">
        
        <!--<a href="Update.jsp">-->
     <input type="text" name="id" value="<%=rid%>" style='display:none'>
        <input type="submit" value="Update">

    </form>
</td>



<td>
    <form action="Cancel.jsp">
        
        <!--<a href="Update.jsp">-->
        <input type="text" name="id" value="<%=rid%>" style='display:none'>
        <input type="submit" value="Cancel">

    </form>
</td>
      </tr>

</table>
     

     
</body>

</html>
