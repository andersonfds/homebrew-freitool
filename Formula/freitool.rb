class Freitool < Formula
  desc "Freitool"
  homepage "https://github.com/andersonfds/freitool"
  version "{{VERSION}}"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andersonfds/freitool/releases/download/vv0.1.0-alpha.3/freitool_macOS_aarch64-apple-darwin.tar.gz"
      sha256 "{{SHA256_ARM}}"
    elsif Hardware::CPU.intel?
      url "https://github.com/andersonfds/freitool/releases/download/vv0.1.0-alpha.3/freitool_macOS_x86_64-apple-darwin.tar.gz"
      sha256 "{{SHA256_INTEL}}"
    end
  end

  def install
    bin.install "freitool"
  end

  test do
    system "#{bin}/freitool", "--version"
  end
end
