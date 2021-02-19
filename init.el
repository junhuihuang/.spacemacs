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
     ivy
     (org :variables org-enable-github-support t)
     better-defaults
     ;;; 编辑器 -------
     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t)
     (spell-checking :variables
                     ispell-program-name "aspell"
                     ispell-dictionary "american"
                     ispell-personal-dictionary "~/.spacemacs.d/.aspell.en.pws"
                     spell-checking-enable-by-default nil)
     syntax-checking
     lsp
     ;;; 框架 ---------
     react
     ;;; 源码管理 ------
     git
     (version-control :variables
                      version-control-global-margin nil)
     ;;; 编程语言 -------
     (emacs-lisp :variables emacs-lisp-hide-namespace-prefix nil)
     plantuml
     graphviz
     yaml
     (markdown
               :variables markdown-live-preview-engine 'vmd)
     shell-scripts
     ipython-notebook
     (python :variables
             python-enable-yapf-format-on-save t
             python-test-runner '(nose pytest)
             python-backend 'lsp
             python-lsp-server 'pyls)
     (go :variables
         go-tab-width 4
         gofmt-command "goimports"
         go-format-before-save t
         go-backend 'lsp
         godoc-at-point-function 'godoc-gogetdoc
         go-use-golangci-lint t)
     (rust :variables
           rust-format-on-save t
           rust-backend 'racer)
     lua
     html
     javascript
     (typescript :variables
                 typescript-fmt-on-save t
                 typescript-fmt-tool 'prettier
                 typescript-indent-level 2)
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            ;; c-c++-enable-clang-support t
            c-c++-enable-clang-format-on-save t
            ;; c-c++-enable-rtags-support t
            ;; c-c++-enable-rtags-completion nil
            c-c++-enable-google-style t
            c-c++-enable-c++11 t
            c-c++-adopt-subprojects t
            c-c++-backend 'lsp-ccls
            c-c++-lsp-enable-semantic-highlight 'rainbow)
     haskell
     protobuf
     csv
     sql
     ;;; 工具 --------
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     nginx
     docker
     ;; gtags
     command-log
     xclipboard
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
     (symbol-overlay :location (recipe :fetcher github :repo "wolray/symbol-overlay"))
     go-playground
     rust-playground
     edit-indirect
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

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

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

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1 1024 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

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

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

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
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

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

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10.0
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
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

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

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

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
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
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

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

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
  (setq use-package-inject-hooks t)
  (setq package-check-signature nil)
  (custom-set-variables '(markdown-toc-user-toc-structure-manipulation-fn
                          (lambda (toc-structure)
                            (--map (-let (((level . label) it))
                                     (cons (- level 1) label))
                                   (cdr toc-structure)))))

  (setq cc-search-directories
        '("../*/include" "../*/inc" "." "/usr/include" "/usr/local/include/*" "../*/src" "../*/source" "$WXWIN/include"))

  (setq split-width-threshold 150)
  (setq split-height-threshold nil)
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

  (setq imenu-max-item-length 256)
  (setq flycheck-gometalinter-deadline "10s")
  (setq flycheck-gometalinter-fast t)
  (setq-default evil-escape-key-sequence "kj")

  (setq tags-add-tables t)

  (setq dumb-jump-prefer-searcher 'rg)

  (setq ivy-count-format "(%d/%d) ")

  (when (>= emacs-major-version 27)
    (setq xref-show-definitions-function #'ivy-xref-show-defs))
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
  (setq lsp-file-watch-threshold 50000)
  (require 'org-tempo)
  (setq-default tab-width 4)
  (setq lua-indent-level 4)
  (setq lua-indent-string-contents nil)
  (xterm-mouse-mode -1)
  (ido-mode -1)
  (which-function-mode t)
  (setq google-translate-default-target-language "zh-CN")

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

  ;; https://github.com/syl20bnr/spacemacs/issues/4243
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "C-w") 'spacemacs/backward-kill-word-or-region))

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

  (evil-leader/set-key "o h" 'symbol-overlay-put)
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "M-n") 'symbol-overlay-jump-next)
    (define-key map (kbd "M-p") 'symbol-overlay-jump-prev)
    (define-key map (kbd "r") 'symbol-overlay-rename)
    (setq symbol-overlay-map map))

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

  (add-to-list 'spacemacs-large-file-modes-list 'tags-table-mode)

  (add-hook 'prog-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

  ;; https://stackoverflow.com/questions/19907939/how-can-one-quickly-browse-through-lots-of-files-in-emacs/19933337#19933337
  ;; little modification to dired-mode that let's you browse through lots of files
  (add-hook 'dired-mode-hook
            (lambda()
              (define-key dired-mode-map (kbd "C-o") 'dired-view-current)     ; was dired-display-file
              (define-key dired-mode-map (kbd "n")   'dired-view-next)           ; was dired-next-line
              (define-key dired-mode-map (kbd "p")   'dired-view-previous))) ; was dired-previous-line

  ;; https://github.com/syl20bnr/spacemacs/issues/12740
  (add-hook 'cython-mode-hook
            (lambda ()
              (which-function-mode -1)))

  (defun dired-view-next ()
    "Move down one line and view the current file in another window."
    (interactive)
    (dired-next-line 1)
    (dired-view-current))

  (defun dired-view-previous ()
    "Move up one line and view the current file in another window."
    (interactive)
    (dired-previous-line 1)
    (dired-view-current))

  (defun dired-view-current ()
    "View the current file in another window (possibly newly created)."
    (interactive)
    (if (not (window-parent))
        (split-window))                                   ; create a new window if necessary
    (let ((file (dired-get-file-for-visit))
          (dbuffer (current-buffer)))
      (other-window 1)                                          ; switch to the other window
      (unless (equal dbuffer (current-buffer))                 ; don't kill the dired buffer
        (if (or view-mode (equal major-mode 'dired-mode))   ; only if in view- or dired-mode
            (kill-buffer)))                                                    ; ... kill it
      (let ((filebuffer (get-file-buffer file)))
        (if filebuffer                              ; does a buffer already look at the file
            (switch-to-buffer filebuffer)                                    ; simply switch
          (view-file file))                                                    ; ... view it
        (other-window -1))))                   ; give the attention back to the dired buffer

  (add-hook 'lsp-ui-mode-hook
            (lambda () (lsp-ui-doc-mode -1) (lsp-ui-sideline-mode -1)))

  ;; https://stackoverflow.com/questions/15869131/emacs-shell-command-on-buffer
  (defun shell-command-on-buffer (command)
    (interactive "sShell command on buffer: ")
    (shell-command-on-region (point-min) (point-max) command nil))

  ;; https://github.com/abo-abo/swiper/issues/2712
  (defun counsel-git-grep-action-new-window (x)
    "Like `counsel-git-grep-action', but use another window."
    (select-window (split-window-right))
    (counsel-git-grep-action x))

  (defun counsel-git-grep-action-horizontal-window (x)
    "Like `counsel-git-grep-action', but use another window."
    (select-window (split-window-vertically))
    (counsel-git-grep-action x))

  (ivy-set-actions
   'counsel-rg
   '(("j" counsel-git-grep-action-new-window "other window")
     ("s" counsel-git-grep-action-horizontal-window "in horizontal split")))

  (defun ivy-xref-action-right-window (x)
    "open candidate file in the new window"
    (select-window (split-window-right))
    (let* ((marker (xref-location-marker (cdr x)))
           (buf (marker-buffer marker)))
      (xref--show-pos-in-buf marker buf)))

  (defun ivy-xref-action-horizontal-window (x)
    "open candidate file in the new window"
    (select-window (split-window-vertically))
    (let* ((marker (xref-location-marker (cdr x)))
           (buf (marker-buffer marker)))
      (xref--show-pos-in-buf marker buf)))

  (ivy-set-actions
   'ivy-xref-show-xrefs
   '(("j" ivy-xref-action-right-window "other window")
     ("s" ivy-xref-action-horizontal-window "in horizontal split")))

  (with-eval-after-load 'ivy
    (define-key ivy-minibuffer-map (kbd "C-c o") 'ivy-dispatching-done)
    (define-key ivy-minibuffer-map (kbd "C-c C-c") 'ivy-call-and-recenter)
    (define-key ivy-minibuffer-map (kbd "TAB") 'ivy-partial)
    (define-key ivy-minibuffer-map (kbd "C-q") 'ivy-avy)
    (setq ivy-on-del-error-function #'ignore))

  (defun copy-directory-path-to-xclipboard ()
    (interactive)
    (spacemacs/copy-directory-path)
    ((lambda (sel)
      (when (spacemacs/system-is-mac) (shell-command (format "echo -n %s | pbcopy" (shell-quote-argument sel))))
      (when (spacemacs/system-is-linux) (shell-command (format "echo -n %s | xsel -ib" (shell-quote-argument sel))))
      (prog1 nil (message "Copied to clipboard: %s" sel) (sit-for 1)))(current-kill 0)))

  (defun copy-buffer-name-to-xclipboard ()
    (interactive)
    (spacemacs/copy-buffer-name)
    ((lambda (sel)
       (when (spacemacs/system-is-mac) (shell-command (format "echo -n %s | pbcopy" (shell-quote-argument sel))))
       (when (spacemacs/system-is-linux) (shell-command (format "echo -n %s | xsel -ib" (shell-quote-argument sel))))
       (prog1 nil (message "Copied to clipboard: %s" sel) (sit-for 1)))(current-kill 0)))

  (evil-leader/set-key "f x d" 'copy-directory-path-to-xclipboard)
  (evil-leader/set-key "f x f" 'copy-buffer-name-to-xclipboard)
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
   '(sqlup-mode ob-ipython ein request-deferred websocket yasnippet-snippets yapfify yaml-mode xterm-color ws-butler writeroom-mode winum which-key web-mode web-beautify volatile-highlights vmd-mode vi-tilde-fringe uuidgen use-package unfill treemacs-projectile treemacs-evil toml-mode toc-org tagedit symon symbol-overlay string-inflection sql-indent spaceline-all-the-icons smeargle slim-mode shell-pop scss-mode sass-mode rust-playground rjsx-mode restart-emacs rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort pug-mode protobuf-mode prettier-js popwin plantuml-mode pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file ob-rust ob-go nginx-mode nameless mwim multi-term move-text mmm-mode markdown-toc magit-svn magit-gitflow macrostep lsp-ui lsp-rust lorem-ipsum livid-mode live-py-mode link-hint json-navigator js2-refactor js-doc insert-shebang indent-guide importmagic impatient-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-mode-manager helm-make helm-hoogle helm-gtags helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets graphviz-dot-mode google-translate google-c-style golden-ratio godoctor go-tag go-rename go-playground go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md ggtags fzf fuzzy font-lock+ flyspell-correct-helm flycheck-rust flycheck-rtags flycheck-pos-tip flycheck-haskell flycheck-bashate flx-ido fish-mode fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav editorconfig edit-indirect dumb-jump dotenv-mode doom-modeline dockerfile-mode docker disaster diminish define-word cython-mode csv-mode cquery counsel-projectile company-web company-tern company-statistics company-shell company-rtags company-lua company-lsp company-go company-ghci company-cabal company-c-headers company-anaconda command-log-mode column-enforce-mode cmm-mode clean-aindent-mode clang-format centered-cursor-mode ccls cargo auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent ace-link ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
