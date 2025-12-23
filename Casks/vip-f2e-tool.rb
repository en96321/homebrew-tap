# Documentation: https://docs.brew.sh/Cask-Cookbook
# VIP F2E Tool Homebrew Cask

cask "vip-f2e-tool" do
  version "1.0.1"
  sha256 "828a96b4fe8005d167fdd6b9339b40cdefeb6ed9c7b81ed3932cb72dfabc8e8e"

  url "https://github.com/en96321/homebrew-tap/releases/download/vip-f2e-tool-#{version}/VIP-F2E-Tool-#{version}.dmg"
  name "VIP F2E Tool"
  desc "整合 PR 比對、RedPen CI、發車工具的前端開發工具"
  homepage "https://github.com/en96321/homebrew-tap"

  depends_on formula: "gh"

  app "VIP F2E Tool.app"

  zap trash: [
    "~/Library/Preferences/com.en96321.vipF2eTool.plist",
    "~/Library/Application Support/com.en96321.vipF2eTool",
    "~/Library/Caches/com.en96321.vipF2eTool",
  ]

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/VIP F2E Tool.app"]
  end

  caveats <<~EOS
    安裝完成後，請確認 GitHub CLI 已登入：
      gh auth login

    檢查更新：
      brew update && brew upgrade --cask vip-f2e-tool
  EOS
end
