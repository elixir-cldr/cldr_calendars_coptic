defmodule Cldr.Calendars.Coptic.MixProject do
  use Mix.Project

  @version "1.1.0"

  def project do
    [
      app: :ex_cldr_calendars_coptic,
      version: @version,
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://github.com/elixir-cldr/cldr_calendars_coptic",
      description: description(),
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      dialyzer: [
        plt_add_apps: ~w(mix)a,
        ignore_warnings: ".dialyzer_ignore_warnings"
      ]
    ]
  end

  def description do
    """
    Implementation of the Coptic calendar for Elixir.
    """
  end

  defp package do
    [
      maintainers: ["Kip Cole"],
      licenses: ["Apache-2.0"],
      logo: "logo.png",
      links: links(),
      files: [
        "lib",
        "logo.png",
        "mix.exs",
        "README*",
        "CHANGELOG*",
        "LICENSE*"
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_cldr_calendars, "~> 2.1"},
      {:stream_data, "~> 1.0", only: :test, optional: true},
      {:ex_doc, "~> 0.19", only: [:release, :dev], optional: true, runtime: false}
    ]
  end

  def links do
    %{
      "GitHub" => "https://github.com/elixir-cldr/cldr_calendars_coptic",
      "Readme" => "https://github.com/elixir-cldr/cldr_calendars_coptic/blob/v#{@version}/README.md",
      "Changelog" => "https://github.com/elixir-cldr/cldr_calendars_coptic/blob/v#{@version}/CHANGELOG.md"
    }
  end

  def docs do
    [
      source_ref: "v#{@version}",
      main: "readme",
      logo: "logo.png",
      extras: [
        "README.md",
        "LICENSE.md",
        "CHANGELOG.md"
      ],
      skip_undefined_reference_warnings_on: ["changelog"]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test", "dev", "test/support"]
  defp elixirc_paths(:dev), do: ["lib", "dev", "bench"]
  defp elixirc_paths(_), do: ["lib"]
end
