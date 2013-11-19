//
//  ESWeatherCell.h
//  WeatherApp
//
//  Created by Eduardo Sierra on 11/14/13.
//  Copyright (c) 2013 Sierra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESWeatherCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *city;
@property (nonatomic, weak) IBOutlet UILabel *temp;
@property (nonatomic, weak) IBOutlet UILabel *desc;


@end
