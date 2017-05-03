//
//  MainTableViewController.m
//  APIExampleApp
//
//  Created by lishan04 on 15-5-14.
//
//

#import "MainTableViewController.h"
#import "CFMobAdSecondViewController.h"
#import "CFMobAdNormalInterstitialViewController.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"开屏广告展示在AppDelegate";
            break;
        case 1:
            cell.textLabel.text = @"横幅广告";
            break;
        case 2:
            cell.textLabel.text = @"插屏广告";
            break;
        default:
            break;
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *detailViewController = nil;
    switch (indexPath.row) {
        case 0:
        
            break;
        case 1:
            detailViewController = [[CFMobAdSecondViewController alloc]init];
            break;
        case 2:
            detailViewController = [[CFMobAdNormalInterstitialViewController alloc] init];
            break;
        default:
            break;
    }

    if (detailViewController) {
        [self.navigationController pushViewController:detailViewController animated:NO];
    }
}

@end
