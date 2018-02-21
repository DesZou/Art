
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(cua-mode t)
(column-number-mode t)
(line-number-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(load-theme 'leuven)
(electric-pair-mode t)
(global-linum-mode t)
(global-hl-line-mode t)
(set-default-font "Courier 10 Pitch-12")
(setq-default c-basic-offset 4)
(setq-default c-default-style "k&r")
(setq-default cursor-type 'bar)
(setq-default indent-tabs-mode nil)
(setq-default inhibit-splash-screen t)
