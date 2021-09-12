defmodule Cldr.Calendar.Coptic do
  @moduledoc """
  Implementation of the Coptic calendar.

  """

  use Cldr.Calendar.Behaviour,
    epoch: ~D[0284-08-30 Cldr.Calendar.Julian],
    cldr_calendar_type: :coptic

  import Cldr.Math, only: [mod: 2]

	@months_in_year 13
  @months_with_30_days 1..12

  @doc """
  Returns the number days in a given year.

  """
  @impl true
  def days_in_year(year) do
    if leap_year?(year), do: 366, else: 365
  end

  @doc """
  Returns the number of months in a given `year`.
  """
  @impl true
  def months_in_year(_year) do
    @months_in_year
  end

  @doc """
  Returns how many days there are in the given year-month.

  """
  @spec days_in_month(year, month) :: 29..31
  @impl true

  def days_in_month(year, 13) do
    if leap_year?(year), do: 6, else: 5
  end

  def days_in_month(_year, month) when month in @months_with_30_days do
    30
  end

  @doc """
  Returns if the given year is a leap year.

  """
  @spec leap_year?(year) :: boolean()
  @impl true
  def leap_year?(year) do
    mod(year, 4) == 3
  end

  @doc """
  Returns the number of days since the calendar
  epoch for a given `year-month-day`

  """
  def date_to_iso_days(year, month, day) do
    epoch() - 1 + 365 * (year - 1) + :math.floor(year / 4) + 30 * (month - 1) + day
    |> trunc
  end

  @doc """
  Returns a `{year, month, day}` calculated from
  the number of `iso_days`.

  """
  def date_from_iso_days(iso_days) do
    year = :math.floor((4 * (iso_days - epoch()) + 1463) / 1461)
    month = :math.floor((iso_days - date_to_iso_days(year, 1, 1)) / 30) + 1
    day = iso_days + 1 - date_to_iso_days(year, month, 1)

    {trunc(year), trunc(month), trunc(day)}
  end

end
