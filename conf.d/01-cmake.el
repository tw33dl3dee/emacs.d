;;; CMake mode 

(autoload 'cmake-mode "cmake-mode" "major-mode for editing CMake sources" t)
(add-to-list 'auto-mode-alist '("\\(CMakeLists\\.txt\\|\\.cmake\\)$" . cmake-mode))

