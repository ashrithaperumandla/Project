				
<%@ include file="connect.jsp"%>


<%
String site=(String)application.getAttribute("esite");

try
{


ResultSet rs=connection.createStatement().executeQuery("select * from purchase_fraud where site='"+site+"' and activity='"+"Abnormal"+"'");
%><html>
<head>
<title>Normal and Abnormal Users Chart Details..</title>
<script type="text/javascript" src="sources/jscharts.js"></script>
</head>
<body>
<div id="graph">Loading graph...</div>
<script type="text/javascript">
var myData=new Array();
var colors=[];

<%
	int i=0;
	
	String s1=null;
	
	while(rs.next())
	{
	 s1=rs.getString(2);
	int s3=0;
	
	%>
	
	myData["<%=i%>"]=["<%= s1%>",<%= s3%>];
        
	<%
	i++;}
	%>
	
	var myChart = new JSChart('graph', 'bar');
	myChart.setDataArray(myData);
	myChart.setBarColor('#FF3300');
	myChart.setBarOpacity(0.8);
	myChart.setSize(800,300);
	myChart.setBarBorderColor('#D9EDF7');
	myChart.setBarValues(true);
	myChart.setTitleColor('#8C8383');
	myChart.setAxisColor('#777E89');
	myChart.setAxisValuesColor('#777E81');
	myChart.draw();
	
</script>

</body>
</html>
<%
}
catch(Exception e)
{
e.printStackTrace();
}
%>

