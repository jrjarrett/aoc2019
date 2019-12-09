defmodule Day02Test do
  use ExUnit.Case
  doctest Day02

  test "addition works" do
    assert Day02.operation(1, 5, 4) == 9
  end

  test "multiplication works" do
    assert Day02.operation(2, 5, 4) == 20
  end

  # test "foo works?" do
  #   input = [1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50]
  #   assert Day02.foo(input) == [1, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50]
  # end

  test "perform_operation works" do
    input = [1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50]
    expected = [1, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50]

    assert Day02.perform_operation(input, 1, [9, 10, 3]) == expected
  end

  test "test program 1" do
    input = [1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50]
    expected = [3500, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50]
    assert Day02.run_program(input, 0) == expected
  end

  test "test program 2" do
    input = [1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50]
    expected = [3500, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50]
    assert Day02.run_program(input, 0) == expected
  end

  test "test program 3" do
    input = [1, 0, 0, 0, 99]
    expected = [2, 0, 0, 0, 99]
    assert Day02.run_program(input, 0) == expected
  end

  test "test program 4" do
    input = [2, 3, 0, 3, 99]
    expected = [2, 3, 0, 6, 99]
    assert Day02.run_program(input, 0) == expected
  end

  test "test program 5" do
    input = [1, 1, 1, 4, 99, 5, 6, 0, 99]
    expected = [30, 1, 1, 4, 2, 5, 6, 0, 99]
    assert Day02.run_program(input, 0) == expected
  end

  test "Day 2 Part 1" do
    assert Enum.at(Day02.run_day_2(), 0) == 4_484_226
  end

  test "Day 2 Part 2" do
    assert Enum.at(Day02.run_day_2_part_2(), 0) == 19_690_720
    assert 100 * 56 + 96 == 5696
  end
end
