class LitraAutotoggle < Formula
  desc 'Automatically turn your Logitech Litra device on when your webcam turns on, and off when your webcam turns off (macOS and Linux only)'
  homepage 'https://github.com/timrogers/litra-autotoggle'
  version '0.6.1'

  # Set the URL and SHA256 based on the platform
  if OS.mac?
    url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.6.1/litra-autotoggle_v0.6.1_darwin-universal'
    sha256 'fa133662d0a0e46672ba2fa778e80dff194e72c6061c2f07b821e27f25fe4a8f'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.6.1/litra-autotoggle_v0.6.1_linux-aarch64'
      sha256 'e1f0e3e51337404e36897d5b16312f60b83cca3ef9a6cf2bca1bb56cc7fb01ed'
    else
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v0.6.1/litra-autotoggle_v0.6.1_linux-amd64'
      sha256 '6a7bffba2b4b359032e431b5f2e06ba291617066ca82913e0cbb598177cc9c05'
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
