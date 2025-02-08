Public Class Dashboard1
    Inherits System.Web.UI.Page

    Public Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Fetch and bind the data to the Repeater for recent registrations
            Dim dash As New Dashboard()

            ' Fetch statistics and bind to labels in the dashboard boxes
            Dim stats = dash.GetStatistics()

            lblTotalStudents.Text = stats("TotalStudents").ToString()
            lblCollegeStudents.Text = stats("CollegeStudents").ToString()
            lblSHSStudents.Text = stats("SHSStudents").ToString()
            lblMaleStudents.Text = stats("MaleStudents").ToString()
            lblFemaleStudents.Text = stats("FemaleStudents").ToString()
        End If
    End Sub

End Class
