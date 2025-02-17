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
        ' Check if any field is empty
        If String.IsNullOrWhiteSpace(txtFirstName.Text) OrElse
       String.IsNullOrWhiteSpace(txtLastName.Text) OrElse
       ddlGender.SelectedIndex = -1 OrElse
       ddlLevel.SelectedIndex = -1 OrElse
       ddlSection.SelectedIndex = -1 Then

            lblMessage.ForeColor = System.Drawing.Color.Red
            lblMessage.Text = "All fields are required!"
            Exit Sub
        End If

        ' Proceed with registration if validation passes
        Dim reg As New StudentRegistration()
        reg.AddStudent(txtFirstName.Text, txtLastName.Text, ddlGender.SelectedValue, ddlLevel.SelectedValue, ddlSection.SelectedValue)

        ' Display success message
        lblMessage.ForeColor = System.Drawing.Color.Green
        lblMessage.Text = "Student successfully registered!"

        ' Clear the fields after registration
        ClearFields()
    End Sub

    ' Method to clear input fields
    Private Sub ClearFields()
        txtFirstName.Text = ""
        txtLastName.Text = ""
        ddlGender.SelectedIndex = 0
        ddlLevel.SelectedIndex = 0
        ddlSection.SelectedIndex = 0
    End Sub

End Class
