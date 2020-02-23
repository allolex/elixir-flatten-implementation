defmodule Flattener do
  @moduledoc "An implementation of a list flattener"

  @doc "Flatten a list"
  def flatten([first | rest] = args, list) do
    flattened = flatten(first, list)
    flatten(rest, flattened)
  end

  @doc "Handle no elements left"
  def flatten([], list), do: list

  @doc "Handle a single element"
  def flatten(single, list) when is_integer(single), do: list ++ [single]

  @doc "Handle bad data"
  def flatten(_, list), do: []
end
