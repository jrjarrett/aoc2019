defmodule Day03Test do
  use ExUnit.Case
  doctest Day03

  test "moving up from origin works" do
    result = Day03.expand_wire_seg("U3", %{x: 0, y: 0})
    assert result[:segment] == [[0, 0], [0, 1], [0, 2], [0, 3]]
    assert result[:current_point] == %{x: 0, y: 3}
  end

  test "moving up from a point works" do
    result = Day03.expand_wire_seg("U3", %{x: 5, y: 3})
    assert result[:segment] == [[5, 3], [5, 4], [5, 5], [5, 6]]
    assert result[:current_point] == %{x: 5, y: 6}
  end

  test "moving down from origin works" do
    result = Day03.expand_wire_seg("D3", %{x: 0, y: 0})
    assert result[:segment] == [[0, 0], [0, -1], [0, -2], [0, -3]]
    assert result[:current_point] == %{x: 0, y: -3}
  end

  test "moving down from a point works" do
    result = Day03.expand_wire_seg("D3", %{x: 5, y: 3})
    assert result[:segment] == [[5, 3], [5, 2], [5, 1], [5, 0]]
    assert result[:current_point] == %{x: 5, y: 0}
  end

  test "moving left from origin works" do
    result = Day03.expand_wire_seg("L3", %{x: 0, y: 0})
    assert result[:segment] == [[0, 0], [-1, 0], [-2, 0], [-3, 0]]
    assert result[:current_point] == %{x: -3, y: 0}
  end

  test "moving left from a point works" do
    result = Day03.expand_wire_seg("L3", %{x: 5, y: 3})
    assert result[:segment] == [[5, 3], [4, 3], [3, 3], [2, 3]]
    assert result[:current_point] == %{x: 2, y: 3}
  end

  test "moving right from origin works" do
    result = Day03.expand_wire_seg("R3", %{x: 0, y: 0})
    assert result[:segment] == [[0, 0], [1, 0], [2, 0], [3, 0]]
    assert result[:current_point] == %{x: 3, y: 0}
  end

  test "moving right from a point works" do
    result = Day03.expand_wire_seg("R3", %{x: 5, y: 3})
    assert result[:segment] == [[5, 3], [6, 3], [7, 3], [8, 3]]
    assert result[:current_point] == %{x: 8, y: 3}
  end

  # Tests for buildiing up one length of wire

  test "example from AoC page works right" do
    wire_seg =
      "R8,U5,L5,D3"
      |> String.split("\n", trim: true)
      |> Enum.map(fn x -> String.split(x, ",", trim: true) end)

    ms = MapSet.new()
    origin = %{x: 0, y: 0}

    expected =
      MapSet.new([
        [0, 0],
        [1, 0],
        [2, 0],
        [3, 0],
        [3, 2],
        [3, 3],
        [3, 4],
        [3, 5],
        [4, 0],
        [4, 5],
        [5, 0],
        [5, 5],
        [6, 0],
        [6, 5],
        [7, 0],
        [7, 5],
        [8, 0],
        [8, 1],
        [8, 2],
        [8, 3],
        [8, 4],
        [8, 5]
      ])

    assert Day03.generate_wire_segments(ms, hd(wire_seg), origin) == expected
  end

  test "manhattan distance example 1 from site" do
    wire_seg =
      "R8,U5,L5,D3
U7,R6,D4,L4"
      |> String.split("\n", trim: true)
      |> Enum.map(fn x -> String.split(x, ",", trim: true) end)

    assert Day03.calculate_manhattan_distance(wire_seg) == 6
  end

  test "manhattan distance example 2 from site" do
    wire_seg =
      "R75,D30,R83,U83,L12,D49,R71,U7,L72
U62,R66,U55,R34,D71,R55,D58,R83"
      |> String.split("\n", trim: true)
      |> Enum.map(fn x -> String.split(x, ",", trim: true) end)

    assert Day03.calculate_manhattan_distance(wire_seg) == 159
  end

  test "manhattan distance example 3 from site" do
    wire_seg =
      "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"
      |> String.split("\n", trim: true)
      |> Enum.map(fn x -> String.split(x, ",", trim: true) end)

    assert Day03.calculate_manhattan_distance(wire_seg) == 135
  end

  test "Day 3 part 1" do
    assert Day03.day3_part1() == 303
  end
end
