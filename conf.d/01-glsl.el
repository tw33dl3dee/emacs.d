;;; GLSL mode for OpenGL shaders

(add-to-list 'auto-mode-alist '("\\.[fv]s$" . glsl-mode))
(autoload 'glsl-mode "glsl-mode" "Major mode for editing OpenGLSL shader files." t)
