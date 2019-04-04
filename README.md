<a href="https://githubsfdeploy.herokuapp.com/?owner=bigassforce&repo=workflow-submit&ref=master">
    <img alt="Deploy to Salesforce" src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

# Workflow Rules - Submit for Approval

Submit records for approval directly from Workflow Rules.

## Usage:
- Create a Workflow Rule / Task Action
- Set the subject "Submit for Approval"

When fired, the related record will be submitted for approval.

## Optional:
- Set the task comment and it will be used for approval comments
- Set the task assignee for that user to be used as the Next Approver ID
- Set the task description to 'SkipEntryCriteria' along with any Process Definition ID
