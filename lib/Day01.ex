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

  def total_fuel do
    @input
    |> Enum.reduce(0, fn element, accumulator -> fuel(element) + accumulator end)
  end

  @doc """
  We split the cases at 6 because 6 fuel requires no extra fuel.
  """
  def mass_fuel(amt) when amt <= 6 do
    0
  end

  def mass_fuel(amt) when amt > 6 do
    fuel(amt) + mass_fuel(fuel(amt))
  end

  def total_mass_fuel do
    @input
    |> Enum.map(fn m -> mass_fuel(m) end)
    |> Enum.sum()
  end
end
