class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.1.16"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.16/pcr-macos-arm64"
      sha256 "24dcb095f81a14b5047c57838dbe0049ab5613b37fa2d610ca1fbe1df55af713"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.16/pcr-macos-x64"
      sha256 "1a10dbbcd6e1a7000d2cfd27580030144370f34456b1587adad477f976edba2f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.16/pcr-linux-x64"
      sha256 "ecc376c5e6e70f19487f92e7809914e386671c99e98154da9e798998c32a89f7"
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
