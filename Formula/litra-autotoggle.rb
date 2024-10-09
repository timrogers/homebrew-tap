class LitraAutotoggle < Formula
  desc 'Automatically turn your Logitech Litra device on when your webcam turns on, and off when your webcam turns off (macOS and Linux only)'
  homepage 'https://github.com/timrogers/litra-autotoggle'
  url 'TODO'
  sha256 'TODO'
  version '0.0.1'

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
