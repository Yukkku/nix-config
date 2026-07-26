_:
let
  color = import ../color;
in
{
  programs.neovim.initLua = ''
    local highlight = {
        -- 行の文字数の目安で表示するあの線
        ColorColumn = {},
        -- /で検索したときの「今注目してる部分」
        CurSearch = {},
        -- コマンドをミスったなどして一番下の行に出るエラー
        ErrorMsg = {},
        -- 行番号
        LineNr = {},
        -- カーソルの位置の括弧と対になる括弧
        MatchParen = {},
        -- 一番下の行
        MsgArea = {},
        -- エディタの下の行が無い部分を埋めるやつ
        NonText = {},
        -- 全体設定っぽい
        Normal = { bg="none", fg="${color.white.hashHex}" },
        -- 下に出てるファイル名とか書いてるあの線
        StatusLine = { bg="${color.blue.hashHex}" },
        -- v押したときの, 選択してる部分
        Visual = {},

        Comment = { fg="${color.gray.hashHex}", italic=true },
        Constant = { fg="${color.green.hashHex}" },
        String = { fg="${color.green.hashHex}" },
        Statement = { fg="${color.yellow.hashHex}" },
        Type = { fg="${color.cyan.hashHex}" },
        PreProc = { fg="${color.magenta.hashHex}" },
    }
    for group, conf in pairs(highlight) do
        vim.api.nvim_set_hl(0, group, conf)
    end
  '';
}
