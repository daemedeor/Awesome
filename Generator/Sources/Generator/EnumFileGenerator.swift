import Foundation


struct EnumFileGenerator {

    let generator: FileGeneration
    var oldStyle : Bool

    func body(from families: [Family: [UpdatedIcon]]) -> String {
        print("\nGenerating \(generator.type.association).swift\n")

        var fileBody = generator.header

        fileBody += generator.buildHeader(for: .struct, with: generator.type.association, modifiers: [.public]) 
        fileBody += oldStyle ? oldFormat(from: families) : newFormat(from: families)
        fileBody += "\n" + generator.indent(for: .decrease()) + "}\n"
        
        return fileBody
    }
    
    private func oldFormat(from families: [Family: [UpdatedIcon]]) -> String {
        var fileBody = ""

        for (family, list) in families {
            var familyStyles = [Style: [UpdatedIcon]]()

            // Gather similar styles together
            for style in Style.allCases {
                guard family.enumName(onlyStyle: true).contains(style.alias) else {
                    continue
                }

                if familyStyles[style] == nil {
                    familyStyles[style] = []
                }

                for icon in list {
                    familyStyles[style]?.append(icon)
                }
            }
            
            generator.adjustIndent(for: .increase())

            for icons in familyStyles {
                guard family.enumName(onlyStyle: true).contains(icons.key.alias) else { continue }

                fileBody += generator.buildHeader(for: .enum,
                                                with: "\(icons.key.alias)".firstUppercased(),
                                                modifiers: [.string, .amazing, .public],
                                                indentBy: .same)
                
                for icon in icons.value {
                    fileBody += generateIconCase(icon: icon) + "\n"
                }
                
                fileBody += "\n"

                fileBody += generator.buildHeader(for: .var,
                                                  with: "unicode",
                                                  modifiers: [.public, .varReturn("String")],
                                                  indentBy: .increase())

                fileBody += generator.indent(for: .increase())
                
                fileBody += "switch self {\n"

                for icon in icons.value {
                    fileBody += generateIconCase(icon: icon,
                                                 includeDot: true,
                                                 value: .value("\"\\u{\(icon.unicode)}\"")) + "\n"
                }
                
                fileBody += generator.indent() + "}\n"
                fileBody += generator.indent(for: .decrease()) + "}\n\n"
                fileBody += generator.indent()
                
                fileBody += "\n"
                fileBody += generator.buildHeader(for: .var,
                                                  with: "unicodeString",
                                                  modifiers: [.public, .varReturn("String")],
                                                  indentBy: .increase())

                fileBody += generator.indent(for: .increase())
                
                fileBody += "switch self {\n"

                for icon in icons.value {
                    fileBody += generateIconCase(icon: icon,
                                                 includeDot: true,
                                                 value: .value("\"\\u{\(icon.unicode)}\"")) + "\n"
                }
                
                fileBody += generator.indent() + "}\n"
                fileBody += generator.indent(for: .decrease()) + "}\n\n"
                fileBody += "public static func withKey(_ label: String) -> "
                fileBody += icons.key.alias.firstUppercased() + "? {\n"

                fileBody += generator.indent(for: .increase())

                fileBody += "return self.allCases.first { label == \"\\($0)\" }\n"

                fileBody += generator.indent(for: .decrease()) + "}"
                fileBody += generateFontType(name: "\(generator.type.association)",
                                             postFix: "\(family.rawDescription.firstUppercased()).\(icons.key.alias)")

                fileBody += generator.indent() + "}\n"
                generator.adjustIndent(for: .decrease())
            }

            print("Style \"\(family.enumName(onlyStyle: false))\" has \(list.count) icons.")
        }

        return fileBody
    }
    
