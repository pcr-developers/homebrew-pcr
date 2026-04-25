class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.2.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.4/pcr-macos-arm64"
      sha256 "691824f27fb2c836ef82bd1784a2a248674bd2d64c2ba257f047ce9bfcfee817"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.4/pcr-macos-x64"
      sha256 "0c899861ff0c8239e93c80b3439dbda4ac01394e39bb20552962a2a7edf0e33b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.4/pcr-linux-x64"
      sha256 "68ccd5a7646f79cb5d5cb4dd6f391617df7bc3d9e99ab9249155c7518fee3e31"
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
