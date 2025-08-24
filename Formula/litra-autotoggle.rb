class LitraAutotoggle < Formula
  desc 'Automatically turn your Logitech Litra device on when your webcam turns on, and off when your webcam turns off (macOS and Linux only)'
  homepage 'https://github.com/timrogers/litra-autotoggle'
  version '0.7.0'

  # Set the URL and SHA256 based on the platform
  if OS.mac?
    url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.7.0/litra-autotoggle_v0.7.0_darwin-universal'
    sha256 'f7ee3ce1cbc5343d5aee42f054eb1d0be97bead1f6ef2e3249c515d8a0a74339'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.7.0/litra-autotoggle_v0.7.0_linux-aarch64'
      sha256 '520311751cf356f160c7b7c638a41143839bc88d3b8b3113f79f3347b078f045'
    else
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.7.0/litra-autotoggle_v0.7.0_linux-amd64'
      sha256 '9b8945e775de08d8d1618231100b3cafb894aa162de1c4e812757dd89acf2d63'
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
