defmodule Day03 do
  @moduledoc """
  Day Three of Advent of Code 2018.
  """
  @external_resource "priv/day-3.txt"
  @input File.read!("priv/day-3.txt")
         |> String.split("\n", trim: true)
         |> Enum.map(fn x -> String.split(x, ",", trim: true) end)

  def expand_wire_seg(s, current_point) do
    [direction | length] = String.split(s, ~r/([A-Z])/, include_captures: true, trim: true)

    distance = String.to_integer(List.first(length))

    case direction do
      "U" ->
        %{
          segment:
            Enum.map(current_point[:y]..(current_point[:y] + distance), fn y ->
              [current_point[:x], y]
            end),
          current_point: %{x: current_point[:x], y: current_point[:y] + distance}
        }

      "D" ->
        %{
          segment:
            Enum.map(current_point[:y]..(current_point[:y] - distance), fn y ->
              [current_point[:x], y]
            end),
          current_point: %{x: current_point[:x], y: current_point[:y] - distance}
        }

      "L" ->
        %{
          segment:
            Enum.map(current_point[:x]..(current_point[:x] - distance), fn x ->
              [x, current_point[:y]]
            end),
          current_point: %{x: current_point[:x] - distance, y: current_point[:y]}
        }

      "R" ->
        %{
          segment:
            Enum.map(current_point[:x]..(current_point[:x] + distance), fn x ->
              [x, current_point[:y]]
            end),
          current_point: %{x: current_point[:x] + distance, y: current_point[:y]}
        }
    end
  end

  def manhattan_distance(x) do
    abs(0 - hd(x)) + abs(0 - hd(tl(x)))
  end

  def generate_wire_segments(a_map_set, a_list_of_seg_defs, the_current_point) do
    [seg_description | rest] = a_list_of_seg_defs

    result = expand_wire_seg(seg_description, the_current_point)

    a_map_set = MapSet.union(a_map_set, MapSet.new(result[:segment]))

    case rest do
      rest when rest != [] ->
        generate_wire_segments(a_map_set, rest, result[:current_point])

      rest when rest == [] ->
        a_map_set
    end
  end

  def find_intersections(input) do
    result = MapSet.new()
    origin = %{x: 0, y: 0}

    Enum.map(input, fn wire_segment -> generate_wire_segments(result, wire_segment, origin) end)
  end

  def calculate_manhattan_distance(input) do
    intersections = find_intersections(input)

    MapSet.intersection(hd(intersections), hd(tl(intersections)))
    |> Enum.map(fn x -> manhattan_distance(x) end)
    |> Enum.filter(fn x -> x != 0 end)
    |> Enum.reduce(fn
      x, acc when x < acc -> x
      x, acc when x >= acc -> acc
    end)
  end

  def day3_part1 do
    calculate_manhattan_distance(@input)
  end

  def get_day3_input do
    @input
  end
end
