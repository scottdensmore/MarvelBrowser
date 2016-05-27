//  TDD sample app MarvelBrowser by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2016 Jonathan M. Reid. See LICENSE.txt

#import "QCOFetchCharactersMarvelService.h"

#import "QCOFetchCharactersRequestModel.h"


@interface QCOFetchCharactersMarvelService ()
@property (nonatomic, strong, readonly) NSURLSession *session;
@end

@implementation QCOFetchCharactersMarvelService

- (instancetype)initWithSession:(NSURLSession *)session
{
    self = [super init];
    if (self)
        _session = session;
    return self;
}

- (void)fetchCharactersWithRequestModel:(QCOFetchCharactersRequestModel *)requestModel
{
    NSString *encodedNamePrefix = [requestModel.namePrefix stringByAddingPercentEncodingWithAllowedCharacters:
            [NSCharacterSet URLQueryAllowedCharacterSet]];
    NSString *urlString = [NSString stringWithFormat:
            @"https://gateway.marvel.com/v1/public/characters?nameStartsWith=%@&limit=%lu&offset=%lu",
            encodedNamePrefix,
            (unsigned long)requestModel.pageSize,
            (unsigned long)requestModel.offset
    ];
    urlString = [urlString stringByAppendingString:@"&ts=FOO&apikey=BAR&hash=BAZ"];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    [self.session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    }];
}

@end
