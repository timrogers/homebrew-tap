class Litra < Formula
  desc "Control your Logitech Litra light from the command line"
  homepage "https://github.com/timrogers/litra-rs"
  url "https://github.com/timrogers/litra-rs/releases/download/v0.1.0/litra_v0.1.0_darwin-amd64"
  sha256 "e71610c5d1a62b967e09cd331c93fb8897843614315b2ab5a97674470abb4c76"
  version "0.1.0"

  def install
    bin.install "litra_v0.1.0_darwin-amd64" => "litra"
  end
end
