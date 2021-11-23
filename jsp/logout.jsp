<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    if(session.getAttribute("Utente")!=null && session.getAttribute("Utente").equals(true) && session.getAttribute("Tipo").equals("admin")){
        session.removeAttribute("Utente");
        session.removeAttribute("Tipo");
        session.removeAttribute("Email");
        session.removeAttribute("Password");
        session.removeAttribute("Welcome");
%>
<script>
    window.location.href = '../index.html';
</script>
<%
      }else if(session.getAttribute("Utente")!=null && session.getAttribute("Utente").equals(true) && session.getAttribute("Tipo").equals("user")){
        session.removeAttribute("Utente");
        session.removeAttribute("Tipo");
        session.removeAttribute("Welcome");
        session.removeAttribute("Ddn");
        session.removeAttribute("Cf");
        session.removeAttribute("Email");
        session.removeAttribute("Password");
      }
      else{
%>
  <script>
    window.location.href = '../index.html';
  </script> 
<%
      }
%>