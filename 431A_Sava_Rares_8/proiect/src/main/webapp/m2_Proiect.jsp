<%-- 
    Document   : m2_Consultatie
    Created on : Nov 14, 2016, 1:42:49 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica Proiect</title>
        <link rel="stylesheet" href="style.css">
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Proiect:</h1>
        <br/>
        <p align="center"><a href="nou_Proiect.jsp"><b>Adauga un nou proiect.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idproiect"));
            String idstudent = request.getParameter("idstudent");
            String idcurs = request.getParameter("idcurs");
            String Denumire = request.getParameter("Denumire");
            String SesiuneExaminare = request.getParameter("Sesiune_examinare");
            String Descriere = request.getParameter("Descriere");
            String DataPredare = request.getParameter("Data_predare");

            String[] valori = {idstudent, idcurs, Denumire, SesiuneExaminare, Descriere, DataPredare};
            String[] campuri = {"idstudent", "idcurs", "Denumire", "Sesiune examinare", "Descriere", "Data predare"};
            jb.modificaTabela("proiect", "idproiect", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        
            <br/>
    </body>
</html>