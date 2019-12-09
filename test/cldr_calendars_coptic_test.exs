defmodule Cldr.Calendar.CopticTest do
  use ExUnit.Case

  doctest Cldr.Calendar.Coptic

  test "day of week" do
    {:ok, gregorian_date} = Date.new(2019,12,9, Cldr.Calendar.Gregorian)
    {:ok, persian_date} = Date.convert(gregorian_date, Cldr.Calendar.Coptic)
    assert Cldr.Calendar.day_of_week(persian_date) == 1
  end

end
