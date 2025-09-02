<%-- 
    Document   : nou_Pacient
    Created on : Nov 14, 2016, 1:08:21 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga student</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <script>
    function checkFields() {
        var form = document.forms[0];
        var required = ['nume', 'initiala_tata', 'prenume', 'data_nasterii', 'cnp', 'adresa', 'facultate', 'ciclu_studii', 'an_studii'];
        var allFilled = required.every(function(name) {
            var el = form[name];
            return el && el.value.trim() !== '';
        });
        form.querySelector('input[type="submit"]').disabled = !allFilled;
    }
    window.onload = function() {
        var form = document.forms[0];
        if (form) {
            var inputs = form.querySelectorAll('input[type="text"]');
            inputs.forEach(function(input) {
                input.addEventListener('input', checkFields);
            });
            checkFields();
        }
    };
    </script>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String Nume = request.getParameter("nume");
        	String InitialaTata = request.getParameter("initiala_tata");
        	String Prenume = request.getParameter("prenume");
        	String DataNasterii = request.getParameter("data_nasterii");
        	String Cnp = request.getParameter("cnp");
        	String Adresa = request.getParameter("adresa");
        	String Facultate = request.getParameter("facultate");
        	String CicluStudii = request.getParameter("ciclu_studii");
        	String AnStudii = request.getParameter("an_studii");
            
            if (Nume != null) {
                jb.connect();
                jb.adaugaStudent(Nume, InitialaTata, Prenume, DataNasterii,
                		Cnp, Adresa, Facultate, CicluStudii, AnStudii);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Student.</h1>
        <form action="nou_Student.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="nume" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Initiala Tata:</td>
                    <td> <input type="text" name="initiala_tata" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Prenume:</td>
                    <td> <input type="text" name="prenume" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Data nasterii:</td>
                    <td> <input type="text" name="data_nasterii" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Cnp:</td>
                    <td> <input type="text" name="cnp" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Adresa:</td>
                    <td> <input type="text" name="adresa" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Facultate:</td>
                    <td> <input type="text" name="facultate" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Ciclu studii:</td>
                    <td> <input type="text" name="ciclu_studii" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">An studii:</td>
                    <td> <input type="text" name="an_studii" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga studentul" disabled />
        </form>
        <%
            }
        %>
        <br/>
        <div style="text-align:center;"><a href="index.html"><b>Home</b></a></div>
        <br/>
    </body>
</html>