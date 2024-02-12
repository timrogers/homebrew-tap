class Litra < Formula
  desc "Control your Logitech Litra light from the command line"
  homepage "https://github.com/timrogers/litra-rs"
  url "https://github.com/timrogers/litra-rs/releases/download/v0.3.0/litra_v0.3.0_darwin-amd64"
  sha256 "aa68bbf12cb92dad4f2c08020ee0d1cbb56b762fa4eb99ba38ae177f0de2690f"
  version "0.3.0"

  def install
    bin.install "litra_v#{version}_darwin-amd64" => "litra"
  end
end
