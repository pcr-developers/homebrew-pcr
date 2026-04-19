class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.1.10"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.10/pcr-macos-arm64"
      sha256 "425ad3a2a4872a1790a57d46c81a5a84d5ec2f65ea0175542865ecd717ed7f47"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.10/pcr-macos-x64"
      sha256 "12bfd3bad2b449e2d1cae41e75ae781b20067b72a94a5111b3f2af397758f773"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.10/pcr-linux-x64"
      sha256 "0235bfe69de8f389c31a33e4f606b4baedabe5fd1a8a08ba0b16a68c59c8dc4b"
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
