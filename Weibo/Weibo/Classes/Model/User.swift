//
//	User.swift
//
//	Create by 旭 张 on 30/1/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class User : NSObject, NSCoding{

	var abilityTags : String!
	var allowAllActMsg : Bool!
	var allowAllComment : Bool!
	var avatarHd : String!
	var avatarLarge : String!
	var biFollowersCount : Int!
	var blockApp : Int!
	var blockWord : Int!
	var cardid : String!
	var city : String!
	var classField : Int!
	var coverImage : String!
	var coverImagePhone : String!
	var createdAt : String!
	var creditScore : Int!
	var descriptionField : String!
	var domain : String!
	var favouritesCount : Int!
	var followMe : Bool!
	var followersCount : Int!
	var following : Bool!
	var friendsCount : Int!
	var gender : String!
	var geoEnabled : Bool!
	var hasServiceTel : Bool!
	var id : Int!
	var idstr : String!
	var insecurity : Insecurity!
	var lang : String!
	var like : Bool!
	var likeMe : Bool!
	var location : String!
	var mbrank : Int!
	var mbtype : Int!
	var name : String!
	var onlineStatus : Int!
	var pagefriendsCount : Int!
	var profileImageUrl : String!
	var profileUrl : String!
	var province : String!
	var ptype : Int!
	var remark : String!
	var screenName : String!
	var star : Int!
	var statusesCount : Int!
	var storyReadState : Int!
	var urank : Int!
	var url : String!
	var userAbility : Int!
	var vclubMember : Int!
	var verified : Bool!
	var verifiedContactEmail : String!
	var verifiedContactMobile : String!
	var verifiedContactName : String!
	var verifiedLevel : Int!
	var verifiedReason : String!
	var verifiedReasonModified : String!
	var verifiedReasonUrl : String!
	var verifiedSource : String!
	var verifiedSourceUrl : String!
	var verifiedState : Int!
	var verifiedTrade : String!
	var verifiedType : Int!
	var verifiedTypeExt : Int!
	var weihao : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		abilityTags = dictionary["ability_tags"] as? String
		allowAllActMsg = dictionary["allow_all_act_msg"] as? Bool
		allowAllComment = dictionary["allow_all_comment"] as? Bool
		avatarHd = dictionary["avatar_hd"] as? String
		avatarLarge = dictionary["avatar_large"] as? String
		biFollowersCount = dictionary["bi_followers_count"] as? Int
		blockApp = dictionary["block_app"] as? Int
		blockWord = dictionary["block_word"] as? Int
		cardid = dictionary["cardid"] as? String
		city = dictionary["city"] as? String
		classField = dictionary["class"] as? Int
		coverImage = dictionary["cover_image"] as? String
		coverImagePhone = dictionary["cover_image_phone"] as? String
		createdAt = dictionary["created_at"] as? String
		creditScore = dictionary["credit_score"] as? Int
		descriptionField = dictionary["description"] as? String
		domain = dictionary["domain"] as? String
		favouritesCount = dictionary["favourites_count"] as? Int
		followMe = dictionary["follow_me"] as? Bool
		followersCount = dictionary["followers_count"] as? Int
		following = dictionary["following"] as? Bool
		friendsCount = dictionary["friends_count"] as? Int
		gender = dictionary["gender"] as? String
		geoEnabled = dictionary["geo_enabled"] as? Bool
		hasServiceTel = dictionary["has_service_tel"] as? Bool
		id = dictionary["id"] as? Int
		idstr = dictionary["idstr"] as? String
		if let insecurityData = dictionary["insecurity"] as? [String:Any]{
			insecurity = Insecurity(fromDictionary: insecurityData)
		}
		lang = dictionary["lang"] as? String
		like = dictionary["like"] as? Bool
		likeMe = dictionary["like_me"] as? Bool
		location = dictionary["location"] as? String
		mbrank = dictionary["mbrank"] as? Int
		mbtype = dictionary["mbtype"] as? Int
		name = dictionary["name"] as? String
		onlineStatus = dictionary["online_status"] as? Int
		pagefriendsCount = dictionary["pagefriends_count"] as? Int
		profileImageUrl = dictionary["profile_image_url"] as? String
		profileUrl = dictionary["profile_url"] as? String
		province = dictionary["province"] as? String
		ptype = dictionary["ptype"] as? Int
		remark = dictionary["remark"] as? String
		screenName = dictionary["screen_name"] as? String
		star = dictionary["star"] as? Int
		statusesCount = dictionary["statuses_count"] as? Int
		storyReadState = dictionary["story_read_state"] as? Int
		urank = dictionary["urank"] as? Int
		url = dictionary["url"] as? String
		userAbility = dictionary["user_ability"] as? Int
		vclubMember = dictionary["vclub_member"] as? Int
		verified = dictionary["verified"] as? Bool
		verifiedContactEmail = dictionary["verified_contact_email"] as? String
		verifiedContactMobile = dictionary["verified_contact_mobile"] as? String
		verifiedContactName = dictionary["verified_contact_name"] as? String
		verifiedLevel = dictionary["verified_level"] as? Int
		verifiedReason = dictionary["verified_reason"] as? String
		verifiedReasonModified = dictionary["verified_reason_modified"] as? String
		verifiedReasonUrl = dictionary["verified_reason_url"] as? String
		verifiedSource = dictionary["verified_source"] as? String
		verifiedSourceUrl = dictionary["verified_source_url"] as? String
		verifiedState = dictionary["verified_state"] as? Int
		verifiedTrade = dictionary["verified_trade"] as? String
		verifiedType = dictionary["verified_type"] as? Int
		verifiedTypeExt = dictionary["verified_type_ext"] as? Int
		weihao = dictionary["weihao"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if abilityTags != nil{
			dictionary["ability_tags"] = abilityTags
		}
		if allowAllActMsg != nil{
			dictionary["allow_all_act_msg"] = allowAllActMsg
		}
		if allowAllComment != nil{
			dictionary["allow_all_comment"] = allowAllComment
		}
		if avatarHd != nil{
			dictionary["avatar_hd"] = avatarHd
		}
		if avatarLarge != nil{
			dictionary["avatar_large"] = avatarLarge
		}
		if biFollowersCount != nil{
			dictionary["bi_followers_count"] = biFollowersCount
		}
		if blockApp != nil{
			dictionary["block_app"] = blockApp
		}
		if blockWord != nil{
			dictionary["block_word"] = blockWord
		}
		if cardid != nil{
			dictionary["cardid"] = cardid
		}
		if city != nil{
			dictionary["city"] = city
		}
		if classField != nil{
			dictionary["class"] = classField
		}
		if coverImage != nil{
			dictionary["cover_image"] = coverImage
		}
		if coverImagePhone != nil{
			dictionary["cover_image_phone"] = coverImagePhone
		}
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if creditScore != nil{
			dictionary["credit_score"] = creditScore
		}
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		if domain != nil{
			dictionary["domain"] = domain
		}
		if favouritesCount != nil{
			dictionary["favourites_count"] = favouritesCount
		}
		if followMe != nil{
			dictionary["follow_me"] = followMe
		}
		if followersCount != nil{
			dictionary["followers_count"] = followersCount
		}
		if following != nil{
			dictionary["following"] = following
		}
		if friendsCount != nil{
			dictionary["friends_count"] = friendsCount
		}
		if gender != nil{
			dictionary["gender"] = gender
		}
		if geoEnabled != nil{
			dictionary["geo_enabled"] = geoEnabled
		}
		if hasServiceTel != nil{
			dictionary["has_service_tel"] = hasServiceTel
		}
		if id != nil{
			dictionary["id"] = id
		}
		if idstr != nil{
			dictionary["idstr"] = idstr
		}
		if insecurity != nil{
			dictionary["insecurity"] = insecurity.toDictionary()
		}
		if lang != nil{
			dictionary["lang"] = lang
		}
		if like != nil{
			dictionary["like"] = like
		}
		if likeMe != nil{
			dictionary["like_me"] = likeMe
		}
		if location != nil{
			dictionary["location"] = location
		}
		if mbrank != nil{
			dictionary["mbrank"] = mbrank
		}
		if mbtype != nil{
			dictionary["mbtype"] = mbtype
		}
		if name != nil{
			dictionary["name"] = name
		}
		if onlineStatus != nil{
			dictionary["online_status"] = onlineStatus
		}
		if pagefriendsCount != nil{
			dictionary["pagefriends_count"] = pagefriendsCount
		}
		if profileImageUrl != nil{
			dictionary["profile_image_url"] = profileImageUrl
		}
		if profileUrl != nil{
			dictionary["profile_url"] = profileUrl
		}
		if province != nil{
			dictionary["province"] = province
		}
		if ptype != nil{
			dictionary["ptype"] = ptype
		}
		if remark != nil{
			dictionary["remark"] = remark
		}
		if screenName != nil{
			dictionary["screen_name"] = screenName
		}
		if star != nil{
			dictionary["star"] = star
		}
		if statusesCount != nil{
			dictionary["statuses_count"] = statusesCount
		}
		if storyReadState != nil{
			dictionary["story_read_state"] = storyReadState
		}
		if urank != nil{
			dictionary["urank"] = urank
		}
		if url != nil{
			dictionary["url"] = url
		}
		if userAbility != nil{
			dictionary["user_ability"] = userAbility
		}
		if vclubMember != nil{
			dictionary["vclub_member"] = vclubMember
		}
		if verified != nil{
			dictionary["verified"] = verified
		}
		if verifiedContactEmail != nil{
			dictionary["verified_contact_email"] = verifiedContactEmail
		}
		if verifiedContactMobile != nil{
			dictionary["verified_contact_mobile"] = verifiedContactMobile
		}
		if verifiedContactName != nil{
			dictionary["verified_contact_name"] = verifiedContactName
		}
		if verifiedLevel != nil{
			dictionary["verified_level"] = verifiedLevel
		}
		if verifiedReason != nil{
			dictionary["verified_reason"] = verifiedReason
		}
		if verifiedReasonModified != nil{
			dictionary["verified_reason_modified"] = verifiedReasonModified
		}
		if verifiedReasonUrl != nil{
			dictionary["verified_reason_url"] = verifiedReasonUrl
		}
		if verifiedSource != nil{
			dictionary["verified_source"] = verifiedSource
		}
		if verifiedSourceUrl != nil{
			dictionary["verified_source_url"] = verifiedSourceUrl
		}
		if verifiedState != nil{
			dictionary["verified_state"] = verifiedState
		}
		if verifiedTrade != nil{
			dictionary["verified_trade"] = verifiedTrade
		}
		if verifiedType != nil{
			dictionary["verified_type"] = verifiedType
		}
		if verifiedTypeExt != nil{
			dictionary["verified_type_ext"] = verifiedTypeExt
		}
		if weihao != nil{
			dictionary["weihao"] = weihao
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         abilityTags = aDecoder.decodeObject(forKey: "ability_tags") as? String
         allowAllActMsg = aDecoder.decodeObject(forKey: "allow_all_act_msg") as? Bool
         allowAllComment = aDecoder.decodeObject(forKey: "allow_all_comment") as? Bool
         avatarHd = aDecoder.decodeObject(forKey: "avatar_hd") as? String
         avatarLarge = aDecoder.decodeObject(forKey: "avatar_large") as? String
         biFollowersCount = aDecoder.decodeObject(forKey: "bi_followers_count") as? Int
         blockApp = aDecoder.decodeObject(forKey: "block_app") as? Int
         blockWord = aDecoder.decodeObject(forKey: "block_word") as? Int
         cardid = aDecoder.decodeObject(forKey: "cardid") as? String
         city = aDecoder.decodeObject(forKey: "city") as? String
         classField = aDecoder.decodeObject(forKey: "class") as? Int
         coverImage = aDecoder.decodeObject(forKey: "cover_image") as? String
         coverImagePhone = aDecoder.decodeObject(forKey: "cover_image_phone") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         creditScore = aDecoder.decodeObject(forKey: "credit_score") as? Int
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         domain = aDecoder.decodeObject(forKey: "domain") as? String
         favouritesCount = aDecoder.decodeObject(forKey: "favourites_count") as? Int
         followMe = aDecoder.decodeObject(forKey: "follow_me") as? Bool
         followersCount = aDecoder.decodeObject(forKey: "followers_count") as? Int
         following = aDecoder.decodeObject(forKey: "following") as? Bool
         friendsCount = aDecoder.decodeObject(forKey: "friends_count") as? Int
         gender = aDecoder.decodeObject(forKey: "gender") as? String
         geoEnabled = aDecoder.decodeObject(forKey: "geo_enabled") as? Bool
         hasServiceTel = aDecoder.decodeObject(forKey: "has_service_tel") as? Bool
         id = aDecoder.decodeObject(forKey: "id") as? Int
         idstr = aDecoder.decodeObject(forKey: "idstr") as? String
         insecurity = aDecoder.decodeObject(forKey: "insecurity") as? Insecurity
         lang = aDecoder.decodeObject(forKey: "lang") as? String
         like = aDecoder.decodeObject(forKey: "like") as? Bool
         likeMe = aDecoder.decodeObject(forKey: "like_me") as? Bool
         location = aDecoder.decodeObject(forKey: "location") as? String
         mbrank = aDecoder.decodeObject(forKey: "mbrank") as? Int
         mbtype = aDecoder.decodeObject(forKey: "mbtype") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         onlineStatus = aDecoder.decodeObject(forKey: "online_status") as? Int
         pagefriendsCount = aDecoder.decodeObject(forKey: "pagefriends_count") as? Int
         profileImageUrl = aDecoder.decodeObject(forKey: "profile_image_url") as? String
         profileUrl = aDecoder.decodeObject(forKey: "profile_url") as? String
         province = aDecoder.decodeObject(forKey: "province") as? String
         ptype = aDecoder.decodeObject(forKey: "ptype") as? Int
         remark = aDecoder.decodeObject(forKey: "remark") as? String
         screenName = aDecoder.decodeObject(forKey: "screen_name") as? String
         star = aDecoder.decodeObject(forKey: "star") as? Int
         statusesCount = aDecoder.decodeObject(forKey: "statuses_count") as? Int
         storyReadState = aDecoder.decodeObject(forKey: "story_read_state") as? Int
         urank = aDecoder.decodeObject(forKey: "urank") as? Int
         url = aDecoder.decodeObject(forKey: "url") as? String
         userAbility = aDecoder.decodeObject(forKey: "user_ability") as? Int
         vclubMember = aDecoder.decodeObject(forKey: "vclub_member") as? Int
         verified = aDecoder.decodeObject(forKey: "verified") as? Bool
         verifiedContactEmail = aDecoder.decodeObject(forKey: "verified_contact_email") as? String
         verifiedContactMobile = aDecoder.decodeObject(forKey: "verified_contact_mobile") as? String
         verifiedContactName = aDecoder.decodeObject(forKey: "verified_contact_name") as? String
         verifiedLevel = aDecoder.decodeObject(forKey: "verified_level") as? Int
         verifiedReason = aDecoder.decodeObject(forKey: "verified_reason") as? String
         verifiedReasonModified = aDecoder.decodeObject(forKey: "verified_reason_modified") as? String
         verifiedReasonUrl = aDecoder.decodeObject(forKey: "verified_reason_url") as? String
         verifiedSource = aDecoder.decodeObject(forKey: "verified_source") as? String
         verifiedSourceUrl = aDecoder.decodeObject(forKey: "verified_source_url") as? String
         verifiedState = aDecoder.decodeObject(forKey: "verified_state") as? Int
         verifiedTrade = aDecoder.decodeObject(forKey: "verified_trade") as? String
         verifiedType = aDecoder.decodeObject(forKey: "verified_type") as? Int
         verifiedTypeExt = aDecoder.decodeObject(forKey: "verified_type_ext") as? Int
         weihao = aDecoder.decodeObject(forKey: "weihao") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if abilityTags != nil{
			aCoder.encode(abilityTags, forKey: "ability_tags")
		}
		if allowAllActMsg != nil{
			aCoder.encode(allowAllActMsg, forKey: "allow_all_act_msg")
		}
		if allowAllComment != nil{
			aCoder.encode(allowAllComment, forKey: "allow_all_comment")
		}
		if avatarHd != nil{
			aCoder.encode(avatarHd, forKey: "avatar_hd")
		}
		if avatarLarge != nil{
			aCoder.encode(avatarLarge, forKey: "avatar_large")
		}
		if biFollowersCount != nil{
			aCoder.encode(biFollowersCount, forKey: "bi_followers_count")
		}
		if blockApp != nil{
			aCoder.encode(blockApp, forKey: "block_app")
		}
		if blockWord != nil{
			aCoder.encode(blockWord, forKey: "block_word")
		}
		if cardid != nil{
			aCoder.encode(cardid, forKey: "cardid")
		}
		if city != nil{
			aCoder.encode(city, forKey: "city")
		}
		if classField != nil{
			aCoder.encode(classField, forKey: "class")
		}
		if coverImage != nil{
			aCoder.encode(coverImage, forKey: "cover_image")
		}
		if coverImagePhone != nil{
			aCoder.encode(coverImagePhone, forKey: "cover_image_phone")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if creditScore != nil{
			aCoder.encode(creditScore, forKey: "credit_score")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if domain != nil{
			aCoder.encode(domain, forKey: "domain")
		}
		if favouritesCount != nil{
			aCoder.encode(favouritesCount, forKey: "favourites_count")
		}
		if followMe != nil{
			aCoder.encode(followMe, forKey: "follow_me")
		}
		if followersCount != nil{
			aCoder.encode(followersCount, forKey: "followers_count")
		}
		if following != nil{
			aCoder.encode(following, forKey: "following")
		}
		if friendsCount != nil{
			aCoder.encode(friendsCount, forKey: "friends_count")
		}
		if gender != nil{
			aCoder.encode(gender, forKey: "gender")
		}
		if geoEnabled != nil{
			aCoder.encode(geoEnabled, forKey: "geo_enabled")
		}
		if hasServiceTel != nil{
			aCoder.encode(hasServiceTel, forKey: "has_service_tel")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if idstr != nil{
			aCoder.encode(idstr, forKey: "idstr")
		}
		if insecurity != nil{
			aCoder.encode(insecurity, forKey: "insecurity")
		}
		if lang != nil{
			aCoder.encode(lang, forKey: "lang")
		}
		if like != nil{
			aCoder.encode(like, forKey: "like")
		}
		if likeMe != nil{
			aCoder.encode(likeMe, forKey: "like_me")
		}
		if location != nil{
			aCoder.encode(location, forKey: "location")
		}
		if mbrank != nil{
			aCoder.encode(mbrank, forKey: "mbrank")
		}
		if mbtype != nil{
			aCoder.encode(mbtype, forKey: "mbtype")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if onlineStatus != nil{
			aCoder.encode(onlineStatus, forKey: "online_status")
		}
		if pagefriendsCount != nil{
			aCoder.encode(pagefriendsCount, forKey: "pagefriends_count")
		}
		if profileImageUrl != nil{
			aCoder.encode(profileImageUrl, forKey: "profile_image_url")
		}
		if profileUrl != nil{
			aCoder.encode(profileUrl, forKey: "profile_url")
		}
		if province != nil{
			aCoder.encode(province, forKey: "province")
		}
		if ptype != nil{
			aCoder.encode(ptype, forKey: "ptype")
		}
		if remark != nil{
			aCoder.encode(remark, forKey: "remark")
		}
		if screenName != nil{
			aCoder.encode(screenName, forKey: "screen_name")
		}
		if star != nil{
			aCoder.encode(star, forKey: "star")
		}
		if statusesCount != nil{
			aCoder.encode(statusesCount, forKey: "statuses_count")
		}
		if storyReadState != nil{
			aCoder.encode(storyReadState, forKey: "story_read_state")
		}
		if urank != nil{
			aCoder.encode(urank, forKey: "urank")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}
		if userAbility != nil{
			aCoder.encode(userAbility, forKey: "user_ability")
		}
		if vclubMember != nil{
			aCoder.encode(vclubMember, forKey: "vclub_member")
		}
		if verified != nil{
			aCoder.encode(verified, forKey: "verified")
		}
		if verifiedContactEmail != nil{
			aCoder.encode(verifiedContactEmail, forKey: "verified_contact_email")
		}
		if verifiedContactMobile != nil{
			aCoder.encode(verifiedContactMobile, forKey: "verified_contact_mobile")
		}
		if verifiedContactName != nil{
			aCoder.encode(verifiedContactName, forKey: "verified_contact_name")
		}
		if verifiedLevel != nil{
			aCoder.encode(verifiedLevel, forKey: "verified_level")
		}
		if verifiedReason != nil{
			aCoder.encode(verifiedReason, forKey: "verified_reason")
		}
		if verifiedReasonModified != nil{
			aCoder.encode(verifiedReasonModified, forKey: "verified_reason_modified")
		}
		if verifiedReasonUrl != nil{
			aCoder.encode(verifiedReasonUrl, forKey: "verified_reason_url")
		}
		if verifiedSource != nil{
			aCoder.encode(verifiedSource, forKey: "verified_source")
		}
		if verifiedSourceUrl != nil{
			aCoder.encode(verifiedSourceUrl, forKey: "verified_source_url")
		}
		if verifiedState != nil{
			aCoder.encode(verifiedState, forKey: "verified_state")
		}
		if verifiedTrade != nil{
			aCoder.encode(verifiedTrade, forKey: "verified_trade")
		}
		if verifiedType != nil{
			aCoder.encode(verifiedType, forKey: "verified_type")
		}
		if verifiedTypeExt != nil{
			aCoder.encode(verifiedTypeExt, forKey: "verified_type_ext")
		}
		if weihao != nil{
			aCoder.encode(weihao, forKey: "weihao")
		}

	}

}