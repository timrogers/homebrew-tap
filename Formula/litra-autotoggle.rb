class LitraAutotoggle < Formula
  desc 'Automatically turn your Logitech Litra device on when your webcam turns on, and off when your webcam turns off (macOS and Linux only)'
  homepage 'https://github.com/timrogers/litra-autotoggle'
  url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.2.0/litra-autotoggle_v0.2.0_darwin-universal'
  sha256 '7fd08516257d9baaf025eb199f4114abd3663904f41d7ca14efce88436708a37'
  version '0.2.0'

  def install
    bin.install "litra-autotoggle_v#{version}_darwin-universal" => 'litra-autotoggle'
  end

  service do
    run opt_bin/'litra-autotoggle'
    keep_alive crashed: true
  end

  test do
    assert_match "litra-autotoggle v#{version}", shell_output("#{bin}/litra-autotoggle --version").strip
  end
end
