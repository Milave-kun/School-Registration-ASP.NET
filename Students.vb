Imports System.Data.SqlClient

Public Class Students
    Public Function GetStudents(level As String, Optional searchTerm As String = "", Optional filterBy As String = "") As DataTable
        Dim db As New Connection()
        Dim query As String = "SELECT * FROM students WHERE level = @Level"

        If Not String.IsNullOrEmpty(searchTerm) Then
            query &= " AND (first_name LIKE @Search OR last_name LIKE @Search)"
        End If

        If Not String.IsNullOrEmpty(filterBy) Then
            Select Case filterBy
                Case "SectionA"
                    query &= " AND section = 'A'"
                Case "SectionB"
                    query &= " AND section = 'B'"
                Case "Male"
                    query &= " AND gender = 'Male'"
                Case "Female"
                    query &= " AND gender = 'Female'"
            End Select
        End If

        Using conn As SqlConnection = db.GetConnection(),
              cmd As New SqlCommand(query, conn),
              dt As New DataTable()

            cmd.Parameters.AddWithValue("@Level", level)
            If Not String.IsNullOrEmpty(searchTerm) Then
                cmd.Parameters.AddWithValue("@Search", "%" & searchTerm & "%")
            End If

            conn.Open()
            Using adapter As New SqlDataAdapter(cmd)
                adapter.Fill(dt)
            End Using
            Return dt
        End Using
    End Function

    Public Sub UpdateStudent(student_id As Integer, firstName As String, lastName As String, gender As String, level As String, section As String)
        Dim db As New Connection()
        Dim query As String = "UPDATE students SET first_name = @FirstName, last_name = @LastName, gender = @Gender, level = @Level, section = @Section WHERE student_id = @student_id"

        Using conn As SqlConnection = db.GetConnection(),
          cmd As New SqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@student_id", student_id) ' Use student_id here
            cmd.Parameters.AddWithValue("@FirstName", firstName)
            cmd.Parameters.AddWithValue("@LastName", lastName)
            cmd.Parameters.AddWithValue("@Gender", gender)
            cmd.Parameters.AddWithValue("@Level", level)
            cmd.Parameters.AddWithValue("@Section", section)

            conn.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Sub DeleteStudent(student_id As Integer)
        Dim db As New Connection()
        Dim query As String = "DELETE FROM students WHERE student_id = @student_id"

        Using conn As SqlConnection = db.GetConnection(),
          cmd As New SqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@student_id", student_id) ' Use student_id here
            conn.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub

End Class
