<%-- 
    Document   : show
    Created on : Sep 16, 2017, 9:21:39 PM
    Author     : Shubham Shukla
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.sql.*"%>
<%@page  import = "java.util.Calendar"%>
<%@page  import = "java.util.Date"%>
<%!
            public class update
	{
                int a,b,c;
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/deptwise";
		String user="root";
		String password="1234";
		String x = new String();
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		int y,z;
                String query = new String();
                Statement statement;
                Statement statement1;
                Statement statement2;
                Statement statement3;
		public update()
		{
			try
			{
				connection = DriverManager.getConnection(url,user,password);
				statement = connection.createStatement();
                                statement1 = connection.createStatement();
                                statement2 = connection.createStatement();
                                statement3 = connection.createStatement();
			}
			catch(Exception e)
			{
				a=10;
			}
		}
		public ResultSet setup(String u,int p,int g1)
		{
			int res = 0;
			try
			{	x=u;
				y=p;
                                z=g1;
                                query ="select roll_no , nam from "+x+" where sem = "+y+" and sec = "+z;
                                resultSet = statement.executeQuery(query);
				return resultSet;
			}
			catch(Exception e)
			{
                            b=10;
			}
                        return resultSet;
		}
                
                public int updat(String d,int a,int att,String sub)
                {
                try
                {
                    String Quer = "insert into "+d+"_record values("+a+",'"+java.time.LocalDate.now()+"','"+sub+"',"+att+")";
                    int res = statement1.executeUpdate(Quer);
                    if(att==1)
                    {
                    if(res>0)
                    {
                        String q1="select total from "+d+"_total where roll_no ="+a+" and sub ='"+sub+"'";
                        ResultSet p = statement2.executeQuery(q1);
                        if(p.next())
                        {
                            int totl = Integer.parseInt(p.getString(1));
                            totl=totl+1;
                            String q2="update "+d+"_total set total = "+totl+" where roll_no = "+a+" and sub = '"+sub+"'";
                            statement3.executeUpdate(q2);
                            return totl;
                        }
                        else
                        {
                            String q2="insert into "+d+"_total values ("+a+",'"+sub+"',1)";
                            int insert = statement2.executeUpdate(q2);
                            return 2;
                        }
                    }
                    else
                    {
                        return -1;
                    }
                    }
                    else return 5;
                }
                catch(Exception e)
                {
                    b=10;
		}
                    return 0;
                }
	}
            
        %>

<%!
	public class login
	{
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/deptwise";
		String user="root";
		String password="1234";
                
                int a,b,c;
		
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		
		public login()
		{
			try
			{
				
                                connection = DriverManager.getConnection(url,user,password);
				ps = connection.prepareStatement("select * from classes where dept = ?");
			}
			catch(SQLException e)
			{
                          
				c=10;
			}
		}
		public ResultSet setup(String u)
		{
			try
			{
				ps.setString(1,u);
				resultSet = ps.executeQuery();
				return resultSet;
			}
			catch(SQLException e)
			{
                            a=10;
                        
			}
			return null;
		}
	}
%>
<%

		String us = new String();
		String pw = new String();
                int kr=1;
		
		if(session.getAttribute("dept")!=null)
		{
			us = (String)session.getAttribute("dept");
		}
		
		login s = new login();
		ResultSet r = s.setup(us);
                
%>

