cask "redpen-ci" do
  version "1.5.0"
  sha256 "76992ba6e7f520bb72dd6b502fb514f069f4b209dc8298ee6970958361112ede"

  url "https://github.com/en96321/redpen-ci/releases/download/1.5.0/RedPen_CI_1.5.0.dmg"
  
  name "RedPen CI"
  desc "Static code analysis tool for RedPen CI"
  homepage "https://github.com/en96321/redpen-ci"

  # 依賴 GitHub CLI
  depends_on cask: "gh"

  app "RedPen CI.app"

  zap trash: [
    "~/Library/Preferences/com.redpen.redpenCiApp.plist",
    "~/Library/Application Support/com.redpen.redpenCiApp",
  ]

  caveats <<~EOS
    #{token} 需要 GitHub CLI 才能正常運作。
    
    安裝後請執行以下命令登入 GitHub:
      gh auth login
    
    如果出現「此應用程式已損毀」錯誤，請執行:
      xattr -cr "/Applications/RedPen CI.app"
  EOS
end
