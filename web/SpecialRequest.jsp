

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <p> Welcome </p>
        <%
//            out.println("Welcome");
            String place = "Enter Location";
            
            %>
            
            <div align="right">
                 
                        <p><a id="new_request" href="NewRequestRoute.jsp" > New Request	</a><a href="OnBehalfStatus.jsp" >On Behalf request	</a>  <a id="r_history" href="newjsp.jsp" >Request History</a>  <a href="PendingSol.jsp" >Approve Request</a><a   href="THDforward.jsp" >THD Request</a></div></p>
             
                        
            
            <form action="LocationCancel.jsp">
                <input type="text" name="place" value="<%=place%>">
                Enter Location where services are to be stopped <input type="submit" value="submit">
                    
            </form>
            
    </body>
</html>





































<%-- 
    Document   : SpecialRequest
    Created on : 2 Jul, 2016, 11:32:26 PM
    Author     : Suryansh
--%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<!--<html>
    <head>
    <link href="rg1.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="pen-title">
  <h1>Special Request</h1>
</div>
 Form Module
<div class="module form-module">
  <div class="toggle">
 

    
  </div>-->
<!--        <%
//            out.println("Welcome");
//            String placeas = "Enter Location";
            
            %>
            -->
          
<!--             
                        <div class="form">
    <h2> Enter Location where services are to be stopped</h2>
    
      <form action="LocationCancel.jsp">
                <input type="text" name="place" value="<%=place%>">
	  <pre>
  <a href="LocationCancel.jsp">
  <button type="button">submit</button></a>
      </pre>
    </form>
  </div>
  </div>
            
            
               
    </body>
</html>-->
