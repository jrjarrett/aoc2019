defmodule Day02 do
  @moduledoc """
  Day Two of Advent of Code 2018.
  """
  @external_resource "priv/day-2.txt"
  @input File.read!("priv/day-2.txt")
         |> String.trim()
         |> String.split(",", trim: true)
         |> Enum.map(&String.to_integer/1)

  @instructionSize 4

  def runProgram(input, programCounter) do
    [instruction | _memory] =
      Enum.chunk_every(Enum.drop(input, programCounter * @instructionSize), @instructionSize)

    [opcode | operation] = instruction

    case opcode do
      opcode when opcode != 99 ->
        runProgram(performOperation(input, opcode, operation), programCounter + 1)

      opcode when opcode == 99 ->
        input
    end
  end

  def performOperation(memory, opcode, operation) do
    [op1 | rest] = operation
    [op2 | rest] = rest
    [memloc | _rest] = rest
    List.replace_at(memory, memloc, operation(opcode, Enum.at(memory, op1), Enum.at(memory, op2)))
  end

  def operation(opcode, operand1, operand2) when opcode == 1 do
    operand1 + operand2
  end

  def operation(opcode, operand1, operand2) when opcode == 2 do
    operand1 * operand2
  end

  def runDay2 do
    gravAssist = List.replace_at(@input, 1, 12)
    gravAssist = List.replace_at(gravAssist, 2, 2)
    runProgram(gravAssist, 0)
  end

  def runDay2Part2 do
    moonLandingDate = List.replace_at(List.replace_at(@input, 1, 56), 2, 96)
    runProgram(moonLandingDate, 0)
  end
end
