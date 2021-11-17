<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    String DRIVER = "com.mysql.cj.jdbc.Driver";
    String URL = "jdbc:mysql://localhost:3306/project_work";
    String USERNAME = "root";
    String PASSWORD = "";
    int punteggio = Integer.parseInt(request.getParameter("punteggio"));
    int idTest = 0;
    try {
        Class.forName(DRIVER);
        Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        String sel = ("INSERT INTO test(punteggio) values(?)");
        PreparedStatement ps = con.prepareStatement(sel);
        ps.setInt(1, punteggio);
        ps.executeUpdate();
        ps.close();
        String sel2 = ("SELECT MAX(idTest) as max FROM test");
        Statement st = con.createStatement();
        ResultSet rs= st.executeQuery(sel2);
        while(rs.next()){
            idTest = rs.getInt("max");
        }
        String sel3 = ("UPDATE candidatura SET codTest = ? WHERE idCandidatura = ?");
        int idCand = (int) session.getAttribute("idCandidatura");
        PreparedStatement ps2 = con.prepareStatement(sel3);
        ps2.setInt(1, idTest);
        ps2.setInt(2, idCand);
        ps2.executeUpdate();
        ps2.close();
        rs.close();
        con.close();
    } catch (SQLException e) {
        e.getErrorCode();
    }
%>
<script>
    window.location.href = 'user.jsp';
</script>