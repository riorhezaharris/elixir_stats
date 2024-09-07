defmodule ElixirStats.CentralTendency.Mean do

  alias ElixirStats.{Errors, Validators}

  def population_mean([]), do: Errors.invalid_data_type()

  def population_mean(nums) when is_list(nums) do
    nums
    |> Validators.validate_num_list()
    |> calculate_population_mean()
  end

  def population_mean(_), do: Errors.invalid_data_type()

  def sample_mean(nums), do: population_mean(nums)

  defp calculate_population_mean({false, _}), do: Errors.invalid_data_type()

  defp calculate_population_mean({true, nums}) do
    Enum.sum(nums) |> mean(Enum.count(nums))
  end

  defp mean(sigma, count), do: sigma/count
end
