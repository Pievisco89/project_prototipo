<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    String DRIVER = "com.mysql.cj.jdbc.Driver";
    String URL = "jdbc:mysql://localhost:3306/project_work";
    String USERNAME = "root";
    String PASSWORD = "";
    int id = Integer.parseInt(request.getParameter("skill"));
    String cv = request.getParameter("cv");
    try {
        Class.forName(DRIVER);
        Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);  
        /*String sel = ("SELECT MAX(id) max FROM posizione;");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sel);
        while(rs.next()){
            massimo = rs.getInt("max");
        }
        massimo++;*/   
        String ins = ("INSERT INTO utente_skill (codSkill , codFiscale) VALUES(?, ?)");
        PreparedStatement ps = con.prepareStatement(ins);
        ps.setInt(1, id);
        ps.setString(2, session.getAttribute("Cf").toString());
        ps.executeUpdate();
        ps.close();
        String upd = ("UPDATE utente SET curriculum = ? WHERE codiceFiscale = ?");
        PreparedStatement ps2 = con.prepareStatement(upd);
        ps2.setString(1, cv);
        ps2.setString(2, session.getAttribute("Cf").toString());
        ps2.executeUpdate();
        ps2.close();    
        con.close();
    } catch (SQLException e) {
        e.getErrorCode();
    }
%>
<script>
    window.location.href = 'user.jsp';
</script>