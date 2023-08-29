# Coptic Calendar

This library implements the Coptic calendar.

From [wikipedia](https://en.wikipedia.org/wiki/Coptic_calendar):

The Coptic calendar, also called the Alexandrian calendar, is a liturgical calendar used by the Coptic Orthodox Church and also used by the farming populace in Egypt. This calendar is based on the ancient Egyptian calendar. To avoid the calendar creep of the latter, a reform of the ancient Egyptian calendar was introduced at the time of Ptolemy III (Decree of Canopus, in 238 BC) which consisted of the intercalation of a sixth epagomenal day every fourth year. However, this reform was opposed by the Egyptian priests, and the reform was not adopted until 25 BC, when the Roman Emperor Augustus imposed the Decree upon Egypt as its official calendar (although it was unsynchronized with the newly introduced Julian calendar which had erroneously been intercalating leap days every third year due to a misinterpration of the leap year rule so as to apply inclusive counting).

To distinguish it from the Ancient Egyptian calendar, which remained in use by some astronomers until medieval times, this reformed calendar is known as the Coptic calendar. Its years and months coincide with those of the Ethiopian calendar but have different numbers and names.

## Usage

[ex_cldr_calendars_coptic](https://hex.pm/packages/ex_cldr_calenars_coptic) conforms to both the `Calendar` and `Cldr.Calendar` behaviours and therefore the functions in the `Date`, `DateTime`, `NaiveDateTime`, `Time` and `Calendar` functions are supported.

For Elixir versions up to and including 1.9, a date can be created by:
```elixir
iex> {:ok, date} = Date.new(1736, 3, 30, Cldr.Calendar.Coptic)
{:ok, ~D[1736-03-30 Cldr.Calendar.Coptic]}
```
For Elixir version 1.10 and later `Sigil_D` supports user-defined calendars:
```
iex> ~D[1736-03-30 Cldr.Calendar.Coptic]
~D[1736-03-30 Cldr.Calendar.Coptic]
```

## Localization

`ex_cldr_calendars_coptic` depends on [ex_cldr_calendars](https://hex.pm/packages/ex_cldr_calendars) which supports calendar localization. For full date and time formatting see [ex_cldr_dates_times](https://hex.pm/packages/ex_cldr_dates_times).

Basic localization is executed by the `Cldr.Calendar.localize/3`. For example:

```elixir
iex> Cldr.Calendar.localize(date, :month, locale: "en")
"Hator"

iex> Cldr.Calendar.localize(date, :day_of_week, locale: "en")
"Tue"

iex> Cldr.Calendar.localize(date, :day_of_week, locale: "ar-EG")
"الثلاثاء"

iex> Cldr.Calendar.localize(date, :month, locale: "ar-EG")
"هاتور"
```

## Relationship to other libraries

This library is part of the [CLDR](https://cldr.unicode.org)-based libraries for Elixir including:

* [ex_cldr](https://hex.pm/packages/ex_cldr)
* [ex_cldr_numbers](https://hex.pm/packages/ex_cldr_numbers)
* [ex_cldr_dates_times](https://hex.pm/packages/ex_cldr_dates_times)
* [ex_cldr_units](https://hex.pm/packages/ex_cldr_units)
* [ex_cldr_lists](https://hex.pm/packages/ex_cldr_lists)
* [ex_cldr_messages](https://hex.pm/packages/ex_cldr_messages)
* [ex_cldr_calendars](https://hex.pm/packages/ex_cldr_calendars)
* [ex_cldr_currencies](https://hex.pm/packages/ex_cldr_currencies)

## Installation

The package can be installed by adding `cldr_calendars_coptic` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:cldr_calendars_coptic, "~> 1.0.0"}
  ]
end
```
Documentation can be found at [https://hexdocs.pm/cldr_calendars_coptic](https://hexdocs.pm/cldr_calendars_coptic).

