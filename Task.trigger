/**
 * Workflow Rules - Submit for Approval
 * 
 * Usage:
 * - Create a Workflow Rule / Task Action
 * - Set the subject "Submit for Approval"
 * - Set the assignee to the custom approver (optional)
 * - Set the description to the approval comments (optional)
 * 
 * The related record will be submitted for approval
 */
trigger Task on Task (after insert)
{
    
    Id userId = UserInfo.getUserId();
    List<Task> tasks = new List<Task>();
    List<Approval.ProcessSubmitRequest> requests;
    requests = new List<Approval.ProcessSubmitRequest>();
    
    for (Task task : Trigger.new)
    {
        //skip unrelated tasks
        if (task.Subject == null) continue;
        if (!task.Subject.containsIgnoreCase('Submit for Approval')) continue;
        
        //convert task into meaningful approval process submission
        Approval.ProcessSubmitRequest request = new Approval.ProcessSubmitRequest();
        if (task.WhoId != null) request.setObjectId(task.WhoId);
        if (task.WhatId != null) request.setObjectId(task.WhatId);
        if (task.OwnerId != userId) request.setNextApproverIds(new List<Id>{userId});
        if (task.Description != null) request.setComments(task.Description);
        
        
        if (('' + task.Description).containsIgnoreCase('SkipEntryCriteria'))
        {
            //magic string to allow skip entry criteria
            request.setSkipEntryCriteria(true);
        }
        
        if (('' + task.Description).contains('04a'))
        {
            //magic string to allow hard coded approval process id
            String id = task.Description.substringAfter('04a').left(12);
            request.setProcessDefinitionNameOrId('04a' + id);
        }
        
        //index them
        tasks.add(task);
        requests.add(request);
    }
    
    //nothing to do
    if (requests.isEmpty()) return;
    
    //set any errors back onto the tasks
    List<Approval.ProcessResult> results = Approval.process(requests, false);
    for (Integer i = 0; i < results.size(); i++) if (!results[i].isSuccess())
    {
        Task task = tasks[i];
        Approval.ProcessResult result = results[i];
        task.addError(result.getErrors()[0].getMessage());
    }
    
}
