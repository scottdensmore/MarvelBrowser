//  TDD sample app MarvelBrowser by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 Jonathan M. Reid. See LICENSE.txt

#import "QCOFetchCharactersResponseDataBuilder.h"

#import <OCHamcrest/OCHamcrest.h>
#import <XCTest/XCTest.h>


@interface QCOFetchCharactersResponseDataBuilderTests : XCTestCase
@end

@implementation QCOFetchCharactersResponseDataBuilderTests
{
    QCOFetchCharactersResponseDataBuilder *sut;
}

- (void)setUp
{
    [super setUp];
    sut = [[QCOFetchCharactersResponseDataBuilder alloc] init];
}

- (void)tearDown
{
    sut = nil;
    [super tearDown];
}

- (void)testParseDictionary_WithNonIntegerOffset_ShouldCaptureNilInBuilder
{
    NSDictionary *dict = @{ @"offset": @"123" };
    
    [sut parseDictionary:dict];
    
    assertThat(sut.offset, is(nilValue()));
}

- (void)testParseDictionary_WithOffset_ShouldCaptureValueInBuilder
{
    NSDictionary *dict = @{ @"offset": @123 };
    
    [sut parseDictionary:dict];
    
    assertThat(sut.offset, is(@123));
}

- (void)testParseDictionary_WithNonIntegerLimit_ShouldCaptureNilInBuilder
{
    NSDictionary *dict = @{ @"limit": @"123" };
    
    [sut parseDictionary:dict];
    
    assertThat(sut.limit, is(nilValue()));
}

- (void)testParseDictionary_WithLimit_ShouldCaptureValueInBuilder
{
    NSDictionary *dict = @{ @"limit": @123 };
    
    [sut parseDictionary:dict];
    
    assertThat(sut.limit, is(@123));
}

- (void)testParseDictionary_WithNonIntegerTotal_ShouldCaptureNilInBuilder
{
    NSDictionary *dict = @{ @"total": @"123" };
    
    [sut parseDictionary:dict];
    
    assertThat(sut.total, is(nilValue()));
}

- (void)testParseDictionary_WithTotal_ShouldCaptureValueInBuilder
{
    NSDictionary *dict = @{ @"total": @123 };
    
    [sut parseDictionary:dict];
    
    assertThat(sut.total, is(@123));
}

- (void)testParseDictionary_WithNonIntegerCount_ShouldCaptureNilInBuilder
{
    NSDictionary *dict = @{ @"count": @"123" };
    
    [sut parseDictionary:dict];
    
    assertThat(sut.count, is(nilValue()));
}

- (void)testParseDictionary_WithCount_ShouldCaptureValueInBuilder
{
    NSDictionary *dict = @{ @"count": @123 };
    
    [sut parseDictionary:dict];
    
    assertThat(sut.count, is(@123));
}

- (void)testParseDictionary_WithNonArrayResult_ShouldCaptureNilInBuilder
{
    NSDictionary *dict = @{ @"results":
            @{ @"name": @"DUMMY" }
    };
    
    [sut parseDictionary:dict];
    
    assertThat(sut.results, is(nilValue()));
}

- (void)testParseDictionary_WithOneResultThatIsNotDictionary_ShouldCaptureArraySizeZeroInBuilder
{
    NSDictionary *dict = @{ @"results": @[
            @[ @"DUMMY" ],
    ] };
    
    [sut parseDictionary:dict];
    
    assertThat(sut.results, hasCountOf(0));
}

- (void)testParseDictionary_WithOneResult_ShouldCaptureOneCharacterInBuilder
{
    NSDictionary *dict = @{ @"results": @[
            @{ @"name": @"ONE" },
    ] };
    
    [sut parseDictionary:dict];
    
    assertThat(sut.results, containsIn(@[
            hasProperty(@"name", @"ONE"),
    ]));
}

- (void)testParseDictionary_WithTwoResult_ShouldCaptureTwoCharactersInBuilder
{
    NSDictionary *dict = @{ @"results": @[
            @{ @"name": @"ONE" },
            @{ @"name": @"TWO" },
    ] };
    
    [sut parseDictionary:dict];
    
    assertThat(sut.results, containsIn(@[
            hasProperty(@"name", @"ONE"),
            hasProperty(@"name", @"TWO"),
    ]));
}

@end