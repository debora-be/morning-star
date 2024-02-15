defmodule MorningStar.Parsers.ParseVenusDataTest do
  use ExUnit.Case, async: true

  describe "parse_data_for_period/3" do
    test "filters and extracts image details within the given period" do
      start_date = ~D[2021-01-01]
      end_date = ~D[2021-12-31]

      items = [
        %{
          "data" => [
            %{
              "date_created" => "2021-06-02T00:00:00Z",
              "description" =>
                "This colorized picture of Venus was taken Feb. 14, 1990, from a distance of almost 1.7 million miles, about 6 days after NASA's Galileo made it closest approach to the planet.  http://photojournal.jpl.nasa.gov/catalog/PIA00111"
            }
          ],
          "links" => [
            %{
              "href" => "https://images-assets.nasa.gov/image/PIA00111/PIA00111~thumb.jpg"
            }
          ]
        },
        %{
          "data" => [
            %{
              "date_created" => "2022-01-01T00:00:00Z",
              "description" =>
                "Venus in 2022 shows a significant increase in volcanic activity. http://photojournal.jpl.nasa.gov/catalog/PIA00202"
            }
          ],
          "links" => [
            %{
              "href" => "https://images-assets.nasa.gov/image/PIA00202/PIA00202~thumb.jpg"
            }
          ]
        }
      ]

      expected = [
        %{
          date_created: "2021-06-02T00:00:00Z",
          description:
            "This colorized picture of Venus was taken Feb. 14, 1990, from a distance of almost 1.7 million miles, about 6 days after NASA's Galileo made it closest approach to the planet.  http://photojournal.jpl.nasa.gov/catalog/PIA00111",
          link: "https://images-assets.nasa.gov/image/PIA00111/PIA00111~thumb.jpg",
          title: nil
        }
      ]

      assert MorningStar.Parsers.ParseVenusData.parse_data_for_period(start_date, end_date, items) ==
               expected
    end
  end

  test "returns an empty list when there is no data for the given period" do
    start_date = ~D[2024-01-01]
    end_date = ~D[2024-12-31]

    items = [
      %{
        "data" => [
          %{
            "date_created" => "2021-06-02T00:00:00Z",
            "description" =>
              "Venus, our planetary neighbor, is a hot, hellish unforgiving world and NASA has selected two bold new missions to study this inferno-like planet: DAVINCI+ and VERITAS. Are Venus and Earth fundamentally unique worlds? Or are the differences between these ‘twins’ only cosmetic? Answering this question is key to understanding what makes other rocky planets habitable and, ultimately, emerge with life.   Learn more about NASA’s newest Discovery missions: https://go.nasa.gov/NewVenusMissions"
          }
        ],
        "links" => [
          %{
            "href" =>
              "https://images-assets.nasa.gov/video/NASA's Return to Venus/NASA's Return to Venus~thumb.jpg"
          }
        ]
      },
      # Additional mocks provided
      %{
        "data" => [
          %{
            "date_created" => "2010-04-08T21:53:58Z",
            "description" =>
              "This figure shows the volcanic peak Idunn Mons in the Imdr Regio area of Venus. The topographic backbone brown color was derived from data obtained by NASA Magellan spacecraft and the overlay was derived from data from ESA Venus Express Spacecraft."
          }
        ],
        "links" => [
          %{"href" => "https://images-assets.nasa.gov/image/PIA13001/PIA13001~thumb.jpg"}
        ]
      },
      %{
        "data" => [
          %{
            "date_created" => "2012-06-05T00:00:00Z",
            "description" =>
              "Beautiful skies prevailed on the evening of the Venus Transit when NASA Glenn brought telescopes to Edgewater Park on Lake Erie for a view of the event."
          }
        ],
        "links" => [
          %{
            "href" =>
              "https://images-assets.nasa.gov/image/GRC-2012-C-02176/GRC-2012-C-02176~thumb.jpg"
          }
        ]
      },
      %{
        "data" => [
          %{
            "date_created" => "1996-03-14T03:12:22Z",
            "description" =>
              "Landslides on Venus! The image on the left was taken in late November of 1990 during Magellan first trip around Venus. The image on the right was taken July 23, as the Magellan spacecraft passed over the region for the second time.  http://photojournal.jpl.nasa.gov/catalog/PIA00248"
          }
        ],
        "links" => [
          %{"href" => "https://images-assets.nasa.gov/image/PIA00248/PIA00248~thumb.jpg"}
        ]
      },
      %{
        "data" => [
          %{
            "date_created" => "1996-03-14T03:25:10Z",
            "description" =>
              "This Magellan image depicts a stereoscopic pair of an area on Venus with small volcanic domes. Stereoscopic images of Venus offer exciting new possibilities for scientific analysis of Venusian landforms.  http://photojournal.jpl.nasa.gov/catalog/PIA00251"
          }
        ],
        "links" => [
          %{"href" => "https://images-assets.nasa.gov/image/PIA00251/PIA00251~thumb.jpg"}
        ]
      },
      %{
        "data" => [
          %{
            "date_created" => "2006-11-24T19:01:48Z",
            "description" =>
              "On Oct. 24, 2006, NASA MESSENGER spacecraft came within 2,990 kilometers 1,860 miles of Venus during its second planetary encounter."
          }
        ],
        "links" => [
          %{"href" => "https://images-assets.nasa.gov/image/PIA10123/PIA10123~thumb.jpg"}
        ]
      },
      %{
        "data" => [
          %{
            "date_created" => "1999-05-18T10:05:11Z",
            "description" =>
              "Venus Cloud Tops Viewed by Hubble. This is a NASA Hubble Space Telescope ultraviolet-light image of the planet Venus, taken on January 24 1995, when Venus was at a distance of 70.6 million miles 113.6 million kilometers from Earth."
          }
        ],
        "links" => [
          %{"href" => "https://images-assets.nasa.gov/image/PIA01544/PIA01544~thumb.jpg"}
        ]
      }
    ]

    expected = []

    assert MorningStar.Parsers.ParseVenusData.parse_data_for_period(start_date, end_date, items) ==
             expected
  end
end
