class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.1.17"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.17/pcr-macos-arm64"
      sha256 "d1fbbb876cf8a1b36b1d51cffcc56c9e3fa9cc3e349f1d585372b12a077b5eb1"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.17/pcr-macos-x64"
      sha256 "06758be607af0f37987568dd5b39b51b83b8322904e44696faff02d22d550b18"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.1.17/pcr-linux-x64"
      sha256 "79cf9a1b9de62ad27211932a40e381a18544456dbc402f57f946243c56d05648"
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
