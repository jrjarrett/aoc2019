defmodule Day04 do
  @moduledoc """
  Day Four of Advent of Code 2018.
  """

  def adjacent_digits?(s) do
    String.match?(s, ~r/(.)\1+/)
  end

  def increasing_digits?(s) do
    l = String.split(s, ~r/([0-9])/, include_captures: true, trim: true)

    Enum.zip(l, tl(l))
    |> Enum.all?(fn {a, b} -> String.to_integer(a) <= String.to_integer(b) end)
  end

  def is_password?(s) do
    adjacent_digits?(s) && increasing_digits?(s)
  end

  def day_4_part_1(start, finish) do
    Enum.map(start..finish, fn x -> Integer.to_string(x) end)
    |> Enum.map(fn p -> is_password?(p) end)
    |> Enum.filter(fn x -> x == true end)
    |> length
  end
end
