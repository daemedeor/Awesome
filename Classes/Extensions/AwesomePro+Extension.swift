//
//  AwesomePro.swift
//  Awesome
//
//  Originally created by Ondrej Rafaj on 13/10/2017.
//  Copyright ©2022 manGoweb UK. All rights reserved.
//
//  This file has been auto-generated on 16/10/2022 04:47).

import Foundation

public extension AwesomePro {
    enum Font: CaseIterable, Identifiable, Equatable {
        case classic(Classic)
        case duotone(Duotone)
        case sharp(Sharp)

        public var id: String {
            switch self {
                case let .classic(style):
                    return "classic" + style.memberName
                case let .duotone(style):
                    return "duotone" + style.memberName
                case let .sharp(style):
                    return "sharp" + style.memberName
            }
        }

        static public var allCases: [AwesomePro.Font] {
            var fonts: [AwesomePro.Font] = []
            fonts += Classic.allCases.map { .classic($0) }
            fonts += Duotone.allCases.map { .duotone($0) }
            fonts += Sharp.allCases.map { .sharp($0) }
            return fonts
        }

        static public var cases: [AwesomeFont] {
            var fonts: [AwesomeFont] = []
            fonts += Classic.allCases.compactMap { style in 
                return style
            }
            fonts += Duotone.allCases.compactMap { style in 
                return style
            }
            fonts += Sharp.allCases.compactMap { style in 
                return style
            }
            return fonts
        }

        public enum Classic: String, Identifiable, Equatable, AwesomeFont, CaseIterable {
            case thin
            case solid
            case brand
            case light
            case regular

            public var file: String {
                switch self {
                    case .thin:
                        return "fa-classic-thin-300"
                    case .solid:
                        return "fa-classic-solid-900"
                    case .brand:
                        return "fa-classic-brands-400"
                    case .light:
                        return "fa-classic-light-300"
                    case .regular:
                        return "fa-classic-regular-400"
                }
            }

            public var description: String {
                switch self {
                    case .thin:
                        return "Font Awesome 6 Pro"
                    case .solid:
                        return "Font Awesome 6 Pro"
                    case .brand:
                        return "Font Awesome 6 Brands"
                    case .light:
                        return "Font Awesome 6 Pro"
                    case .regular:
                        return "Font Awesome 6 Pro"
                }
            }

            public var memberName: String {
                switch self {
                    case .thin:
                        return "FontAwesome6Pro-Thin"
                    case .solid:
                        return "FontAwesome6Pro-Solid"
                    case .brand:
                        return "FontAwesome6Brands-Regular"
                    case .light:
                        return "FontAwesome6Pro-Light"
                    case .regular:
                        return "FontAwesome6Pro-Regular"
                }
            }

            public var alternativeFileName: String {
                switch self {
                    case .thin:
                        return "Font Awesome 6 Pro-Thin-300"
                    case .solid:
                        return "Font Awesome 6 Pro-Solid-900"
                    case .brand:
                        return "Font Awesome 6 Brands-Brands-400"
                    case .light:
                        return "Font Awesome 6 Pro-Light-300"
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

    }

    static func loadFonts(from bundle: Bundle, only: [Font] = []) {
        var fonts = Font.allCases
        if !only.isEmpty {
            fonts = fonts.filter { element in only.contains(element) }
        }
        fonts.forEach { font in
            let currStyle: AwesomeFont
            switch font {
                case let .classic(style):
                    currStyle = style
                case let .duotone(style):
                    currStyle = style
                case let .sharp(style):
                    currStyle = style

            }
            Fonts.load(type: currStyle, from: bundle)
        }
    }

}
