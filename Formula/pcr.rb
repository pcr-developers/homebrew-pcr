class Pcr < Formula
  desc "Capture AI coding prompts for peer review on PCR.dev"
  homepage "https://pcr.dev"
  version "0.2.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.6/pcr-macos-arm64"
      sha256 "51940d144e67763e0ebe592e3f33e788d623b854f203a04999216844e8c34413"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.6/pcr-macos-x64"
      sha256 "beebb351482258dbca030dcdfc8da6c2dab38522d5220582327bcd0300cb6f73"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.6/pcr-linux-x64"
      sha256 "998df98831641905db080714ab10182c3669516c305e95ccfdc2c9940cdc7bcc"
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
