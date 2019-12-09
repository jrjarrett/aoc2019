defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  test "mass 12" do
    assert Day01.fuel(12) == 2
  end

  test "mass 14" do
    assert Day01.fuel(14) == 2
  end

  test "mass 1969" do
    assert Day01.fuel(1969) == 654
  end

  test "mass 100756" do
    assert Day01.fuel(100_756) == 33_583
  end

  @doc """
  This tests Day 1 part 1
  """
  test "part one answer" do
    assert Day01.total_fuel() == 3_375_962
  end

  test "mass 14 requires 2" do
    assert Day01.mass_fuel(14) == 2
  end

  test "mass 1969 requires 966" do
    assert Day01.mass_fuel(1969) == 966
  end

  test "mass 100756 requires 50346" do
    assert Day01.mass_fuel(100_756) == 50_346
  end

  test "mass 50811 requires 25377" do
    assert Day01.mass_fuel(50_811) == 25_377
  end

  @doc """
  This tests Day 1 part 2
  """
  test "part two answer" do
    assert Day01.total_mass_fuel() == 5_061_072
  end
end
