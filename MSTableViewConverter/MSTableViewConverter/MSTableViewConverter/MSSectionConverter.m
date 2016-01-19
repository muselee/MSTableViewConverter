//
//  MSSectionConverter.m
//  MSTableViewConverter
//
//  Created by liqian on 16/1/7.
//  Copyright © 2016年 Bestdo. All rights reserved.
//

#import "MSSectionConverter.h"

@interface MSSectionConverter()

@end

@implementation MSSectionConverter


- (instancetype)initWithNOHeaderAndFooter
{
    self = [self init];
    return self;
}

- (instancetype)initWithHeaderSectionWithHeight:(SectionHeaderHeightBlock)heightHeaderBlock configure:(SectionHeaderConfigureBlock)configureHeaderBlock
{
    self = [self initWithHeaderSectionWithHeight:heightHeaderBlock configure:configureHeaderBlock andFooterSectionWithHeight:nil configure:nil];
    return self;
}

- (instancetype)initWithFooterSectionWithHeight:(SectionFooterHeightBlock)heightFooterBlock configure:(SectionFooterConfigureBlock)configureFooterBlock;
{
    self = [self initWithHeaderSectionWithHeight:nil configure:nil andFooterSectionWithHeight:heightFooterBlock configure:configureFooterBlock];
    return self;
}

- (instancetype)initWithHeaderSectionWithHeight:(SectionHeaderHeightBlock)heightHeaderBlock configure:(SectionHeaderConfigureBlock)configureHeaderBlock andFooterSectionWithHeight:(SectionFooterHeightBlock)heightFooterBlock configure:(SectionFooterConfigureBlock)configureFooterBlock
{
    self = [self init];
    if (self)
    {
        self.heightHeaderBlock = [heightHeaderBlock copy];
        self.configureHeaderBlock = [configureHeaderBlock copy];
        
        self.heightFooterBlock = [heightFooterBlock copy];
        self.configureFooterBlock = [configureFooterBlock copy];
    }
    return self;
}

- (instancetype)initWithHeaderSectionWithTitle:(SectionHeaderTitleBlock)titleHeaderBlock
{
    self = [self initWithHeaderSectionWithTitle:titleHeaderBlock andFooterSectionWithTitle:nil];
    return self;
}

- (instancetype)initWithFooterSectionWithTitle:(SectionFooterTitleBlock)titleFooterBlock
{
    self = [self initWithHeaderSectionWithTitle:nil andFooterSectionWithTitle:titleFooterBlock];
    return self;
}

- (instancetype)initWithHeaderSectionWithTitle:(SectionHeaderTitleBlock)titleHeaderBlock andFooterSectionWithTitle:(SectionFooterTitleBlock)titleFooterBlock
{
    self = [self init];
    if (self)
    {
        self.titleHeaderBlock = [titleHeaderBlock copy];
        self.titleFooterBlock = [titleFooterBlock copy];
    }
    return self;
}

-(instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _cellConverters = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Cell Converter

-(void)addCellConverter:(MSCellConverter *)cellConverter
{
    [self.cellConverters addObject:cellConverter];
}

-(void)addCellConverter:(MSCellConverter *)cellConverter atIndex:(NSInteger)index
{
    [self.cellConverters insertObject:cellConverter atIndex:index];
}

@end
