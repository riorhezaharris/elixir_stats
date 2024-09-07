defmodule ElixirStats do
  alias ElixirStats.CentralTendency.{Mean, Median}

  # def population_mean(nums), do: Mean.population_mean(nums)
  defdelegate population_mean(nums), to: Mean

  defdelegate sample_mean(nums), to: Mean

  defdelegate population_median(nums), to: Median
end
