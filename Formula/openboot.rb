class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.55.4"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.4/openboot-darwin-arm64"
    sha256 "ae0f207ec0583d3fc8616d9b424972d1b644338ad5c6934316e26f61fbab40f0"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.55.4/openboot-darwin-amd64"
    sha256 "98026d6093849dc147bdbb2a72fdfa5c742ab0572818420267935f707033d48d"
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
