//
//  NOCTableViewController.m
//  NOC-List
//
//  Created by HSummy on 11/11/16.
//  Copyright © 2016 HSummy. All rights reserved.
//

#import "NOCTableViewController.h"
#import "NOCAgent.h"
#import "AgentDetailViewController.h"

@interface NOCTableViewController ()

//@property (nonnull, strong) NSArray *noc
{
    
NSMutableArray *noc;

}
- (void)loadNOC;

@end

@implementation NOCTableViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.title = @"NOC";
    noc = [[NSMutableArray alloc] init];
    [self loadNOC];
    


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

}
- (void)loadNOC
{
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"NOC" ofType:@"json"];
        NSArray *nocJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
        //adding a bucket for the info with line below storing it into *aDictionary
       // self.nocAgent = [[NSMutableArray alloc] init];
        
        for (NSDictionary *aDictionary in nocJSON)
    
    {
        NOCAgent *anItem = [NOCAgent nocAgentWithDictionary:aDictionary];
      //  [self.nocAgent addObject:anItem];
        [noc addObject:anItem];
    }
    
    
}
- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    //return self.nocAgent.count;
    return [noc count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NOCCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    //NOCAgent *anItem = self.nocAgent[indexPath.row];
    NOCAgent *anItem = [noc objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = anItem.realName;
    cell.detailTextLabel.text = anItem.coverName;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([[segue identifier] isEqualToString:@"AgentDetailSeque"])
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
        
    {
        
        AgentDetailViewController *detailVC = [segue destinationViewController];
        
        UITableViewCell *selectedCell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell: selectedCell];
        NOCAgent *selectedNOCAgent = noc[indexPath.row];
        detailVC.nocAgent = selectedNOCAgent;
    }
}



@end
