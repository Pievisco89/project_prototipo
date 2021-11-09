<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String DRIVER = "com.mysql.cj.jdbc.Driver";
    String URL = "jdbc:mysql://localhost:3306/project_work";
    String USERNAME = "root";
    String PASSWORD = "";
    String user = request.getParameter("email");
    String password = request.getParameter("password");   
    boolean status = false;
    try {
        Class.forName(DRIVER);
        Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        String sel = ("SELECT email, password, nome, cognome, codiceFiscale, dataDiNascita FROM utente");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sel);
        while (rs.next()) {
            if (rs.getString("email").equals(user) && rs.getString("password").equals(password)) {
                status = true;
                String nome_cognome = rs.getString("nome") + " " + rs.getString("cognome");
                session.setAttribute("Welcome", nome_cognome);
                session.setAttribute("Ddn",  rs.getString("dataDiNascita"));
                session.setAttribute("Cf",  rs.getString("codiceFiscale"));
                session.setAttribute("Email",  rs.getString("email"));
                session.setAttribute("Password",  rs.getString("password"));

            }
        }
        con.close();
    } catch (SQLException e) {
        e.getErrorCode();
    }
    if (status) {
        //out.println("<h1>Login user riuscita!</h1>");
%> 
    <jsp:forward page="user.jsp" />
<%
    } else {
        out.println("<h1>Login user NON riuscita!</h1>");

    }
%>