
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
           String id = session.getAttribute("id").toString();
           
           
           String log =" ";
           int rid = 0;
//        String depart = " ";
//        String ename = " ";
//          String nul = " ";
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
//          out.println("Started");
           int a=0,b=0;
           
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
           
         <div id="label">
<label>
                 
                      <input name="button" type="button" value="Initialization"> 	
                      	<input name="button"  type="button" value="Approve">
	<input type="button"  value="Acknowledgement">
                  
                  </label>
</div>
            
            <blockquote>`
       <blockquote>
         <blockquote>
           <h3>Pending Request</h3>
         </blockquote>
       </blockquote>
     </blockquote> 
          
          <div  align="center" STYLE=" height: 200px; width: 1080px; font-size: 17px; overflow: auto;">
<table width="1082" border="1" align="center" >
     
      <tr>
        
        <th>Request ID</th>
        
        <th>Employee ID </th>
         <th>Authority Name </th>
        <th>Cab Type </th>
        <th>Required Date </th>
        <th>Location</th>
        <th>Request for </th>
        <th>Authority Decision</th>
          <th>Solve Request  </th>
        
      </tr>
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
      String query = " select logic_level from employee where employee.e_id = " + id ;
      
      ResultSet rs = stmt.executeQuery(query);
      
      while(rs.next())
      {
          log = rs.getString("logic_level");
//          depart = rs.getString("depart");
            a = log.compareToIgnoreCase("B");
            b = log.compareToIgnoreCase("C");
//            ename = rs.getString("e_name");
      }
      
           }
           catch(Exception e)
           {
               out.println("Logical Level not accessed");
               
           }
           
//           out.println("Logical level filtered");
           
           
           
           if(a!=0 && b!=0)
           {
           
           try
           {
               
//           out.print("Entered if");
           
           String myDriver = "com.mysql.jdbc.Driver";
//           out.print("First step made");
           
           String myUrl = "jdbc:mysql://localhost/choudhary";
           
           Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
//      out.print("Connection made");
      // create a sql date object so we can use it in our INSERT statement
      
      // the mysql insert statement
      
      Statement stmt = conn.createStatement();
         
          
      String query = " select * from requests where (requests.auth_id = " + "'"+id+"'" + ") and (requests.statusauth  " + "IS NULL" + " or requests.statusauth <> " + "'cancel'" + ") and (requests.statustran " + " IS NULL)" ;
//      out.println(query);
      
      ResultSet rs = stmt.executeQuery(query);
//      out.println("Query executed");
      while(rs.next())
      {
//          out.println("While loop final");
//           ename = rs.getString("e_name");
           id = rs.getString("e_id");
           rid = rs.getInt("r_id");
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
//           authid = rs.getString("auth_id");
           
           adec = rs.getString("statusauth");
           tdec = rs.getString("statustran");
//           out.println("Values Inerted");
//          
//          out.println("Request id is" + rid);
//          out.println("Employee Id is " + id);
//          out.println("type " + type);
//          out.println("auth_post" + post);
//          out.println("startdate is " +sdate );
//          out.println("Approving Authority Decision is " + adec);
//          out.println("Transport authority decision is " + tdec);
//        
          %>
        
          <tr align="center">
      
     <td width="148"><%=rid%></td>
        <td width="148"><%=id%></td>
         <td width="148"><%=name%></td>
        <td width="80"><%=type%></td>
        <td width="85"><%=sdate%> </td>
        <td width="100"><%=loc%></td>
        <td width="117"><%=type_of%> 
        <td width="117"><%=adec%> </td>
        
        <td>
      <form action="Status.jsp">
           <input type="text" name="id" value="<%=rid%>" style='display:none' >
          <input type="submit" value="Solve">
          
      </form>      </td></tr>

         

   <%       
      }
      
//      out.print("All queries done");
           }
      
           
           catch(Exception e)
                   
           {
               out.print("You have reached an exception");
                       
           }
          
           }
           
           else
           {
//               out.println("You are not authorised");
               
           }
            
      %>
      
<!--       <tr>
      
     <td width="148"><%=rid%></td>
        <td width="148"><%=id%></td>
         <td width="148"><%=name%></td>
        <td width="80"><%=type%></td>
        <td width="85"><%=sdate%> </td>
        <td width="100"><%=loc%></td>
        <td width="117"><%=type_of%> </td>
        
        <td align="center">
      <form action="Status.jsp">
           <input type="text" name="id" value="<%=rid%>" style='display:none' >
          <input type="submit" value="Solve">
          
      </form>      </td></tr>
 <tr>
      
     <td width="148"><%=rid%></td>
        <td width="148"><%=id%></td>
         <td width="148"><%=name%></td>
        <td width="80"><%=type%></td>
        <td width="85"><%=sdate%> </td>
        <td width="100"><%=loc%></td>
        <td width="117"><%=type_of%> </td>
        
        <td>
      <form action="Status.jsp">
           <input type="text" name="id" value="<%=rid%>" style='display:none' >
          <input type="submit" value="Solve">
          
      </form>      </td></tr>-->

       </table>
        </body>
        </html>
      
     

      
           
   
      
      
      
    
