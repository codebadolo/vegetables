GIT-BRANCH(1)                                Git Manual                               GIT-BRANCH(1)

NNAAMMEE
       git-branch - List, create, or delete branches

SSYYNNOOPPSSIISS
       _g_i_t _b_r_a_n_c_h [--color[=<when>] | --no-color] [--show-current]
               [-v [--abbrev=<n> | --no-abbrev]]
               [--column[=<options>] | --no-column] [--sort=<key>]
               [--merged [<commit>]] [--no-merged [<commit>]]
               [--contains [<commit>]] [--no-contains [<commit>]]
               [--points-at <object>] [--format=<format>]
               [(-r | --remotes) | (-a | --all)]
               [--list] [<pattern>...]
       _g_i_t _b_r_a_n_c_h [--track | --no-track] [-f] <branchname> [<start-point>]
       _g_i_t _b_r_a_n_c_h (--set-upstream-to=<upstream> | -u <upstream>) [<branchname>]
       _g_i_t _b_r_a_n_c_h --unset-upstream [<branchname>]
       _g_i_t _b_r_a_n_c_h (-m | -M) [<oldbranch>] <newbranch>
       _g_i_t _b_r_a_n_c_h (-c | -C) [<oldbranch>] <newbranch>
       _g_i_t _b_r_a_n_c_h (-d | -D) [-r] <branchname>...
       _g_i_t _b_r_a_n_c_h --edit-description [<branchname>]

DDEESSCCRRIIPPTTIIOONN
       If ----lliisstt is given, or if there are no non-option arguments, existing branches are listed;
       the current branch will be highlighted in green and marked with an asterisk. Any branches
       checked out in linked worktrees will be highlighted in cyan and marked with a plus sign.
       Option --rr causes the remote-tracking branches to be listed, and option --aa shows both local
       and remote branches.

       If a <<ppaatttteerrnn>> is given, it is used as a shell wildcard to restrict the output to matching
       branches. If multiple patterns are given, a branch is shown if it matches any of the
       patterns.

       Note that when providing a <<ppaatttteerrnn>>, you must use ----lliisstt; otherwise the command may be
       interpreted as branch creation.

       With ----ccoonnttaaiinnss, shows only the branches that contain the named commit (in other words, the
       branches whose tip commits are descendants of the named commit), ----nnoo--ccoonnttaaiinnss inverts it.
       With ----mmeerrggeedd, only branches merged into the named commit (i.e. the branches whose tip
       commits are reachable from the named commit) will be listed. With ----nnoo--mmeerrggeedd only branches
       not merged into the named commit will be listed. If the <commit> argument is missing it
       defaults to HHEEAADD (i.e. the tip of the current branch).

       The command’s second form creates a new branch head named <branchname> which points to the
       current HHEEAADD, or <start-point> if given. As a special case, for <start-point>, you may use
       ""AA......BB"" as a shortcut for the merge base of AA and BB if there is exactly one merge base. You
       can leave out at most one of AA and BB, in which case it defaults to HHEEAADD.

       Note that this will create the new branch, but it will not switch the working tree to it;
       use "git switch <newbranch>" to switch to the new branch.

       When a local branch is started off a remote-tracking branch, Git sets up the branch
       (specifically the bbrraanncchh..<<nnaammee>>..rreemmoottee and bbrraanncchh..<<nnaammee>>..mmeerrggee configuration entries) so
       that _g_i_t _p_u_l_l will appropriately merge from the remote-tracking branch. This behavior may be
       changed via the global bbrraanncchh..aauuttooSSeettuuppMMeerrggee configuration flag. That setting can be
       overridden by using the ----ttrraacckk and ----nnoo--ttrraacckk options, and changed later using ggiitt bbrraanncchh
       ----sseett--uuppssttrreeaamm--ttoo.

       With a --mm or --MM option, <oldbranch> will be renamed to <newbranch>. If <oldbranch> had a
       corresponding reflog, it is renamed to match <newbranch>, and a reflog entry is created to
       remember the branch renaming. If <newbranch> exists, -M must be used to force the rename to
       happen.

       The --cc and --CC options have the exact same semantics as --mm and --MM, except instead of the
       branch being renamed, it will be copied to a new name, along with its config and reflog.

       With a --dd or --DD option, <<bbrraanncchhnnaammee>> will be deleted. You may specify more than one branch
       for deletion. If the branch currently has a reflog then the reflog will also be deleted.

       Use --rr together with --dd to delete remote-tracking branches. Note, that it only makes sense
       to delete remote-tracking branches if they no longer exist in the remote repository or if
       _g_i_t _f_e_t_c_h was configured not to fetch them again. See also the _p_r_u_n_e subcommand of ggiitt--
       rreemmoottee(1) for a way to clean up all obsolete remote-tracking branches.

