//
//  MSSectionConverter.h
//  MSTableViewConverter
//
//  Created by liqian on 16/1/7.
//  Copyright © 2016年 Bestdo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSCellConverter.h"
//section 的header
typedef CGFloat (^SectionHeaderHeightBlock)(UITableView* tableView, NSInteger section);
typedef UIView* (^SectionHeaderConfigureBlock)(UITableView* tableView, NSInteger section);
//section 的footer
typedef CGFloat (^SectionFooterHeightBlock)(UITableView* tableView, NSInteger section);
typedef UIView* (^SectionFooterConfigureBlock)(UITableView* tableView, NSInteger section);
//section 的header 和 footer 的标题
typedef NSString* (^SectionHeaderTitleBlock)(UITableView* tableView, NSInteger section);
typedef NSString* (^SectionFooterTitleBlock)(UITableView* tableView, NSInteger section);

@interface MSSectionConverter : NSObject

@property (nonatomic, copy) SectionHeaderHeightBlock heightHeaderBlock;
@property (nonatomic, copy) SectionHeaderConfigureBlock configureHeaderBlock;
@property (nonatomic, copy) SectionFooterHeightBlock heightFooterBlock;
@property (nonatomic, copy) SectionFooterConfigureBlock configureFooterBlock;
@property (nonatomic, copy) SectionHeaderTitleBlock titleHeaderBlock;
@property (nonatomic, copy) SectionFooterTitleBlock titleFooterBlock;

@property (nonatomic,strong,readonly) NSMutableArray* cellConverters;

//空section 没有header和footer
- (instancetype)initWithNOHeaderAndFooter;
//只有header的section
- (instancetype)initWithHeaderSectionWithHeight:(SectionHeaderHeightBlock)heightHeaderBlock configure:(SectionHeaderConfigureBlock)configureHeaderBlock;
//只有footer的section
- (instancetype)initWithFooterSectionWithHeight:(SectionFooterHeightBlock)heightFooterBlock configure:(SectionFooterConfigureBlock)configureFooterBlock;
//header 和 footer 都有的section
- (instancetype)initWithHeaderSectionWithHeight:(SectionHeaderHeightBlock)heightHeaderBlock configure:(SectionHeaderConfigureBlock)configureHeaderBlock andFooterSectionWithHeight:(SectionFooterHeightBlock)heightFooterBlock configure:(SectionFooterConfigureBlock)configureFooterBlock;

- (instancetype)initWithHeaderSectionWithTitle:(SectionHeaderTitleBlock)titleHeaderBlock;
- (instancetype)initWithFooterSectionWithTitle:(SectionFooterTitleBlock)titleFooterBlock;
- (instancetype)initWithHeaderSectionWithTitle:(SectionHeaderTitleBlock)titleHeaderBlock andFooterSectionWithTitle:(SectionFooterTitleBlock)titleFooterBlock;


-(void)addCellConverter:(MSCellConverter *)cellConverter;
-(void)addCellConverter:(MSCellConverter *)cellConverter atIndex:(NSInteger)index;

@end
