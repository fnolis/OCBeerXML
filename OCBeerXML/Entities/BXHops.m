#import "BXHops.h"
#import "BXHop.h"
#import "BXXmlTags.h"

@interface BXHops()

@property (nonatomic, retain) NSMutableArray *hops;

@end

@implementation BXHops

+ (BXHops*)hopsFromDictionary:(NSDictionary*)data error:(NSError**)error {
	BXHops *bxhops = [[BXHops alloc] init];
	BXHop *bxhop = nil;
	NSError *xmlerror = nil;
	
	if ([[data objectForKey:BXTagHop] isKindOfClass:[NSArray class]] ){ // many
		for (NSDictionary *hop in [data objectForKey:BXTagHop]) {
			bxhop = [BXHop hopFromDictionary:hop error:&xmlerror];
			
			if( bxhop )
				[bxhops.hops addObject:bxhop];
			else if( !xmlerror ) // If error was nil and bxhop resulted in nil, unknown error
				xmlerror = [NSError errorWithDomain:@"UnknownError" code:-1 userInfo:nil];
			
			if( !error && xmlerror ) break;
		}
	} else if ([[data objectForKey:BXTagHop] isKindOfClass:[NSDictionary class]] ){ // one
		bxhop = [BXHop hopFromDictionary:[data objectForKey:BXTagHop] error:error];
		
		if( bxhop )
			[bxhops.hops addObject:bxhop];
		else if( !error )// If error was nil and bxhop resulted in nil, unknown error
			xmlerror = [NSError errorWithDomain:@"UnknownError" code:-1 userInfo:nil];
	}
	
	if( xmlerror && error )
		*error = xmlerror;

	return bxhops;
}

- (id)init {
	self = [super init];

	if( self ) {
		self.hops = [NSMutableArray array];
	}
	
	return self;
}

- (NSUInteger)count {
	return self.hops.count;
}

- (BXHop*)objectAtIndex:(NSUInteger)index {
	return [self.hops objectAtIndex:index];
}

@end
