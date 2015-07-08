//  TDD sample app MarvelBrowser by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 Jonathan M. Reid. See LICENSE.txt

#import <Foundation/Foundation.h>

@interface QCOMarvelAuthentication : NSObject

@property (nonatomic, copy) NSString *timestamp;
@property (nonatomic, copy) NSString *publicKey;
@property (nonatomic, copy) NSString *privateKey;
@property (nonatomic, copy) NSString *(^MD5Block)(NSString *);

- (NSString *)MD5OfString:(NSString *)str;
- (NSString *)URLParameters;

@end
