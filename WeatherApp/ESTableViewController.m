//
//  ESTableViewController.m
//  WeatherApp
//
//  Created by Eduardo Sierra on 11/14/13.
//  Copyright (c) 2013 Sierra. All rights reserved.
//

#import "ESTableViewController.h"
#import "ESWeatherCell.h"

@interface ESTableViewController ()

@end

@implementation ESTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.theWeather = [[ESWeatherData alloc] init];
    
    _weatherArray = [NSMutableArray new];
    
    _weatherURL = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=Seattle,us"];
    
    [self weatherInfo:_weatherURL];
    


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return _weatherArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ESWeatherCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[ESWeatherCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    // Configure the cell...
    
    cell.city.text = [_weatherArray[indexPath.row] locationName];
    if ([_weatherArray[indexPath.row] temperature]) {
        cell.temp.text = [NSString stringWithFormat:@"%@", [_weatherArray[indexPath.row] temperature]];
    }
    cell.desc.text = [_weatherArray[indexPath.row] weatherDescription];
    
    
    return cell;
        
}

- (void)weatherInfo:(NSURL *)weatherSeattle
{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    
    NSURLSessionDataTask *weatherData = [session dataTaskWithURL:weatherSeattle completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *weatherDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        self.theWeather.locationName = [weatherDictionary objectForKey:@"name"];
        self.theWeather.temperature = [weatherDictionary valueForKeyPath:@"main.temp"];
        self.theWeather.weatherDescription = [[[weatherDictionary objectForKey:@"weather"] lastObject] objectForKey:@"description"];
        
        [self.weatherArray addObject:self.theWeather];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];

        }];
        
        
    }];
    
    [weatherData resume];
    
}

- (IBAction)refreshWeather:(id)sender;
{
    [self.tableView reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    

    
}


@end
