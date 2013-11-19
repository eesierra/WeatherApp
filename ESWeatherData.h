//
//  ESWeatherData.h
//  WeatherApp
//
//  Created by Eduardo Sierra on 11/11/13.
//  Copyright (c) 2013 Sierra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESWeatherData : NSObject

@property (nonatomic, strong) NSString *locationName;
@property (nonatomic, strong) NSDecimalNumber *temperature;
@property (nonatomic, strong) NSString *weatherDescription;


@end
