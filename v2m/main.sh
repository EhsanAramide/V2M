#!/bin/bash

# FIX: async `preview` command
REPO_FILES="find $V2M_REPO -type f"
eval $REPO_FILES | fzf \
--border=rounded \
--margin=2.5% \
--multi \
--preview="$V2M_HOME/v2m/config_detail.py {}" \
--preview-label="[ Server Detail ]" \
--preview-window="40%,border-rounded,wrap" \
\
--bind="del:execute(rm -ri {+})" \
--bind="ctrl-h:execute(rm -ri {+})" \
--bind="left:execute(rm -ri {+})" \
\
--bind="+:execute(touch $V2M_REPO/{q})" \
\
--bind="del:+reload(eval $REPO_FILES)" \
--bind="ctrl-h:+reload(eval $REPO_FILES)" \
--bind="left:+reload(eval $REPO_FILES)" \
--bind="+:+reload(eval $REPO_FILES)" \
--bind="ctrl-r:reload(eval $REPO_FILES)" \
\
--bind="enter:execute(bash $V2M_HOME/v2m/set_config.sh {})" \
--bind="right:execute(vim {+})" \
--bind="ctrl-l:execute(vim {+})" \
\
--bind="enter:+deselect-all" \
--bind="right:+deselect-all" \
--bind="ctrl-l:+deselect-all" \
\
--bind="enter:+abort" \
\
--bind="ctrl-p:refresh-preview"
