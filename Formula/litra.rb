class Litra < Formula
  desc "Control your Logitech Litra light from the command line"
  homepage "https://github.com/timrogers/litra-rs"
  url "https://github.com/timrogers/litra-rs/releases/download/v1.5.0/litra_v1.5.0_darwin-universal"
  sha256 "0f9bbfa96d621b4d819ba69d03a3b3490e4608a0e185b83c29cc744db99be996"
  version "1.5.0"

  def install
    bin.install "litra_v#{version}_darwin-universal" => "litra"
  end
end
