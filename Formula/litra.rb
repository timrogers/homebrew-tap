class Litra < Formula
  desc "Control your Logitech Litra light from the command line"
  homepage "https://github.com/timrogers/litra-rs"
  url "https://github.com/timrogers/litra-rs/releases/download/v1.4.0/litra_v1.4.0_darwin-universal"
  sha256 "f5993c63608b635c5edb7a74ef7b1515ea52a8b83aec45f1bd556c730043a182"
  version "1.4.0"

  def install
    bin.install "litra_v#{version}_darwin-universal" => "litra"
  end
end
