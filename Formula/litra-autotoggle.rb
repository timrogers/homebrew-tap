class LitraAutotoggle < Formula
  desc 'Automatically turn your Logitech Litra device on when your webcam turns on, and off when your webcam turns off (macOS and Linux only)'
  homepage 'https://github.com/timrogers/litra-autotoggle'
  version '0.6.0'

  # Set the URL and SHA256 based on the platform
  if OS.mac?
    url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.6.0/litra-autotoggle_v0.6.0_darwin-universal'
    sha256 '5f0d9390161efdfdbde4c097b1784f2914a0edfe907ef018d23f90e38f01e46b'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.6.0/litra-autotoggle_v0.6.0_linux-aarch64'
      sha256 '21bf0a04abb3393b8036c460effaa0e3c759afa93ab69d71b7ef63b405d401c5'
    else
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.6.0/litra-autotoggle_v0.6.0_linux-amd64'
      sha256 '2c083f44e82b6ed9cae55ef268397c792af231cdcb18d2ff5b4fa38f1afc4a9e'
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
