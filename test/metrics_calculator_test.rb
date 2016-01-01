require './test/test_helper'
require './lib/metrics_calculator'
require './lib/section'

class MetricsCalculatorTest < Minitest::Test
  def test_it_exists
    MetricsCalculator
  end

  def test_it_loads_sections
    calc = MetricsCalculator.new
    sec_1 = Section.new("Biology 1")
    sec_2 = Section.new("Biology 2")
    sec_3 = Section.new("Biology 3")

    calc.add(sec_1)
    calc.add(sec_2)
    calc.add(sec_3)
    assert_equal 3, calc.section_count
  end

  def test_it_finds_a_total_number_of_students
    calc = MetricsCalculator.new
    sec_1 = Section.new("Biology 1")
    sec_2 = Section.new("Biology 2")
    sec_3 = Section.new("Biology 3")
    calc.add(sec_1)
    calc.add(sec_2)
    calc.add(sec_3)
    # sec 1 should have 22 students
    sec_1.stubs(:students_count).returns(22)
    # sec 2 should have 24 students
    sec_2.stubs(:students_count).returns(24)
    # sec 3 should have 18 students
    sec_3.stubs(:students_count).returns(18)
    assert_equal 64, calc.total_students
  end

  def test_it_calculates_an_average_grade
    calc = MetricsCalculator.new
    sec_1 = Section.new("Biology 1")
    sec_2 = Section.new("Biology 2")
    sec_3 = Section.new("Biology 3")
    # grade_1 = mock('grade')
    # grade_2 = mock('grade')
    # grade_3 = mock('grade')
    # calc.add_grade

    calc.add(sec_1)
    calc.add(sec_2)
    calc.add(sec_3)

    sec_1.stubs(:students_count).returns(4)
    sec_1.stubs(:grade).returns(82)
    sec_2.stubs(:students_count).returns(5)
    sec_2.stubs(:grade).returns(86)
    sec_3.stubs(:students_count).returns(6)
    sec_3.stubs(:grade).returns(90)
# binding.pry
    assert_equal 86.5, calc.average_grade
  end
end
