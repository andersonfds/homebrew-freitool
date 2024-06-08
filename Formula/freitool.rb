class Freitool < Formula
  desc "Freitool"
  homepage "https://github.com/andersonfds/freitool"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andersonfds/freitool/releases/download/v0.1.0/freitool_macOS_arm.tar.gz"
      sha256 "5d6bc95920dbb7e4fc58433093e08d1575e67d5a15e41317fcffd5d5ca45c069"
    elsif Hardware::CPU.intel?
      url "https://github.com/andersonfds/freitool/releases/download/v0.1.0/freitool_macOS_x86.tar.gz"
      sha256 "692634e0b3fdd13d228fc5bb195710f539830d4cb9164db68f6440d17f6e7f99"
    end
  end

  def install
    bin.install "freitool"
  end

  test do
    system "#{bin}/freitool", "--version"
  end
end
