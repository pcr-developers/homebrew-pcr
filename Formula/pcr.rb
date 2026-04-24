class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.1/pcr-macos-arm64"
      sha256 "d23cbe031a96199df3351c80260d85e97628df128b32c84ec80b85482597f6fe"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.1/pcr-macos-x64"
      sha256 "c32059c786c3f1d4dce0c7bc1f292de13640ffa5d69bc504b9d678fa2e701feb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.1/pcr-linux-x64"
      sha256 "1967add0b6ec8b2fb3ffcc00bb655109c9c6da89ba5b159b719c85adf9ea8ad4"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "pcr-macos-arm64" => "pcr"
      else
        bin.install "pcr-macos-x64" => "pcr"
      end
    else
      bin.install "pcr-linux-x64" => "pcr"
    end
  end

  test do
    assert_match "PCR.dev", shell_output("#{bin}/pcr --help")
  end
end
