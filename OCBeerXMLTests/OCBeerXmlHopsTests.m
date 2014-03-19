#import <XCTest/XCTest.h>
#import "OCBeerXml.h"
#include "BXHops.h"

@interface BeerXmlHopsTests : XCTestCase

@end

@implementation BeerXmlHopsTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

/*
- (void)testParseHop {
	NSString *xml = @"<HOPS><HOP><NAME>Amarillo</NAME><VERSION>1</VERSION><ALPHA>3.5</ALPHA><AMOUNT>3.4</AMOUNT><USE>Boil</USE><TIME>25</TIME></HOP></HOPS>";
	NSError *error;
	NSArray *hops = [OCBeerXML parseHops:xml error:&error];
	
	XCTAssertTrue(hops, @"Failed to parse hop");
	
	BXHop *hop = [hops objectAtIndex:0];
	XCTAssertTrue([hop.name isEqualToString:@"Amarillo" ], @"Name is '%@', but should be 'Amarillo'", hop.name);
	XCTAssertTrue(hop.version == 1, @"Version is '%d', but should be '1'", (int)hop.version);
}

- (void)testParseHops {
	NSString *xml = @"<HOPS><HOP><NAME>Amarillo</NAME><VERSION>1</VERSION><ALPHA>3.5</ALPHA><AMOUNT>3.4</AMOUNT><USE>Boil</USE><TIME>25</TIME></HOP><HOP><NAME>Cascade</NAME><VERSION>2</VERSION><ALPHA>3.5</ALPHA><AMOUNT>3.4</AMOUNT><USE>Boil</USE><TIME>25</TIME></HOP></HOPS>";
	NSError *error;
	NSArray *hops = [OCBeerXML parseHops:xml error:&error];
	
	XCTAssertTrue(hops, @"Failed to parse hop");
	
	BXHop *hop = [hops objectAtIndex:1];
	XCTAssertTrue([hop.name isEqualToString:@"Cascade" ], @"Hop name is '%@', but should be 'Cascade'", hop.name);
	XCTAssertTrue(hop.version == 2, @"Version is '%d', but should be '2'", (int)hop.version);
}
*/
/*
 *	Sends valid XML but VERSION has been removed. Should result in an error.
 */
/*
- (void)testParseBrokenHopMissingVersion {
	NSString *xml = @"<HOPS><HOP><NAME>Amarillo</NAME><ALPHA>3.5</ALPHA><AMOUNT>3.4</AMOUNT><USE>Boil</USE><TIME>25</TIME></HOP></HOPS>";
	NSError *error;
	NSArray *hops = [OCBeerXML parseHops:xml error:&error];
	
	XCTAssertTrue(error, @"No error occurred, it should. Version is missing...");
	XCTAssertTrue(!hops, @"parse result is not nil");
	XCTAssertTrue([error.domain isEqualToString:BeerXMLErrorDomain] && error.code == BeerXMLErrorRequiredTagMissing, @"'%d:%@' is wrong kind of error", (int)error.code, error.domain);
}

- (void)testParseBrokenHopMissingVersion2 {
	NSString *xml = @"<HOPS><HOP><NAME>Amarillo</NAME><ALPHA>3.5</ALPHA><AMOUNT>3.4</AMOUNT><USE>Boil</USE><TIME>25</TIME></HOP></HOPS>";
	NSArray *hops = [OCBeerXML parseHops:xml];
	
	XCTAssertTrue(!hops, @"parse result is not nil");
}

- (void)testParseBrokenHopMissingName {
	NSString *xml = @"<HOPS><HOP><ALPHA>3.5</ALPHA><VERSION>1</VERSION><AMOUNT>3.4</AMOUNT><USE>Boil</USE><TIME>25</TIME></HOP></HOPS>";
	NSError *error;
	NSArray *hops = [OCBeerXML parseHops:xml error:&error];
	
	XCTAssertTrue(error, @"No error occurred, it should. Version is missing...");
	XCTAssertTrue(!hops, @"parse result is not nil");
	XCTAssertTrue([error.domain isEqualToString:BeerXMLErrorDomain] && error.code == BeerXMLErrorRequiredTagMissing, @"'%d:%@' is wrong kind of error", (int)error.code, error.domain);
}

- (void)testParseBrokenHopMissingAlpha {
	NSString *xml = @"<HOPS><HOP><NAME>Amarillo</NAME><VERSION>1</VERSION><AMOUNT>3.4</AMOUNT><USE>Boil</USE><TIME>25</TIME></HOP></HOPS>";
	NSError *error;
	NSArray *hops = [OCBeerXML parseHops:xml error:&error];
	
	XCTAssertTrue(error, @"No error occurred, it should. Version is missing...");
	XCTAssertTrue(!hops, @"parse result is not nil");
	XCTAssertTrue([error.domain isEqualToString:BeerXMLErrorDomain] && error.code == BeerXMLErrorRequiredTagMissing, @"'%d:%@' is wrong kind of error", (int)error.code, error.domain);
}
*/
/*
 *	Sends broken XML with enabled error feedback
 *
 *	@see testParseBrokenHopXML2
 */
