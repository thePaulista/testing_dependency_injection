require 'set'

class Schedule
  def initialize
    @sections_total = []
    # @has_section =[]
  end

  def add(section)
    @sections_total << section
  end

  def has_section?(section)
   return true if @sections_total.include?(section)
  end

end
