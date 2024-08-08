class Litra < Formula
  desc "Control your Logitech Litra light from the command line"
  homepage "https://github.com/timrogers/litra-rs"
  url "https://github.com/timrogers/litra-rs/releases/download/v1.3.0/litra_v1.3.0_darwin-amd64"
  sha256 "a823348aa11c382d339c97205ac0e7232bb546c151fdd42efef451d36ae21482"
  version "1.3.0"

  def install
    bin.install "litra_v#{version}_darwin-amd64" => "litra"
  end
end
