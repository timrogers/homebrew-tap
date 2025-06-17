class Csvmd < Formula
  desc 'Convert a CSV file to a Markdown table 📊'
  homepage 'https://github.com/timrogers/csvmd'
  version '0.1.0'

  if OS.mac?
    url 'https://github.com/timrogers/csvmd/releases/download/v0.1.0/csvmd_v0.1.0_darwin-universal'
    sha256 'fd9f9a8806935d38cbd8235d066be1a17e07def87c362e24c0f82cb6a029b258'
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/timrogers/csvmd/releases/download/v0.1.0/csvmd_v0.1.0_linux-aarch64'
      sha256 'a369045e09c4e8d095f336ea991a64da43cd017c4eb4e846a16020ff6affa2a6'
    else
      url 'https://github.com/timrogers/csvmd/releases/download/v0.1.0/csvmd_v0.1.0_linux-amd64'
      sha256 '5a095633dc2ec7cd52d9ee2340c57559e1291ee0d63509af149183b7259df042'
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
