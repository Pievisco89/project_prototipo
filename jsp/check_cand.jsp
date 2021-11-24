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
    int idCand = 0;
    String Cf = session.getAttribute("Cf").toString();
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
        idCand = (int) session.getAttribute("idCandidatura");     
        String ins = ("INSERT INTO utente_candidatura(codFiscale, codCandidatura) VALUES(?, ?)");
        PreparedStatement ps2 = con.prepareStatement(ins);
        ps2.setString(1, Cf);
        ps2.setInt(2, idCand);
        ps2.executeUpdate();
        ps2.close();    
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