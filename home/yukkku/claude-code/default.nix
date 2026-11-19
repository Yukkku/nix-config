{ config, ... }:
{
  programs.claude-code = {
    enable = true;
    # upstream デフォルト (~/.claude) と異なる場所を指定すると
    # CLAUDE_CONFIG_DIR が自動で export され, ~/.claude.json もこの中に置かれる.
    # (Impermanence でディレクトリごと永続化するため)
    configDir = "${config.xdg.configHome}/claude";
  };
}
