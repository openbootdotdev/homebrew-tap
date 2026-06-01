class Openboot < Formula
  desc "Set up your macOS dev environment in one command"
  homepage "https://openboot.dev"
  version "0.60.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.60.0/openboot-darwin-arm64"
    sha256 "59430cba1c8568b9d3450cadabbf5e0bcb573965e3995d4e8e8e171c38aa1590"
  else
    url "https://github.com/openbootdotdev/openboot/releases/download/v0.60.0/openboot-darwin-amd64"
    sha256 "8bfe9a8d746dcaca6a6ff577e281612ca3e2362496c957f4c86690f9706baf19"
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
