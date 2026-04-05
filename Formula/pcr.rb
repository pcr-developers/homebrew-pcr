class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.6/pcr-macos-arm64"
      sha256 "6c7c7d7cf6bfe5af91763e3f949317758c06ba1178acec7798b7a8826e879b87"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.6/pcr-macos-x64"
      sha256 "04e12d7b64c72c4c1920337445d7fc991345462aec575f6be846a519bf09c02d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.6/pcr-linux-x64"
      sha256 "ed678ea00d646886f19d7ac6c81e11e6be5238d7da082919a909dac35e849a69"
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
