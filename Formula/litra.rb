class Litra < Formula
  desc "Control your Logitech Litra light from the command line"
  homepage "https://github.com/timrogers/litra-rs"
  url "https://github.com/timrogers/litra-rs/releases/download/v1.1.1/litra_v1.1.1_darwin-amd64"
  sha256 "8afe7410cd623be061280f867e769469caafae363601414f1f98e04a33d0fff9"
  version "1.1.1"

  def install
    bin.install "litra_v#{version}_darwin-amd64" => "litra"
  end
end
