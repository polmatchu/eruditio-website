/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Marvin
 */
@WebServlet(name = "EmailServlet", urlPatterns = {"/EmailServlet"})
public class EmailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    Connection conn;
    
     @Override
    public void init() throws ServletException
    {
        try
        {
            ServletContext con = getServletContext();
            Class.forName(con.getInitParameter("jdbcClassName"));
            String username = con.getInitParameter("dbUserName");
            String password = con.getInitParameter("dbPassword");
            
            // Sets up the url
            StringBuffer url = new StringBuffer(con.getInitParameter("jdbcDriverURL"))
                .append("://")
                .append(con.getInitParameter("dbHostName"))
                .append(":")
                .append(con.getInitParameter("dbPort"))
                .append("/")
                .append(con.getInitParameter("databaseName"));
            conn = DriverManager.getConnection(url.toString(), username, password);
        }
        catch (SQLException sqle){
            System.out.println("SQLException error occured - " 
                + sqle.getMessage());
        } catch (ClassNotFoundException nfe){
            System.out.println("ClassNotFoundException error occured - " 
                + nfe.getMessage());
        }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("Email").trim(); 
        String query = "INSERT INTO NEWSLETTER (EMAIL) VALUES (?)";
        try
        {
            PreparedStatement log = conn.prepareStatement(query);
            log.setString(1, email);
            log.executeUpdate();
            RequestDispatcher back = request.getRequestDispatcher(request.getContextPath());
            back.forward(request, response);
        }
        catch(SQLException e)
        {
            e.getMessage();
        }
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
