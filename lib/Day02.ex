defmodule Day02 do
  @moduledoc """
  Day Two of Advent of Code 2018.
  """
  @external_resource "priv/day-2.txt"
  @input File.read!("priv/day-2.txt")
     |> String.trim
     |> String.split(",", trim: true)
     |> Enum.map(&String.to_integer/1)


  def foo(input) do
    counter = 0
    [pc | memory] = Enum.chunk_every(Enum.drop(input,counter*4),4)
    [opcode | rest] = pc
    [op1 | rest] = rest
    [op2 | rest] = rest
    [memloc | rest] = rest
    List.replace_at(input, memloc, Enum.at(input,op1) + Enum.at(input, op2))
  end
  
  def foo1 do 
    foo(@input)
  end

end
