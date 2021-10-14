(setq projectile-globally-ignored-directories
      '(
        "node_modules"
        "dist" "target" "build"
        "logs" "coverage"
        ".cache"
        ".vscode"
        ".settings" "META-INF"
        ".mvn"
        )
      projectile-globally-ignored-files
      '(
        ".DS_Store"
        "TAGS"
        ".project" ".classpath"
        )
      projectile-globally-ignored-file-suffixes
      '(
        ".o"
        ".elc"
        ".pyc"
        ".class"
        ".db"
        ".min.js"
        )
)

(setq projectile-project-search-path
      '("~/code" "~/code_momo")
)
