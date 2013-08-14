//
// Created by AndrewShmig on 8/14/13.
//
// Copyright (c) 2013 Andrew Shmig
// 
// Permission is hereby granted, free of charge, to any person 
// obtaining a copy of this software and associated documentation 
// files (the "Software"), to deal in the Software without 
// restriction, including without limitation the rights to use, 
// copy, modify, merge, publish, distribute, sublicense, and/or 
// sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following 
// conditions:
// 
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
// FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION 
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
// THE SOFTWARE.
//
#import "kNNClassifier.h"
#import "Film.h"
#import "Pair.h"


@implementation kNNClassifier
{
    NSArray *_dataSet;
}

- (instancetype)initWithArray:(NSArray *)initialDataSet
{
    if(self = [super init]){
        _dataSet = initialDataSet;
    }

    return self;
}

- (NSString *)classifyFilm:(Film *)film
{
    const int K = 3; // K < [_dataSet count]

//    вычисляем расстояния
    NSMutableArray* pairs = [[NSMutableArray alloc] init];

    for(Film* f in _dataSet){
        NSNumber* distance = [self calculateDistanceFrom:film to:f];

        Pair* p = [[Pair alloc] init];
        p.first = f;
        p.second = distance;

        [pairs addObject:p];
    }

//    сортируем
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"second"
                                                                     ascending:YES];
    [pairs sortUsingDescriptors:@[sortDescriptor]];

//    определяем жанр
    NSMutableDictionary *genres = [NSMutableDictionary dictionary];

    for(NSUInteger index=0; index<K; index++){
        NSString* genre = [[pairs[index] first] genre];

        if(nil == genres[genre]){
            genres[genre] = @1;
        } else {
            NSNumber* count = @([genres[genre] integerValue] + 1);
            genres[genre] = count;
        }
    }

    NSNumber* maxValue = @(-1);
    for(NSString* g in [genres allKeys]){
        if([genres[g] integerValue] > [maxValue integerValue]){
            maxValue = genres[g];
        }
    }

    NSMutableArray *resultingGenres = [NSMutableArray array];
    for(NSString* g in [genres allKeys]){
        if([genres[g] integerValue] == [maxValue integerValue]){
            [resultingGenres addObject:g];
        }
    }

    return [resultingGenres componentsJoinedByString:@","];
}

#pragma mark - Private methods

- (NSNumber *)calculateDistanceFrom:(Film *)filmA to:(Film *)filmB
{
    NSUInteger X = filmA.kisses - filmB.kisses;
    NSUInteger Y = filmA.funnyScenes - filmB.funnyScenes;
    NSUInteger Z = filmA.bangs - filmB.bangs;

    NSUInteger result = X*X + Y*Y + Z*Z;
    return @(result);
}

@end