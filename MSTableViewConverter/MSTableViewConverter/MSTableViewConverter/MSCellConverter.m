//
//  MSCellConverter.m
//  MSTableViewConverter
//
//  Created by liqian on 16/1/7.
//  Copyright © 2016年 Bestdo. All rights reserved.
//

#import "MSCellConverter.h"

@interface MSCellConverter()

@end

@implementation MSCellConverter

- (instancetype)initWithHeight:(CellHeightBlock)heightBlock configure:(CellConfigureBlock)configureBlock
{
    self = [self initWithHeight:heightBlock configure:configureBlock select:nil];
    return self;
}

- (instancetype)initWithHeight:(CellHeightBlock)heightBlock configure:(CellConfigureBlock)configureBlock select:(CellSelectBlock)selectBlock
{
    self = [super init];
    if (self)
    {
        self.heightBlock = [heightBlock copy];
        self.configureBlock = [configureBlock copy];
        self.selectBlock = [selectBlock copy];
    }
    return self;
}

@end
