<%-- 
    Document   : pdfAdmin
    Created on : 05 2, 21, 8:15:32 PM
    Author     : Marvin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.model.AdminPdf"%>
<html>
    <%
        AdminPdf f = new AdminPdf(response.getOutputStream());
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition",
                     "attachment;filename= " + f.getFilename() + ".pdf");
        f.create((String) session.getAttribute("username"));
    %>
</html>
