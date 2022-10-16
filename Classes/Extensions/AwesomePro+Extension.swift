//
//  AwesomePro.swift
//  Awesome
//
//  Originally created by Ondrej Rafaj on 13/10/2017.
//  Copyright ©2022 manGoweb UK. All rights reserved.
//
//  This file has been auto-generated on 16/10/2022 06:37).

import Foundation

public extension AwesomePro {
    enum Font: CaseIterable, Identifiable, Equatable {
        case duotone(Duotone)
        case sharp(Sharp)
        case classic(Classic)

        public var id: String {
            switch self {
                case let .duotone(style):
                    return "duotone" + style.memberName
                case let .sharp(style):
                    return "sharp" + style.memberName
                case let .classic(style):
                    return "classic" + style.memberName
            }
        }

        static public var allCases: [AwesomePro.Font] {
            var fonts: [AwesomePro.Font] = []
            fonts += Duotone.allCases.map { .duotone($0) }
            fonts += Sharp.allCases.map { .sharp($0) }
            fonts += Classic.allCases.map { .classic($0) }
            return fonts
        }

        static public var cases: [AwesomeFont] {
            var fonts: [AwesomeFont] = []
            fonts += Duotone.allCases.compactMap { style in 
                return style
            }
            fonts += Sharp.allCases.compactMap { style in 
                return style
            }
            fonts += Classic.allCases.compactMap { style in 
                return style
            }
            return fonts
        }

        public enum Duotone: String, Identifiable, Equatable, AwesomeFont, CaseIterable {
            case solid

            public var file: String {
                switch self {
                    case .solid:
                        return "fa-duotone-solid-900"
                }
            }

            public var description: String {
                switch self {
                    case .solid:
                        return "Font Awesome 6 Duotone"
                }
            }

            public var memberName: String {
                switch self {
                    case .solid:
                        return "FontAwesome6Duotone-Solid"
                }
            }

            public var alternativeFileName: String {
                switch self {
                    case .solid:
                        return "Font Awesome 6 Duotone-Solid-900"
                }
            }

            public var id: String {
                return self.memberName
            }
        }

        public static func loadFonts(from bundle: Bundle, only: [Duotone] = []) {
            var fonts = Duotone.allCases 
            if !only.isEmpty {
                fonts = fonts.filter { element in only.contains(element) }
            }
            fonts.forEach { font in 
                Fonts.load(type: font, from: bundle)
            }
        }

        public enum Sharp: String, Identifiable, Equatable, AwesomeFont, CaseIterable {
            case solid

            public var file: String {
                switch self {
                    case .solid:
                        return "fa-sharp-solid-900"
                }
            }

            public var description: String {
                switch self {
                    case .solid:
                        return "Font Awesome 6 Sharp"
                }
            }

            public var memberName: String {
                switch self {
                    case .solid:
                        return "FontAwesome6Sharp-Solid"
                }
            }

            public var alternativeFileName: String {
                switch self {
                    case .solid:
                        return "Font Awesome 6 Sharp-Solid-900"
                }
            }

            public var id: String {
                return self.memberName
            }
        }

        public static func loadFonts(from bundle: Bundle, only: [Sharp] = []) {
            var fonts = Sharp.allCases 
            if !only.isEmpty {
                fonts = fonts.filter { element in only.contains(element) }
            }
            fonts.forEach { font in 
                Fonts.load(type: font, from: bundle)
            }
        }

        public enum Classic: String, Identifiable, Equatable, AwesomeFont, CaseIterable {
            case solid
            case light
            case brand
            case thin
            case regular

            public var file: String {
                switch self {
                    case .solid:
                        return "fa-classic-solid-900"
                    case .light:
                        return "fa-classic-light-300"
                    case .brand:
                        return "fa-classic-brands-400"
                    case .thin:
                        return "fa-classic-thin-100"
                    case .regular:
                        return "fa-classic-regular-400"
                }
            }

            public var description: String {
                switch self {
                    case .solid:
                        return "Font Awesome 6 Pro"
                    case .light:
                        return "Font Awesome 6 Pro"
                    case .brand:
                        return "Font Awesome 6 Brands"
                    case .thin:
                        return "Font Awesome 6 Pro"
                    case .regular:
                        return "Font Awesome 6 Pro"
                }
            }

            public var memberName: String {
                switch self {
                    case .solid:
                        return "FontAwesome6Pro-Solid"
                    case .light:
                        return "FontAwesome6Pro-Light"
                    case .brand:
                        return "FontAwesome6Brands-Regular"
                    case .thin:
                        return "FontAwesome6Pro-Thin"
                    case .regular:
                        return "FontAwesome6Pro-Regular"
                }
            }

            public var alternativeFileName: String {
                switch self {
                    case .solid:
                        return "Font Awesome 6 Pro-Solid-900"
                    case .light:
                        return "Font Awesome 6 Pro-Light-300"
                    case .brand:
                        return "Font Awesome 6 Brands-Regular-400"
                    case .thin:
                        return "Font Awesome 6 Pro-Thin-100"
                    case .regular:
                        return "Font Awesome 6 Pro-Regular-400"
                }
            }

            public var id: String {
                return self.memberName
            }
        }

        public static func loadFonts(from bundle: Bundle, only: [Classic] = []) {
            var fonts = Classic.allCases 
            if !only.isEmpty {
                fonts = fonts.filter { element in only.contains(element) }
            }
            fonts.forEach { font in 
                Fonts.load(type: font, from: bundle)
            }
        }

    }

    static func loadFonts(from bundle: Bundle, only: [Font] = []) {
        var fonts = Font.allCases
        if !only.isEmpty {
            fonts = fonts.filter { element in only.contains(element) }
        }
        fonts.forEach { font in
            let currStyle: AwesomeFont
            switch font {
                case let .duotone(style):
                    currStyle = style
                case let .sharp(style):
                    currStyle = style
                case let .classic(style):
                    currStyle = style

            }
            Fonts.load(type: currStyle, from: bundle)
        }
    }

}
