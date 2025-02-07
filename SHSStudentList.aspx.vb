Public Class SHSStudentList
    Inherits System.Web.UI.Page

    Private students As New Students()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindGrid()
        End If
    End Sub

    Private Sub BindGrid()
        gvStudents.DataSource = students.GetStudents("SHS", txtSearch.Text, ddlFilter.SelectedValue)
        gvStudents.DataBind()
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs)
        BindGrid()
    End Sub

    Protected Sub ddlFilter_SelectedIndexChanged(sender As Object, e As EventArgs)
        BindGrid()
    End Sub

    Protected Sub gvStudents_RowEditing(sender As Object, e As GridViewEditEventArgs)
        gvStudents.EditIndex = e.NewEditIndex
        BindGrid()
    End Sub

    Protected Sub gvStudents_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim student_id As Integer = Convert.ToInt32(gvStudents.DataKeys(e.RowIndex).Value)
        Dim firstName As String = DirectCast(gvStudents.Rows(e.RowIndex).Cells(1).Controls(0), TextBox).Text
        Dim lastName As String = DirectCast(gvStudents.Rows(e.RowIndex).Cells(2).Controls(0), TextBox).Text
        Dim gender As String = DirectCast(gvStudents.Rows(e.RowIndex).Cells(3).Controls(0), TextBox).Text
        Dim section As String = DirectCast(gvStudents.Rows(e.RowIndex).Cells(4).Controls(0), TextBox).Text

        students.UpdateStudent(student_id, firstName, lastName, gender, "SHS", section) ' Passing student_id

        gvStudents.EditIndex = -1
        BindGrid()
    End Sub

    Protected Sub gvStudents_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        gvStudents.EditIndex = -1
        BindGrid()
    End Sub

    Protected Sub gvStudents_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim student_id As Integer = Convert.ToInt32(gvStudents.DataKeys(e.RowIndex).Value)
        students.DeleteStudent(student_id) ' Passing student_id
        BindGrid()
    End Sub
End Class