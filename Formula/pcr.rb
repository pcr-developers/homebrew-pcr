class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.1.14"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.14/pcr-macos-arm64"
      sha256 "aa1e5902df7326740ddf5b1f110218039714b5bb6945d90ab8809ad4a05d1667"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.14/pcr-macos-x64"
      sha256 "c5e68a5b939fabf10f4056df15246f94321a1f2a07c4c4231f29ea1c1776e594"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.14/pcr-linux-x64"
      sha256 "4b327567c49289a120f65f47bb898b53fcd0feac9edab57f34d88ecb0d998fdc"
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
