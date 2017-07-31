//
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See LICENSE in the project root for license information.
//

import Foundation


/** User compact view */
open class UserCompactView: JSONEncodable {
    public enum Visibility: String { 
        case _public = "Public"
        case _private = "Private"
    }
    public enum FollowerStatus: String { 
        case _none = "None"
        case follow = "Follow"
        case pending = "Pending"
        case blocked = "Blocked"
    }
    /** Gets or sets user handle */
    public var userHandle: String?
    /** Gets or sets first name of the user */
    public var firstName: String?
    /** Gets or sets last name of the user */
    public var lastName: String?
    /** Gets or sets photo handle of the user */
    public var photoHandle: String?
    /** Gets or sets photo url of the user */
    public var photoUrl: String?
    /** Gets or sets visibility of the user */
    public var visibility: Visibility?
    /** Gets or sets follower relationship status of the querying user */
    public var followerStatus: FollowerStatus?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["userHandle"] = self.userHandle
        nillableDictionary["firstName"] = self.firstName
        nillableDictionary["lastName"] = self.lastName
        nillableDictionary["photoHandle"] = self.photoHandle
        nillableDictionary["photoUrl"] = self.photoUrl
        nillableDictionary["visibility"] = self.visibility?.rawValue
        nillableDictionary["followerStatus"] = self.followerStatus?.rawValue
        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}