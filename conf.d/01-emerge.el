;;; Gentoo emerge syntax

(add-site-load-path "gentoo-syntax")
(modify-coding-system-alist 'file "\\.\\(ebuild\\|eclass\\|eblit\\|eselect\\)\\'" 'utf-8)
(setq ebuild-mode-portdir "/usr/portage")
