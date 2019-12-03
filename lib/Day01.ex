defmodule Day01 do
  @moduledoc """
  Day One of Advent of Code 2018.
  """
  @external_resource "priv/day-1.txt"
  @input File.read!("priv/day-1.txt")

  def fuel(mass) do
    trunc(Float.floor(mass / 3)) - 2
  end

  def totalFuel do
    @input
    |> String.split("\n", trim: true)
    |> Enum.map(fn d -> String.to_integer(d) end)
    |> Enum.reduce(0, fn element, accumulator -> fuel(element) + accumulator end)
  end

  def massFuel(amt) when amt <= 0 do
    0
  end

  def massFuel(amt) when amt > 0 do
    fuel(amt) + fuel(fuel(amt))
  end
end
