<%-- 
    Document   : m2_Pacient
    Created on : Nov 14, 2016, 1:42:49 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica Student</title>
        <link rel="stylesheet" href="style.css">
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Studenti:</h1>
        <br/>
        <p align="center"><a href="nou_Student.jsp"><b>Adauga un nou student.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idstudent"));
            String Nume = request.getParameter("nume");
            String InitialaTata = request.getParameter("initiala_tata");
            String Prenume = request.getParameter("prenume");
            String DataNasterii = request.getParameter("data_nasterii");
            String Cnp = request.getParameter("cnp");
            String Adresa = request.getParameter("adresa");
            String Facultate = request.getParameter("facultate");
            String CicluStudii = request.getParameter("ciclu_studii");
            String AnStudii = request.getParameter("an_studii");

            String[] valori = {Nume, InitialaTata, Prenume, DataNasterii, Cnp, Adresa, Facultate, CicluStudii, AnStudii};
            String[] campuri = {"nume", "initiala_tata", "prenume", "data_nasterii", "cnp", "adresa", "facultate", "ciclu_studii", "an_studii"};
            jb.modificaTabela("studenti", "idstudent", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        
            <br/>
    </body>
</html>