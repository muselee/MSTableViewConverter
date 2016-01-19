//
//  ViewController.m
//  MSTableViewConverter
//
//  Created by liqian on 16/1/19.
//  Copyright © 2016年 Bestdo. All rights reserved.
//

#import "ViewController.h"
#import "MSTableViewConverter.h"
@interface ViewController ()
@property (nonatomic,strong) MSTableViewConverter * tableViewConverter;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewConverter = [[MSTableViewConverter alloc] init];
    
    MSSectionConverter* sectionConverter = [[MSSectionConverter alloc] initWithNOHeaderAndFooter];
    
    NSArray* cells = @[@"aaaaaaa",@"bbbbbbbb",@"ccccccc",@"dddddddd",@"eeeeee",@"ffffff",@"gggggggg",@"hhhhhhhhh",@"iiiiiiiii",@"jjjjjjjjjj",@"kkkkkkkk",@"llllllllll",@"mmmmmmmm",@"aaaaaaa",@"bbbbbbbb",@"ccccccc",@"dddddddd",@"eeeeee",@"ffffff",@"gggggggg",@"hhhhhhhhh",@"iiiiiiiii",@"jjjjjjjjjj",@"kkkkkkkk",@"llllllllll",@"mmmmmmmm"];
    for (NSString* cellText in cells)
    {
        [self addCell:cellText section:sectionConverter];
    }
    [self.tableViewConverter addSectionConverter:sectionConverter];
    
    self.tableView.delegate = self.tableViewConverter;
    self.tableView.dataSource = self.tableViewConverter;

}
- (void)addCell:(NSString*)cellText section:(MSSectionConverter*)sectionDescriptor
{
    __weak typeof(self) weakSelf = self;
    
    MSCellConverter* cellDescriptor = [[MSCellConverter alloc] initWithHeight:^CGFloat(UITableView* tableView, NSIndexPath *indexPath)
                                        {
                                            return 44;
                                            
                                        } configure:^UITableViewCell *(UITableView* tableView, NSIndexPath *indexPath)
                                        {
                                            UITableViewCell* cell = [weakSelf.tableView dequeueReusableCellWithIdentifier:@"DefaultTableViewCell" forIndexPath:indexPath];
                                            
                                            return cell;
                                            
                                        } select:^(UITableView* tableView, NSIndexPath *indexPath)
                                        {
                                            [tableView deselectRowAtIndexPath:indexPath animated:YES];
                                            NSLog(@"cell did select index %ld",(long)indexPath.row);
                                        }];
    
    [cellDescriptor setWillDisplayBlock:^(UITableView* tableView, UITableViewCell *cell, NSIndexPath *indexPath) {
        cell.textLabel.text = cellText;
    }];
    
    [sectionDescriptor addCellConverter:cellDescriptor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma GCC diagnostic pop
@end
