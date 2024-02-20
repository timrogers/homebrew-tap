class Litra < Formula
  desc "Control your Logitech Litra light from the command line"
  homepage "https://github.com/timrogers/litra-rs"
  url "https://github.com/timrogers/litra-rs/releases/download/v1.0.0/litra_v1.0.0_darwin-amd64"
  sha256 "88971b78c2f27667a07d4962e18e18734064c9962ac03d28456e66e0ac386ddd"
  version "1.0.0"

  def install
    bin.install "litra_v#{version}_darwin-amd64" => "litra"
  end
end
