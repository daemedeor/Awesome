//
//  Fonts.swift
//  Awesome
//
//  Created by Ondrej Rafaj on 14/10/2017.
//

import Foundation
import CoreGraphics
import CoreText

public extension AwesomeFont {
    
    @available(*, unavailable, renamed: "description")
    var name: String {
        get {
            fatalError()
        }
    }
}

class Fonts {

    static func load(type: AwesomeFont, from bundle: Bundle? = nil) {
        guard !Amazing.Font.fontNames(forFamilyName: type.description).contains(type.memberName) else {
            return
        }

        let fontBundle: Bundle
        #if SWIFT_PACKAGE
        fontBundle = bundle ?? Bundle.module
        #else
        fontBundle = bundle ?? Bundle(for: Self.self)
        #endif

        guard let url = findFile(type, in: fontBundle) else {
            return
        }

        let data = try! Data(contentsOf: url as URL)
        let provider = CGDataProvider(data: data as CFData)
        let font = CGFont(provider!)

        var error: Unmanaged<CFError>?

        if CTFontManagerRegisterGraphicsFont(font!, &error) == false {
            let errorDescription: CFString = CFErrorCopyDescription(error!.takeUnretainedValue())
            let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
            NSException(name: NSExceptionName.internalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
        }
        
    }

    enum FileType: CaseIterable {
        case file
        case alternativeFile
    }
    
    enum FontFileExtension: String, CaseIterable {
        case otf
        case ttf
    }

    private static func findFile(_ type: AwesomeFont, in fontBundle: Bundle) -> URL? {
        let identifier = fontBundle.bundleIdentifier
        let isCocoapods = identifier?.hasPrefix("org.cocoapods") == true

        let subdirectory = isCocoapods ? "Awesome.bundle" : nil
        
        var foundURL: URL?
        
        for fontFileType in FontFileExtension.allCases {
            for fileType in FileType.allCases {
                switch fileType {
                case .file:
                    foundURL = fontBundle.url(forResource: type.file, withExtension: fontFileType.rawValue, subdirectory: subdirectory)
                case .alternativeFile:
                    foundURL = fontBundle.url(forResource: type.alternativeFileName, withExtension: fontFileType.rawValue, subdirectory: subdirectory)
                }
                
                if let foundURL {
                    return foundURL
                }
            }
            
            if let foundURL {
                return foundURL
            }
        }
        
        return foundURL
    }
    
}
