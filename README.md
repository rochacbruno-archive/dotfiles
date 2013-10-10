# HOW TO

First clone this repo to your home directory

```
$ cd ~
$ git clone git@github.com:rochacbruno/.emacs.d.git
```

Now you have .emacs.d dorectory and .emacs file


Install emacs for Python.  

https://github.com/gabrielelanaro/emacs-for-python  

```
$ cd ~/.emacs.d
$ git clone git@github.com:gabrielelanaro/emacs-for-python.git
```

If the directory already exists you only need to intialize the github sub-repo

```
$ cd ~/.emacs.d
$ git submodule init
```

# Using emacs and keybindings

# emacs

C = Control
M = Alt (Meta key)

M-x = Alt + x

# file browser
<f8> nav-toggle  
press F8 to open file browser buffer 

## basic  
C-g = abort command  
C-x C-c = Exit  
C-_ | C-x u = Undo  
C-z = iconify / %emacs to get back  
C-x C-z = suspend, back qith "fg"  
M-x shell = bash  
ESC-! = shell command  
C-h b = list of key bindings  
M-! = Shell command  
M-& = async shell command  
M-% = query replace  
M-x global-linum-mode = show line numbers  
C-c C-v = OPen shell buffer  
C-c f = load file  
C-c C-f = load file  
C-x C-k = Kill a buffer    
  
## motion  
  
C-f/M-f = right/forward  
C-b/M-b = left/backward  
C-n = next/down  
C-p = previous/open  
C-e = forward to end of line  
C-a = backward to init of line  
C-o = open new line  
M-a = sentence forward  
M-e = sentence backward  
M-> = forward end of file  
M-< = backward begin of file  
C-v = Page down  
M-v = Page up  
C-l = recenter  
C-M-v = Other window down  
M-g g = go to line  
C-c g = go to line

  
## Copy Paste  
C- SPC = Mark region  
C-c l = Mark Line  
C-w = Cut  
M-w = Copy  
C-y = Paste  
C-c y = Duplicate line  
C-y M-y = Next on clipboard  


  
## windows  
C-x 0 = close current window  
C-x 1 = show only one window  
C-x 2 = Split horizontal  
C-x 3 = Split vertical  
C-x o = Move to other window  
C-x 4 f = Open file another window  
  
C-x k bufname - Kill buffer  
M-x kill-some-buffers  
M-x kill-matching-buffers  


# tab  
M-x tabbar-mode = activate tabs
C-x left | right  
C-x C-left | C-right  
  
## files  
C-x C-f = Find file or create  
C-x C-r = Fine and open read only  
C-x C-q = Toggle read only  
C-x C-s = Save file  
C-x C-w = Write file (save as)  
C-x s = save all windows  
C-x b | C-x C-b = List windows  
C-x d = dired  
  
## find / replace  
C-s = Find  
C-r = Find backward  
C-c s = Find insensitive  
C-c r = Find backward insensitive   
M-x replace-string  
M-x query-replace  

C-q = query replace  
C-c q = regex replace  


  
## delete  
  
M-d = forward one word  
M-DEL = backward one word  
C-k = to end of line  
C-SPC C-a C-w = to start of line  
  
## text  
C-x C-l = downcase marked region  
C-x C-u = uppercade marked region  
C-x C-o = delete blank lines  
C-x C-p = mark the page  
C-x h = mark whole buffer  
C-x i = insert external file  
C-x l = count lines in page  
C-c i = indent marked region
C-c n = Comment marked region
C-c m = Uncomment marked region
 
# splits
C-x 6 2         2C-two-columns
C-x 6 b         2C-associate-buffer
C-x 6 s         2C-split
C-x 6 <f2>      2C-two-columns

