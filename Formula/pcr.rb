class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.1.11"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.11/pcr-macos-arm64"
      sha256 "6f5ae4ebe3361180b3b50f5bc16ad7d0735b883cb884fd380bca2d149c0bcde5"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.11/pcr-macos-x64"
      sha256 "974f45d9b56f1ef5aad27efc4ff977fa2cbdca7736f08f911ba945b6087dfa5c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.11/pcr-linux-x64"
      sha256 "bd241042f4ac51f79b9dfc3a9c9cbdb49da4ef278bb1b0af5c43268836f47f9a"
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
