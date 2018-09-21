;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     ;;; Emacs ---------
     helm
     org
     better-defaults
     ;;; 编辑器 -------
     auto-completion
     (spell-checking :variables
                     ispell-program-name "aspell"
                     ispell-dictionary "american"
                     ispell-alternate-dictionary "~/bin/aspell-conf/english-words.txt"
                     ispell-personal-dictionary "~/bin/aspell-conf/en.pws"
                     spell-checking-enable-by-default nil)
     syntax-checking
     lsp
     ;;; 框架 ---------
     react
     ;;; 源码管理 ------
     git
     ;; (version-control :variables
     ;;                  version-control-global-margin t
     ;;                  version-control-diff-tool 'git-gutter
     ;;                  version-control-global-margin t)
     ;;; 编程语言 -------
     sql
     (emacs-lisp :variables emacs-lisp-hide-namespace-prefix nil)
     plantuml
     graphviz
     yaml
     (markdown :packages (not mmm-mode)
               :variables markdown-live-preview-engine 'vmd)
     shell-scripts
     (python :variables
             python-enable-yapf-format-on-save t
             python-test-runner '(nose pytest))
     (go :variables
         go-tab-width 4
         gofmt-command "goimports"
         go-format-before-save t
         godoc-at-point-function 'godoc-gogetdoc)
     rust
     lua
     html
     javascript
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t
            c-c++-enable-rtags-support t
            c-c++-enable-clang-format-on-save t
            c-c++-enable-google-style t)
     haskell
     protobuf
     csv
     ;;; 工具 --------
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     nginx
     docker
     (gtags :variables gtags-enable-by-default nil)
     command-log
     xclipboard
     tern
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages
   '(
     ob-go  ;; Enable org-babel support for Go
     ob-rust
     edit-indirect
     fzf
     (helm-ag :location (recipe :fetcher github :repo "junhuihuang/emacs-helm-ag"))
     (symbol-overlay :location (recipe :fetcher github :repo "wolray/symbol-overlay"))
     go-playground
     rust-playground
    )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; (setq configuration-layer--elpa-archives
  ;;       '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
  ;;         ("org-cn"   . "http://elpa.emacs-china.org/org/")
  ;;         ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

  ;; https://github.com/nashamri/spacemacs-theme
  ;; (custom-set-variables '(spacemacs-theme-custom-colors
  ;;                         '((bg2 . "#000000")
  ;;                           (highlight . "#5E4E78")
  ;;                           (base . "#CCCCCC"))))

  ;; https://github.com/ardumont/markdown-toc
  ;; (custom-set-variables
  ;;  '(markdown-toc-user-toc-structure-manipulation-fn 'cdr))
  (custom-set-variables '(markdown-toc-user-toc-structure-manipulation-fn
                          (lambda (toc-structure)
                            (--map (-let (((level . label) it))
                                     (cons (- level 1) label))
                                   (cdr toc-structure)))))

  (setq cc-search-directories
        '("../*/include" "../*/inc" "." "/usr/include" "/usr/local/include/*" "../*/src" "../*/source" "$WXWIN/include"))

  (setq helm-move-to-line-cycle-in-source t)
  (setq helm-window-prefer-horizontal-split 'decide)
  (setq helm-switch-to-buffer-ow-vertically 'decide)
  (setq split-width-threshold 160)
  (setq ivy-wrap t)

  ;; http://blog.binchen.org/posts/easy-indentation-setup-in-emacs-for-web-development.html
  (setq-default c-default-style "bsd")
  (setq-default c-basic-offset 4)
  ;; web development
  (setq-default
    ;; js2-mode
    js-indent-level 2
    js2-basic-offset 2
    ;; web-mode
    web-mode-markup-indent-offset 2
    web-mode-css-indent-offset 2
    web-mode-code-indent-offset 2
    web-mode-attr-indent-offset 2)
  (with-eval-after-load 'web-mode
    (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-calls . nil")))

  (setq js2-strict-missing-semi-warning nil)
  (setq js2-strict-trailing-comma-warning nil)

  (setq hi-lock-face-defaults '("hi-green-b" "hi-red-b" "hi-yellow" "hi-green" "hi-black-hb" "hi-blue-b" "hi-pink" "hi-blue" "hi-black-b"))

  (setq plantuml-jar-path
        (expand-file-name "~/bin/plantuml.jar"))
  (setq org-plantuml-jar-path plantuml-jar-path)

  ;; https://emacs-china.org/t/org-mode/597/5
  ;; 必须在 (require 'org) 之前
  (setq org-emphasis-regexp-components
        ;; markup 记号前后允许中文
        (list (concat " \t('\"{"            "[:nonascii:]")
              (concat "- \t.,:!?;'\")}\\["  "[:nonascii:]")
              " \t\r\n,\"'"
              "."
              1))

  (spacemacs|use-package-add-hook org
    :post-config
    (progn
      (add-to-list 'org-babel-load-languages '(ditaa . t))
      (add-to-list 'org-babel-load-languages '(go . t))
      (add-to-list 'org-babel-load-languages '(js . t))
      (add-to-list 'org-babel-load-languages '(rust . t))))

  (setq imenu-max-item-length 160)
  (setq flycheck-gometalinter-deadline "10s")
  (setq flycheck-gometalinter-fast t)
  (setq-default evil-escape-key-sequence "kj")

  (setq tags-add-tables t)
)

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; (setq powerline-default-separator 'utf-8)
  (setq-default tab-width 4)
  (setq lua-indent-level 4)
  (setq lua-indent-string-contents nil)
  (xterm-mouse-mode -1)
  (ido-mode -1)
  (which-function-mode t)
  (setq google-translate-default-target-language "zh-CN")
  (setq tern-command '("tern" "--no-port-file"))

  ;; {{
  ;; https://github.com/emacs-helm/helm/issues/1100
  (defun helm-buffer-switch-new-window (candidate)
    "Display buffers in new windows."
    ;; Select the bottom right window
    ;; (require 'winner)
    ;; (select-window (car (last (winner-sorted-window-list))))
    ;; Display buffers in new windows
    (dolist (buf (helm-marked-candidates))
      (select-window (split-window-below))
      (switch-to-buffer buf))
    ;; (optional) Adjust size of windows
    (balance-windows))

  (defun helm-file-switch-new-window (candidate)
    "Open files in new windows."
    (dolist (buf (helm-marked-candidates))
      (select-window (split-window-below))
      (switch-to-buffer (find-file-noselect buf))))

  (with-eval-after-load 'helm
    (add-to-list 'helm-type-buffer-actions
                 '("Display buffer(s) in new window(s)" .
                   helm-buffer-switch-new-window))
    (add-to-list 'helm-find-files-actions
                 '("Open file(s) below window(s)" .
                   helm-file-switch-new-window))
    (add-to-list 'helm-type-file-actions
                 '("Open file(s) below window(s)" .
                   helm-file-switch-new-window)))
  ;; }}

  ;; https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-misc.el
  ;; {{
  (autoload 'popup-tip "popup")

  (defun my-which-function ()
    "Return current function name."
    ;; clean the imenu cache
    ;; @see http://stackoverflow.com/questions/13426564/how-to-force-a-rescan-in-imenu-by-a-function
    (setq imenu--index-alist nil)
    (which-function))

  (defun popup-which-function ()
    (interactive)
    (let ((msg (my-which-function)))
      (popup-tip msg)))

  ;; }}
  (spaceline-toggle-which-function-off)

  (evil-leader/set-key "w p f" 'popup-which-function)

  ;; https://github.com/syl20bnr/spacemacs/issues/6520
  (clean-aindent-mode -1)

  ;; {
  ;; Chrome as default browser
  (cond ((spacemacs/system-is-linux)
          (setq-default browse-url-browser-function 'browse-url-generic
                        browse-url-generic-program "google-chrome")))
  ;; }

  (define-key evil-hybrid-state-map (kbd "M-n") 'evil-complete-next)
  (define-key evil-hybrid-state-map (kbd "M-p") 'evil-complete-previous)
  (define-key evil-hybrid-state-map (kbd "M-y") 'evil-copy-from-above)
  (define-key evil-hybrid-state-map (kbd "C-w") 'evil-delete-backward-word)
  ;; https://github.com/syl20bnr/spacemacs/issues/9739
  (define-key evil-hybrid-state-map (kbd "C-j") 'company-manual-begin)
  (define-key evil-insert-state-map (kbd "M-n") 'evil-complete-next)
  (define-key evil-insert-state-map (kbd "M-p") 'evil-complete-next)
  (define-key evil-normal-state-map (kbd "C-n") 'next-error)
  (define-key evil-normal-state-map (kbd "C-p") 'previous-error)

  (define-key evil-motion-state-map (kbd "%") 'evilmi-jump-items)

  (progn
    (spacemacs/set-leader-keys-for-major-mode 'c++-mode
      "gd" 'ggtags-find-definition
      "gr" 'ggtags-find-reference
      "gt" 'ggtags-find-tag-dwim
      "gp" 'ggtags-prev-mark
      "go" 'ff-find-other-file
      "bf" 'beginning-of-defun
      "ef" 'end-of-defun)
    (spacemacs/set-leader-keys-for-major-mode 'c-mode
      "gd" 'ggtags-find-definition
      "gr" 'ggtags-find-reference
      "gt" 'ggtags-find-tag-dwim
      "gp" 'ggtags-prev-mark
      "go" 'ff-find-other-file
      "bf" 'beginning-of-defun
      "ef" 'end-of-defun)
    )

  ;; https://github.com/syl20bnr/spacemacs/issues/4243
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "C-w") 'spacemacs/backward-kill-word-or-region))
  (with-eval-after-load 'helm
    (define-key helm-map (kbd "C-c C-w") 'spacemacs/backward-kill-word-or-region)
    (define-key helm-map (kbd "C-c C-r") 'helm-show-kill-ring)
    (define-key helm-map (kbd "C-k") 'kill-line)
    (define-key helm-map (kbd "C-c C-c") 'helm-xclipboard-copy))

  (defun helm-xclipboard-copy (arg)
    "copy text in helm minibuffer"
    (interactive "P")
    (with-helm-alive-p
      (helm-run-after-exit
       (lambda (sel)
         (when (spacemacs/system-is-mac) (shell-command (format "echo -n %s | pbcopy" (shell-quote-argument sel))))
         (when (spacemacs/system-is-linux) (shell-command (format "echo -n %s | xsel -ib" (shell-quote-argument sel))))
         (prog1 nil (message "Copied to clipboard: %s" sel) (sit-for 1)))
       (format "%s" (helm-get-selection nil (not arg))))))
  (put 'helm-xclipboard-copy 'helm-only t)

  (with-eval-after-load 'go-playground
    (define-key go-playground-mode-map (kbd "C-c C-c") 'go-playground-exec))

  ;;;; 多窗口高亮 --------------------------------------------------------------
  ;;;; {
  ;; list to store what had been highlighted
  (defvar highlight-list* nil)

  (defun unhighlight-all-of-a-window (win)
    "Clear all highlight of current buffer, called by
`unhighlit-windows-all' when iterating all windows. When a
buffer is being burry, this funciton also will be called to
clear all highlight"
    (select-window win)
    (dolist (item highlight-list*)
      (unhighlight-regexp (regexp-quote item))))

  (defun unhighlit-windows-all ()
    "Clear all highlights of all windows "
    (interactive)
    ;; 1) walk all windows and unhighlight all
    (walk-windows 'unhighlight-all-of-a-window)
    ;; 2) clear *highlight-list* to nil
    (setq highlight-list* nil))

  (defun highlight-windows-toogle ()
    (interactive)
    (let ((thing-to-highlight ; get what to search
           (if (use-region-p) ; 1) region active, use region content
               (buffer-substring-no-properties
                (region-beginning) (region-end))
             (if (thing-at-point 'symbol)
                 (buffer-substring-no-properties
                  (car (bounds-of-thing-at-point 'symbol))
                  (cdr (bounds-of-thing-at-point 'symbol)))))))
      (if (stringp thing-to-highlight)
          ;; toogle highlight, 2 cases
          ;; 1) thing already unlighlight and stored in list, unhighight it
          ;; 2) new highlight, highlight it and add it to list
          (if (member thing-to-highlight highlight-list*)
              (progn ; 1)
                ;; 1.1) delete it from list
                (setq highlight-list*
                      (delete thing-to-highlight highlight-list*))
                ;; 1.2) unhighlight it
                (walk-windows
                 (lambda (win)
                   (select-window win)
                   (unhighlight-regexp
                    (regexp-quote thing-to-highlight)))))
            (progn ; 2)
              (push thing-to-highlight highlight-list*)
              (walk-windows
               (lambda (win)
                 (select-window win)
                 (highlight-regexp
                  (regexp-quote (car highlight-list*))))
               'ignore-minibuffer)))
        (message "No vaidate region, or no validate symbol under curosr!"))))
  ;;; }

;;{{
;; http://stackoverflow.com/questions/8257009/emacs-insert-word-at-point-into-replace-string-query
  (defun my-minibuffer-insert-word-at-point ()
    "Get word at point in original buffer and insert it to minibuffer."
    (interactive)
    (let (word beg)
      (with-current-buffer (window-buffer (minibuffer-selected-window))
        (save-excursion
          (skip-syntax-backward "w_")
          (setq beg (point))
          ;; (skip-syntax-forward "w_ ")
          (skip-chars-forward "-/_.a-zA-z0-9")
          (setq word (buffer-substring-no-properties beg (point)))))
      (when word
        (insert word))))
  (defun my-minibuffer-setup-hook ()
    (local-set-key (kbd "C-d") 'my-minibuffer-insert-word-at-point))

  (add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)
;; }}

  ;; {{
  ;; https://github.com/syl20bnr/spacemacs/issues/2222
  (defun copy-to-clipboard()
    "Copies selection to x-clipboard."
    (interactive)
    (if (display-graphic-p)
        (progn
          (message "Yanked region to x-clipboard!")
          (call-interactively 'clipboard-kill-ring-save)
          )
      (if (region-active-p)
          (progn
            (when (spacemacs/system-is-mac)
                (shell-command-on-region (region-beginning) (region-end) "pbcopy"))
            (when (spacemacs/system-is-linux)
                (shell-command-on-region (region-beginning) (region-end) "xsel -i -b"))
            (message "Yanked region to clipboard!")
            (deactivate-mark))
        (message "No region active; can't yank to clipboard!")))
    )
  (defun paste-from-clipboard()
    "Pastes from x-clipboard."
    (interactive)
    (if (display-graphic-p)
        (progn
          (clipboard-yank)
          (message "graphics active")
          )
      (when (spacemacs/system-is-mac) (insert (shell-command-to-string "pbpaste")))
      (when (spacemacs/system-is-linux) (insert (shell-command-to-string "xsel -o -b")))
      )
    )
  (evil-leader/set-key "o y" 'copy-to-clipboard)
  (evil-leader/set-key "o p" 'paste-from-clipboard)
  ;; }}
  (evil-leader/set-key "o h" 'symbol-overlay-put)
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "M-n") 'symbol-overlay-jump-next)
    (define-key map (kbd "M-p") 'symbol-overlay-jump-prev)
    (define-key map (kbd "r") 'symbol-overlay-rename)
    (setq symbol-overlay-map map))

  ;; https://emacs.stackexchange.com/questions/30797/imenu-is-missing-multi-line-golang-function-signatures
  (defun my-go-mode-hook()
    (setq imenu-generic-expression
          '(("type" "^[ \t]*type *\\([^ \t\n\r\f]*[ \t]*\\(struct\\|interface\\)\\)" 1)
            ("func" "^func *\\(.*\\)" 1)))
    )
  (add-hook 'go-mode-hook 'my-go-mode-hook)

  ;; Bind <SPC f z> to fzf fuzzy find in CWD, and <SPC f Z> for a manual directory.
  ;; We disable colors so that the display looks good on any Emacs theme,
  ;; and we move the fzf prompt up by 1 row to fix a rendering bug in ansi-term.
  ;; Note that you simply press <C-c C-c> to gently exit fzf if you want to abort.
  (setq fzf/args "-e -x --color bw --print-query")
  (evil-leader/set-key "f z" 'fzf)
  (evil-leader/set-key "f Z" 'fzf-directory)

  (progn
    ;; Git Gutter
    ;; (set-face-attribute
    ;;  'git-gutter:added nil :background nil :foreground "green")
    ;; (set-face-attribute
    ;;  'git-gutter:deleted nil :background nil :foreground "red")
    ;; (set-face-attribute
    ;;  'git-gutter:modified nil :background nil :foreground "blue")

    (setq-default
     git-gutter:modified-sign "!"
     ))

  (setq go-packages-function 'go-packages-gopkgs)

  (defun go-packages-gopkgs ()
    "Return a list of all Go packages, using 'gopkgs'."
    (process-lines "gopkgs"))

  (defun layout-double-columns-focus ()
    " Set the layout to double columns and focus"
    (interactive)
    (delete-other-windows)
    (split-window-right)
    (select-window (winum-get-window-by-number 2)))

  (evil-leader/set-key "o 2" 'layout-double-columns-focus)

  (defconst my-protobuf-style
    '((c-basic-offset . 2)
      (indent-tabs-mode . nil)
      (c-auto-newline . nil)))

  (add-hook 'protobuf-mode-hook
            (lambda () (c-add-style "my-style" my-protobuf-style t)))

  (add-hook 'protobuf-mode-hook 'smartparens-mode)

  (add-hook 'lsp-ui-mode-hook
            (lambda () (lsp-ui-doc-mode -1)))

  (add-to-list 'spacemacs-large-file-modes-list 'tags-table-mode)

  (add-hook 'prog-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-toc-user-toc-structure-manipulation-fn
   (lambda
     (toc-structure)
     (--map
      (-let
          (((level . label)
            it))
        (cons
         (- level 1)
         label))
      (cdr toc-structure))))
 '(package-selected-packages
   '(yasnippet-snippets rjsx-mode lsp-ui lsp-go flyspell-correct-helm flyspell-correct evil-mc evil-matchit evil-escape evil-args dumb-jump doom-modeline dockerfile-mode docker dante company-lsp counsel ivy iedit smartparens rtags htmlize haskell-mode company yasnippet multiple-cursors avy typescript-mode lsp-mode projectile magit git-commit ghub treepy graphql dash evil org-plus-contrib hydra yapfify yaml-mode xterm-color ws-butler with-editor winum which-key web-mode web-beautify volatile-highlights vmd-mode vi-tilde-fringe uuidgen use-package unfill undo-tree toml-mode toc-org tagedit tablist symon symbol-overlay swiper string-inflection sql-indent spaceline-all-the-icons smeargle slim-mode shrink-path shell-pop scss-mode sass-mode rust-playground restart-emacs rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort pug-mode protobuf-mode prettier-js popwin plantuml-mode pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file ob-rust ob-go nginx-mode neotree nameless mwim multi-term move-text markdown-toc magit-svn magit-gitflow macrostep lsp-python lsp-javascript-typescript lorem-ipsum livid-mode live-py-mode link-hint lcr json-navigator json-mode js2-refactor js-doc intero insert-shebang indent-guide importmagic impatient-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-mode-manager helm-make helm-hoogle helm-gtags helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets graphviz-dot-mode goto-chg google-translate google-c-style golden-ratio godoctor go-tag go-rename go-playground go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md ggtags fzf fuzzy font-lock+ flycheck-rust flycheck-rtags flycheck-pos-tip flycheck-haskell flycheck-bashate flx-ido fish-mode fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-ediff evil-cleverparens evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav eldoc-eval editorconfig edit-indirect dotenv-mode docker-tramp disaster diminish define-word cython-mode csv-mode counsel-projectile company-web company-tern company-statistics company-shell company-rtags company-lua company-go company-ghci company-ghc company-cabal company-c-headers company-anaconda command-log-mode column-enforce-mode cmm-mode clean-aindent-mode clang-format centered-cursor-mode cargo auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent ace-window ace-link ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
