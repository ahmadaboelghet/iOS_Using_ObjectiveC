//
//  ViewController.m
//  Synchronous-And-Asynchronous-Task
//
//  Created by Mohammed Adel on 28/08/2023.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
 

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)asyncButtonTapped:(id)sender {
    _url = [NSURL URLWithString:@"https://m.facebook.com"];
    _request = [NSURLRequest requestWithURL:_url];
    _connection = [[NSURLConnection alloc]initWithRequest:_request delegate:self];
    [_connection start];
}

- (IBAction)syncButtonTapped:(id)sender {
    _url = [[NSURL alloc]initWithString:@"https://m.facebook.com"];
    _s = [[NSString alloc]initWithContentsOfURL:_url encoding:NSUTF8StringEncoding error:nil];
   
    SecondViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    vc.flag = NO;
    vc.s = _s;
    vc.url = _url;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.data appendData:data];
    _s = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    SecondViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    vc.flag = YES;
    vc.s = _s;
    vc.request = _request;
    [self presentViewController:vc animated:YES completion:nil];
}

@end

