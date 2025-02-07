<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="StudentRegistration.aspx.vb" Inherits="School_Registration_ASP.NET.StudentRegistration1" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
    <style>
        /* Basic styling for the form */
        .form-container {
            margin-left: 220px;
            padding: 20px;
        }
        .form-group {
            margin: 10px 0;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
        }
        .form-group button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #45a049;
        }
        /* Sidebar styles */
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
    <div class="form-container">
        <h2>Register a New Student</h2>
        <form id="formRegistration" runat="server">
            <div class="form-group">
                <label for="txtFirstName">First Name:</label>
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtLastName">Last Name:</label>
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="ddlGender">Gender:</label>
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="ddlLevel">Level:</label>
                <asp:DropDownList ID="ddlLevel" runat="server">
                    <asp:ListItem Value="College">College</asp:ListItem>
                    <asp:ListItem Value="SHS">SHS</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="ddlSection">Section:</label>
                <asp:DropDownList ID="ddlSection" runat="server">
                    <asp:ListItem Value="A">A</asp:ListItem>
                    <asp:ListItem Value="B">B</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
            </div>
        </form>
    </div>
</body>
</html>