/*
- (void)testParseBrokenHopXML {
	NSString *xml = @"<HOPS><HOP<NAME>Amarillo<ALPHA>3.5</ALPHA><AMOUN</AMOUNT><USE>Boil</USE><TIME>25</TIME></HOP></HOPS>";
	NSError *error;
	NSArray *hops = [OCBeerXML parseHops:xml error:&error];
	
	XCTAssertTrue(error, @"No error occurred, it should.");
	XCTAssertTrue(!hops, @"parse result is not nil");
	XCTAssertTrue(error.code == 68, @"Error is NOT 68 'error parsing attribute name'");
}

- (void)testParseHopsBrew015 {
	NSString *xml = @"<HOPS><HOP><NAME>US Columbus(Tomahawk)</NAME><VERSION>1</VERSION><ALPHA>15.000000</ALPHA><AMOUNT>0.050000</AMOUNT><NOTES>60 Min From End</NOTES><USE>Boil</USE><TIME>60</TIME><FORM>Pellet</FORM></HOP><HOP><NAME>US Centennial</NAME><VERSION>1</VERSION><ALPHA>10.000000</ALPHA><AMOUNT>0.020000</AMOUNT><NOTES>5 Min From End</NOTES><USE>Boil</USE><TIME>5</TIME><FORM>Pellet</FORM></HOP><HOP><NAME>US Amarillo</NAME><VERSION>1</VERSION><ALPHA>9.000000</ALPHA><AMOUNT>0.020000</AMOUNT><NOTES>5 Min From End</NOTES><USE>Boil</USE><TIME>5</TIME><FORM>Pellet</FORM></HOP><HOP><NAME>US Cascade</NAME><VERSION>1</VERSION><ALPHA>7.000000</ALPHA><AMOUNT>0.020000</AMOUNT><NOTES>5 Min From End</NOTES><USE>Boil</USE><TIME>5</TIME><FORM>Pellet</FORM></HOP><HOP><NAME>US Amarillo</NAME><VERSION>1</VERSION><ALPHA>7.000000</ALPHA><AMOUNT>0.030000</AMOUNT><NOTES>20 Min From End</NOTES><USE>Boil</USE><TIME>20</TIME><FORM>Pellet</FORM></HOP><HOP><NAME>US Cascade</NAME><VERSION>1</VERSION><ALPHA>7.000000</ALPHA><AMOUNT>0.030000</AMOUNT><NOTES>20 Min From End</NOTES><USE>Boil</USE><TIME>20</TIME><FORM>Pellet</FORM></HOP><HOP><NAME>US Chinook</NAME><VERSION>1</VERSION><ALPHA>12.000000</ALPHA><AMOUNT>0.020000</AMOUNT><NOTES>5 Min From End</NOTES><USE>Boil</USE><TIME>5</TIME><FORM>Pellet</FORM></HOP></HOPS>";
	NSError *error;
	NSArray *hops = [OCBeerXML parseHops:xml error:&error];
	
	XCTAssertFalse(error, @"Error occured, it shouldn't.");
	XCTAssertTrue(hops, @"No hops parsed");
	
	XCTAssertEqual((int)hops.count, 7, @"Hops count is '%d', should be '7'",(int)hops.count);
}
*/
/*
 *	Sends broken XML but with disabled error feedback
 *
 * @see testParseBrokenHopXML
 */
/*
- (void)testParseBrokenHopXML2 {
	NSString *xml = @"<HOPS><HOP<NAME>Amarillo<ALPHA>3.5</ALPHA><AMOUN</AMOUNT><USE>Boil</USE><TIME>25</TIME></HOP></HOPS>";
	NSArray *hops = [OCBeerXML parseHops:xml];
	
	XCTAssertTrue(!hops, @"parse result is not nil");
}
*/

@end