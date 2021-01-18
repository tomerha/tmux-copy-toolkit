#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# copytk prefix: easymotion action bindings
tmux bind-key -T copytk s run-shell -b "python3 $CURRENT_DIR/copytk.py easymotion-search --search-nkeys 1"
tmux bind-key -T copytk S run-shell -b "python3 $CURRENT_DIR/copytk.py easymotion-search --search-nkeys 2"
tmux bind-key -T copytk k run-shell -b "python3 $CURRENT_DIR/copytk.py easymotion-lines --search-direction backward"
tmux bind-key -T copytk j run-shell -b "python3 $CURRENT_DIR/copytk.py easymotion-lines --search-direction forward"
tmux bind-key -T copytk n run-shell -b "python3 $CURRENT_DIR/copytk.py easymotion-lines"

# copy mode: easymotion action bindings
tmux bind-key -T copy-mode-vi s run-shell -b "python3 $CURRENT_DIR/copytk.py easymotion-search --search-nkeys 1"
tmux bind-key -T copy-mode s run-shell -b "python3 $CURRENT_DIR/copytk.py easymotion-search --search-nkeys 1"

# copytk prefix: easycopy action bindings
tmux bind-key -T copytk y run-shell -b "python3 $CURRENT_DIR/copytk.py easycopy --search-nkeys 1"
tmux bind-key -T copytk Y run-shell -b "python3 $CURRENT_DIR/copytk.py easycopy --search-nkeys 2"

# tmux prefix: easycopy action bindings
tmux bind-key -T prefix S run-shell -b "python3 $CURRENT_DIR/copytk.py easycopy --search-nkeys 1"
tmux bind-key -T prefix C-s run-shell -b "python3 $CURRENT_DIR/copytk.py easycopy --search-nkeys 1"

# tmux prefix: quickcopy action bindings
tmux bind-key -T prefix Q run-shell -b "python3 $CURRENT_DIR/copytk.py quickcopy"
tmux bind-key -T prefix C-q run-shell -b "python3 $CURRENT_DIR/copytk.py quickcopy"

# bindings to enter copytk prefix
tmux bind-key -T copy-mode-vi S switch-client -T copytk
tmux bind-key -T copy-mode S switch-client -T copytk


# Match URLs
tmux set -g @copytk-quickcopy-match-0-0 urls
tmux set -g @copytk-quickcopy-match-0-1 abspaths
tmux set -g @copytk-quickcopy-match-1-0 paths
tmux set -g @copytk-quickcopy-match-1-1 filenames
# Match commands after the prompt
tmux set -g @copytk-quickcopy-match-2-0 '^.{0,80}\$ ([a-zA-Z][a-zA-Z0-9_-]*(?: .*)?)$'
# Match numbers
tmux set -g @copytk-quickcopy-match-3-0 '-?[0-9]+(?:\.[0-9]+)?(?:[eE]-?[0-9]+)?'
# Match whole lines
tmux set -g @copytk-quickcopy-match-4-0 lines

