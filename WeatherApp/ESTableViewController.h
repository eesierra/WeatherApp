//
//  ESTableViewController.h
//  WeatherApp
//
//  Created by Eduardo Sierra on 11/14/13.
//  Copyright (c) 2013 Sierra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESWeatherData.h"

@interface ESTableViewController : UITableViewController <NSURLSessionDataDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) ESWeatherData *theWeather;
@property (nonatomic) NSMutableArray *weatherArray;
@property (nonatomic) NSURL *weatherURL;

- (void)weatherInfo:(NSURL *)weatherSeattle;

- (IBAction)refreshWeather:(id)sender;

@end
