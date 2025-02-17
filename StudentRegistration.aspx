<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="StudentRegistration.aspx.vb" Inherits="School_Registration_ASP.NET.StudentRegistration1" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>

        /* Sidebar styles */
        .sidebar {
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            background-color: white;
            padding-top: 20px;
            text-align: center;
            box-shadow: 4px 0px 10px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            overflow-y: auto;
        }
        .sidebar-logo {
            width: 200px;
            height: auto;
            margin-bottom: 30px;
        }
        .sidebar a {
            display: flex;
            align-items: center;
            color: black;
            padding: 15px 20px;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            text-transform: uppercase;
            transition: 0.3s;
        }
        .sidebar a i {
            font-size: 20px;
            width: 30px;
            text-align: center;
            margin-right: 10px;
            transition: transform 0.3s ease;
        }
        .sidebar a:hover {
            background-color: maroon;
            color: white;
        }
        .sidebar a:hover i {
            transform: scale(1.1);
        }

        /* Main content background */
        .main-content {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 250px;
            padding: 20px;
            background-color: maroon;
            min-height: 100vh;
            color: white;
        }

        /* Registration form container */
        .form-container {
            background: white;
            padding: 40px 40px 60px; /* Added more padding at the bottom */
            border-radius: 15px;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
            width: 500px;
            min-height: 400px; /* Added minimum height */
            color: black;
        }

        /* Centering title */
        .form-container h2 {
            text-align: center;
        }

        /* Adjusting the label and input fields */
        .form-group label {
            font-weight: bold;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        /* Button style */
        .btn {
            padding: 12px 20px; /* Adjust the padding for better height and spacing */
            font-size: 16px; /* Increase the font size */
            margin-top: 20px; /* Add space above the button */
            width: 100%; /* Make the button take up the full width */
            border-radius: 8px; /* Slightly round the corners */
            text-align: center; /* Ensure the text is centered */
        }

        /* Responsive adjustments */
        @media (max-width: 991px) {
            .sidebar {
                width: 200px;
            }
            .main-content {
                margin-left: 200px;
            }
            .form-container {
                width: 100%;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .main-content {
                margin-left: 0;
            }
        }

        @media (max-width: 576px) {
            .form-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <img src="img/DatamexLogo.png" alt="School Logo" class="sidebar-logo">
        <a href="Dashboard.aspx">
            <i class="fas fa-chart-line"></i>Dashboard
        </a>
        <a href="StudentRegistration.aspx">
            <i class="fas fa-user-plus"></i>Register Student
        </a>
        <a href="SHSStudentList.aspx">
            <i class="fas fa-graduation-cap"></i>SHS Students
        </a>
        <a href="CollegeStudentList.aspx">
            <i class="fas fa-university"></i>College Students
        </a>
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
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
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
