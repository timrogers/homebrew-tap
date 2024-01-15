class Litra < Formula
  desc "Control your Logitech Litra light from the command line"
  homepage "https://github.com/timrogers/litra-rs"
  url "https://github.com/timrogers/litra-rs/releases/download/v0.2.0/litra_v0.2.0_darwin-amd64"
  sha256 "f52c2b8010eb77e686ae6e2479ae1a028cfba8c579ee878c7da0332fb181f674"
  version "0.2.0"

  def install
    bin.install "litra_v#{version}_darwin-amd64" => "litra"
  end
end
