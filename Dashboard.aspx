<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Dashboard.aspx.vb" Inherits="School_Registration_ASP.NET.Dashboard1" %>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            margin-left: 250px;
            padding: 20px;
            background-color: maroon;
            min-height: 100vh;
            color: white;
        }

        /* Dashboard grid layout */
        .dashboard-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-top: 20px;
        }

        /* Dashboard box styling */
        .dashboard-box {
            background: white;
            color: black;
            border-radius: 15px;
            padding: 15px;
            text-align: center;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.1);
            font-size: 18px;
            font-weight: bold;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 120px;
        }
        .dashboard-box:hover {
            transform: translateY(-5px);
            box-shadow: 8px 8px 20px rgba(0, 0, 0, 0.2);
        }

        /* Icon styling */
        .dashboard-box i {
            font-size: 30px;
            margin-bottom: 10px;
            transition: transform 0.3s ease-in-out;
        }
        .dashboard-box:hover i {
            transform: rotate(360deg);
        }

        /* Label styling inside boxes */
        .dashboard-box span {
            font-size: 24px;
            display: block;
            font-weight: bold;
            margin-top: 5px;
        }

        /* Chart container styling */
        .chart-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 30px;
            padding: 0 10px;
        }

        .chart-wrapper {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out, box-shadow 0.3s;
            aspect-ratio: 16/9;
            width: 100%;
            height: auto;
            min-height: 300px;
        }

        .chart-wrapper:hover {
            transform: translateY(-5px);
            box-shadow: 8px 8px 20px rgba(0, 0, 0, 0.2);
        }

        .chart-wrapper canvas {
            width: 100% !important;
            height: 100% !important;
        }

        /* Responsive adjustments */
        @media (max-width: 991px) {
            .sidebar {
                width: 200px;
            }
            .main-content {
                margin-left: 200px;
            }
            .dashboard-box {
                font-size: 16px;
            }
            .dashboard-box span {
                font-size: 20px;
            }
            .sidebar a {
                padding: 12px 15px;
                font-size: 14px;
            }
            .sidebar a i {
                font-size: 18px;
                width: 25px;
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
            .chart-wrapper {
                min-height: 250px;
            }
            .dashboard-container {
                grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            }
        }

        @media (max-width: 576px) {
            .chart-container {
                grid-template-columns: 1fr;
            }
            .dashboard-box {
                min-height: 100px;
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
        <h1 class="fw-bold text-center h1 mb-4">School Registration Dashboard</h1>
        
        <!-- Dashboard Boxes -->
        <div class="dashboard-container">
            <div class="dashboard-box">
                <i class="fas fa-users" style="color: #ff5733;"></i>
                Total Students
                <span><asp:Label ID="lblTotalStudents" runat="server"></asp:Label></span>
            </div>
            <div class="dashboard-box">
                <i class="fas fa-school" style="color: #33c3ff;"></i>
                College Students
                <span><asp:Label ID="lblCollegeStudents" runat="server"></asp:Label></span>
            </div>
            <div class="dashboard-box">
                <i class="fas fa-graduation-cap" style="color: #28a745;"></i>
                SHS Students
                <span><asp:Label ID="lblSHSStudents" runat="server"></asp:Label></span>
            </div>
            <div class="dashboard-box">
                <i class="fas fa-male" style="color: #d63384;"></i>
                Male Students
                <span><asp:Label ID="lblMaleStudents" runat="server"></asp:Label></span>
            </div>
            <div class="dashboard-box">
                <i class="fas fa-female" style="color: #d63384;"></i>
                Female Students
                <span><asp:Label ID="lblFemaleStudents" runat="server"></asp:Label></span>
            </div>
        </div>

        <!-- Charts -->
        <div class="chart-container">
            <div class="chart-wrapper">
                <canvas id="barChart"></canvas>
            </div>
            <div class="chart-wrapper">
                <canvas id="pieChart"></canvas>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Fetch data from the server
        var totalStudents = <%= lblTotalStudents.Text %>;
        var collegeStudents = <%= lblCollegeStudents.Text %>;
        var shsStudents = <%= lblSHSStudents.Text %>;
        var maleStudents = <%= lblMaleStudents.Text %>;
        var femaleStudents = <%= lblFemaleStudents.Text %>;

        const pieCtx = document.getElementById('pieChart').getContext('2d');
        const barCtx = document.getElementById('barChart').getContext('2d');

        // Bar Chart Configuration
        const barChart = new Chart(barCtx, {
            type: 'bar',
            data: {
                labels: ['Total Students', 'College Students', 'SHS Students', 'Male Students', 'Female Students'],
                datasets: [{
                    label: 'Number of Students',
                    data: [totalStudents, collegeStudents, shsStudents, maleStudents, femaleStudents],
                    backgroundColor: ['#ff5733', '#33c3ff', '#28a745', '#d63384', '#d63384'],
                    borderColor: ['#ff5733', '#33c3ff', '#28a745', '#d63384', '#d63384'],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            color: 'black',
                            font: { size: 12 }
                        },
                        grid: {
                            color: 'rgba(0, 0, 0, 0.1)'
                        }
                    },
                    x: {
                        ticks: {
                            color: 'black',
                            font: { size: 12 }
                        },
                        grid: {
                            color: 'rgba(0, 0, 0, 0.1)'
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: false
                    }
                }
            }
        });

        // Pie Chart Configuration
        const pieChart = new Chart(pieCtx, {
            type: 'pie',
            data: {
                labels: ['College Students', 'SHS Students', 'Male Students', 'Female Students'],
                datasets: [{
                    data: [collegeStudents, shsStudents, maleStudents, femaleStudents],
                    backgroundColor: ['#ff5733', '#33c3ff', '#28a745', '#d63384'],
                    borderColor: ['#ff5733', '#33c3ff', '#28a745', '#d63384'],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'right',
                        labels: {
                            color: 'black',
                            font: { size: 12 }
                        }
                    }
                }
            }
        });
    </script>
</body>
</html>