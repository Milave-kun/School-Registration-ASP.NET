<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Dashboard.aspx.vb" Inherits="School_Registration_ASP.NET.Dashboard1" %>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Sidebar styles */
        .sidebar {
            width: 400px;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            background-color: white;
            padding-top: 20px;
            text-align: center;
            box-shadow: 4px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .sidebar-logo {
            width: 280px; /* Bigger logo */
            height: auto;
            margin-bottom: 30px;
        }
        .sidebar a {
            display: block;
            color: black;
            padding: 20px;
            text-decoration: none;
            font-size: 22px;
            font-weight: bold;
            text-transform: uppercase;
            transition: 0.3s;
        }
        .sidebar a:hover {
            background-color: maroon;
            color: white;
        }

        /* Main content background */
        .main-content {
            margin-left: 420px;
            padding: 30px;
            background-color: maroon;
            min-height: 100vh;
            color: white;
        }

        /* Dashboard grid layout */
        .dashboard-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            justify-content: center;
            margin-top: 30px;
        }

        /* Dashboard box styling */
        .dashboard-box {
            background: white;
            color: black;
            border-radius: 15px;
            padding: 40px;
            text-align: center;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
            font-size: 28px;
            font-weight: bold;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s;
            position: relative;
            overflow: hidden;
        }
        .dashboard-box:hover {
            transform: translateY(-5px);
            box-shadow: 8px 8px 20px rgba(0, 0, 0, 0.3);
        }

        /* Box colors */
        .total-students { background: #ffcc00; }
        .college-students { background: #ff5733; }
        .shs-students { background: #33c3ff; }
        .male-students { background: #28a745; }
        .female-students { background: #d63384; }

        /* Label styling inside boxes */
        .dashboard-box span {
            font-size: 50px;
            display: block;
            font-weight: bold;
            margin-top: 10px;


    </style>
</head>
<body>
    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <img src="img/DatamexLogo.png" alt="School Logo" class="sidebar-logo">
        <a href="Dashboard.aspx">Dashboard</a>
        <a href="StudentRegistration.aspx">Register Student</a>
        <a href="SHSStudentList.aspx">SHS Students</a>
        <a href="CollegeStudentList.aspx">College Students</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1 class="fw-bold text-center">School Registration Dashboard</h1>
        
        <!-- Dashboard Boxes at the top -->
        <div class="dashboard-container">
            <div class="dashboard-box total-students">
                Total Students
                <span><asp:Label ID="lblTotalStudents" runat="server"></asp:Label></span>
            </div>
            <div class="dashboard-box college-students">
                College Students
                <span><asp:Label ID="lblCollegeStudents" runat="server"></asp:Label></span>
            </div>
            <div class="dashboard-box shs-students">
                SHS Students
                <span><asp:Label ID="lblSHSStudents" runat="server"></asp:Label></span>
            </div>
            <div class="dashboard-box male-students">
                Male Students
                <span><asp:Label ID="lblMaleStudents" runat="server"></asp:Label></span>
            </div>
            <div class="dashboard-box female-students">
                Female Students
                <span><asp:Label ID="lblFemaleStudents" runat="server"></asp:Label></span>
            </div>
        </div>

    <!-- Bootstrap JS (Optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
