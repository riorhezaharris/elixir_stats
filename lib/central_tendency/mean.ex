defmodule ElixirStats.CentralTendency.Mean do

  alias ElixirStats.{Errors, Validators}

  def population_mean([]), do: Errors.invalid_data_type()

  def population_mean(nums) when is_list(nums) do
    nums
    |> Validators.validate_num_list()
    |> calculate_population_mean()
  end

  def population_mean(_), do: Errors.invalid_data_type()

  @spec calculate_population_mean({false, any()} | {true, any()}) ::
          float() | {:error, <<_::104>>}
  def calculate_population_mean({false, _}), do: Errors.invalid_data_type()

  def calculate_population_mean({true, nums}) do
    Enum.sum(nums) |> mean(Enum.count(nums))
  end

  @spec mean(number(), number()) :: float()
  def mean(sigma, count), do: sigma/count
end