OOPPTTIIOONNSS
       -d, --delete
           Delete a branch. The branch must be fully merged in its upstream branch, or in HHEEAADD if
           no upstream was set with ----ttrraacckk or ----sseett--uuppssttrreeaamm--ttoo.

       -D
           Shortcut for ----ddeelleettee ----ffoorrccee.

       --create-reflog
           Create the branch’s reflog. This activates recording of all changes made to the branch
           ref, enabling use of date based sha1 expressions such as "<branchname>@{yesterday}".
           Note that in non-bare repositories, reflogs are usually enabled by default by the
           ccoorree..llooggAAllllRReeffUUppddaatteess config option. The negated form ----nnoo--ccrreeaattee--rreefflloogg only overrides
           an earlier ----ccrreeaattee--rreefflloogg, but currently does not negate the setting of
           ccoorree..llooggAAllllRReeffUUppddaatteess.

       -f, --force
           Reset <branchname> to <startpoint>, even if <branchname> exists already. Without --ff, _g_i_t
           _b_r_a_n_c_h refuses to change an existing branch. In combination with --dd (or ----ddeelleettee), allow
           deleting the branch irrespective of its merged status, or whether it even points to a
           valid commit. In combination with --mm (or ----mmoovvee), allow renaming the branch even if the
           new branch name already exists, the same applies for --cc (or ----ccooppyy).

       -m, --move
           Move/rename a branch, together with its config and reflog.

       -M
           Shortcut for ----mmoovvee ----ffoorrccee.

       -c, --copy
           Copy a branch, together with its config and reflog.

       -C
           Shortcut for ----ccooppyy ----ffoorrccee.

       --color[=<when>]
           Color branches to highlight current, local, and remote-tracking branches. The value must
           be always (the default), never, or auto.

       --no-color
           Turn off branch colors, even when the configuration file gives the default to color
           output. Same as ----ccoolloorr==nneevveerr.

       -i, --ignore-case
           Sorting and filtering branches are case insensitive.

       --column[=<options>], --no-column
           Display branch listing in columns. See configuration variable ccoolluummnn..bbrraanncchh for option
           syntax.  ----ccoolluummnn and ----nnoo--ccoolluummnn without options are equivalent to _a_l_w_a_y_s and _n_e_v_e_r
           respectively.

           This option is only applicable in non-verbose mode.

       -r, --remotes
           List or delete (if used with -d) the remote-tracking branches. Combine with ----lliisstt to
           match the optional pattern(s).

       -a, --all
           List both remote-tracking branches and local branches. Combine with ----lliisstt to match
           optional pattern(s).

       -l, --list
           List branches. With optional <<ppaatttteerrnn>>......, e.g.  ggiitt bbrraanncchh ----lliisstt ''mmaaiinntt--**'', list only
           the branches that match the pattern(s).

       --show-current
           Print the name of the current branch. In detached HEAD state, nothing is printed.

       -v, -vv, --verbose
           When in list mode, show sha1 and commit subject line for each head, along with
           relationship to upstream branch (if any). If given twice, print the path of the linked
           worktree (if any) and the name of the upstream branch, as well (see also ggiitt rreemmoottee sshhooww
           <<rreemmoottee>>). Note that the current worktree’s HEAD will not have its path printed (it will
           always be your current directory).

       -q, --quiet
           Be more quiet when creating or deleting a branch, suppressing non-error messages.

       --abbrev=<n>
           In the verbose listing that show the commit object name, show the shortest prefix that
           is at least _<_n_> hexdigits long that uniquely refers the object. The default value is 7
           and can be overridden by the ccoorree..aabbbbrreevv config option.

       --no-abbrev
           Display the full sha1s in the output listing rather than abbreviating them.

       -t, --track
           When creating a new branch, set up bbrraanncchh..<<nnaammee>>..rreemmoottee and bbrraanncchh..<<nnaammee>>..mmeerrggee
           configuration entries to mark the start-point branch as "upstream" from the new branch.
           This configuration will tell git to show the relationship between the two branches in
           ggiitt ssttaattuuss and ggiitt bbrraanncchh --vv. Furthermore, it directs ggiitt ppuullll without arguments to pull
           from the upstream when the new branch is checked out.

           This behavior is the default when the start point is a remote-tracking branch. Set the
           branch.autoSetupMerge configuration variable to ffaallssee if you want ggiitt sswwiittcchh, ggiitt
           cchheecckkoouutt and ggiitt bbrraanncchh to always behave as if ----nnoo--ttrraacckk were given. Set it to aallwwaayyss
           if you want this behavior when the start-point is either a local or remote-tracking
           branch.

       --no-track
           Do not set up "upstream" configuration, even if the branch.autoSetupMerge configuration
           variable is true.

       --set-upstream
           As this option had confusing syntax, it is no longer supported. Please use ----ttrraacckk or
           ----sseett--uuppssttrreeaamm--ttoo instead.

       -u <upstream>, --set-upstream-to=<upstream>
           Set up <branchname>'s tracking information so <upstream> is considered <branchname>'s
           upstream branch. If no <branchname> is specified, then it defaults to the current
           branch.

       --unset-upstream
           Remove the upstream information for <branchname>. If no branch is specified it defaults
           to the current branch.

       --edit-description
           Open an editor and edit the text to explain what the branch is for, to be used by
           various other commands (e.g.  ffoorrmmaatt--ppaattcchh, rreeqquueesstt--ppuullll, and mmeerrggee (if enabled)).
           Multi-line explanations may be used.

       --contains [<commit>]
           Only list branches which contain the specified commit (HEAD if not specified). Implies
           ----lliisstt.

       --no-contains [<commit>]
           Only list branches which don’t contain the specified commit (HEAD if not specified).
           Implies ----lliisstt.

       --merged [<commit>]
           Only list branches whose tips are reachable from the specified commit (HEAD if not
           specified). Implies ----lliisstt.

       --no-merged [<commit>]
           Only list branches whose tips are not reachable from the specified commit (HEAD if not
           specified). Implies ----lliisstt.

       <branchname>
           The name of the branch to create or delete. The new branch name must pass all checks
           defined by ggiitt--cchheecckk--rreeff--ffoorrmmaatt(1). Some of these checks may restrict the characters
           allowed in a branch name.

       <start-point>
           The new branch head will point to this commit. It may be given as a branch name, a
           commit-id, or a tag. If this option is omitted, the current HEAD will be used instead.

       <oldbranch>
           The name of an existing branch to rename.

       <newbranch>
           The new name for an existing branch. The same restrictions as for <branchname> apply.

       --sort=<key>
           Sort based on the key given. Prefix -- to sort in descending order of the value. You may
           use the --sort=<key> option multiple times, in which case the last key becomes the
           primary key. The keys supported are the same as those in ggiitt ffoorr--eeaacchh--rreeff. Sort order
           defaults to the value configured for the bbrraanncchh..ssoorrtt variable if exists, or to sorting
           based on the full refname (including rreeffss//......  prefix). This lists detached HEAD (if
           present) first, then local branches and finally remote-tracking branches. See ggiitt--
           ccoonnffiigg(1).

       --points-at <object>
           Only list branches of the given object.

       --format <format>
           A string that interpolates %%((ffiieellddnnaammee)) from a branch ref being shown and the object it
           points at. The format is the same as that of ggiitt--ffoorr--eeaacchh--rreeff(1).

