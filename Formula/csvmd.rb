class Csvmd < Formula
  desc 'Convert a CSV file to a Markdown table 📊'
  homepage 'https://github.com/timrogers/csvmd'
  version '0.2.0'

  if OS.mac?
    url 'https://github.com/timrogers/csvmd/releases/download/v0.2.0/csvmd_v0.2.0_darwin-universal'
    sha256 'b9eb218baa1bd237da3223ad4df85e5b6d3c958989d0a3cafbf227c9322505d8'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/csvmd/releases/download/v0.2.0/csvmd_v0.2.0_linux-aarch64'
      sha256 'bcb57242c369ba5284f31fcd392a97e93281a3ed2f39af4b2083623fcd03540b'
    else
      url 'https://github.com/timrogers/csvmd/releases/download/v0.2.0/csvmd_v0.2.0_linux-amd64'
      sha256 '95ec5dc4a618a4560fbe1534a19c39adc81b7baf6bdd6000ac9a00ae057d6c81'
    end
  end

  def install
    if OS.mac?
      bin.install "csvmd_v#{version}_darwin-universal" => 'csvmd'
    elsif Hardware::CPU.arm?
      bin.install "csvmd_v#{version}_linux-aarch64" => 'csvmd'
    else
      bin.install "csvmd_v#{version}_linux-amd64" => 'csvmd'
    end
  end

  test do
    assert_match "csvmd v#{version}", shell_output("#{bin}/csvmd --version").strip
  end
end
