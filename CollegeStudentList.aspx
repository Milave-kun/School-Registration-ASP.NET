<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CollegeStudentList.aspx.vb" Inherits="School_Registration_ASP.NET.CollegeStudentList" %>

<!DOCTYPE html>
<html>
<head>
    <title>College Student List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
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
            margin-left: 250px;
            padding: 30px;
            background-color: maroon;
            min-height: 100vh;
            color: white;
        }

        /* Table and form styling */
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

        /* Responsive adjustments */
        @media (max-width: 991px) {
            .sidebar {
                width: 200px;
            }
            .main-content {
                margin-left: 200px;
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
            .sidebar {
                width: 100%;
                position: relative;
            }
            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
            <h2 class="fw-bold text-center h1">College Student List</h2>
            
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

                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-warning btn-sm"
                                    CommandName="Edit" />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm"
                                    CommandName="Delete" OnClientClick="return confirmDelete();" />
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success btn-sm"
                                    CommandName="Update" OnClientClick="return confirmUpdate();" />
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary btn-sm"
                                    CommandName="Cancel" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        function confirmUpdate() {
            return confirm("Are you sure you want to update this student?");
        }

        function confirmDelete() {
            return confirm("Are you sure you want to delete this student?");
        }
    </script>
</body>
</html>
