Imports System.Data.SqlClient

Public Class Connection
    Private connectionString As String = "Data Source=DESKTOP-PD9I1RP\SQLEXPRESS;Initial Catalog=school_db;Integrated Security=True;"

    Public Function GetConnection() As SqlConnection
        Return New SqlConnection(connectionString)
    End Function
End Class

Public Class StudentRegistration
    Public Sub AddStudent(firstName As String, lastName As String, gender As String, level As String, section As String)
        Dim db As New Connection()
        Dim query As String = "INSERT INTO students (first_name, last_name, gender, level, section) VALUES (@FirstName, @LastName, @Gender, @Level, @Section)"

        Using conn As SqlConnection = db.GetConnection(),
              cmd As New SqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@FirstName", firstName)
            cmd.Parameters.AddWithValue("@LastName", lastName)
            cmd.Parameters.AddWithValue("@Gender", gender)
            cmd.Parameters.AddWithValue("@Level", level)
            cmd.Parameters.AddWithValue("@Section", section)

            conn.Open()
            cmd.ExecuteNonQuery()
        End Using
    End Sub
End Class

Public Class Dashboard
    Public Function GetStatistics() As Dictionary(Of String, Integer)
        Dim stats As New Dictionary(Of String, Integer)()
        Dim db As New Connection()
        Dim query As String = "SELECT 
            (SELECT COUNT(*) FROM students) AS TotalStudents,
            (SELECT COUNT(*) FROM students WHERE level IN ('Grade 11', 'Grade 12')) AS SHSStudents,
            (SELECT COUNT(*) FROM students WHERE level IN ('1st Year College', '2nd Year College', '3rd Year College', '4th Year College')) AS CollegeStudents,
            (SELECT COUNT(*) FROM students WHERE gender = 'Male') AS MaleStudents,
            (SELECT COUNT(*) FROM students WHERE gender = 'Female') AS FemaleStudents,
            (SELECT COUNT(*) FROM students WHERE section = 'A') AS SectionA,
            (SELECT COUNT(*) FROM students WHERE section = 'B') AS SectionB"

        Using conn As SqlConnection = db.GetConnection(),
              cmd As New SqlCommand(query, conn)
            conn.Open()
            Using reader As SqlDataReader = cmd.ExecuteReader()
                If reader.Read() Then
                    stats("TotalStudents") = reader("TotalStudents")
                    stats("SHSStudents") = reader("SHSStudents") ' Now includes both Grade 11 and Grade 12
                    stats("CollegeStudents") = reader("CollegeStudents")
                    stats("MaleStudents") = reader("MaleStudents")
                    stats("FemaleStudents") = reader("FemaleStudents")
                    stats("SectionA") = reader("SectionA")
                    stats("SectionB") = reader("SectionB")
                End If
            End Using
        End Using
        Return stats
    End Function

End Class


