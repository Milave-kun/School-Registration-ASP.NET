<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Dashboard.aspx.vb" Inherits="School_Registration_ASP.NET.Dashboard1" %>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        /* Basic styling for dashboard box */
        .dashboard-box {
            border: 1px solid #ddd;
            padding: 20px;
            margin: 10px;
            width: 200px;
            display: inline-block;
            text-align: center;
            background-color: #f4f4f4;
        }
        .sidebar {
            width: 200px;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            background-color: #333;
            padding-top: 20px;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 10px;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #575757;
        }
    </style>
</head>
<body>
    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <a href="Dashboard.aspx">Dashboard</a>
        <a href="StudentRegistration.aspx">Register Student</a>
        <a href="SHSStudentList.aspx">SHS Students</a> <!-- Added SHS Students link -->
        <a href="CollegeStudentList.aspx">College Students</a>
    </div>

    <!-- Main Content -->
    <div style="margin-left: 220px; padding: 20px;">
        <h2>School Registration Dashboard</h2>
        <div class="dashboard-box">
            Total Students: <asp:Label ID="lblTotalStudents" runat="server"></asp:Label>
        </div>
        <div class="dashboard-box">
            College Students: <asp:Label ID="lblCollegeStudents" runat="server"></asp:Label>
        </div>
        <div class="dashboard-box">
            SHS Students: <asp:Label ID="lblSHSStudents" runat="server"></asp:Label>
        </div>
        <div class="dashboard-box">
            Male Students: <asp:Label ID="lblMaleStudents" runat="server"></asp:Label>
        </div>
        <div class="dashboard-box">
            Female Students: <asp:Label ID="lblFemaleStudents" runat="server"></asp:Label>
        </div>
        <div class="dashboard-box">
            Section A: <asp:Label ID="lblSectionA" runat="server"></asp:Label>
        </div>
        <div class="dashboard-box">
            Section B: <asp:Label ID="lblSectionB" runat="server"></asp:Label>
        </div>
    </div>
</body>
</html>
