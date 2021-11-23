<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    if(session.getAttribute("Utente")!=null && session.getAttribute("Utente").equals(true) && session.getAttribute("Tipo").equals("user")){
%>
<%
    String DRIVER = "com.mysql.cj.jdbc.Driver";
    String URL = "jdbc:mysql://localhost:3306/project_work";
    String USERNAME = "root";
    String PASSWORD = "";
    int idPos = Integer.parseInt(request.getParameter("scelta"));
    try {
        Class.forName(DRIVER);
        Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        String sel = ("INSERT INTO candidatura(cod_posizione) VALUES(?)");
        PreparedStatement ps = con.prepareStatement(sel);
        ps.setInt(1, idPos);
        ps.executeUpdate();
        ps.close();
        String sel2 = ("SELECT MAX(idCandidatura) as max FROM candidatura");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sel2);
        while(rs.next()){
            session.setAttribute("idCandidatura", rs.getInt("max"));
        }        
        con.close();
    } catch (SQLException e) {
        e.getErrorCode();
    }
%>
<script>
    window.location.href = '../test.html';
</script>
<%
      }else{
%>
  <script>
    window.location.href = '../login_user.html';
  </script> 
<%
      }
%>