CCOONNFFIIGGUURRAATTIIOONN
       ppaaggeerr..bbrraanncchh is only respected when listing branches, i.e., when ----lliisstt is used or implied.
       The default is to use a pager. See ggiitt--ccoonnffiigg(1).

EEXXAAMMPPLLEESS
       Start development from a known tag

               $ git clone git://git.kernel.org/pub/scm/.../linux-2.6 my2.6
               $ cd my2.6
               $ git branch my2.6.14 v2.6.14   ((11))
               $ git switch my2.6.14

           11.. This step and the next one could be combined into a single step with "checkout -b
           my2.6.14 v2.6.14".

       Delete an unneeded branch

               $ git clone git://git.kernel.org/.../git.git my.git
               $ cd my.git
               $ git branch -d -r origin/todo origin/html origin/man   ((11))
               $ git branch -D test                                    ((22))

           11.. Delete the remote-tracking branches "todo", "html" and "man". The next _f_e_t_c_h or _p_u_l_l
           will create them again unless you configure them not to. See ggiitt--ffeettcchh(1).
           22.. Delete the "test" branch even if the "master" branch (or whichever branch is
           currently checked out) does not have all commits from the test branch.

       Listing branches from a specific remote

               $ git branch -r -l '<remote>/<pattern>'                 ((11))
               $ git for-each-ref 'refs/remotes/<remote>/<pattern>'    ((22))

           11.. Using --aa would conflate <remote> with any local branches you happen to have been
           prefixed with the same <remote> pattern.
           22.. ffoorr--eeaacchh--rreeff can take a wide range of options. See ggiitt--ffoorr--eeaacchh--rreeff(1)

       Patterns will normally need quoting.

