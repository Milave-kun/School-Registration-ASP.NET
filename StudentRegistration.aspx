<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="StudentRegistration.aspx.vb" Inherits="School_Registration_ASP.NET.StudentRegistration1" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
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
            width: 280px;
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
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Registration form container */
        .form-container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
            width: 500px;
            color: black;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
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
        <div class="form-container">
            <h2>Register a New Student</h2>
            <form id="formRegistration" runat="server">
                <div class="form-group">
                    <label for="txtFirstName">First Name:</label>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtLastName">Last Name:</label>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="ddlGender">Gender:</label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select">
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="ddlLevel">Level:</label>
                    <asp:DropDownList ID="ddlLevel" runat="server" CssClass="form-select">
                        <asp:ListItem Value="Grade 11">Grade 11</asp:ListItem>
                        <asp:ListItem Value="Grade 12">Grade 12</asp:ListItem>
                        <asp:ListItem Value="1st Year College">1st Year College</asp:ListItem>
                        <asp:ListItem Value="2nd Year College">2nd Year College</asp:ListItem>
                        <asp:ListItem Value="3rd Year College">3rd Year College</asp:ListItem>
                        <asp:ListItem Value="4th Year College">4th Year College</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="ddlSection">Section:</label>
                    <asp:DropDownList ID="ddlSection" runat="server" CssClass="form-select">
                        <asp:ListItem Value="A">A</asp:ListItem>
                        <asp:ListItem Value="B">B</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group text-center">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary w-100" OnClick="btnRegister_Click" />
                </div>
                <div class="form-group text-center">
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
