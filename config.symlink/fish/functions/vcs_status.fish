function vcs_status
  if vcs.present
    if test (vcs.name) = "hg" > /dev/null
      echo " ("
      cat (vcs.root)/.hg/bookmarks.current 2>/dev/null;
        or echo "default"
      echo -n -s (__vcs_status) ")"
    else
      echo -n -s " (" (vcs.branch) (__vcs_status) ")"
    end
  end
end
