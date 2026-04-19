class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.1.13"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.13/pcr-macos-arm64"
      sha256 "2c6443603ba41ffdfa993c36ab216744184d99f77791f82c701fcee70df36036"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.13/pcr-macos-x64"
      sha256 "2ad584212cf01022b47bfc1b1576ac4b84c3f7fb3f876746c0ff483b7d1a5971"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.13/pcr-linux-x64"
      sha256 "d6a57997ea048590a07d677424f32a7fad7c62835fe3510511a455f66fdd6dc6"
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
