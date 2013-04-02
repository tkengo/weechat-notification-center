def weechat_init
  Weechat.register("weechat-notification-center", "Kengo Tateish", "0.1", "MIT License", "Weechat notify to Notification Center on Mac OS X", "", "")
  Weechat.hook_print("", "", "", 1, "notify_callback", "");
  return Weechat::WEECHAT_RC_OK
end

def notify_callback(data, buffer, date, tags, displayed, highlight, prefix, message)
  if highlight == '1' or tags.split(',').include?('notify_private')
    buffer_name = Weechat.buffer_get_string(buffer, "name")
    cmd = "terminal-notifier -message '#{message}' -title '#{buffer_name}' -subtitle '#{prefix}'"
    Weechat.hook_process(cmd, 10000, "hook_process_cb", "")
  end

  return Weechat::WEECHAT_RC_OK
end

def hook_process_cb(data, command, rc, stdout, stderr)
  return Weechat::WEECHAT_RC_OK
end
