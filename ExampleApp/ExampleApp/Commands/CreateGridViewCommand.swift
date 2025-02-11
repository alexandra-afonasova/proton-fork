//
//  CreateGridViewCommand.swift
//  Proton
//
//  Created by Rajdeep Kwatra on 6/6/2022.
//  Copyright © 2022 Rajdeep Kwatra. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation
import UIKit
import Proton

/// Editor command that inserts a GridView in the given range
public class CreateGridViewCommand: EditorCommand {

    public let name = CommandName("createGridViewCommand")
    weak var delegate: GridViewDelegate?
    public init(delegate: GridViewDelegate) {
        self.delegate = delegate
    }

    public func execute(on editor: EditorView) {
        let config = GridConfiguration(
            columnsConfiguration: [
//                GridColumnConfiguration(dimension: .fixed(150)),
                GridColumnConfiguration(dimension: .fractional(0.25)),
                GridColumnConfiguration(dimension: .fractional(0.25)),
                GridColumnConfiguration(dimension: .fractional(0.25)),
                GridColumnConfiguration(dimension: .fractional(0.25)),
                GridColumnConfiguration(dimension: .fractional(0.25)),
                GridColumnConfiguration(dimension: .fractional(0.25)),
            ],
            rowsConfiguration: [
                GridRowConfiguration(initialHeight: 40),
                GridRowConfiguration(initialHeight: 80),
                GridRowConfiguration(initialHeight: 120),
                GridRowConfiguration(initialHeight: 40),
                GridRowConfiguration(initialHeight: 80),
                GridRowConfiguration(initialHeight: 120),
            ])

        let attachment = GridViewAttachment(config: config)
        attachment.selectBeforeDelete = true
        attachment.view.delegate = delegate
//        attachment.view.setColumnResizing(true)
        editor.insertAttachment(in: editor.selectedRange, attachment: attachment)
    }
}
