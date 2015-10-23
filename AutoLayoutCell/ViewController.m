//
//  ViewController.m
//  AutoLayoutCell
//
//  Created by Scott_Mr on 15/10/22.
//  Copyright © 2015年 Scott_Mr. All rights reserved.
//

#import "ViewController.h"
#import "DIYTableViewCell.h"

static NSString *iden = @"cell";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *tbData;
@property (nonatomic, strong) DIYTableViewCell *cell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tbData = @[@"1\n2\n3\n4\n5\n6",@"123456789012345678901234567890", @"1\n2", @"1\n2\n3",@"1",@"1234567890234567892345678923456789234567892345678923456789234567892345678912345678901234567890"];
    
    self.tableView.tableFooterView = [[UIView alloc] init];

    self.cell = [self.tableView dequeueReusableCellWithIdentifier:iden];
    
    self.cell.titleLabel.preferredMaxLayoutWidth = self.view.frame.size.width - 130;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tbData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DIYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    cell.titleLabel.text = [self.tbData objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DIYTableViewCell *cell = (DIYTableViewCell *)self.cell;
    cell.titleLabel.text = [self.tbData objectAtIndex:indexPath.row];
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    NSLog(@"调用次数%ld",indexPath.row+1);
    return MAX(44, 1 + size.height) ;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


@end
