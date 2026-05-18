class Pcr < Formula
  desc "Capture AI coding prompts for peer review on PCR.dev"
  homepage "https://pcr.dev"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.3.0/pcr-macos-arm64"
      sha256 "14e72c637ac201651e1aec38185df374d7ae92143e69c7680d8cdaa17c06905f"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.3.0/pcr-macos-x64"
      sha256 "53581954ad7f2488600dfd48ed9b89de24e7b58565c2cf99f514796eb6d3ed6b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.3.0/pcr-linux-x64"
      sha256 "5ef1614012a9cdd02120356fc5f2d81d5316f04a3ecc97caedcc43bd3c486f4d"
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
