//
//  ASAAppDelegate.m
//  kNN
//
//  Created by AndrewShmig on 8/14/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import "ASAAppDelegate.h"
#import "Film.h"
#import "kNNClassifier.h"

@implementation ASAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

//    Data set to classify
    Film* first = [[Film alloc] initWithName:@"Морской бой"
                                     kisses:0
                                funnyScenes:4
                                      bangs:74];
    Film* second = [[Film alloc] initWithName:@"Город грехов"
                                       kisses:24
                                  funnyScenes:15
                                        bangs:58];
    Film* third = [[Film alloc] initWithName:@"Призрачный патруль"
                                      kisses:3
                                 funnyScenes:42
                                       bangs:65];
    NSArray* filmsToClassify = @[first, second, third];

//    Initial data set
    Film* a = [[Film alloc] initWithName:@"Эммануель"
                                  kisses:73
                             funnyScenes:0
                                   bangs:0];
    a.genre = @"Драма";
    Film* b = [[Film alloc] initWithName:@"Великий Гэтсби"
                                  kisses:35
                             funnyScenes:7
                                   bangs:2];
    b.genre = @"Драма";
    Film* c = [[Film alloc] initWithName:@"Железный человек"
                                  kisses:5
                             funnyScenes:7
                                   bangs:98];
    c.genre = @"Боевик";
    Film* d = [[Film alloc] initWithName:@"Очень страшное кино"
                                  kisses:16
                             funnyScenes:69
                                   bangs:1];
    d.genre = @"Комедия";
    Film* e = [[Film alloc] initWithName:@"Терминатор"
                                  kisses:1
                             funnyScenes:0
                                   bangs:157];
    e.genre = @"Боевик";

//    Classification process
    kNNClassifier* kNN = [[kNNClassifier alloc] initWithArray:@[a, b, c, d, e]];

    for(Film* f in filmsToClassify){
        NSLog(@"\"%@\" is classified as \"%@\"", f.name, [kNN classifyFilm:f]);
    }

    return YES;
}

@end