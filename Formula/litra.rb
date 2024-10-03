class Litra < Formula
  desc "Control your Logitech Litra light from the command line"
  homepage "https://github.com/timrogers/litra-rs"
  url "https://github.com/timrogers/litra-rs/releases/download/v1.6.0/litra_v1.6.0_darwin-universal"
  sha256 "f8c753bdac880bbd5ad433b072b369c0ada44913f3e2413fab496e9b9fffd65f"
  version "1.6.0"

  def install
    bin.install "litra_v#{version}_darwin-universal" => "litra"
  end
end
