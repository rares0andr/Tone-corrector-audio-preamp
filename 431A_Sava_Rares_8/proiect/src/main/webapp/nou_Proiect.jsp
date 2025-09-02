<%-- 
    Document   : nou_Consultatie
    Created on : Nov 14, 2016, 1:08:21 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga proiect</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            int idstudent, idcurs;
            String id1, id2, Nume, InitialaTata, Prenume, DataNasterii, Cnp, Adresa, Facultate, CicluStudii, AnStudii, DenumireCurs, NumeProfesor, Sala, MetodaNotare, Structura, DenumireProiect, SesiuneExaminare, Descriere, DataPredare;
            id1 = request.getParameter("idstudent");
            id2 = request.getParameter("idcurs");
            DenumireProiect = request.getParameter("Denumire");
            SesiuneExaminare = request.getParameter("Sesiune_examinare");
            Descriere = request.getParameter("Descriere");
            DataPredare = request.getParameter("Data_predare");
            if (id1 != null) {
            	jb.connect();
                jb.adaugaProiect(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), DenumireProiect, SesiuneExaminare, Descriere, DataPredare);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.<p><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("studenti");
        ResultSet rs2 = jb.vedeTabela("cursuri");

        %>
        <h1> Suntem in tabela proiecte.</h1>
        <form action="nou_Proiect.jsp" method="post">
            <div class="table-responsive">
            <table>
                <tr>
                    <td align="right">Idstudent:</td>
                    <td> 
                        Selectati studentul:
                        <SELECT NAME="idstudent" required>
                                <%
                                    while(rs1.next()){
                                        idstudent = rs1.getInt("idstudent");
                                        Nume = rs1.getString("nume");
                                        InitialaTata = rs1.getString("initiala_tata");
                                        Prenume = rs1.getString("prenume");
                                        DataNasterii = rs1.getString("data_nasterii");
                                        Cnp = rs1.getString("cnp");
                                        Adresa = rs1.getString("adresa");
                                        Facultate = rs1.getString("facultate");
                                        CicluStudii = rs1.getString("ciclu_studii");
                                        AnStudii = rs1.getString("an_studii");
                                %>
                                    <OPTION VALUE="<%= idstudent%>"><%= idstudent%>,<%= Nume%>,<%= InitialaTata%>,<%= Prenume%>,<%= DataNasterii%>,<%= Cnp%>,<%= Adresa%>,<%= Facultate%>,<%= CicluStudii%>,<%= AnStudii%></OPTION>
                                <%
                                    }
                                %>
                        </SELECT>
                    
                    </td>
                </tr>
                <tr>
                    <td align="right">IdCurs:</td>
                    <td> 
                        Selectati cursul:
			<SELECT NAME="idcurs" required>
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        idcurs = rs2.getInt("idcurs");
                                        DenumireCurs = rs2.getString("denumire");
                                        NumeProfesor = rs2.getString("nume_profesor");
                                        Sala = rs2.getString("sala");
                                        MetodaNotare = rs2.getString("metoda_notare");
                                        Structura = rs2.getString("structura");
                                %>
                                    <OPTION VALUE="<%= idcurs%>"><%= idcurs%>,<%= DenumireCurs%>,<%= NumeProfesor%>,<%= Sala%>,<%= MetodaNotare%>,<%= Structura%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
                <tr>
                    <td align="right">Denumire:</td>
                    <td> <input type="text" name="Denumire" size="30" required /></td>
                </tr>
                <tr>
                    <td align="right">Sesiune examinare:</td>
                    <td> <input type="text" name="Sesiune_examinare" size="30" required /></td>
                </tr>
                <tr>
                    <td align="right">Descriere:</td>
                    <td> <input type="text" name="Descriere" size="30" required /></td>
                </tr>
                <tr>
                    <td align="right">Data predare:</td>
                    <td> <input type="text" name="Data_predare" size="30" required /></td>
                </tr>
            </table>
            </div>
            <input type="submit" value="Adauga proiectul" disabled />
    <script>
    function checkFields() {
        var form = document.forms[0];
        var required = ['idstudent', 'idcurs', 'Denumire', 'Sesiune_examinare', 'Descriere', 'Data_predare'];
        var allFilled = required.every(function(name) {
            var el = form[name];
            if (!el) return false;
            if (el.tagName === 'SELECT') {
                return el.value && el.value !== '';
            }
            return el.value.trim() !== '';
        });
        form.querySelector('input[type="submit"]').disabled = !allFilled;
    }
    document.addEventListener('DOMContentLoaded', function() {
        var form = document.forms[0];
        if (form) {
            var inputs = form.querySelectorAll('input[type="text"], select');
            inputs.forEach(function(input) {
                input.addEventListener('input', checkFields);
                input.addEventListener('change', checkFields);
            });
            checkFields();
        }
    });
    </script>
        </form>
        <%
            }
        %>
        <br/>
        <div style="text-align:center;"><a href="index.html"><b>Home</b></a></div>
        <br/>
    </body>
</html>