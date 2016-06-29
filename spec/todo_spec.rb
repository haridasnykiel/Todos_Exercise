require "spec_helper"
require 'pry'

describe "Todos class" do

  let(:todo1) {Todos.new("Get some Cookies", "1992-02-02")}
  let(:todo2)  {Todos.new("Get some Milk", "1992-03-01")}

  after :each do
    Todos.clear
  end

  it "Should create an object of Todos with title and due_date information." do
    # binding.pry
    todo1 = Todos.new("Get some Milk", "1992-02-01")
    # expect(todo1.title).to eq "Get some Milk"
    expect(todo1).to have_attributes(title: "Get some Milk", due_date: Date.parse("1992-02-01"))


  end

  it "Date should default to todays date." do

    # todo1 = Todos.new("Get some Milk")

    expect(Todos.new('Test')).to have_attributes(due_date: Date.today)
  end

  it "Date should be an object of Date, if not raise an error." do

    # todo = Todos.new("Get some Milk.", "Hello")
    expect{Todos.new("Get some Milk.", "Hello")}.to raise_error(ArgumentError)

  end

  it "Should be able to clear the todos array list." do
    todo1
    todo2
    Todos.clear

    expect(Todos.all).to be_empty
  end

  it "Should be able to list all the todo objects in an string format." do
    # Todos.clear
    # todo1 = Todos.new("Get some Cookies", "1992-02-02")
    # todo2 = Todos.new("Get some Milk", "1992-03-01")

    expect(Todos.all).to eq [todo1,todo2]

  end


  it "Should be able to see the latest todo object" do
    # Todos.clear
    todo1
    todo2


    expect(Todos.last).to eq (todo2)

  end

  it "Should be able to find todos by using a key word" do
    # Todos.clear
    todo1
    todo2

    # Todos.find contain: "Milk"

    expect(Todos.find contain: "Milk").to eq [todo2]
  end

  it "Should be able to find a todo by entering the exact title" do

    todo1
    todo2

    expect(Todos.find exact: "Get some Milk").to eq todo2

  end



end
