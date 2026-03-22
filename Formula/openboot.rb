class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.48.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.48.0/openboot-darwin-arm64"
    sha256 "2b6c720b2003350772f2b1eaeea1097b3052da93b4a44f4d8b3f35356b6e0e60"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.48.0/openboot-darwin-amd64"
    sha256 "e6c5ab8cf133d58e92b10d0588b2237746e858d750356a04935fe68d469c545d"
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
