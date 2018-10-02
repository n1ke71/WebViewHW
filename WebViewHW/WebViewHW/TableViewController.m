//
//  TableViewController.m
//  WebViewHW
//
//  Created by Kozaderov Ivan on 22.09.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.currentSource = indexPath.row;
    [self performSegueWithIdentifier:@"WebViewSegue" sender:self];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    ViewController *vc = (ViewController *)segue.destinationViewController;
    vc.currentRow = self.currentSource;
   
}

@end
