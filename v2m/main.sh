#!/bin/bash

REPO_FILES="find $V2M_REPO"
eval $REPO_FILES | fzf \
--border=rounded \
--margin=2.5% \
--multi \
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
--bind="enter:+abort"
