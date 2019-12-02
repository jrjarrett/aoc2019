 defmodule AOC do
    def fuel(mass) do
      trunc(Float.floor(mass/3)) -2
 	end

 	def totalFuel do
	 	 File.read!("day-1.txt")
	 	 |> String.split("\n")
	     |> Enum.map(fn (d) -> String.to_integer(d) end)
	     |> Enum.reduce(0, fn element, accumulator -> fuel(element) + accumulator end)
    end

 end