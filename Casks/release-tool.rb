cask "release-tool" do
  version "1.0.0"
  sha256 "516581fbf6145cc96aceba0498b7615d89e08a07e5a9c5adfff76e46725c3bef"

  url "https://github.com/en96321/release-tool/releases/download/1.0.0/Release.Tool.dmg"
  name "Release Tool"
  desc "A macOS app for cherry-picking commits across branches"
  homepage "https://github.com/en96321/release-tool"

  # App to install
  app "Release Tool.app"

  # Optional: Clean up preferences on uninstall
  zap trash: [
    "~/Library/Preferences/com.en96321.releaseTool.plist"
  ]
end
