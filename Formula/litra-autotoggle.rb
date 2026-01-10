class LitraAutotoggle < Formula
  desc 'Automatically turn your Logitech Litra device on when your webcam turns on, and off when your webcam turns off (macOS and Linux only)'
  homepage 'https://github.com/timrogers/litra-autotoggle'
  version '0.7.0'

  # Set the URL and SHA256 based on the platform
  if OS.mac?
    url 'https://github.com/timrogers/litra-autotoggle/releases/download/v1.0.0/litra-autotoggle_v1.0.0_darwin-universal'
    sha256 '94fe0265132e7d726bf84c3436ea55b4c744e7629f25b9b844ef9f4aaa2c5b51'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v1.0.0/litra-autotoggle_v1.0.0_linux-aarch64'
      sha256 '660e23f9ad44201faec675dcb45843f2f86b25d88528f00c929e9caa6367bfda'
    else
      url 'https://github.com/timrogers/litra-autotoggle/releases/download/v1.0.0/litra-autotoggle_v1.0.0_linux-amd64'
      sha256 '3dd0a8e2266e9f0053f20e52c7488d6067c4a01ffbf52b3708d1bb4332f117b7'
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
