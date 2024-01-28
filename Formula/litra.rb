class Litra < Formula
  desc "Control your Logitech Litra light from the command line"
  homepage "https://github.com/timrogers/litra-rs"
  url "https://github.com/timrogers/litra-rs/releases/download/v0.2.1/litra_v0.2.1_darwin-amd64"
  sha256 "0ded7c48475881fdaf7f7c7f0ac9b9811badee8e1403670ab4c9ba99d6704640"
  version "0.2.1"

  def install
    bin.install "litra_v#{version}_darwin-amd64" => "litra"
  end
end
