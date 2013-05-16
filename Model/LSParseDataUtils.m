//
//  LSParseDataUtils.m
//  Locoso
//
//  Created by zhiwei ma on 12-3-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSParseDataUtils.h"

@implementation LSParseDataUtils
+ (LSDataCategory*)parseCategory:(NSDictionary*)aJSONData
{
    LSDataCategory* category = [[[LSDataCategory alloc] init] autorelease];
    
    category.ID = [[aJSONData valueForKey:LSJSONKEY_id] longValue];
    category.name = [aJSONData valueForKey:LSJSONKEY_name];
    category.spell = [aJSONData valueForKey:LSJSONKEY_spell];
    category.shortname = [aJSONData valueForKey:LSJSONKEY_shortname];
    category.ico = [aJSONData valueForKey:LSJSONKEY_ico];
    category.parentnames = [aJSONData valueForKey:LSJSONKEY_parentnames];
    category.parentids = [aJSONData valueForKey:LSJSONKEY_parentids];
    category.parented = [[aJSONData valueForKey:LSJSONKEY_parented] longValue];
    category.cityname = [aJSONData valueForKey:LSJSONKEY_cityname];
    category.cityid = [[aJSONData valueForKey:LSJSONKEY_cityid] longValue];
    category.ishot = [[aJSONData valueForKey:LSJSONKEY_ishot] intValue];
    category.arrchildid = [aJSONData valueForKey:LSJSONKEY_arrchildid];
    category.childnum = [[aJSONData valueForKey:LSJSONKEY_childnum] intValue];
    category.depth = [[aJSONData valueForKey:LSJSONKEY_depth] intValue];
    category.childid = [aJSONData valueForKey:LSJSONKEY_childid];
    
    return category;
}
+ (LSDataCompany*)parseCompany:(NSDictionary*)aJSONData
{
    LSDataCompany* company = [[[LSDataCompany alloc] init] autorelease];
    
    company.companyID = [[aJSONData valueForKey:LSJSONKEY_companyid] longValue];
    company.companyName = [aJSONData valueForKey:LSJSONKEY_companyname];
    company.logo = [aJSONData valueForKey:LSJSONKEY_logo];
    company.address = [aJSONData valueForKey:LSJSONKEY_address];
    company.state = [[aJSONData valueForKey:LSJSONKEY_state] intValue];
    
    
    return company;
}
+ (LSDataCompanyDetail*)parseCompanyDetail:(NSDictionary*)aJSONData
{
    LSDataCompanyDetail* company = [[[LSDataCompanyDetail alloc] init] autorelease];
    
    company.companyID = [[aJSONData valueForKey:LSJSONKEY_companyid] longValue];
    company.companyName = [aJSONData valueForKey:LSJSONKEY_companyname];
    company.logo = [aJSONData valueForKey:LSJSONKEY_logo];
    company.address = [aJSONData valueForKey:LSJSONKEY_address];
    company.mapx  = [aJSONData valueForKey:LSJSONKEY_MapX];
    company.mapy  = [aJSONData valueForKey:LSJSONKEY_MapY];
    company.contactphone = [aJSONData valueForKey:LSJSONKEY_contactphone];
    company.info = [aJSONData valueForKey:LSJSONKEY_info];
    return company;
}

+ (LSDataProduct*)parseProduct:(NSDictionary*)aJSONData
{
        
    LSDataProduct* product = [[[LSDataProduct alloc] init] autorelease];
    
    product.producid = [[aJSONData valueForKey:LSJSONKEY_ProductId] longValue];
    product.productname = [aJSONData valueForKey:LSJSONKEY_ProductName];
    product.content = [aJSONData valueForKey:LSJSONKEY_content];
    product.imageUrl = [aJSONData valueForKey:LSJSONKEY_image];
    return product;

}

+ (LSDataCount*)parseCount:(NSDictionary*)aJSONData
{

    LSDataCount* product = [[[LSDataCount alloc] init] autorelease];


    product.photocount = [aJSONData valueForKey:LSJSONKEY_PhotoCount];
    product.mesgcount = [aJSONData valueForKey:LSJSONKEY_mesgcount];
    product.viewCount = [aJSONData valueForKey:LSJSONKEY_viewCount];
    product.procount = [aJSONData valueForKey:LSJSONKEY_procount];
    product.newscount = [aJSONData valueForKey:LSJSONKEY_newscount];

    return product;
}


+ (LSDataNews*)parseNews:(NSDictionary*)aJSONData
{
    LSDataNews* news = [[[LSDataNews alloc] init] autorelease];
    
    news.articleid = [[aJSONData valueForKey:LSJSONKEY_articleid] longValue];
    news.title = [aJSONData valueForKey:LSJSONKEY_title];
    news.content = [aJSONData valueForKey:LSJSONKEY_content];
    return news;
}

