class Litra < Formula
  desc "Control your Logitech Litra light from the command line"
  homepage "https://github.com/timrogers/litra-rs"
  url "https://github.com/timrogers/litra-rs/releases/download/v1.1.2/litra_v1.1.2_darwin-amd64"
  sha256 "5c429f4fdaf1b252615f6249d08b29f412a5aad103d25082334dd469b4ca20c2"
  version "1.1.2"

  def install
    bin.install "litra_v#{version}_darwin-amd64" => "litra"
  end
end
