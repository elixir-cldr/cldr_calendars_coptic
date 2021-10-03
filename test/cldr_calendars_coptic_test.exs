defmodule Cldr.Calendar.CopticTest do
  use ExUnit.Case

  doctest Cldr.Calendar.Coptic

  test "day of week" do
    {:ok, gregorian_date} = Date.new(2019,12,9, Cldr.Calendar.Gregorian)
    {:ok, coptic_date} = Date.convert(gregorian_date, Cldr.Calendar.Coptic)
    assert Cldr.Calendar.day_of_week(coptic_date) == Cldr.Calendar.day_of_week(gregorian_date)
  end

  test "beginning and end of week" do
    {:ok, coptic_date} = Date.new(2020, 07, 05, Cldr.Calendar.Coptic)
    assert Date.beginning_of_week(coptic_date) == ~D[2020-07-02 Cldr.Calendar.Coptic]
    assert Date.end_of_week(coptic_date) == ~D[2020-07-08 Cldr.Calendar.Coptic]

    assert Cldr.Calendar.day_of_week(Date.beginning_of_week(coptic_date)) == 1
    assert Cldr.Calendar.day_of_week(Date.end_of_week(coptic_date)) == 7
  end

  test "months in year" do
    assert Cldr.Calendar.Coptic.months_in_year(2000) == 13
  end

  test "~U sigil" do
    assert ~U[1736-13-01T00:00:00.0Z Cldr.Calendar.Coptic]
    assert ~D[1736-13-01 Cldr.Calendar.Coptic]
    assert ~D[1736-13-05 Cldr.Calendar.Coptic]
  end

  test "New Year" do
    new_year = Cldr.Calendar.Gregorian.date_to_iso_days(2021,9,11)
    assert Cldr.Calendar.Coptic.date_from_iso_days(new_year) == {1738,1,1}
  end

end
