class Freitool < Formula
  desc "Freitool"
  homepage "https://github.com/andersonfds/freitool"
  version "0.1.0-alpha.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andersonfds/freitool/releases/download/v0.1.0-alpha.2/freitool_macOS_arm.tar.gz"
      sha256 "0b05fdeb775a5b930d4266bc9ac262bb5b6073350d038240344415a47d93c23a"
    elsif Hardware::CPU.intel?
      url "https://github.com/andersonfds/freitool/releases/download/v0.1.0-alpha.2/freitool_macOS_x86.tar.gz"
      sha256 "0d05035ab598a1022ca5bb75268ea6a7bddb594a1cb4b75b103ffe6415fc7f3b"
    end
  end

  def install
    bin.install "freitool"
  end

  test do
    system "#{bin}/freitool", "--version"
  end
end
