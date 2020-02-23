defmodule FlattenerTest do
  use ExUnit.Case
  doctest Flattener

  test "flattens a complex list" do
    assert Flattener.flatten([1, [2, 3], 4, [5, [6, 7]]], []) == [1, 2, 3, 4, 5, 6, 7]
  end

  test "flattens correctly with the provided example" do
    assert Flattener.flatten([[1, 2, [3]], 4], []) == [1, 2, 3, 4]
  end

  test "flattens correctly with deep nesting" do
    assert Flattener.flatten([0, [1, [2, [3, [4]]]]], []) == [0, 1, 2, 3, 4]
  end

  test "flattens correctly with simple lists" do
    assert Flattener.flatten([1], []) == [1]
  end

  test "treats a single integer as a list" do
    assert Flattener.flatten(1, []) == [1]
  end

  test "fails when given a list of characters" do
    assert Flattener.flatten(["a"], []) == []
  end

  test "fails when given a hash type" do
    assert Flattener.flatten(%{a: 1}, []) == []
  end

  test "fails when given a hash type inside a list" do
    assert Flattener.flatten([1, %{a: 1}], []) == []
  end
end