<% Class.forName("com.mysql.jdbc.Driver");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Lumino - Dashboard</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<SCRIPT language = "JavaScript">
function alertt()
{
	if(document.nm.hidden.value==1)
			alert("Login Successfull");
        if(document.nm.hidden.value==-1)
			alert("You don't have a lecture today");
}
</SCRIPT>
</head>
<body onload = "alertt()">
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#sidebar-collapse" aria-expanded="true"><span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span></button>
				<a class="navbar-brand" href="#"><span>S-</span>Admin</a>
				<ul class="nav navbar-top-links navbar-right">
				</ul>
			</div>
		</div><!-- /.container-fluid -->
	</nav>
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar collapse in" aria-expanded="true" style="">
		<div class="profile-sidebar">
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">Username</div>
				
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		
		<ul class="nav menu">
			<li class="active">
            <a href="login.jsp"><em class="fa fa-dashboard">&nbsp;</em>Daily Attendance</a></li>
			<li><a href="monthly.jsp"><em class="fa fa-calendar">&nbsp;</em>Monthly Record</a></li>
			<li><a href="update_existing.jsp"><em class="fa fa-bar-chart">&nbsp;</em>Update Existing</a></li>
			<li><a href="export.jsp"><em class="fa fa-toggle-off">&nbsp;</em>Export</a></li>
			<li><a href="special.jsp"><em class="fa fa-clone">&nbsp;</em>Special Attendance</a></li>
			
			<li><a href="index.jsp"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
		</ul>
	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Home</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Daily Attendance</h1>
			</div>
		</div><!--/.row-->
		
		
		<div class="row">
			<div class="col-md-12">
<form name = "nm" action="redir" method =post>				
Select the class </br>

Semester : 
<select name="sem">
<%
if(r!=null){
while(r.next()){%>
<option><%= r.getString(2)%></option>
<%}}
r.beforeFirst();
%>
</select>
Section :
<select name="section">
<%
if(r!=null){
while(r.next()){%>
<option><%= r.getString(3)%></option>
<%}}
r.beforeFirst();
%>
</select>
<input type = "hidden" name = "hidden" value= ""/>


 Subject :
    <select name="subject">
        <option>SELECT SUBJECT</option>
        <option>TOC</option>
        <option>POS</option>
        <option>CG</option>
        <option>MMT</option>
        <option>WD</option>
        <option>MP</option>                         
    </select>

<input type="submit" value="Go" name="today" />
</form>

<%

		String c = new String();
                String sb = new String();
                Integer s1=0,q=0,stop =0;
                ResultSet x=null;
		
		if(session.getAttribute("dept")!=null)
		{
			c = (String)session.getAttribute("dept");
                        sb = (String)session.getAttribute("subject");
                        if(sb.equals("SELECT SUBJECT"))
                        {
                            stop=1;
                        }
		}
		s1 = Integer.parseInt((String)session.getAttribute("sem"));
		q = Integer.parseInt((String)session.getAttribute("section"));
                int tru=0;
                update sh = new update();
                ResultSet kx = sh.setup(c,s1,q);
                
                if(stop==1)
                {
                    %>Select a subject to proceed <a href = "login.jsp">go back</a><%                    
                }
                else{
                while(kx.next() && stop ==0)
                {
                int at;
                if(request.getParameter(kx.getString(1))==null){at = 0;}else{at = 1;};
                int h = sh.updat(c,Integer.parseInt(kx.getString(1)),at,sb);
                if(h==-1||h==0)
                {
                    tru=-1;
                    %>Entry already made for same date and subject please update <a href = "login.jsp">go back</a><%
                }
                }
                kx.beforeFirst();
                }

        if(tru==0){%>
<h4>Attendance Updated:</h4>
<table border="1">
    <tbody>
        <tr >
            <td>Roll no</td>
            <td>Name </td>
            <td>Status</td>
        </tr>
        <% int i=0;
            String stat;
        while(kx.next()){%>
            <tr>
            <td><%=kx.getString(1)%></td>
            <td><%=kx.getString(2)%></td>
            <td><%if(request.getParameter(kx.getString(1))==null){stat = "absent";}else{stat = "present";}%><%=stat%></td>
            
            </tr>
        <%} %>
    </tbody>
</table>
        <a href="login.jsp">Home</a>
        <%}%>
        
</div>
</div>
		
		
		
		
	</div>	<!--/.main-->
	
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/custom.js"></script>
	<script>
		window.onload = function () {
	var chart1 = document.getElementById("line-chart").getContext("2d");
	window.myLine = new Chart(chart1).Line(lineChartData, {
	responsive: true,
	scaleLineColor: "rgba(0,0,0,.2)",
	scaleGridLineColor: "rgba(0,0,0,.05)",
	scaleFontColor: "#c5c7cc"
	});
};
	</script>
		

</body></html>