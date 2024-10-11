class LitraAutotoggle < Formula
  desc 'Automatically turn your Logitech Litra device on when your webcam turns on, and off when your webcam turns off (macOS and Linux only)'
  homepage 'https://github.com/timrogers/litra-autotoggle'
  version '0.2.0'

  # Set the URL and SHA256 based on the platform
  if OS.mac?
    url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.2.0/litra-autotoggle_v0.2.0_darwin-universal'
    sha256 '7fd08516257d9baaf025eb199f4114abd3663904f41d7ca14efce88436708a37'
  elsif OS.linux?
    if Hardware::CPU.arm?
      odie "Linux devices with ARM processors are not supported"
    else
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.2.0/litra-autotoggle_v0.2.0_linux-amd64'
      sha256 '244ad4cf5b40be246a1be9e75274a441592562b0be9b2715c47688877ff1e561'
    end
  end

  def install
    if OS.mac?
      bin.install "litra-autotoggle_v#{version}_darwin-universal" => 'litra-autotoggle'
    else
      bin.install "litra-autotoggle_v#{version}_linux-amd64" => 'litra-autotoggle'
    end
  end

  service do
    run opt_bin/'litra-autotoggle'
    keep_alive crashed: true
  end

  test do
    assert_match "litra-autotoggle v#{version}", shell_output("#{bin}/litra-autotoggle --version").strip
  end
end
