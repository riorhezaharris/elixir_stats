defmodule ElixirStats.CentralTendency.Median do
  require Integer
  alias ElixirStats.Validators
  alias ElixirStats.Errors

  def sample() do
    [10, 40, 20, 50, 30, 90, 70, 60, 80]
  end

  def population_median(nums) when is_list(nums) do
    nums |> Validators.validate_num_list() |> calc_median()
  end

  def population_median(_), do: Errors.invalid_data_type()

  # defp calc_median({:error, _msg}), do: Errors.invalid_data_type()
  defp calc_median({false, _}), do: Errors.invalid_data_type()
  defp calc_median({true, nums}) do
    count = Enum.count(nums)
    nums
    |> Enum.sort()
    |> get_median(Integer.is_even(count), count)
  end

  defp get_median(nums, false, count), do: Enum.at(nums, div(count, 2))
  defp get_median(nums, true, count) do
    a = Enum.at(nums, div(count - 1, 2))
    b = Enum.at(nums, div(count, 2))
    (a + b) / 2
  end
end
