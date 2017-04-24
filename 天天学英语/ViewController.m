//
//  ViewController.m
//  天天学英语
//
//  Created by ceshi on 2017/4/22.
//  Copyright © 2017年 ceshi. All rights reserved.
//

#import "ViewController.h"
#import "WeekViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"word"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"word"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld篇",indexPath.row + 1];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeekViewController *word = [[WeekViewController alloc] init];
    word.index = indexPath.row + 1;
    [self.navigationController pushViewController:word animated:YES];
}





@end
