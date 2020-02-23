defmodule Flattener do
  @moduledoc "An implementation of a list flattener"

  @doc "Flatten a list"
  def flatten(list), do: flatten(list, [])

  defp flatten([first | rest] = args, list) do
    flattened = flatten(first, list)
    flatten(rest, flattened)
  end

  defp flatten([], list), do: list

  defp flatten(single, list) when is_integer(single), do: list ++ [single]

  defp flatten(_, list), do: []
end
