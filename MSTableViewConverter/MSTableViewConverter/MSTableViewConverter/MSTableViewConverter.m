//
//  MSTableViewConverter.m
//  MSTableViewConverter
//
//  Created by liqian on 16/1/7.
//  Copyright © 2016年 Bestdo. All rights reserved.
//

#import "MSTableViewConverter.h"
#import <objc/runtime.h>

@interface MSTableViewConverter()

@end
@implementation MSTableViewConverter
-(id)init
{
    self = [super init];
    if (self)
    {
        _sectionConverters = [NSMutableArray array];
    }
    return self;
}


#pragma mark - Section Converter

-(void)addSectionConverter:(MSSectionConverter *)sectionConverter
{
    [self.sectionConverters addObject:sectionConverter];
}

-(MSSectionConverter *)getSectionConverterAt:(int)index
{
    return self.sectionConverters[index];
}

#pragma mark - TableView Section Delegate & DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return [self.sectionConverters count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    if ([self.sectionConverters count] < 1) return nil;
    
    MSSectionConverter * sectionConverter = self.sectionConverters[section];
    if (sectionConverter.configureHeaderBlock)
    {
        return sectionConverter.configureHeaderBlock(tableView, (int)section);
    }
    
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if ([self.sectionConverters count] < 1) return -1;
    
    MSSectionConverter* sectionConverter = self.sectionConverters[section];
    if (sectionConverter.heightHeaderBlock)
    {
        return sectionConverter.heightHeaderBlock(tableView, (int)section);
    }
    
    return -1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    if ([self.sectionConverters count] < 1) return nil;
    
    MSSectionConverter* sectionConverter = self.sectionConverters[section];
    if (sectionConverter.configureFooterBlock)
        return sectionConverter.configureFooterBlock(tableView, (int)section);
    
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    if ([self.sectionConverters count] < 1) return -1;
    
    MSSectionConverter* sectionConverter = self.sectionConverters[section];
    if (sectionConverter.heightFooterBlock)
        return sectionConverter.heightFooterBlock(tableView, (int)section);
    
    return -1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    if ([self.sectionConverters count] < 1) return nil;
    
    MSSectionConverter* sectionConverter = self.sectionConverters[section];
    if (sectionConverter.titleHeaderBlock)
        return sectionConverter.titleHeaderBlock(tableView, (int)section);
    
    return nil;
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    
    if ([self.sectionConverters count] < 1) return nil;
    
    MSSectionConverter* sectionConverter = self.sectionConverters[section];
    if (sectionConverter.titleFooterBlock)
        return sectionConverter.titleFooterBlock(tableView, (int)section);
    
    return nil;
}

#pragma mark - TableView Cell Delegate & DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if ([self.sectionConverters count] < 1) return 0;
    
    MSSectionConverter* sectionConverter = self.sectionConverters[section];
    return [sectionConverter.cellConverters count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MSSectionConverter* sectionConverter = self.sectionConverters[indexPath.section];
    MSCellConverter* cellConverter = sectionConverter.cellConverters[indexPath.row];
    if (cellConverter.heightBlock)
        return cellConverter.heightBlock(tableView, indexPath);
    
    return 0;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    MSSectionConverter* sectionConverter = self.sectionConverters[indexPath.section];
    MSCellConverter* cellConverter = sectionConverter.cellConverters[indexPath.row];
    if (cellConverter.willDisplayBlock)
        cellConverter.willDisplayBlock(tableView, cell, indexPath);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    MSSectionConverter* sectionConverter = self.sectionConverters[indexPath.section];
    MSCellConverter* cellConverter = sectionConverter.cellConverters[indexPath.row];
    if (cellConverter.configureBlock)
        return cellConverter.configureBlock(tableView, indexPath);
    
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    MSSectionConverter* sectionConverter = self.sectionConverters[indexPath.section];
    MSCellConverter* cellConverter = sectionConverter.cellConverters[indexPath.row];
    if (cellConverter.selectBlock)
        cellConverter.selectBlock(tableView, indexPath);
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    MSSectionConverter* sectionConverter = self.sectionConverters[indexPath.section];
    MSCellConverter* cellConverter = sectionConverter.cellConverters[indexPath.row];
    if (cellConverter.editableBlock)
        return cellConverter.editableBlock(tableView, indexPath);
    
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MSSectionConverter* sectionConverter = self.sectionConverters[indexPath.section];
    MSCellConverter* cellConverter = sectionConverter.cellConverters[indexPath.row];
    if (cellConverter.commitEditingStyleBlock)
        cellConverter.commitEditingStyleBlock(tableView, editingStyle, indexPath);
}

@end
