defmodule Day03Test do
  use ExUnit.Case
  doctest Day03

  test "moving up from origin works" do
    result = Day03.expandWireSeg("U3", %{x: 0, y: 0})
    assert result[:segment] == [[0, 0], [0, 1], [0, 2], [0, 3]]
    assert result[:current_point] == %{x: 0, y: 3}
  end

  test "moving up from a point works" do
    result = Day03.expandWireSeg("U3", %{x: 5, y: 3})
    assert result[:segment] == [[5, 3], [5, 4], [5, 5], [5, 6]]
    assert result[:current_point] == %{x: 5, y: 6}
  end

  test "moving down from origin works" do
    result = Day03.expandWireSeg("D3", %{x: 0, y: 0})
    assert result[:segment] == [[0, 0], [0, -1], [0, -2], [0, -3]]
    assert result[:current_point] == %{x: 0, y: -3}
  end

  test "moving down from a point works" do
    result = Day03.expandWireSeg("D3", %{x: 5, y: 3})
    assert result[:segment] == [[5, 3], [5, 2], [5, 1], [5, 0]]
    assert result[:current_point] == %{x: 5, y: 0}
  end

  test "moving left from origin works" do
    result = Day03.expandWireSeg("L3", %{x: 0, y: 0})
    assert result[:segment] == [[0, 0], [-1, 0], [-2, 0], [-3, 0]]
    assert result[:current_point] == %{x: -3, y: 0}
  end

  test "moving left from a point works" do
    result = Day03.expandWireSeg("L3", %{x: 5, y: 3})
    assert result[:segment] == [[5, 3], [4, 3], [3, 3], [2, 3]]
    assert result[:current_point] == %{x: 2, y: 3}
  end

  test "moving right from origin works" do
    result = Day03.expandWireSeg("R3", %{x: 0, y: 0})
    assert result[:segment] == [[0, 0], [1, 0], [2, 0], [3, 0]]
    assert result[:current_point] == %{x: 3, y: 0}
  end

  test "moving right from a point works" do
    result = Day03.expandWireSeg("R3", %{x: 5, y: 3})
    assert result[:segment] == [[5, 3], [6, 3], [7, 3], [8, 3]]
    assert result[:current_point] == %{x: 8, y: 3}
  end
end