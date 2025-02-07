Public Class Dashboard1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim dash As New Dashboard()
            Dim stats = dash.GetStatistics()
            lblTotalStudents.Text = stats("TotalStudents").ToString()
            lblCollegeStudents.Text = stats("CollegeStudents").ToString()
            lblSHSStudents.Text = stats("SHSStudents").ToString()
            lblMaleStudents.Text = stats("MaleStudents").ToString()
            lblFemaleStudents.Text = stats("FemaleStudents").ToString()
            lblSectionA.Text = stats("SectionA").ToString()
            lblSectionB.Text = stats("SectionB").ToString()
        End If
    End Sub
End Class
