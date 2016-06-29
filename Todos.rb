class Todos

  attr_accessor :title, :due_date

  @@todos = []

  def initialize (title, date = Date.today)
    # @@todos = []
    @title = title

    if date.is_a? Date
      @due_date = date
    elsif date.is_a? String
      @due_date = Date.parse(date)
    else
      raise ArgumentError, "Please enter a real date. eg. 2001-02-06"
    end

    @@todos << self

  end

  def self.clear
    @@todos = []
  end

  def self.all
    @@todos
  end

  def self.last
    @@todos.last
  end

  def self.find(keyword)

    result_array = []

    if keyword[:contain]
      @@todos.each do |todo|

        result_array << todo if todo.title.include? keyword[:contain]

      end
      return result_array

    elsif keyword[:exact]
      @@todos.each do |todo|

        return todo if todo.title == keyword[:exact]

      end
    end


  end

end
