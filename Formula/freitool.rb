class Freitool < Formula
  desc "Freitool"
  homepage "https://github.com/andersonfds/freitool"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andersonfds/freitool/releases/download/v0.1.0/freitool_macOS_arm.tar.gz"
      sha256 "e57595408ead35c6e8c6e414c4280941dc964bf6fa057e9b3519c651a94f5d4b"
    elsif Hardware::CPU.intel?
      url "https://github.com/andersonfds/freitool/releases/download/v0.1.0/freitool_macOS_x86.tar.gz"
      sha256 "e6168a7867eb27af099c44acbe6123ccd763cafb7ee1729c698927e54c6a4b3f"
    end
  end

  def install
    bin.install "freitool"
  end

  test do
    system "#{bin}/freitool", "--version"
  end
end
