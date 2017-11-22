;; -*- mode: emacs-lisp -*-
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
   '(graphviz
     plantuml
     sql
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     ;;; Emacs ---------
     org
     better-defaults
     emacs-lisp
     ;;; 插件 ---------
     (gtags :disabled-for clojure emacs-lisp javascript latex python shell-scripts)
     ;;; 检查器 -------
     (spell-checking :variables
                     ispell-program-name "aspell"
                     ispell-dictionary "american"
                     ispell-alternate-dictionary "~/bin/aspell-conf/english-words.txt"
                     ispell-personal-dictionary "~/bin/aspell-conf/en.pws"
                     spell-checking-enable-by-default nil)
     syntax-checking
     ;;; 框架 ---------
     react
     ;;; 源码管理 ------
     git
     ;; (version-control :variables
     ;;                  version-control-diff-tool 'diff-hl
     ;;                  version-control-diff-side 'left)
     yaml
     (markdown :variables
               markdown-live-preview-engine 'vmd)
     ;;; 编程语言 -------
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     (python :variables
             python-test-runner '(nose pytest))
     (go :variables
         go-tab-width 4
         gofmt-command "goimports")
     lua
     html
     javascript
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode)
     docker
     (gtags :variables gtags-enable-by-default nil)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     ob-go  ;; Enable org-babel support for Go
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
   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default nil)
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
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
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         spacemacs-dark
                         molokai
                         spacemacs-light
                         solarized-dark)
   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
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
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
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
   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'source
   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil
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
   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
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
   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
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
   dotspacemacs-pretty-docs nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; (setq configuration-layer--elpa-archives
  ;;       '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
  ;;         ("org-cn"   . "http://elpa.emacs-china.org/org/")
  ;;         ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

  ;; https://github.com/nashamri/spacemacs-theme
  (custom-set-variables '(spacemacs-theme-custom-colors
                          '((bg2 . "#000000")
                            (highlight . "#5E4E78")
                            (base . "#CCCCCC"))))

  (setq cc-search-directories
        '("../*/include" "../*/inc" "." "/usr/include" "/usr/local/include/*" "../*/src" "../*/source" "$WXWIN/include"))

  (setq helm-move-to-line-cycle-in-source t)
  (setq helm-window-prefer-horizontal-split 'decide)
  (setq helm-switch-to-buffer-ow-vertically 'decide)
  (setq split-width-threshold 80)
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
      (add-to-list 'org-babel-load-languages '(go . t))))

  (setq imenu-max-item-length 160)
  (setq flycheck-gometalinter-deadline "10s")
  (setq flycheck-gometalinter-fast t)
)

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq powerline-default-separator 'utf-8)
  (setq-default tab-width 4)
  (setq lua-indent-level 4)
  (setq lua-indent-string-contents nil)
  (xterm-mouse-mode -1)
  (ido-mode -1)
  (which-function-mode t)

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

  (spacemacs/set-leader-keys
    "jt" 'avy-goto-char-timer)

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
    (define-key helm-map (kbd "C-w") 'spacemacs/backward-kill-word-or-region))

  ;;;; layout
  (spacemacs|define-custom-layout "@doc"
    :binding "d"
    :body
    (spacemacs/find-user-init-file))
  (spacemacs|define-custom-layout "@third"
    :binding "t"
    :body
    (spacemacs/find-user-init-file))
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
          (skip-syntax-forward "w_")
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

  ;; https://emacs.stackexchange.com/questions/30797/imenu-is-missing-multi-line-golang-function-signatures
  (defun my-go-mode-hook()
    (setq imenu-generic-expression
          '(("type" "^[ \t]*type *\\([^ \t\n\r\f]*[ \t]*\\(struct\\|interface\\)\\)" 1)
            ("func" "^func *\\(.*\\)" 1)))
    )
  (add-hook 'go-mode-hook 'my-go-mode-hook)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
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
 '(package-selected-packages
   (quote
    (molokai-theme yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vmd-mode vi-tilde-fringe uuidgen use-package unfill toc-org tagedit symon string-inflection sql-indent spaceline solarized-theme smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs realgud rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin plantuml-mode pip-requirements persp-mode pcre2el password-generator paradox orgit org-projectile org-present org-pomodoro org-download org-bullets org-brain open-junk-file ob-go neotree mwim multi-term move-text monokai-theme mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode js2-refactor js-doc info+ indent-guide impatient-mode hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag graphviz-dot-mode google-translate golden-ratio godoctor go-rename go-guru go-eldoc gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md ggtags fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav editorconfig edit-indirect dumb-jump dockerfile-mode docker disaster define-word cython-mode company-web company-tern company-statistics company-lua company-go company-c-headers company-anaconda column-enforce-mode coffee-mode cmake-mode cmake-ide clean-aindent-mode clang-format auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
