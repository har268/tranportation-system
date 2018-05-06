<%-- 
    Document   : IdStore
    Created on : 14 Jun, 2016, 11:42:26 PM
    Author     : Suryansh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%
            String id = " ";
            String idi = request.getParameter("id");
            session.setAttribute("id", idi);
            
            
            %>
            <form action="First.jsp">
            <input type="submit" name="submit">
            </form>
    </body>
</html>
