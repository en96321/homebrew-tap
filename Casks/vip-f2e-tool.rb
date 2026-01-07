# Documentation: https://docs.brew.sh/Cask-Cookbook
# VIP F2E Tool Homebrew Cask

cask "vip-f2e-tool" do
  version "1.0.5"
  sha256 "65e962d2c22c8f507bb21dd5cd1b83d9854d0f28e66e42e7a754afcc86846f95"

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
