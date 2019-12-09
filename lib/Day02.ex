defmodule Day02 do
  @moduledoc """
  Day Two of Advent of Code 2018.
  """
  @external_resource "priv/day-2.txt"
  @input File.read!("priv/day-2.txt")
         |> String.trim()
         |> String.split(",", trim: true)
         |> Enum.map(&String.to_integer/1)

  @instruction_size 4

  def run_program(input, program_counter) do
    [instruction | _memory] =
      Enum.chunk_every(Enum.drop(input, program_counter * @instruction_size), @instruction_size)

    [opcode | operation] = instruction

    case opcode do
      opcode when opcode != 99 ->
        run_program(perform_operation(input, opcode, operation), program_counter + 1)

      opcode when opcode == 99 ->
        input
    end
  end

  def perform_operation(memory, opcode, operation) do
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

  def run_day_2 do
    grav_assist = List.replace_at(@input, 1, 12)
    grav_assist = List.replace_at(grav_assist, 2, 2)
    run_program(grav_assist, 0)
  end

  def run_day_2_part_2 do
    moon_landing_date = List.replace_at(List.replace_at(@input, 1, 56), 2, 96)
    run_program(moon_landing_date, 0)
  end
end
