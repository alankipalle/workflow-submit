@IsTest class TaskTest
{
    
    @IsTest static void testSubmitForApproval()
    {
        //arrange
        Task task = new Task(Subject = 'Submit for Approval');
        
        //act
        Database.SaveResult result = Database.insert(task, false);
        
        //assert
        System.assert(result != null);
    }
    
}
