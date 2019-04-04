<a href="https://githubsfdeploy.herokuapp.com/?owner=bigassforce&repo=workflow-submit&ref=master">
    <img alt="Deploy to Salesforce" src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

# Workflow Rules - Submit for Approval

Makes it easy to submit records for approval from Workflow Rules.

## Usage:
- Create a Workflow Rule / Task Action
- Set the subject "Submit for Approval"
- Set the description to the approval comments

When fired, the related record will be submitted for approval.

## Optional:
- Set the task assignee for that user to be used as the Next Approver ID
- Set the task description to 'SkipEntryCriteria' along with any Process Definition ID
