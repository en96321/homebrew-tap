# Scorpio 智慧注音（由 ScorpioMac/tools/release_brew.sh 產生，版本與 sha256 會自動更新）
cask "scorpio-ime" do
  version "0.2.6"
  sha256 "44023ec2b07ed91c969938acdf12d406acd2b204faefc7084072ec22d7ede528"

  url "https://github.com/en96321/homebrew-tap/releases/download/scorpio-ime-#{version}/ScorpioMac-#{version}.zip"
  name "Scorpio 智慧注音"
  desc "整句選字的注音輸入法（大千鍵盤、個人學習、Caps Lock 切換 ABC）"
  homepage "https://github.com/en96321/homebrew-tap"

  depends_on macos: :ventura

  input_method "ScorpioMac.app"

  # 沒有公證：裝進去之前先清掉下載的隔離標記（還在暫存目錄時）
  preflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "ScorpioMac.app"], chdir: "."
  end

  # 換掉正在跑的舊版，註冊、啟用輸入法
  postflight_steps do
    terminate_process "ScorpioIME"
    run "Library/Input Methods/ScorpioMac.app/Contents/MacOS/ScorpioIME",
        base:           :home,
        args:           ["--install"],
        writable_paths: ["Library/Input Methods/ScorpioMac.app"],
        writable_base:  :home
  end

  uninstall_preflight_steps do
    terminate_process "ScorpioIME"
  end

  zap trash: [
    "~/Library/Application Support/ScorpioMac",
    "~/Library/Logs/ScorpioMac",
    "~/Library/Preferences/com.p3dro.inputmethod.ScorpioMac.plist",
  ]

  caveats <<~EOS
    安裝後：
      1. 系統設定 → 鍵盤 → 輸入方式 → 編輯 →「＋」→ 繁體中文 → 加入「Scorpio 智慧注音」
      2. 想用 Caps Lock 切中英：同一頁打開「使用大寫鎖定鍵切換 ABC 輸入方式」
      3. 建議登出再登入（或把開著的 App 重開），舊的 App 才切得到新的輸入法、Caps Lock 才會正常切換

    更新：
      brew update && brew upgrade --cask scorpio-ime
  EOS
end