    private func newFormat(from families: [Family: [UpdatedIcon]]) -> String {
        var fileBody = ""
        var normalizedData = [
            String: [Family: [UpdatedIcon]]
        ]()

        for (family, list) in families {
            if normalizedData[family.rawDescription] == nil {
                normalizedData[family.rawDescription] = [:]
            }
            
            if normalizedData[family.rawDescription]?[family] == nil {
                normalizedData[family.rawDescription]?[family] = []
            }
            
            normalizedData[family.rawDescription]?[family]?.append(contentsOf: list)
        }

        for family in normalizedData {
            var totalFamilyIconCount = 0

            fileBody += generator.buildHeader(for: .enum,
                                            with: family.key.firstUppercased(),
                                            modifiers: [.public],
                                            indentBy: .increase())
            
            for style in family.value {
                fileBody += generator.generateCase("\(style.key.enumName(onlyStyle: true).lowercased())(\(style.key.enumName(onlyStyle: true).firstUppercased()))") + "\n"
            }

            fileBody += "\n"

            for style in family.value {
                var iconCount = 0

                fileBody += generator.buildHeader(for: .enum,
                                                with: style.key.enumName(onlyStyle: true).firstUppercased(),
                                                  modifiers: [.amazing, .public],
                                                indentBy: .increase())
                
                for icon in style.value {
                    iconCount += 1
                    fileBody += generateIconCase(icon: icon) + "\n"
                }
                
                fileBody += "\n"
                
                fileBody += generator.buildHeader(for: .var,
                                                  with: "unicodeString",
                                                  modifiers: [.public, .varReturn("String")],
                                                  indentBy: .increase())

                fileBody += generator.indent(for: .increase())
                
                fileBody += "switch self {\n"

                for icon in style.value {
                    iconCount += 1
                    fileBody += generateIconCase(icon: icon,
                                                 includeDot: true,
                                                 value: .value("\"\\u{\(icon.unicode)}\"")) + "\n"
                }
                
                fileBody += generator.indent() + "}\n"
                fileBody += generator.indent(for: .decrease()) + "}\n\n"

                fileBody += generator.indent() + "public static func withKey(_ label: String) -> "
                fileBody += style.key.enumName(onlyStyle: true).firstUppercased() + "? {\n"

                fileBody += generator.indent(for: .increase())

                fileBody += "return self.allCases.first { label == \"\\($0.unicodeString)\" }\n"
                
                fileBody += generator.indent(for: .decrease()) + "}\n"

                fileBody += generateFontType(name: "\(generator.type.association)",
                                             postFix: "\(family.key.firstUppercased()).\(style.key.enumName(onlyStyle: true).lowercased())")
                fileBody += generator.indent() + "}\n\n"
                
                generator.adjustIndent(for: .decrease())
                
                print("Style \"\(style.key.enumName().fullCasing())\" has \(iconCount) icons.")

                totalFamilyIconCount += iconCount
            }

            generator.adjustIndent(for: .increase())
            
            fileBody += generator.indent(for: .decrease()) + "}\n"

            generator.adjustIndent(for: .decrease())
            
            print("\(family.key.firstUppercased()) has a total of \(totalFamilyIconCount) icons. \n")
        }
        
        return fileBody
    }
    
    func generateIconCase(icon: any BaseIcon, includeDot: Bool = false, value: FileGeneration.CaseValue? = nil) -> String {
        let normalizedName = generateName(name: icon.name)

        return generator.generateCase(normalizedName.isKeyword ? "`\(normalizedName)`" : normalizedName, value: value, includeDot: includeDot)
    }

    func generateName(name: String) -> String {
        var outputName = name.split(separator: "-").map { $0.firstUppercased() }.joined(separator: "")
        let initialLetter = outputName.prefix(1)
        
        outputName = initialLetter.lowercased() + outputName.dropFirst()
        
        if Int(initialLetter) != nil { outputName = "fa\(outputName)" }
        
        return outputName
    }

    func generateFontType(name: String, postFix: String) -> String {
        var content = "\n" + generator.buildHeader(for: .var,
                                          with: "fontType",
                                          modifiers: [.public, .awesomeFont])

        content += generator.indent(for: .increase())

        content += "return \(name).Font.\(postFix)\n"

        content += generator.indent(for: .decrease())

        content += "}\n"
        
        generator.adjustIndent(for: .decrease())

        return content
    }
}


