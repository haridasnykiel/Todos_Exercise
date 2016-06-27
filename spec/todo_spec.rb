require "spec_helper"

describe "Todos class" do

  it "Should create an object of Todos" do

    todo = Todos.new("Get some Milk", Date.parse("1992-02-01"))

    expect(todo.title).to eq "Get some Milk"
    expect(todo.due_date).to eq Date.parse("1992-02-01")

  end

end
