//
//  InterfacePreviewsFileEntry.swift
//  DevCleaner
//
//  Created by Konrad Kołakowski on 17/01/2021.
//  Copyright © 2021 One Minute Games. All rights reserved.
//
//  DevCleaner is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 3 of the License, or
//  (at your option) any later version.
//
//  DevCleaner is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with DevCleaner.  If not, see <http://www.gnu.org/licenses/>.

import Foundation
import AppKit

public final class InterfacePreviewsFileEntry: XcodeFileEntry {
    // TODO: Probably use different technique for removing IB previews, as those simulators can't be just all removed,
    //       they probably follow the rules for all installed simulators, depending on runtime etc.
    
    // MARK: Types
    public enum PreviewType: CaseIterable {
        case swiftUIPreviews
        
        var name: String {
            switch self {
                case .swiftUIPreviews: return "SwiftUI Previews"
            }
        }
        
        var tooltip: String {
            switch self {
                case .swiftUIPreviews: return "SwiftUI previews cached simulators"
            }
        }
    }
    
    // MARK: Properties
    public let previewType: PreviewType
    
    public init(type: PreviewType, selected: Bool) {
        self.previewType = type
        
        super.init(label: type.name,
                   tooltipText: type.tooltip,
                   icon: .image(name: "Files/SwiftUIPreview"),
                   tooltip: true,
                   selected: selected)
    }
}
