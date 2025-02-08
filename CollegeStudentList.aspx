<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CollegeStudentList.aspx.vb" Inherits="School_Registration_ASP.NET.CollegeStudentList" %>

<!DOCTYPE html>
<html>
<head>
    <title>College Student List</title>
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
        }
        .search-box, .filter-box {
            margin-bottom: 20px;
        }
        .grid-container {
            background: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
            color: black;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
            <h2 class="fw-bold text-center">College Student List</h2>
            
            <div class="search-box">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by name..."></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-light mt-2" Text="Search" OnClick="btnSearch_Click" />
            </div>
            
            <div class="filter-box">
                <asp:Label ID="lblFilterGrade" runat="server" Text="Filter by Year Level: " CssClass="fw-bold ms-3" />
                <asp:DropDownList ID="ddlFilterGrade" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
                    <asp:ListItem Value="">All Year Level</asp:ListItem>
                    <asp:ListItem Value="1st Year College">1st Year College</asp:ListItem>
                    <asp:ListItem Value="2nd Year College">2nd Year College</asp:ListItem>
                    <asp:ListItem Value="3rd Year College">3rd Year College</asp:ListItem>
                    <asp:ListItem Value="4th Year College">4th Year College</asp:ListItem>
                </asp:DropDownList>

                <asp:Label ID="lblFilterSection" runat="server" Text="Filter by Section: " CssClass="fw-bold ms-3" />
                <asp:DropDownList ID="ddlFilterSection" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
                    <asp:ListItem Value="">All Sections</asp:ListItem>
                    <asp:ListItem Value="A">A</asp:ListItem>
                    <asp:ListItem Value="B">B</asp:ListItem>
                </asp:DropDownList>
                
                <asp:Label ID="lblFilterGender" runat="server" Text="Filter by Gender: " CssClass="fw-bold ms-3" />
                <asp:DropDownList ID="ddlFilterGender" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
                    <asp:ListItem Value="">All Genders</asp:ListItem>
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:DropDownList>
            </div>
            
            <div class="grid-container">
                <asp:GridView ID="gvStudents" runat="server" CssClass="table table-striped table-bordered"
                    AutoGenerateColumns="False" OnRowEditing="gvStudents_RowEditing" 
                    OnRowUpdating="gvStudents_RowUpdating" OnRowCancelingEdit="gvStudents_RowCancelingEdit" 
                    OnRowDeleting="gvStudents_RowDeleting" DataKeyNames="student_id">
                    <Columns>
                        <asp:BoundField DataField="student_id" HeaderText="ID" ReadOnly="True" /> 
                        <asp:BoundField DataField="first_name" HeaderText="First Name" />
                        <asp:BoundField DataField="last_name" HeaderText="Last Name" />
                        <asp:BoundField DataField="gender" HeaderText="Gender" />
                        <asp:BoundField DataField="level" HeaderText="Level" />
                        <asp:BoundField DataField="section" HeaderText="Section" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>