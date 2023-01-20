<%-- 
    Document   : pdfUser
    Created on : 05 2, 21, 11:31:59 PM
    Author     : Marvin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.model.UserPdf"%>
<%
    UserPdf f = new UserPdf(response.getOutputStream());
    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition",
                 "attachment;filename= " + f.getFilename() + ".pdf");
    f.create((String) session.getAttribute("username"));
%>
