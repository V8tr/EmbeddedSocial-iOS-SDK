//
// ReplyView.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Reply view */
open class ReplyView: JSONEncodable {
    public enum ContentStatus: String { 
        case active = "Active"
        case banned = "Banned"
        case mature = "Mature"
        case clean = "Clean"
    }
    /** Gets or sets reply handle */
    public var replyHandle: String?
    /** Gets or sets parent comment handle */
    public var commentHandle: String?
    /** Gets or sets root topic handle */
    public var topicHandle: String?
    /** Gets or sets created time */
    public var createdTime: Date?
    /** Gets or sets last updated time */
    public var lastUpdatedTime: Date?
    /** Gets or sets owner of the reply */
    public var user: UserCompactView?
    /** Gets or sets reply text */
    public var text: String?
    /** Gets or sets reply language */
    public var language: String?
    /** Gets or sets total likes for the reply */
    public var totalLikes: Int64?
    /** Gets or sets a value indicating whether the querying user has liked the reply */
    public var liked: Bool?
    /** Gets or sets content status */
    public var contentStatus: ContentStatus?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["replyHandle"] = self.replyHandle
        nillableDictionary["commentHandle"] = self.commentHandle
        nillableDictionary["topicHandle"] = self.topicHandle
        nillableDictionary["createdTime"] = self.createdTime?.encodeToJSON()
        nillableDictionary["lastUpdatedTime"] = self.lastUpdatedTime?.encodeToJSON()
        nillableDictionary["user"] = self.user?.encodeToJSON()
        nillableDictionary["text"] = self.text
        nillableDictionary["language"] = self.language
        nillableDictionary["totalLikes"] = self.totalLikes?.encodeToJSON()
        nillableDictionary["liked"] = self.liked
        nillableDictionary["contentStatus"] = self.contentStatus?.rawValue
        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
