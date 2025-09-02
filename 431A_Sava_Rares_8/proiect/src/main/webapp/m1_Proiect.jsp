<%-- 
    Document   : m1_Consultatie
    Created on : Nov 14, 2016, 1:39:35 PM
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
        <h1 align="center">Tabela Proiect:</h1>
        <br/>
        <p align="center"><a href="nou_Proiect.jsp"><b>Adauga un nou proiect.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String Nume, InitialaTata, Prenume, DataNasterii, Cnp, Adresa, Facultate, 
            CicluStudii, AnStudii, DenumireCurs, NumeProfesor, Sala, MetodaNotare, Structura, DenumireProiect, SesiuneExaminare, Descriere, DataPredare;

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceProiectId(aux);
            rs.first();
            int id1 = rs.getInt("IdStudentProiect");
            int id2 = rs.getInt("IdCursProiect");
			
            Nume = rs.getString("nume");
            InitialaTata = rs.getString("initiala_tata");
            Prenume = rs.getString("prenume");
            DataNasterii = rs.getString("data_nasterii");
            Cnp = rs.getString("cnp");
            Adresa = rs.getString("adresa");
            Facultate = rs.getString("facultate");
            CicluStudii = rs.getString("ciclu_studii");
            AnStudii = rs.getString("an_studii");
            DenumireCurs = rs.getString("DenumireCurs");
            NumeProfesor = rs.getString("nume_profesor");
            Sala = rs.getString("sala");
            MetodaNotare = rs.getString("metoda_notare");
            Structura = rs.getString("structura");
            
            DenumireProiect = rs.getString("DenumireProiect");
            SesiuneExaminare = rs.getString("Sesiune examinare");
            Descriere = rs.getString("Descriere");
            DataPredare = rs.getString("Data predare");

            ResultSet rs1 = jb.vedeTabela("studenti");
            ResultSet rs2 = jb.vedeTabela("cursuri");
            int idstudent, idcurs;


        %>
        <form action="m2_Proiect.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdProiect:</td>
                    <td> <input type="text" name="idproiect" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">idstudent:</td>
                    <td> 
                        <SELECT NAME="idstudent">
                            <%
                                while (rs1.next()) {
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
                                    
                                    if (idstudent != id1) {
                            %>
                            <OPTION VALUE="<%= idstudent%>"><%= idstudent%>, <%= Nume%>, <%= InitialaTata%>, <%= Prenume%>, <%= DataNasterii%>, <%= Cnp%>, <%= Adresa%>, <%= Facultate%>, <%= CicluStudii%>, <%= AnStudii%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idstudent%>"><%= idstudent%>, <%= Nume%>, <%= InitialaTata%>, <%= Prenume%>, <%= DataNasterii%>, <%= Cnp%>, <%= Adresa%>, <%= Facultate%>, <%= CicluStudii%>, <%= AnStudii%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">idcurs:</td>
                    <td> 
                        <SELECT NAME="idcurs">
                            <%
                                while (rs2.next()) {
                                    idcurs = rs2.getInt("idcurs");
                                    DenumireCurs = rs2.getString("denumire");
                                    NumeProfesor = rs2.getString("nume_profesor");
                                    Sala = rs2.getString("sala");
                                    MetodaNotare = rs2.getString("metoda_notare");
                                    Structura = rs2.getString("structura");
                                    
                            if (idcurs != id2) {
                            %>
                            <OPTION VALUE="<%= idcurs%>"><%= idcurs%>, <%= DenumireCurs%>, <%= NumeProfesor%>, <%= Sala%>, <%= MetodaNotare%>, <%= Structura%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idcurs%>"><%= idcurs%>, <%= DenumireCurs%>, <%= NumeProfesor%>, <%= Sala%>, <%= MetodaNotare%>, <%= Structura%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">Denumire:</td>
                    <td> <input type="text" name="Denumire" size="30" value="<%= DenumireProiect%>"/></td>
                </tr>
                <tr>
                    <td align="right">Sesiune Examinare:</td>
                    <td> <input type="text" name="Sesiune_examinare" size="30" value="<%= SesiuneExaminare%>"/></td>
                </tr>
                <tr>
                    <td align="right">Descriere:</td>
                    <td> <input type="text" name="Descriere" size="30" value="<%= Descriere%>"/></td>
                </tr>
                <tr>
                    <td align="right">Data Predare:</td>
                    <td> <input type="text" name="Data_predare" size="30" value="<%= DataPredare%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        
            <br/>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>