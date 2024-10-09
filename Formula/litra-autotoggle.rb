class LitraAutotoggle < Formula
  desc 'Automatically turn your Logitech Litra device on when your webcam turns on, and off when your webcam turns off (macOS and Linux only)'
  homepage 'https://github.com/timrogers/litra-autotoggle'
  url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.1.0/litra-autotoggle_v0.1.0_darwin-universal'
  sha256 '284578d2ec5cee619f9ec72f93d1e4d6f9dd7b9893e311e968493345c8d31af0'
  version '0.1.0'

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
