Public Class StudentRegistration1
    Inherits System.Web.UI.Page

    ' Declare controls with WithEvents for handling events
    Protected WithEvents txtFirstName As TextBox
    Protected WithEvents txtLastName As TextBox
    Protected WithEvents ddlGender As DropDownList
    Protected WithEvents ddlLevel As DropDownList
    Protected WithEvents ddlSection As DropDownList
    Protected WithEvents btnRegister As Button
    Protected WithEvents lblMessage As Label

    Protected Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click
        Dim reg As New StudentRegistration()
        reg.AddStudent(txtFirstName.Text, txtLastName.Text, ddlGender.SelectedValue, ddlLevel.SelectedValue, ddlSection.SelectedValue)
        lblMessage.Text = "Student successfully registered!"
    End Sub
End Class
