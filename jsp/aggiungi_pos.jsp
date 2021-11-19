<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    String DRIVER = "com.mysql.cj.jdbc.Driver";
    String URL = "jdbc:mysql://localhost:3306/project_work";
    String USERNAME = "root";
    String PASSWORD = "";
    int massimo = 0;
    String nome = request.getParameter("nome");
    boolean stato = request.getBoolean("stato");
    try {
        Class.forName(DRIVER);
        Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);  
        String sel = ("SELECT MAX(id) max FROM posizione;");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sel);
        while(rs.next()){
            massimo = rs.getInt("max");
        }
        massimo++;   
        String ins = ("INSERT INTO posizione (id , nome, stato) VALUES(?, ?, ?)");
        PreparedStatement ps = con.prepareStatement(ins);
        ps.setInt(1, massimo);
        ps.setString(2, nome);
        ps.setBoolean(3, stato);
        ps.executeUpdate();
        ps.close();    
        con.close();
    } catch (SQLException e) {
        e.getErrorCode();
    }
%>
<script>
    window.location.href = 'gest_pos.jsp';
</script>