NNOOTTEESS
       If you are creating a branch that you want to switch to immediately, it is easier to use the
       "git switch" command with its --cc option to do the same thing with a single command.

       The options ----ccoonnttaaiinnss, ----nnoo--ccoonnttaaiinnss, ----mmeerrggeedd and ----nnoo--mmeerrggeedd serve four related but
       different purposes:

       •   ----ccoonnttaaiinnss <<ccoommmmiitt>> is used to find all branches which will need special attention if
           <commit> were to be rebased or amended, since those branches contain the specified
           <commit>.

       •   ----nnoo--ccoonnttaaiinnss <<ccoommmmiitt>> is the inverse of that, i.e. branches that don’t contain the
           specified <commit>.

       •   ----mmeerrggeedd is used to find all branches which can be safely deleted, since those branches
           are fully contained by HEAD.

       •   ----nnoo--mmeerrggeedd is used to find branches which are candidates for merging into HEAD, since
           those branches are not fully contained by HEAD.

       When combining multiple ----ccoonnttaaiinnss and ----nnoo--ccoonnttaaiinnss filters, only references that contain
       at least one of the ----ccoonnttaaiinnss commits and contain none of the ----nnoo--ccoonnttaaiinnss commits are
       shown.

       When combining multiple ----mmeerrggeedd and ----nnoo--mmeerrggeedd filters, only references that are reachable
       from at least one of the ----mmeerrggeedd commits and from none of the ----nnoo--mmeerrggeedd commits are
       shown.

SSEEEE AALLSSOO
       ggiitt--cchheecckk--rreeff--ffoorrmmaatt(1), ggiitt--ffeettcchh(1), ggiitt--rreemmoottee(1), ““UUnnddeerrssttaannddiinngg hhiissttoorryy:: WWhhaatt iiss aa
       bbrraanncchh??””[1] in the Git User’s Manual.

GGIITT
       Part of the ggiitt(1) suite

NNOOTTEESS
        1. “Understanding history: What is a branch?”
           file:///usr/share/doc/git/html/user-manual.html#what-is-a-branch

Git 2.34.1                                   07/07/2023                               GIT-BRANCH(1)
