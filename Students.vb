Imports System.Data.SqlClient

Public Class Students
    Public Function GetStudents(level As String, Optional searchTerm As String = "", Optional sectionFilter As String = "", Optional genderFilter As String = "", Optional gradeFilter As String = "") As DataTable
        Dim db As New Connection()
        Dim query As String = "SELECT * FROM students WHERE 1=1"

        ' Apply level-based filtering
        If level = "College" Then
            query &= " AND level IN ('1st Year College', '2nd Year College', '3rd Year College', '4th Year College')"
        ElseIf level = "SHS" Then
            query &= " AND level IN ('Grade 11', 'Grade 12')"
        End If

        ' Apply search filter if needed
        If Not String.IsNullOrEmpty(searchTerm) Then
            query &= " AND (first_name LIKE @Search OR last_name LIKE @Search)"
        End If

        ' Apply section filter if needed
        If Not String.IsNullOrEmpty(sectionFilter) Then
            query &= " AND section = @Section"
        End If

        ' Apply gender filter if needed
        If Not String.IsNullOrEmpty(genderFilter) Then
            query &= " AND gender = @Gender"
        End If

        ' Apply grade filter if needed
        If Not String.IsNullOrEmpty(gradeFilter) Then
            query &= " AND level = @Grade"
        End If

        Using conn As SqlConnection = db.GetConnection(),
          cmd As New SqlCommand(query, conn),
          dt As New DataTable()

            ' Add parameters for the filters
            cmd.Parameters.AddWithValue("@Search", "%" & searchTerm & "%")

            If Not String.IsNullOrEmpty(sectionFilter) Then
                cmd.Parameters.AddWithValue("@Section", sectionFilter)
            End If

            If Not String.IsNullOrEmpty(genderFilter) Then
                cmd.Parameters.AddWithValue("@Gender", genderFilter)
            End If

            If Not String.IsNullOrEmpty(gradeFilter) Then
                cmd.Parameters.AddWithValue("@Grade", gradeFilter)
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
