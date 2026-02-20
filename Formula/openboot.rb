class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.30.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.30.0/openboot-darwin-arm64"
    sha256 "549052f33ea87c80e2a36c4c012c9ac5c4b0834006f71d8bbce61b9d131c8796"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.30.0/openboot-darwin-amd64"
    sha256 "a4bd4278d633a859890f551f6943f27f84b5d87d68facce9a8e4b43a3977fe9d"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "openboot-darwin-arm64" => "openboot"
    else
      bin.install "openboot-darwin-amd64" => "openboot"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/openboot version")
  end
end
