<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    if(session.getAttribute("Utente")!=null && session.getAttribute("Utente").equals(true) && session.getAttribute("Tipo").equals("admin")){
%>
<%
    String DRIVER = "com.mysql.cj.jdbc.Driver";
    String URL = "jdbc:mysql://localhost:3306/project_work";
    String USERNAME = "root";
    String PASSWORD = "";
    int id = Integer.parseInt(request.getParameter("check"));
    boolean stato=false;
    try {
        Class.forName(DRIVER);
        Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        String sel = ("SELECT stato_domanda FROM candidatura WHERE idCandidatura = "+ id +";");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sel);
        while(rs.next()){
            stato=rs.getBoolean("stato_domanda");
            if(stato){
                stato=false;
            }else{
                stato=true;
            }
        }   
        String upd = ("UPDATE candidatura SET stato_domanda = ? WHERE idCandidatura = ?");
        PreparedStatement ps = con.prepareStatement(upd);
        ps.setBoolean(1, stato);
        ps.setInt(2, id);
        ps.executeUpdate();
        ps.close();    
        con.close();
    } catch (SQLException e) {
        e.getErrorCode();
    }
%>
<script>
    window.location.href = 'gest_cand.jsp';
</script>
<%
      }else{
%>
  <script>
    window.location.href = '../login.html';
  </script> 
<%
      }
%>