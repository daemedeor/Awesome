//
//  Amazing.swift
//  Awesome
//
//  Created by Ondrej Rafaj on 15/10/2017.
//

import Foundation

public protocol Amazing: Identifiable, Hashable, CaseIterable {
    
    /// Returns an unique identifier string that contains the icon name
    var key: String { get }
    
    /// Returns an unique identifier string that contains the font name, font style and icon name
    var detailedKey: String { get }

    /// Returns a human readable string that describes the icon
    var description: String { get }
    
    /// Returns an object with information about the font used by the icon
    var fontType: AwesomeFont { get }
    
    /// An array with all keys of all icons of the font style
    static var allKeys: [String] { get }

    /// An array with all detailed keys of all icons of the font style
    static var allDetailedKeys: [String] { get }

    /// An array with all human readable descriptions of all icons of the font style
    static var allDescriptions: [String] { get }
    
    var id: String { get }
    
    static var allCases: [Self] { get }
    
    static func withKey(_ label: String) -> Self?

    var unicodeString : String { get }
}
