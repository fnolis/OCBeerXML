//
//  OCBeerXML.m
//  OCBeerXML
//
//  Created by Ola Rönnerup on 04/03/14.
//  Copyright (c) 2014 Ola Rönnerup. All rights reserved.
//

#import "OCBeerXML.h"
#import "BXXmlTags.h"
#import "XmlReader.h"
#import "BXRecipe.h"

@implementation OCBeerXML

#pragma mark - Recipes

+ (NSArray*)parseRecipes:(NSString*)xml error:(NSError**)error {
	NSError *xmlerror = nil;
	NSDictionary *data = [XMLReader dictionaryForXMLString:xml error:&xmlerror];
	NSMutableArray *recipes = nil;
	
	if( !xmlerror ) {
		recipes = [NSMutableArray array];
		BXRecipe *bxrecipe;
		
		if( [[data objectForKey:BXTagRecipes] isKindOfClass:[NSDictionary class]] ) {
			if ([[[data objectForKey:BXTagRecipes] objectForKey:BXTagRecipe] isKindOfClass:[NSArray class]] ){ // many
				for (NSDictionary *recipe in [[data objectForKey:BXTagRecipes] objectForKey:BXTagRecipe]) {
					bxrecipe = [BXRecipe recipeFromDictionary:recipe error:&xmlerror];
					
					if( bxrecipe )
						[recipes addObject:bxrecipe];
					else if( !xmlerror ) // If error was nil and bxhop resulted in nil, unknown error
						xmlerror = [NSError errorWithDomain:@"UnknownError" code:-1 userInfo:nil];
					
					if( error && *error ) break;
				}
			} else if ([[[data objectForKey:BXTagRecipes] objectForKey:BXTagRecipe] isKindOfClass:[NSDictionary class]] ){ // one
				bxrecipe = [BXRecipe recipeFromDictionary:[[data objectForKey:BXTagRecipes] objectForKey:BXTagRecipe] error:error];
				
				if( bxrecipe)
					[recipes addObject:bxrecipe];
				else if( !xmlerror )// If error was nil and bxhop resulted in nil, unknown error
					xmlerror = [NSError errorWithDomain:@"UnknownError" code:-1 userInfo:nil];
			}
		} else {
			NSLog(@"Unexpected data: %@",data);
			//TODO:Unexpected error
			NSLog(@"error class %@",[[data objectForKey:BXTagRecipes] class]);
		}
	}
	
	if( xmlerror ) {
		recipes = nil;
		
		if( error )
			*error = xmlerror;
	}
	
	return recipes;
}

#pragma mark - Hops

+ (NSArray*)parseHops:(NSString*)xml {
	return [self parseHops:xml error:nil];
}

+ (NSArray*)parseHops:(NSString*)xml error:(NSError**)error {
	NSError *xmlerror = nil;
	NSDictionary *data = [XMLReader dictionaryForXMLString:xml error:&xmlerror];
	NSMutableArray *hops = nil;
	
	if( !xmlerror ) {
		hops = [NSMutableArray array];
		BXHop *bxhop;
		
		if( [[data objectForKey:BXTagHops] isKindOfClass:[NSDictionary class]] ) {
			if ([[[data objectForKey:BXTagHops] objectForKey:BXTagHop] isKindOfClass:[NSArray class]] ){ // many
				for (NSDictionary *hop in [[data objectForKey:BXTagHops] objectForKey:BXTagHop]) {
					bxhop = [BXHop hopFromDictionary:hop error:&xmlerror];
					
					if( bxhop )
						[hops addObject:bxhop];
					else if( !xmlerror ) // If error was nil and bxhop resulted in nil, unknown error
						xmlerror = [NSError errorWithDomain:@"UnknownError" code:-1 userInfo:nil];
					
					if( error && *error ) break;
				}
			} else if ([[[data objectForKey:BXTagHops] objectForKey:BXTagHop] isKindOfClass:[NSDictionary class]] ){ // one
				bxhop = [BXHop hopFromDictionary:[[data objectForKey:BXTagHops] objectForKey:BXTagHop] error:&xmlerror];
				
				if( bxhop )
					[hops addObject:bxhop];
				else if( !xmlerror )// If error was nil and bxhop resulted in nil, unknown error
					xmlerror = [NSError errorWithDomain:@"UnknownError" code:-1 userInfo:nil];
			}
		} else {
			NSLog(@"Unexpected data: %@",data);
			//TODO:Unexpected error
			NSLog(@"error class %@",[[data objectForKey:BXTagHops] class]);
		}
	}
	
	if( xmlerror ) {
		hops = nil;
		
		if( error )
			*error = xmlerror;
	}
	
	return hops;
}

@end
