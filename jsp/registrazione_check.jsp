<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String DRIVER = "com.mysql.cj.jdbc.Driver";
    String URL = "jdbc:mysql://localhost:3306/project_work";
    String USERNAME = "root";
    String PASSWORD = "";
    String nome = request.getParameter("nome");
    String cognome = request.getParameter("cognome");
    String codiceFiscale = request.getParameter("codiceFiscale");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String dataNascita = request.getParameter("dataNascita");
    String confermaPassword = request.getParameter("confermaPassword");
    int naz = Integer.parseInt(request.getParameter("naz"));
    Date date=Date.valueOf(dataNascita);
    //Query di insert per UTENTE
    try {
        Class.forName(DRIVER);
        Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        String sel = ("INSERT INTO utente(codiceFiscale, nome, cognome, dataDiNascita, email, password) values(?,?,?,?,?,?)");
        PreparedStatement ps = con.prepareStatement(sel);
        ps.setString(1, codiceFiscale);
        ps.setString(2, nome);
        ps.setString(3, cognome);
        ps.setDate(4, date);
        ps.setString(5, email);
        if(password.equals(confermaPassword)){
            ps.setString(6, password);
        }
        ps.executeUpdate();
        ps.close();
        //Query di insert legata alla tabella n a n UTENTE-NAZIONALITA
        String sel2 = ("INSERT INTO utente_nazionalita(codFiscale, codNazione) values(?,?)");
        PreparedStatement psn = con.prepareStatement(sel2);  
        psn.setString(1, codiceFiscale);
        psn.setInt(2, naz);
        psn.executeUpdate();
        psn.close();
        con.close();
    } catch (SQLException e) {
        e.getErrorCode();
    }
%>