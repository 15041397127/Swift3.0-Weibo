//
//	CommentManageInfo.swift
//
//	Create by 旭 张 on 30/1/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class CommentManageInfo : NSObject, NSCoding{

	var approvalCommentType : Int!
	var commentPermissionType : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		approvalCommentType = dictionary["approval_comment_type"] as? Int
		commentPermissionType = dictionary["comment_permission_type"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if approvalCommentType != nil{
			dictionary["approval_comment_type"] = approvalCommentType
		}
		if commentPermissionType != nil{
			dictionary["comment_permission_type"] = commentPermissionType
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         approvalCommentType = aDecoder.decodeObject(forKey: "approval_comment_type") as? Int
         commentPermissionType = aDecoder.decodeObject(forKey: "comment_permission_type") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if approvalCommentType != nil{
			aCoder.encode(approvalCommentType, forKey: "approval_comment_type")
		}
		if commentPermissionType != nil{
			aCoder.encode(commentPermissionType, forKey: "comment_permission_type")
		}

	}

}