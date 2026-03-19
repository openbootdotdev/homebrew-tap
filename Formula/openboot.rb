class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.45.4"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.4/openboot-darwin-arm64"
    sha256 "0212c95db215f3ba83caa5833bc9a9223d961928cd323467fb186fc3604e9e31"
  end

  on_intel do
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.45.4/openboot-darwin-amd64"
    sha256 "d867d55946a96552c22c7e8a22957d5ee7e178f9819a610b9437aacbff2bdae6"
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
