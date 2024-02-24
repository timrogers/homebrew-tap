class Litra < Formula
  desc "Control your Logitech Litra light from the command line"
  homepage "https://github.com/timrogers/litra-rs"
  url "https://github.com/timrogers/litra-rs/releases/download/v1.1.0/litra_v1.1.0_darwin-amd64"
  sha256 "207114dd4e5aa6d6cc949fa916406051009a6341aec3ada062c9e48e0accf683"
  version "1.1.0"

  def install
    bin.install "litra_v#{version}_darwin-amd64" => "litra"
  end
end
