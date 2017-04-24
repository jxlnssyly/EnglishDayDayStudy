//
//  WordViewController.m
//  天天学英语
//
//  Created by ceshi on 2017/4/22.
//  Copyright © 2017年 ceshi. All rights reserved.
//

#import "WordViewController.h"
#import "WordModel.h"
#import "YYModel.h"
#import "UIBarButtonItem+Extension.h"

@interface WordViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataArr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) BOOL contentTag;

@end

@implementation WordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = [NSString stringWithFormat:@"单词列表(%zd)",self.wordArr.count];
    self.dataArr = [NSArray yy_modelArrayWithClass:[WordModel class] json:self.wordArr];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemName:@"切换" targer:self action:@selector(changeContent)];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"word"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"word"];
    }
    WordModel *model = self.dataArr[indexPath.row];

    
    if (self.contentTag) {
        cell.textLabel.text = model.eng;
        cell.detailTextLabel.text = nil;

    } else {
        cell.textLabel.text = model.eng;
        cell.detailTextLabel.text = model.chinese;
    }
    
    return cell;
}

- (void)changeContent
{
    self.contentTag = !self.contentTag;
    [self.tableView reloadData];
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
