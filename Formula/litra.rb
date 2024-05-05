class Litra < Formula
  desc "Control your Logitech Litra light from the command line"
  homepage "https://github.com/timrogers/litra-rs"
  url "https://github.com/timrogers/litra-rs/releases/download/v1.2.0/litra_v1.2.0_darwin-amd64"
  sha256 "de72260ae95255d5ab4251894515e744acdbca93517ad97a061e34c11dc95c60"
  version "1.2.0"

  def install
    bin.install "litra_v#{version}_darwin-amd64" => "litra"
  end
end
