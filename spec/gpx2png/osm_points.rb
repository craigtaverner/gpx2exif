require 'spec_helper'
require 'gpx2png/osm'
require 'gpx2png/ump'

describe Gpx2png::Osm do
  it "should create using GPX file with fixed size using OSM with 1 added point" do
    g = GpxUtils::TrackImporter.new
    g.add_file(File.join('spec', 'fixtures', 'sample.gpx'))

    e = Gpx2png::Osm.new
    e.coords = g.coords

    e.fixed_size(200, 200)
    e.add_point(
      blob: File.read("spec/fixtures/blue-flag1.gif"),
      label: 'test',
      lat: g.coords.first[:lat],
      lon: g.coords.first[:lon]
    )
    e.save("samples/tmp/png_with_points.png")
  end
end
