module StudentsHelper
  def student_grades(student)
    result = "<table>"
    student.grades.each do |grade|
      result <<"<p>Grade: #{grade.grade} Date of assignment: #{grade.date}</p>"
    end
    result << "</table>"
    result.html_safe
  end
end
