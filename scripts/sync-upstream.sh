#!/bin/bash
# PraisonAI Chat - Upstream Sync Script
# This script helps sync changes from the upstream Chainlit repository

set -e

UPSTREAM_REMOTE="upstream"
UPSTREAM_BRANCH="main"
LOCAL_BRANCH="main"

echo "=== PraisonAI Chat Upstream Sync ==="
echo ""

# Check if upstream remote exists
if ! git remote | grep -q "^${UPSTREAM_REMOTE}$"; then
    echo "Adding upstream remote..."
    git remote add ${UPSTREAM_REMOTE} https://github.com/Chainlit/chainlit.git
fi

# Fetch upstream changes
echo "Fetching upstream changes..."
git fetch ${UPSTREAM_REMOTE}

# Show what's new
echo ""
echo "=== Changes from upstream ==="
git log --oneline ${LOCAL_BRANCH}..${UPSTREAM_REMOTE}/${UPSTREAM_BRANCH} | head -20

# Count commits
COMMIT_COUNT=$(git rev-list --count ${LOCAL_BRANCH}..${UPSTREAM_REMOTE}/${UPSTREAM_BRANCH})
echo ""
echo "Total new commits from upstream: ${COMMIT_COUNT}"

if [ "$COMMIT_COUNT" -eq 0 ]; then
    echo "Already up to date with upstream!"
    exit 0
fi

echo ""
echo "=== Options ==="
echo "1. Create a merge commit (recommended for preserving history)"
echo "2. Rebase onto upstream (cleaner history, may require conflict resolution)"
echo "3. Show diff only (no changes)"
echo "4. Exit"
echo ""
read -p "Choose option [1-4]: " OPTION

case $OPTION in
    1)
        echo "Merging upstream changes..."
        git merge ${UPSTREAM_REMOTE}/${UPSTREAM_BRANCH} --no-edit -m "Merge upstream Chainlit changes"
        echo "Merge complete! Review changes and push when ready."
        ;;
    2)
        echo "Rebasing onto upstream..."
        git rebase ${UPSTREAM_REMOTE}/${UPSTREAM_BRANCH}
        echo "Rebase complete! Review changes and push when ready."
        ;;
    3)
        echo "Showing diff..."
        git diff ${LOCAL_BRANCH}..${UPSTREAM_REMOTE}/${UPSTREAM_BRANCH} --stat
        ;;
    4)
        echo "Exiting."
        exit 0
        ;;
    *)
        echo "Invalid option."
        exit 1
        ;;
esac

echo ""
echo "=== Post-sync checklist ==="
echo "1. Review merged changes for conflicts"
echo "2. Run tests: cd backend && poetry run pytest"
echo "3. Build frontend: pnpm run buildUi"
echo "4. Test the application locally"
echo "5. Push changes: git push origin ${LOCAL_BRANCH}"
