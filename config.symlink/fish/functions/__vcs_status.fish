function __vcs_status
  if vcs.present
    if test (vcs.name) = "hg" > /dev/null
      if test -f (vcs.root)"/.hg/bisect.state"
        echo "|BISECT"
      else if test -f (vcs.root)"/.hg/histedit-state"
        echo "|HISTEDIT"
      else if test -f (vcs.root)"/.hg/graftstate"
        echo "|GRAFT"
      else if test -f (vcs.root)"/.hg/unshelverebasestate"
        echo "|UNSHELVE"
      else if test -f (vcs.root)"/.hg/rebasestate"
        echo "|REBASE"
      else if test -d (vcs.root)"/.hg/merge"
        echo "|MERGE"
      end
    else
      set status_value (vcs.status)
      if test -n "$status_value"
        if test "$status_value" != "clean"
          echo "|$status_value"
        end
      end
    end
  end
end
