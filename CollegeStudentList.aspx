<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CollegeStudentList.aspx.vb" Inherits="School_Registration_ASP.NET.CollegeStudentList" %>

<!DOCTYPE html>
<html>
<head>
    <title>College Student List</title>
    <style>
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
        .content {
            margin-left: 220px;
            padding: 20px;
        }
        .search-box {
            margin-bottom: 20px;
        }
        .filter-box {
            margin-bottom: 20px;
        }
        .grid-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <a href="Dashboard.aspx">Dashboard</a>
            <a href="StudentRegistration.aspx">Register Student</a>
            <a href="SHSStudentList.aspx">SHS Students</a>
            <a href="CollegeStudentList.aspx">College Students</a>
        </div>
        
        <div class="content">
            <h2>College Student List</h2>
            
            <div class="search-box">
                <asp:TextBox ID="txtSearch" runat="server" placeholder="Search by name..."></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            </div>
            
            <div class="filter-box">
                <asp:DropDownList ID="ddlFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
                    <asp:ListItem Value="">All</asp:ListItem>
                    <asp:ListItem Value="SectionA">Section A</asp:ListItem>
                    <asp:ListItem Value="SectionB">Section B</asp:ListItem>
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:DropDownList>
            </div>
            
            <div class="grid-container">
                <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" 
                    OnRowEditing="gvStudents_RowEditing" OnRowUpdating="gvStudents_RowUpdating"
                    OnRowCancelingEdit="gvStudents_RowCancelingEdit" OnRowDeleting="gvStudents_RowDeleting"
                    DataKeyNames="student_id">
                    <Columns>
                        <asp:BoundField DataField="student_id" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="first_name" HeaderText="First Name" />
                        <asp:BoundField DataField="last_name" HeaderText="Last Name" />
                        <asp:BoundField DataField="gender" HeaderText="Gender" />
                        <asp:BoundField DataField="section" HeaderText="Section" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>