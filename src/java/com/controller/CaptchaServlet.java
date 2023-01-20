/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nl.captcha.*;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.gimpy.DropShadowGimpyRenderer;
import nl.captcha.noise.CurvedLineNoiseProducer;
import java.awt.Color;
import java.awt.Font;
import java.util.List;
import java.util.Arrays;
import nl.captcha.text.renderer.DefaultWordRenderer;

/**
 *
 * @author Marvin
 */
public class CaptchaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            
            List<Color> textColors = Arrays.asList(Color.BLACK, Color.BLUE, Color.RED);
            List<Font> font = Arrays.asList(new Font("Arial", Font.BOLD, 40));
            response.setContentType("image/png");
            Captcha captcha = new Captcha.Builder(250, 60)
            .addText(new DefaultWordRenderer(textColors, font))
            .addBackground()
            .addNoise(new CurvedLineNoiseProducer())
            .gimp(new DropShadowGimpyRenderer())
            .addBorder()
            .build();
            
            request.getSession().setAttribute("captcha", captcha);
            request.getSession().setAttribute("isAudio", false);
            
            CaptchaServletUtil.writeImage(response, captcha.getImage());
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
