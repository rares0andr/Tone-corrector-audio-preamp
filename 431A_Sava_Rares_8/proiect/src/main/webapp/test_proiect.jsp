<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Test Proiect Table</title>
    <link rel="stylesheet" href="style.css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <h1>Testing Proiect Table</h1>
    
    <%
        try {
            jb.connect();
            out.println("<p>Database connection successful.</p>");
            
            // Test 1: Check if table exists
            out.println("<h2>Test 1: Table Structure</h2>");
            try {
                ResultSet rs = jb.testProiectTable();
                out.println("<table border='1'>");
                out.println("<tr><th>Field</th><th>Type</th><th>Null</th><th>Key</th><th>Default</th><th>Extra</th></tr>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("Field") + "</td>");
                    out.println("<td>" + rs.getString("Type") + "</td>");
                    out.println("<td>" + rs.getString("Null") + "</td>");
                    out.println("<td>" + rs.getString("Key") + "</td>");
                    out.println("<td>" + rs.getString("Default") + "</td>");
                    out.println("<td>" + rs.getString("Extra") + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
                rs.close();
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error checking table structure: " + e.getMessage() + "</p>");
            }
            
            // Test 2: Simple query
            out.println("<h2>Test 2: Simple Query</h2>");
            try {
                ResultSet rs = jb.testSimpleProiectQuery();
                int rowCount = 0;
                while (rs.next()) {
                    rowCount++;
                }
                out.println("<p>Simple query successful. Found " + rowCount + " rows.</p>");
                rs.close();
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error in simple query: " + e.getMessage() + "</p>");
            }
            
            // Test 2.5: Show actual data
            out.println("<h2>Test 2.5: Proiect Table Data</h2>");
            try {
                ResultSet rs = jb.getAllProiectData();
                out.println("<table border='1'>");
                out.println("<tr><th>idproiect</th><th>idstudent</th><th>idcurs</th><th>denumire</th><th>sesiune_examinare</th><th>descriere</th><th>data_predare</th></tr>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("idproiect") + "</td>");
                    out.println("<td>" + rs.getString("idstudent") + "</td>");
                    out.println("<td>" + rs.getString("idcurs") + "</td>");
                    out.println("<td>" + rs.getString("denumire") + "</td>");
                    out.println("<td>" + rs.getString("sesiune_examinare") + "</td>");
                    out.println("<td>" + rs.getString("descriere") + "</td>");
                    out.println("<td>" + rs.getString("data_predare") + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
                rs.close();
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error showing proiect data: " + e.getMessage() + "</p>");
            }
            
            // Test 2.6: Show actual column names
            out.println("<h2>Test 2.6: Actual Column Names</h2>");
            try {
                ResultSet rs = jb.testProiectTable();
                out.println("<p>Columns in proiect table:</p>");
                out.println("<ul>");
                while (rs.next()) {
                    out.println("<li>" + rs.getString("Field") + " (" + rs.getString("Type") + ")</li>");
                }
                out.println("</ul>");
                rs.close();
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error showing column names: " + e.getMessage() + "</p>");
            }
            
            // Test 3: Check other tables
            out.println("<h2>Test 3: Other Tables</h2>");
            try {
                ResultSet rs = jb.vedeTabela("studenti");
                out.println("<p>Studenti table: OK</p>");
                rs.close();
                
                rs = jb.vedeTabela("cursuri");
                out.println("<p>Cursuri table: OK</p>");
                rs.close();
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error with other tables: " + e.getMessage() + "</p>");
            }
            
            jb.disconnect();
        } catch (Exception e) {
            out.println("<p style='color:red;'>Connection error: " + e.getMessage() + "</p>");
        }
    %>
    
    <br/>
    <a href="index.html">Back to Home</a>
</body>
</html> 