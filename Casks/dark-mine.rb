cask "dark-mine" do
  version "0.2.0"
  sha256 "20b67344bf43dda4953c1f28e07550d8c78222bf7f50bad396a847c28b3f2368"

  url "https://github.com/Jackson-Pike/homebrew-dark-mine/releases/download/v#{version}/DarkMine-Mac.zip"
  name "Dark Mine"
  desc "First-person mining game where blind creatures hunt by sound"
  homepage "https://github.com/Jackson-Pike/homebrew-dark-mine"

  app "Dark Mine.app"

  # Not signed with a paid Apple developer account: clear the "downloaded" flag so macOS lets it open.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Dark Mine.app"]
  end

  zap trash: [
    "~/Library/Application Support/Jackson Pike/Dark Mine",
    "~/Library/Preferences/unity.Jackson Pike.Dark Mine.plist",
  ]
end
