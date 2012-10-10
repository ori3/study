require 'tk'

TkLabel.new {
    text        "hello,world"
    bg          "red"
    pack
}
TkButton.new {
    text        "Close"
    command     { exit }
    pack
}

tk.mainloop

