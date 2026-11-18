cask "dark-mine" do
  version "0.1.1"
  sha256 "dc04f79f02c6c50cb94e38bdf6f3e14a06113ebaa423576d449feb1baf373161"

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
