class Litra < Formula
  desc "Control your Logitech Litra light from the command line"
  homepage "https://github.com/timrogers/litra-rs"
  url "https://github.com/timrogers/litra-rs/releases/download/v0.1.0/litra_v0.1.0_darwin-amd64"
  sha256 "9e237022500adeb0a981219dc8666b2939c413db"
  version "0.1.0"

  def install
    bin.install "litra"
  end
end
