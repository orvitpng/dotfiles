{
  programs.firefox = {
    enable = true;
    profiles.default.settings = {
      "app.shield.optoutstudies.enabled" = false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
      "browser.newtabpage.activity-stream.showSponsored" = false;
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      "browser.toolbars.bookmarks.visibility" = "never";
      "datareporting.healthreport.uploadEnabled" = false;
      "dom.security.https_only_mode" = true;
      "extensions.pocket.enabled" = false;
      "privacy.donottrackheader.enabled" = true;
      "signon.rememberSignons" = false;
    };
  };
}
