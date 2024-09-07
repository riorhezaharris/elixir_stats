defmodule ElixirStats.Validators do
  alias ElixirStats.Errors

  @spec validate_num_list(maybe_improper_list()) ::
          {false, maybe_improper_list()} | {true, maybe_improper_list()}
  def validate_num_list(nums) when is_list(nums) do
    {Enum.all?(nums, fn x -> is_number(x) end), nums}
  end

  def validate_num_list(_), do: Errors.invalid_data_type()

end
