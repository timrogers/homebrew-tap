class Litra < Formula
  desc "Control your Logitech Litra light from the command line"
  homepage "https://github.com/timrogers/litra-rs"
  url "https://github.com/timrogers/litra-rs/releases/download/v2.0.0/litra_v2.0.0_darwin-universal"
  sha256 "51ddcbcf7510ae3945bb2e3addc73c7ef1afb571fbe99f602584641aeaab0abf"
  version "2.0.0"

  def install
    bin.install "litra_v#{version}_darwin-universal" => "litra"
  end
end
