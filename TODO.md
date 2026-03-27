# Todo

- diff-tool selection is consistent with `git help difftool`
- Command line args are consistent with `git dif`
  Use -t and --tool, NOT -d
  See: git difftool --tool-help

# Starter code

```bash
get_git_difftool() {
    # Check if --tool argument is provided in command line arguments
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -t|--tool)
                echo "$2"
                return 0
                ;;
            *) shift ;;
        esac
    done

    # Check if GIT_DIFF_TOOL environment variable is set
    if [[ -n "$GIT_DIFF_TOOL" ]]; then
        echo "$GIT_DIFF_TOOL"
        return 0
    fi

    # Fallback to the configured diff.tool in git config
    git_config_tool="$(git config --get diff.tool)"
    if [[ -n "$git_config_tool" ]]; then
        echo "$git_config_tool"
        return 0
    fi

    # Default return if no tool is set (to avoid empty return)
    echo "default-diff-tool"  # Replace this with the actual default tool if needed
}
```

## Emacs

;; Local Variables:
;; eval: (apheleia-mode nil)
;; eval: (apheleia-mode nil)

;; eval: (apheleia-mode +1)
;; eval: (apheleia-mode 0)
;; eval: (apheleia-mode -1)

;; eval: (bound-and-true-p aphelia-mode)
;; eval: (apheleia-mode)

;; eval: (apheleia-mode-with-elisp-conventions nil)
;; End:
