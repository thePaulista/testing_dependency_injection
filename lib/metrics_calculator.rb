class MetricsCalculator

  def initialize
    @section_total = []
    @section_grade = []
  end

  def add(sections)
    @section_total << sections
  end

  def add_grade(grades)
    @section_grades << grades
  end

  def section_count
    @section_total.count
  end

  def total_students
    @section_total.map {|x| x.students_count}.inject(:+)
  end

  def average_grade
    students_array = @section_total.map {|x| x.students_count}
    grades_array =@section_total.map {|y| y.grade}
    combo_arrays = students_array.zip(grades_array)
    total_grade = combo_arrays.map {|x| x[0] * x[1]}.inject(:+) / total_students.to_f
    total_grade.round(1)
  end

end