+ (LSDataMessage*)parseMessage:(NSDictionary*)aJSONData
{
    LSDataMessage* message = [[[LSDataMessage alloc] init] autorelease];
    
    message.messageID = [[aJSONData valueForKey:LSJSONKEY_messageid] longValue];
    message.senderuaid = [[aJSONData valueForKey:LSJSONKEY_senderuaid] longValue];
    message.senderuaname = [aJSONData valueForKey:LSJSONKEY_senderuaname];
    message.content = [aJSONData valueForKey:LSJSONKEY_content];
    message.createtime = [aJSONData valueForKey:LSJSONKEY_createtime];
    message.replyContent = [aJSONData valueForKey:LSJSONKEY_replycontent];
    message.state = [[aJSONData valueForKey:LSJSONKEY_state] intValue];
    return message;
}

+ (LSDataPhoto*)parsePhoto:(NSDictionary*)aJSONData
{
    LSDataPhoto* photo = [[[LSDataPhoto alloc] init] autorelease];
    
    photo.mediaid = [[aJSONData valueForKey:LSJSONKEY_mediaid] longValue];
    photo.medianame = [aJSONData valueForKey:LSJSONKEY_medianame];
    photo.filepath = [aJSONData valueForKey:LSJSONKEY_filepath];
    
    return photo;
}

+ (LSDataPhoto*)parseUploadPhoto:(NSDictionary*)aJSONData
{
    LSDataPhoto* photo = [[[LSDataPhoto alloc] init] autorelease];
    
    photo.filepath = [aJSONData valueForKey:LSJSONKEY_filepath];
    
    return photo;
}


+ (LSDataCity*)parseCity:(NSDictionary*)aJSONData
{
    LSDataCity* city = [[[LSDataCity alloc] init] autorelease];
    
    city.ID = [[aJSONData valueForKey:LSJSONKEY_id] longValue];
    city.shortname = [aJSONData valueForKey:LSJSONKEY_shortname];
    if ([city.shortname length ] == 0)
    {
        city.shortname = [aJSONData valueForKey:LSJSONKEY_name];
    }
    city.childnum = [[aJSONData valueForKey:LSJSONKEY_childnum] intValue];
    city.depth = [[aJSONData valueForKey:LSJSONKEY_depth] intValue];
    city.parentid = [[aJSONData valueForKey:LSJSONKEY_parented] longValue];
    
    return city;
}
+ (LSDataEnterprise*)parseEnterprise:(NSDictionary*)aJSONData
{
    LSDataEnterprise* enterprise = [[[LSDataEnterprise alloc] init] autorelease];
    

    enterprise.companyname = [aJSONData valueForKey:LSJSONKEY_companyname];
    enterprise.telephone = [aJSONData valueForKey:LSJSONKEY_telephone];
    enterprise.address = [aJSONData valueForKey:LSJSONKEY_address];
    enterprise.contactphone = [aJSONData valueForKey:LSJSONKEY_contactphonem];
    enterprise.mobilephone = [aJSONData valueForKey:LSJSONKEY_mobilephone];
    enterprise.email = [aJSONData valueForKey:LSJSONKEY_email];
    enterprise.website = [aJSONData valueForKey:LSJSONKEY_website];
    enterprise.contactpeople = [aJSONData valueForKey:LSJSONKEY_contactpeople];
    enterprise.city = [aJSONData valueForKey:LSJSONKEY_city];
    enterprise.catename = [aJSONData valueForKey:LSJSONKEY_catename];
    enterprise.logo = [aJSONData valueForKey:LSJSONKEY_logo];
    return enterprise;
}

+ (LSDataKeyword*)parseKeyword:(NSDictionary*)aJSONData
{
    LSDataKeyword* keyword = [[[LSDataKeyword alloc] init] autorelease];
    keyword.name = [aJSONData valueForKey:LSJSONKEY_name];
    keyword.count = [[aJSONData valueForKey:LSJSONKEY_count] integerValue];
    return keyword;
}

+ (LSDataSession*)parseSession:(NSDictionary*)aJSONData
{
    LSDataSession* session = [[[LSDataSession alloc] init] autorelease];
    session.uaid = [aJSONData valueForKey:LSJSONKEY_uaid];
    session.session = [aJSONData valueForKey:LSJSONKEY_session];
    return session;
}

+ (LSDataAD*)parseAd:(NSDictionary*)aJSONData
{
    LSDataAD* ad = [[[LSDataAD alloc] init] autorelease];
    ad.imageURL = [aJSONData valueForKey:LSJSONKEY_value];
    ad.url = [aJSONData valueForKey:LSJSONKEY_url];
    return ad;
}
@end
