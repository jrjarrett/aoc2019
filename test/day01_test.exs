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

  test "part one answer" do
    assert Day01.totalFuel() == 3_375_962
  end

  test "mass 14 requires 2" do
    assert Day01.massFuel(14) == 2
  end

  test "mass 1969 requires 966" do
    assert Day01.massFuel(1969) == 966
  end

  test "mass 100756 requires 50346" do
    assert Day01.massFuel(100_756) == 50346
  end
end
