class LitraAutotoggle < Formula
  desc 'Automatically turn your Logitech Litra device on when your webcam turns on, and off when your webcam turns off (macOS and Linux only)'
  homepage 'https://github.com/timrogers/litra-autotoggle'
  version '0.2.0'

  # Set the URL and SHA256 based on the platform
  if OS.mac?
    url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.3.0/litra-autotoggle_v0.3.0_darwin-universal'
    sha256 '8ca0405f5567bd9eaae9fa16b814e9af1e4b1b6bcbd4bbe01f7e8af14581e360'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.3.0/litra-autotoggle_v0.3.0_linux-aarch64'
      sha256 '6b94bf961d291e9718f3fbd996396b64a92555e0b6a0eab554bffe0518f08fb4'
    else
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.3.0/litra-autotoggle_v0.3.0_linux-amd64'
      sha256 '05a6713584f9e59d4ad07b8fe52ec43dc5cbfe8a09e6cebcef96390262123930'
    end
  end

  def install
    if OS.mac?
      bin.install "litra-autotoggle_v#{version}_darwin-universal" => 'litra-autotoggle'
    elsif Hardware::CPU.arm?
      bin.install "litra-autotoggle_v#{version}_linux-aarch64" => 'litra-autotoggle'
    else
      bin.install "litra-autotoggle_v#{version}_linux-amd64" => 'litra-autotoggle'
    end
  end

  service do
    run opt_bin / 'litra-autotoggle'
    keep_alive crashed: true
  end

  test do
    assert_match "litra-autotoggle v#{version}", shell_output("#{bin}/litra-autotoggle --version").strip
  end
end
