defmodule ElixirStats.CentralTendency.Mean do

  def population_mean([]), do: {:error, "Invalid input"}

  def population_mean(nums) when is_list(nums) do
    nums
    |> validate_num_list()
    |> calculate_population_mean()
  end

  @spec validate_num_list(any()) :: {false, any()} | {true, any()}
  def validate_num_list(nums) do
    {Enum.all?(nums, fn x -> is_number(x) end), nums}
  end

  @spec calculate_population_mean({false, any()} | {true, any()}) ::
          float() | {:error, <<_::104>>}
  def calculate_population_mean({false, _}), do: {:error, "Invalid input"}

  def calculate_population_mean({true, nums}) do
    Enum.sum(nums) |> mean(Enum.count(nums))
  end

  @spec mean(number(), number()) :: float()
  def mean(sigma, count), do: sigma/count
end
