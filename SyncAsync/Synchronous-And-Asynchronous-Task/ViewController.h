//
//  ViewController.h
//  Synchronous-And-Asynchronous-Task
//
//  Created by Mohammed Adel on 28/08/2023.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>



@interface ViewController : UIViewController <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property NSURL* url;
@property NSURLRequest* request;
@property NSString* s;
@property NSURLConnection *connection;
@property NSMutableData* data;


@end

