name: Celadon PR label blocker

on:
  pull_request:
    types: [opened, reopened, synchronize, labeled, unlabeled]

jobs:
  do-not-merge:
    name: Do Not Merge
    runs-on: ubuntu-latest
    steps:
      - name: Fail if labeled 'DONT MERGE'
        if: contains(github.event.pull_request.labels.*.name, 'DONT MERGE')
        run: |
          echo "::error::PR is labeled 'DONT MERGE' — merging is blocked."
          exit 1
