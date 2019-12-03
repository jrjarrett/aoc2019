defmodule Day01 do
  @moduledoc """
  Day One of Advent of Code 2018.
  """
  @external_resource "priv/day-1.txt"
  @input File.read!("priv/day-1.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(fn d -> String.to_integer(d) end)


  def fuel(mass) do
    trunc(Float.floor(mass / 3)) - 2
  end

  def totalFuel do
    @input
    |> Enum.reduce(0, fn element, accumulator -> fuel(element) + accumulator end)
  end
  @doc """
  We split the cases at 6 because 6 fuel requires no extra fuel.
  """
  def massFuel(amt) when amt <= 6 do
    0
  end

  def massFuel(amt) when amt > 6 do
    fuel(amt) + massFuel(fuel(amt))
  end

  def totalMassFuel do
    @input
    |> Enum.map(fn m -> massFuel(m) end)
    |> Enum.sum
  end
end
