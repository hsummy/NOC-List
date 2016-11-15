//
//  AgentDetailViewController.m
//  NOC-List
//
//  Created by HSummy on 11/13/16.
//  Copyright © 2016 HSummy. All rights reserved.
//

#import "AgentDetailViewController.h"

@interface AgentDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *realNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *coverNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *accessLevelLabel;


@end

@implementation AgentDetailViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.realNameLabel.text = self.nocAgent.realName;
    self.coverNameLabel.text = self.nocAgent.coverName;
    self.accessLevelLabel.text = [NSString stringWithFormat:@"Access Level %ld", (long)self.nocAgent.accessLevel];
}
- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
