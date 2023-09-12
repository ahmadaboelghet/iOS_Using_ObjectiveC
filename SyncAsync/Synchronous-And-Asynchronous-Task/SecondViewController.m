//
//  SyncViewController.m
//  Synchronous-And-Asynchronous-Task
//
//  Created by Mohammed Adel on 28/08/2023.
//

#import "SecondViewController.h"
#import <WebKit/WebKit.h>


@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    if (_flag) {
        _textView.text = _s;
        [_webView loadRequest: _request];
    } else {
        _textView.text = _s;
        [_webView loadHTMLString:_s baseURL:_url];
    }
    
}



@end
