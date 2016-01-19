//
//  MSCellConverter.h
//  MSTableViewConverter
//
//  Created by liqian on 16/1/7.
//  Copyright © 2016年 Bestdo. All rights reserved.
//

#import <UIKit/UIKit.h>

 /** 配置cell 高度*/
typedef CGFloat (^CellHeightBlock)(UITableView* tableView, NSIndexPath* indexPath);
 /** cell 将要出现*/
typedef void (^CellWillDisplayBlock)(UITableView* tableView, UITableViewCell* cell, NSIndexPath* indexPath);
 /** 获取cell*/
typedef UITableViewCell* (^CellConfigureBlock)(UITableView* tableView, NSIndexPath* indexPath);
 /** 点击cell*/
typedef void (^CellSelectBlock)(UITableView* tableView, NSIndexPath* indexPath);
 /** 是否可编辑*/
typedef BOOL (^CellEditableBlock)(UITableView* tableView, NSIndexPath* indexPath);
 /** 编辑*/
typedef void (^CellCommitEditingStyleBlock)(UITableView* tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath* indexPath);

@interface MSCellConverter : NSObject

@property (nonatomic, copy) CellHeightBlock heightBlock;
@property (nonatomic, copy) CellWillDisplayBlock willDisplayBlock;
@property (nonatomic, copy) CellConfigureBlock configureBlock;
@property (nonatomic, copy) CellSelectBlock selectBlock;
@property (nonatomic, copy) CellEditableBlock editableBlock;
@property (nonatomic, copy) CellCommitEditingStyleBlock commitEditingStyleBlock;
/**
 *  生成cell的转换对象
 *
 *  @param heightBlock    cell 的高度
 *  @param configureBlock cell 生成
 *
 *  @return cell转换对象
 */
- (instancetype)initWithHeight:(CellHeightBlock)heightBlock configure:(CellConfigureBlock)configureBlock;

- (instancetype)initWithHeight:(CellHeightBlock)heightBlock configure:(CellConfigureBlock)configureBlock select:(CellSelectBlock)selectBlock;


@end
