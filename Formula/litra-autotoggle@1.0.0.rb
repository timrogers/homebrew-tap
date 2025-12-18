class LitraAutotoggleAT100 < Formula
  desc 'Automatically turn your Logitech Litra device on when your webcam turns on, and off when your webcam turns off (macOS and Linux only)'
  homepage 'https://github.com/timrogers/litra-autotoggle'
  version '1.0.0-rc1'

  # Set the URL and SHA256 based on the platform
  if OS.mac?
    url 'https://github.com/timrogers/litra-autotoggle/releases/download/v1.0.0-rc1/litra-autotoggle_v1.0.0-rc1_darwin-universal'
    sha256 '00a587d41f3bc6af582614b87bce9bbd2789d0c82f09873e9313dc11f87a32eb'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v1.0.0-rc1/litra-autotoggle_v1.0.0-rc1_linux-aarch64'
      sha256 '0eab94a8abd16e936869a2666da4a503224e92ec638934ce96e0d055476cbe3d'
    else
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v1.0.0-rc1/litra-autotoggle_v1.0.0-rc1_linux-amd64'
      sha256 '0b89127955732102223f9298600faebc8fe9de77ff0e008717d412813d16e6a5'
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

    (buildpath / 'litra-autotoggle.yml').write <<~YAML
      # By default, the background service will control all connected Litra devices.
      # To specify particular devices or configure other advanced options, uncomment
      # and modify the example below.
      #
      # device_type: glow
      # serial_number: ABCD1
      # video_device: /dev/video0
      # device_path: DevSrvsID:4296789687
      # delay: 2000
    YAML

    etc.install 'litra-autotoggle.yml'
  end

  service do
    run [opt_bin / 'litra-autotoggle', '--config', etc / 'litra-autotoggle.yml']
    keep_alive crashed: true
  end

  test do
    assert_match "litra-autotoggle v#{version}", shell_output("#{bin}/litra-autotoggle --version").strip
  end
end
