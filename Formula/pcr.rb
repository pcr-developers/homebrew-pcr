class Pcr < Formula
  desc "PCR.dev CLI — capture AI coding prompts for peer review"
  homepage "https://pcr.dev"
  version "v0.2.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.8/pcr-macos-arm64"
      sha256 "489805651271c7ec4fc3f46e0b0828972f739d349b80f965cd564b8113ea8964"
    end
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.8/pcr-macos-x64"
      sha256 "b7bad41af48bda88420c4c71966ee1c89dc94e612015ee64c75228fe8c328ea7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pcr-developers/cli/releases/download/v0.2.8/pcr-linux-x64"
      sha256 "34633c0e8dbc6b776f11af8de5f9349ae3d8533c37e5ce94e81f2c9d1daf3827"
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
