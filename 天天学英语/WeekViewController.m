//
//  WeekViewController.m
//  天天学英语
//
//  Created by ceshi on 2017/4/22.
//  Copyright © 2017年 ceshi. All rights reserved.
//

#import "WeekViewController.h"
#import "WordViewController.h"

@interface WeekViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation WeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *path = [NSString stringWithFormat:@"eng%ld.json",self.index];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:path ofType:@""];
    NSData *wordData = [NSData dataWithContentsOfFile:path2];
    NSArray *wordArr = [NSJSONSerialization JSONObjectWithData:wordData options:NSJSONReadingAllowFragments error:nil];
    self.title = [NSString stringWithFormat:@"本周任务(%zd)",wordArr.count];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"word"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"word"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld天",indexPath.row + 1];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WordViewController *word = [[WordViewController alloc] init];
    
    NSString *path = [NSString stringWithFormat:@"eng%ld.json",self.index];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:path ofType:@""];
    NSData *wordData = [NSData dataWithContentsOfFile:path2];
    NSArray *wordArr = [NSJSONSerialization JSONObjectWithData:wordData options:NSJSONReadingAllowFragments error:nil];
    NSUInteger begin = (wordArr.count - (7 - indexPath.row) * (wordArr.count / 7)) - (wordArr.count % 7);
    NSUInteger end = indexPath.row == 6 ? wordArr.count - begin  : wordArr.count / 7;
    NSArray *arr = [wordArr subarrayWithRange:NSMakeRange(begin, end)];
    word.wordArr = arr;
    [self.navigationController pushViewController:word animated:YES];
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
