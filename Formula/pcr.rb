class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.2.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.2/pcr-macos-arm64"
      sha256 "3c5682be7b783eb42304eeaf828ba833e275c8035dea291d5960f2abb61bd248"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.2/pcr-macos-x64"
      sha256 "dcba4f653870e24260b0297c27c72560e8f07cf2811597f1e478eeaaa62606a7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.2/pcr-linux-x64"
      sha256 "cdee2712bc362e5e754bd36c1175c15c99eecc9612f95f318f2f6eb31be519b3"
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
