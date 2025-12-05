<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>All Clubs</title>
  <style>
    body { background: #f2f6ff; font-family: 'Inter', sans-serif; }
    .club-card {
      width: 300px;
      background: white;
      border-radius: 15px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.1);
      margin: 20px;
      padding: 15px;
      display: inline-block;
      vertical-align: top;
      transition: all 0.3s ease;
    }
    .club-card:hover { transform: scale(1.05); }
    img { width: 100%; height: 200px; border-radius: 10px; object-fit: cover; }
    h3 { color: #1e3c72; }
  </style>
</head>
<body>

<h2 style="text-align:center;">Our Clubs</h2>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dcsa","root","sayak");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM clubs");

        while(rs.next()) {
%>
<div class="club-card">
  <img src="${pageContext.request.contextPath}/images/<%= new java.io.File(rs.getString("imageUrl")).getName() %>" 
     alt="<%= rs.getString("name") %>" 
     style="width:150px; height:150px; object-fit:cover; border-radius:10px;">
  
  
  
  <h3><%= rs.getString("name") %></h3>
  <p><strong>Faculty:</strong> <%= rs.getString("faculty") %></p>
  <p><strong>Coordinator:</strong> <%= rs.getString("coordinator") %></p>
  <p><%= rs.getString("description") %></p>
</div>
<%
        }
        con.close();
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

</body>
</html>
