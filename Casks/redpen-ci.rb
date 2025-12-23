cask "redpen-ci" do
  version "1.5.0"
  sha256 "25aa65ab2352eb330e9ae317ee58806653538121bb61177745931b0c6afc00ac"

  url "https://github.com/en96321/redpen-ci/releases/download/1.5.0/RedPen_CI_1.5.0.dmg"
  
  name "RedPen CI"
  desc "Static code analysis tool for RedPen CI"
  homepage "https://github.com/en96321/redpen-ci"

  # 依賴 GitHub CLI
  depends_on formula: "gh"

  app "RedPen CI.app"

  zap trash: [
    "~/Library/Preferences/com.en96321.redpenCiApp.plist"
  ]

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/RedPen CI.app"]
  end

  caveats <<~EOS
    #{token} 需要 GitHub CLI 才能正常運作。
    
    安裝後請執行以下命令登入 GitHub:
      gh auth login
    
    已自動執行 xattr -cr 移除應用程式隔離屬性。
    如果仍出現「此應用程式已損毀」錯誤，請手動執行:
      xattr -cr "#{appdir}/RedPen CI.app"
  EOS
end
