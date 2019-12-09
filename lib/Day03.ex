defmodule Day03 do
  @external_resource "priv/day-3.txt"
  @input File.read!("priv/day-3.txt")
         |> String.split("\n", trim: true)
         |> Enum.map(fn x -> String.split(x, ",", trim: true) end)

  def expandWireSeg(s, current_point) do
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
end
