class Section
  attr_reader :name

  def initialize(subject)
    @name = subject
    @student_roll = []
  end

  def enroll(student)
    return @student_roll << student
  end

  def students
    @student_roll
  end

  def student_names
    @student_roll.map {|x| x.first_name}
  end

end
