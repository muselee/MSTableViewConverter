//
//  MSTableViewConverter.h
//  MSTableViewConverter
//
//  Created by liqian on 16/1/7.
//  Copyright © 2016年 Bestdo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSSectionConverter.h"
@interface MSTableViewConverter : NSObject<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong,readonly) NSMutableArray* sectionConverters;

- (instancetype)init;

- (void)addSectionConverter:(MSSectionConverter *)sectionConverter;

@end
