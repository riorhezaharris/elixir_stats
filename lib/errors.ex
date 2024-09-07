defmodule ElixirStats.Errors do

  @spec invalid_data_type() :: {:error, <<_::104>>}
  def invalid_data_type(), do: {:error, "Invalid input"}
end
