defmodule Day04Test do
  use ExUnit.Case
  doctest Day04

  test "111111 has at least 2 adjacent digits the same" do
    assert Day04.adjacent_digits?("111111") == true
  end

  test "111111 digits  never decrease" do
    assert Day04.increasing_digits?("111111") == true
  end

  test "223450 has at least 2 adjacent digits the same" do
    assert Day04.adjacent_digits?("223450") == true
  end

  test "223450 digits decrease" do
    assert Day04.increasing_digits?("223450") == false
  end

  test "123789 fails because no adjacent digits" do
    assert Day04.adjacent_digits?("123789") == false
  end

  test "123789 digits are all increasing" do
    assert Day04.increasing_digits?("123789") == true
  end

  # Day 4 part 1 tests

  test "111111 is a possible password" do
    assert Day04.is_password?("111111") == true
  end

  test "223450 is not a possible password" do
    assert Day04.is_password?("223450") == false
  end

  test "123789 is not a possible password" do
    assert Day04.is_password?("123789") == false
  end

  # Day 4 Part 1
  test "A partial range gives an answer" do
    assert Day04.day_4_part_1(246_540, 246_900) == 18
  end
end
