#!/usr/bin/env python

"""
GIT hook to prefix JIRA issue number in commit messages.

modified to personal usage:
original source: https://www.atlassian.com/git/tutorials/git-hooks

Imp info:
    The prepare-commit-msg hook is called after the pre-commit hook to
    populate the text editor with a commit message. This is a good place
    to alter the automatically generated commit messages for squashed
    or merged commits.

    One to three arguments are passed to the prepare-commit-msg script:

    The name of a temporary file that contains the message.
    You change the commit message by altering this file in-place.
    The type of commit. This can be message (-m or -F option),
    template (-t option), merge (if the commit is a merge commit),
    or squash (if the commit is squashing other commits).

    The SHA1 hash of the relevant commit. Only given if -c, -C,
    or --amend option was given.

    As with pre-commit, exiting with a non-zero status aborts the commit.


    **NOTE** (drawback):
      - only works after setting ISSUE_PREFIX and ISSUE_NUMBER environ variables.
      - is unable to abort commit.
"""

import sys
# import re
import os

from subprocess import check_output

# Collect the parameters
commit_msg_filepath = sys.argv[1]

if len(sys.argv) > 2:
    commit_type = sys.argv[2]
else:
    commit_type = ''

if len(sys.argv) > 3:
    commit_hash = sys.argv[3]
else:
    commit_hash = ''

print ("prepare-commit-msg: File: %s\nType: %s\nHash: %s" % (
    commit_msg_filepath, commit_type, commit_hash))

# Figure out which branch we're on
branch = check_output(['git', 'symbolic-ref', '--short', 'HEAD']).strip()

print("prepare-commit-msg: On branch '%s'" % branch)

# Populate the commit message with the issue #, if there is one
# if branch.startswith('issue-'):
#     print("prepare-commit-msg: Oh hey, it's an issue branch.")

# result = re.match('issue-(.*)', branch)
# issue_number = result.group(1)

prefix = os.environ.get('ISSUE_PREFIX')
issue_number = os.environ.get('ISSUE_NUMBER')

if not prefix or not issue_number:
    print("\n\n****************************************************"
          "\nPLEASE export ISSUE_PREFIX and ISSUE_NUMBER (in uppercase)"
          " to get the auto prefix working."
          "\n****************************************************\n"
          "\n example: \n\t\t$ export ISSUE_PREFIX=LIN "
          "\n\t\t$ export ISSUE_NUMBER=04 \n\n")
else:
    with open(commit_msg_filepath, 'r+') as f:
        content = f.read()
        if not content.startswith('Merge') and not content.startswith(prefix):
            f.seek(0, 0)
            f.write("{0}-{1}: {2}".format(prefix, issue_number, content))
