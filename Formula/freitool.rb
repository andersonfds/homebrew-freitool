class Freitool < Formula
  desc "Freitool"
  homepage "https://github.com/andersonfds/freitool"
  version "0.1.0-alpha.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andersonfds/freitool/releases/download/v#{version}/freitool_macOS_aarch64-apple-darwin.tar.gz"
      sha256 "90b060dfdd9cb17cbf2f1d5f3be516491f23ea765228d49340167f76a89e1a60"
    elsif Hardware::CPU.intel?
      url "https://github.com/andersonfds/freitool/releases/download/v#{version}/freitool_macOS_x86_64-apple-darwin.tar.gz"
      sha256 "c375e89b0b17e635293e0d6e8321fe905ee18751250f6f4355aa4af5fcb052c2"
    end
  end

  def install
    bin.install "freitool"
  end

  test do
    system "#{bin}/freitool", "--version"
  end
end
