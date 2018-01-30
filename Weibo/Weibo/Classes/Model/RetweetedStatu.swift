//
//	RetweetedStatu.swift
//
//	Create by 旭 张 on 30/1/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class RetweetedStatu : NSObject, NSCoding{

	var attitudesCount : Int!
	var bizFeature : Int!
	var bmiddlePic : String!
	var canEdit : Bool!
	var cardid : String!
	var commentManageInfo : CommentManageInfo!
	var commentsCount : Int!
	var contentAuth : Int!
	var createdAt : String!
	var darwinTags : [AnyObject]!
	var favorited : Bool!
	var geo : AnyObject!
	var gifIds : String!
	var hasActionTypeCard : Int!
	var hotWeiboTags : [AnyObject]!
	var id : Int!
	var idstr : String!
	var inReplyToScreenName : String!
	var inReplyToStatusId : String!
	var inReplyToUserId : String!
	var isLongText : Bool!
	var isPaid : Bool!
	var isShowBulletin : Int!
	var mblogVipType : Int!
	var mid : String!
	var mlevel : Int!
	var moreInfoType : Int!
	var originalPic : String!
	var pendingApprovalCount : Int!
	var picUrls : [PicUrl]!
	var positiveRecomFlag : Int!
	var repostsCount : Int!
	var source : String!
	var sourceAllowclick : Int!
	var sourceType : Int!
	var text : String!
	var textLength : Int!
	var textTagTips : [AnyObject]!
	var thumbnailPic : String!
	var truncated : Bool!
	var user : User!
	var userType : Int!
	var visible : Visible!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		attitudesCount = dictionary["attitudes_count"] as? Int
		bizFeature = dictionary["biz_feature"] as? Int
		bmiddlePic = dictionary["bmiddle_pic"] as? String
		canEdit = dictionary["can_edit"] as? Bool
		cardid = dictionary["cardid"] as? String
		if let commentManageInfoData = dictionary["comment_manage_info"] as? [String:Any]{
			commentManageInfo = CommentManageInfo(fromDictionary: commentManageInfoData)
		}
		commentsCount = dictionary["comments_count"] as? Int
		contentAuth = dictionary["content_auth"] as? Int
		createdAt = dictionary["created_at"] as? String
		darwinTags = dictionary["darwin_tags"] as? [AnyObject]
		favorited = dictionary["favorited"] as? Bool
		geo = dictionary["geo"] as? AnyObject
		gifIds = dictionary["gif_ids"] as? String
		hasActionTypeCard = dictionary["hasActionTypeCard"] as? Int
		hotWeiboTags = dictionary["hot_weibo_tags"] as? [AnyObject]
		id = dictionary["id"] as? Int
		idstr = dictionary["idstr"] as? String
		inReplyToScreenName = dictionary["in_reply_to_screen_name"] as? String
		inReplyToStatusId = dictionary["in_reply_to_status_id"] as? String
		inReplyToUserId = dictionary["in_reply_to_user_id"] as? String
		isLongText = dictionary["isLongText"] as? Bool
		isPaid = dictionary["is_paid"] as? Bool
		isShowBulletin = dictionary["is_show_bulletin"] as? Int
		mblogVipType = dictionary["mblog_vip_type"] as? Int
		mid = dictionary["mid"] as? String
		mlevel = dictionary["mlevel"] as? Int
		moreInfoType = dictionary["more_info_type"] as? Int
		originalPic = dictionary["original_pic"] as? String
		pendingApprovalCount = dictionary["pending_approval_count"] as? Int
		picUrls = [PicUrl]()
		if let picUrlsArray = dictionary["pic_urls"] as? [[String:Any]]{
			for dic in picUrlsArray{
				let value = PicUrl(fromDictionary: dic)
				picUrls.append(value)
			}
		}
		positiveRecomFlag = dictionary["positive_recom_flag"] as? Int
		repostsCount = dictionary["reposts_count"] as? Int
		source = dictionary["source"] as? String
		sourceAllowclick = dictionary["source_allowclick"] as? Int
		sourceType = dictionary["source_type"] as? Int
		text = dictionary["text"] as? String
		textLength = dictionary["textLength"] as? Int
		textTagTips = dictionary["text_tag_tips"] as? [AnyObject]
		thumbnailPic = dictionary["thumbnail_pic"] as? String
		truncated = dictionary["truncated"] as? Bool
		if let userData = dictionary["user"] as? [String:Any]{
			user = User(fromDictionary: userData)
		}
		userType = dictionary["userType"] as? Int
		if let visibleData = dictionary["visible"] as? [String:Any]{
			visible = Visible(fromDictionary: visibleData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if attitudesCount != nil{
			dictionary["attitudes_count"] = attitudesCount
		}
		if bizFeature != nil{
			dictionary["biz_feature"] = bizFeature
		}
		if bmiddlePic != nil{
			dictionary["bmiddle_pic"] = bmiddlePic
		}
		if canEdit != nil{
			dictionary["can_edit"] = canEdit
		}
		if cardid != nil{
			dictionary["cardid"] = cardid
		}
		if commentManageInfo != nil{
			dictionary["comment_manage_info"] = commentManageInfo.toDictionary()
		}
		if commentsCount != nil{
			dictionary["comments_count"] = commentsCount
		}
		if contentAuth != nil{
			dictionary["content_auth"] = contentAuth
		}
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if darwinTags != nil{
			dictionary["darwin_tags"] = darwinTags
		}
		if favorited != nil{
			dictionary["favorited"] = favorited
		}
		if geo != nil{
			dictionary["geo"] = geo
		}
		if gifIds != nil{
			dictionary["gif_ids"] = gifIds
		}
		if hasActionTypeCard != nil{
			dictionary["hasActionTypeCard"] = hasActionTypeCard
		}
		if hotWeiboTags != nil{
			dictionary["hot_weibo_tags"] = hotWeiboTags
		}
		if id != nil{
			dictionary["id"] = id
		}
		if idstr != nil{
			dictionary["idstr"] = idstr
		}
		if inReplyToScreenName != nil{
			dictionary["in_reply_to_screen_name"] = inReplyToScreenName
		}
		if inReplyToStatusId != nil{
			dictionary["in_reply_to_status_id"] = inReplyToStatusId
		}
		if inReplyToUserId != nil{
			dictionary["in_reply_to_user_id"] = inReplyToUserId
		}
		if isLongText != nil{
			dictionary["isLongText"] = isLongText
		}
		if isPaid != nil{
			dictionary["is_paid"] = isPaid
		}
		if isShowBulletin != nil{
			dictionary["is_show_bulletin"] = isShowBulletin
		}
		if mblogVipType != nil{
			dictionary["mblog_vip_type"] = mblogVipType
		}
		if mid != nil{
			dictionary["mid"] = mid
		}
		if mlevel != nil{
			dictionary["mlevel"] = mlevel
		}
		if moreInfoType != nil{
			dictionary["more_info_type"] = moreInfoType
		}
		if originalPic != nil{
			dictionary["original_pic"] = originalPic
		}
		if pendingApprovalCount != nil{
			dictionary["pending_approval_count"] = pendingApprovalCount
		}
		if picUrls != nil{
			var dictionaryElements = [[String:Any]]()
			for picUrlsElement in picUrls {
				dictionaryElements.append(picUrlsElement.toDictionary())
			}
			dictionary["pic_urls"] = dictionaryElements
		}
		if positiveRecomFlag != nil{
			dictionary["positive_recom_flag"] = positiveRecomFlag
		}
		if repostsCount != nil{
			dictionary["reposts_count"] = repostsCount
		}
		if source != nil{
			dictionary["source"] = source
		}
		if sourceAllowclick != nil{
			dictionary["source_allowclick"] = sourceAllowclick
		}
		if sourceType != nil{
			dictionary["source_type"] = sourceType
		}
		if text != nil{
			dictionary["text"] = text
		}
		if textLength != nil{
			dictionary["textLength"] = textLength
		}
		if textTagTips != nil{
			dictionary["text_tag_tips"] = textTagTips
		}
		if thumbnailPic != nil{
			dictionary["thumbnail_pic"] = thumbnailPic
		}
		if truncated != nil{
			dictionary["truncated"] = truncated
		}
		if user != nil{
			dictionary["user"] = user.toDictionary()
		}
		if userType != nil{
			dictionary["userType"] = userType
		}
		if visible != nil{
			dictionary["visible"] = visible.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         attitudesCount = aDecoder.decodeObject(forKey: "attitudes_count") as? Int
         bizFeature = aDecoder.decodeObject(forKey: "biz_feature") as? Int
         bmiddlePic = aDecoder.decodeObject(forKey: "bmiddle_pic") as? String
         canEdit = aDecoder.decodeObject(forKey: "can_edit") as? Bool
         cardid = aDecoder.decodeObject(forKey: "cardid") as? String
         commentManageInfo = aDecoder.decodeObject(forKey: "comment_manage_info") as? CommentManageInfo
         commentsCount = aDecoder.decodeObject(forKey: "comments_count") as? Int
         contentAuth = aDecoder.decodeObject(forKey: "content_auth") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         darwinTags = aDecoder.decodeObject(forKey: "darwin_tags") as? [AnyObject]
         favorited = aDecoder.decodeObject(forKey: "favorited") as? Bool
         geo = aDecoder.decodeObject(forKey: "geo") as? AnyObject
         gifIds = aDecoder.decodeObject(forKey: "gif_ids") as? String
         hasActionTypeCard = aDecoder.decodeObject(forKey: "hasActionTypeCard") as? Int
         hotWeiboTags = aDecoder.decodeObject(forKey: "hot_weibo_tags") as? [AnyObject]
         id = aDecoder.decodeObject(forKey: "id") as? Int
         idstr = aDecoder.decodeObject(forKey: "idstr") as? String
         inReplyToScreenName = aDecoder.decodeObject(forKey: "in_reply_to_screen_name") as? String
         inReplyToStatusId = aDecoder.decodeObject(forKey: "in_reply_to_status_id") as? String
         inReplyToUserId = aDecoder.decodeObject(forKey: "in_reply_to_user_id") as? String
         isLongText = aDecoder.decodeObject(forKey: "isLongText") as? Bool
         isPaid = aDecoder.decodeObject(forKey: "is_paid") as? Bool
         isShowBulletin = aDecoder.decodeObject(forKey: "is_show_bulletin") as? Int
         mblogVipType = aDecoder.decodeObject(forKey: "mblog_vip_type") as? Int
         mid = aDecoder.decodeObject(forKey: "mid") as? String
         mlevel = aDecoder.decodeObject(forKey: "mlevel") as? Int
         moreInfoType = aDecoder.decodeObject(forKey: "more_info_type") as? Int
         originalPic = aDecoder.decodeObject(forKey: "original_pic") as? String
         pendingApprovalCount = aDecoder.decodeObject(forKey: "pending_approval_count") as? Int
         picUrls = aDecoder.decodeObject(forKey :"pic_urls") as? [PicUrl]
         positiveRecomFlag = aDecoder.decodeObject(forKey: "positive_recom_flag") as? Int
         repostsCount = aDecoder.decodeObject(forKey: "reposts_count") as? Int
         source = aDecoder.decodeObject(forKey: "source") as? String
         sourceAllowclick = aDecoder.decodeObject(forKey: "source_allowclick") as? Int
         sourceType = aDecoder.decodeObject(forKey: "source_type") as? Int
         text = aDecoder.decodeObject(forKey: "text") as? String
         textLength = aDecoder.decodeObject(forKey: "textLength") as? Int
         textTagTips = aDecoder.decodeObject(forKey: "text_tag_tips") as? [AnyObject]
         thumbnailPic = aDecoder.decodeObject(forKey: "thumbnail_pic") as? String
         truncated = aDecoder.decodeObject(forKey: "truncated") as? Bool
         user = aDecoder.decodeObject(forKey: "user") as? User
         userType = aDecoder.decodeObject(forKey: "userType") as? Int
         visible = aDecoder.decodeObject(forKey: "visible") as? Visible

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if attitudesCount != nil{
			aCoder.encode(attitudesCount, forKey: "attitudes_count")
		}
		if bizFeature != nil{
			aCoder.encode(bizFeature, forKey: "biz_feature")
		}
		if bmiddlePic != nil{
			aCoder.encode(bmiddlePic, forKey: "bmiddle_pic")
		}
		if canEdit != nil{
			aCoder.encode(canEdit, forKey: "can_edit")
		}
		if cardid != nil{
			aCoder.encode(cardid, forKey: "cardid")
		}
		if commentManageInfo != nil{
			aCoder.encode(commentManageInfo, forKey: "comment_manage_info")
		}
		if commentsCount != nil{
			aCoder.encode(commentsCount, forKey: "comments_count")
		}
		if contentAuth != nil{
			aCoder.encode(contentAuth, forKey: "content_auth")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if darwinTags != nil{
			aCoder.encode(darwinTags, forKey: "darwin_tags")
		}
		if favorited != nil{
			aCoder.encode(favorited, forKey: "favorited")
		}
		if geo != nil{
			aCoder.encode(geo, forKey: "geo")
		}
		if gifIds != nil{
			aCoder.encode(gifIds, forKey: "gif_ids")
		}
		if hasActionTypeCard != nil{
			aCoder.encode(hasActionTypeCard, forKey: "hasActionTypeCard")
		}
		if hotWeiboTags != nil{
			aCoder.encode(hotWeiboTags, forKey: "hot_weibo_tags")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if idstr != nil{
			aCoder.encode(idstr, forKey: "idstr")
		}
		if inReplyToScreenName != nil{
			aCoder.encode(inReplyToScreenName, forKey: "in_reply_to_screen_name")
		}
		if inReplyToStatusId != nil{
			aCoder.encode(inReplyToStatusId, forKey: "in_reply_to_status_id")
		}
		if inReplyToUserId != nil{
			aCoder.encode(inReplyToUserId, forKey: "in_reply_to_user_id")
		}
		if isLongText != nil{
			aCoder.encode(isLongText, forKey: "isLongText")
		}
		if isPaid != nil{
			aCoder.encode(isPaid, forKey: "is_paid")
		}
		if isShowBulletin != nil{
			aCoder.encode(isShowBulletin, forKey: "is_show_bulletin")
		}
		if mblogVipType != nil{
			aCoder.encode(mblogVipType, forKey: "mblog_vip_type")
		}
		if mid != nil{
			aCoder.encode(mid, forKey: "mid")
		}
		if mlevel != nil{
			aCoder.encode(mlevel, forKey: "mlevel")
		}
		if moreInfoType != nil{
			aCoder.encode(moreInfoType, forKey: "more_info_type")
		}
		if originalPic != nil{
			aCoder.encode(originalPic, forKey: "original_pic")
		}
		if pendingApprovalCount != nil{
			aCoder.encode(pendingApprovalCount, forKey: "pending_approval_count")
		}
		if picUrls != nil{
			aCoder.encode(picUrls, forKey: "pic_urls")
		}
		if positiveRecomFlag != nil{
			aCoder.encode(positiveRecomFlag, forKey: "positive_recom_flag")
		}
		if repostsCount != nil{
			aCoder.encode(repostsCount, forKey: "reposts_count")
		}
		if source != nil{
			aCoder.encode(source, forKey: "source")
		}
		if sourceAllowclick != nil{
			aCoder.encode(sourceAllowclick, forKey: "source_allowclick")
		}
		if sourceType != nil{
			aCoder.encode(sourceType, forKey: "source_type")
		}
		if text != nil{
			aCoder.encode(text, forKey: "text")
		}
		if textLength != nil{
			aCoder.encode(textLength, forKey: "textLength")
		}
		if textTagTips != nil{
			aCoder.encode(textTagTips, forKey: "text_tag_tips")
		}
		if thumbnailPic != nil{
			aCoder.encode(thumbnailPic, forKey: "thumbnail_pic")
		}
		if truncated != nil{
			aCoder.encode(truncated, forKey: "truncated")
		}
		if user != nil{
			aCoder.encode(user, forKey: "user")
		}
		if userType != nil{
			aCoder.encode(userType, forKey: "userType")
		}
		if visible != nil{
			aCoder.encode(visible, forKey: "visible")
		}

	}

}