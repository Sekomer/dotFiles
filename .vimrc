
"========================================="
"====== Remapping ESC ---> CAPSLOCK ======"
"========================================="

au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

"""https://stackoverflow.com/questions/2176532/how-to-map-caps-lock-key-in-vim"""

" tab length "
set tabstop=4



