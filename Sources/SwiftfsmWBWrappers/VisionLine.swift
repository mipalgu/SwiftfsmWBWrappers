/*
 * file VisionLine.swift
 *
 * This file was generated by classgenerator from vision_line.gen.
 * DO NOT CHANGE MANUALLY!
 *
 * Copyright © 2020 Carl Lusty. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials
 *    provided with the distribution.
 *
 * 3. All advertising materials mentioning features or use of this
 *    software must display the following acknowledgement:
 *
 *        This product includes software developed by Carl Lusty.
 *
 * 4. Neither the name of the author nor the names of contributors
 *    may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
 * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * -----------------------------------------------------------------------
 * This program is free software; you can redistribute it and/or
 * modify it under the above terms or under the terms of the GNU
 * General Public License as published by the Free Software Foundation;
 * either version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/licenses/
 * or write to the Free Software Foundation, Inc., 51 Franklin Street,
 * Fifth Floor, Boston, MA  02110-1301, USA.
 *
 */

//swiftlint:disable superfluous_disable_command
//swiftlint:disable type_body_length
//swiftlint:disable function_body_length
//swiftlint:disable file_length
//swiftlint:disable line_length
//swiftlint:disable identifier_name

/**
 * Line class.
 */
public struct VisionLine {

    public var _raw: wb_vision_line

    public var lineEdgeTop: PixelCoordinateLine {
        get {
            return PixelCoordinateLine(self._raw.lineEdgeTop)
        } set {
            self._raw.lineEdgeTop = newValue._raw
        }
    }

    public var lineEdgeBottom: PixelCoordinateLine {
        get {
            return PixelCoordinateLine(self._raw.lineEdgeBottom)
        } set {
            self._raw.lineEdgeBottom = newValue._raw
        }
    }

    public var computedVars: [String: Any] {
        return [
            "lineEdgeTop": self._raw.lineEdgeTop,
            "lineEdgeBottom": self._raw.lineEdgeBottom
        ]
    }

    public var manipulators: [String: (Any) -> Any] {
        return [:]
    }

    public var validVars: [String: [Any]] {
        return ["_raw": []]
    }

    /**
     * Create a new `wb_vision_line`.
     */
    public init(lineEdgeTop: PixelCoordinateLine = PixelCoordinateLine(wb_pixel_coordinate_line()), lineEdgeBottom: PixelCoordinateLine = PixelCoordinateLine(wb_pixel_coordinate_line())) {
        self._raw = wb_vision_line()
        self.lineEdgeTop = lineEdgeTop
        self.lineEdgeBottom = lineEdgeBottom
    }

    /**
     * Create a new `wb_vision_line`.
     */
    public init(_ rawValue: wb_vision_line) {
        self._raw = rawValue
    }

    /**
     * Create a `wb_vision_line` from a dictionary.
     */
    public init(fromDictionary dictionary: [String: Any?]) {
        self.init()
        guard
            let lineEdgeTop = (dictionary["lineEdgeTop"] as? [String: Any]).flatMap({ PixelCoordinateLine(fromDictionary: $0)  }),
            let lineEdgeBottom = (dictionary["lineEdgeBottom"] as? [String: Any]).flatMap({ PixelCoordinateLine(fromDictionary: $0)  })
        else {
            fatalError("Unable to convert \(dictionary) to wb_vision_line.")
        }
        self.lineEdgeTop = lineEdgeTop
        self.lineEdgeBottom = lineEdgeBottom
    }

}

extension VisionLine: CustomStringConvertible {

    /**
     * Convert to a description String.
     */
    public var description: String {
        var descString = ""
        descString += "lineEdgeTop={" + self.lineEdgeTop.description + "}"
        descString += ", "
        descString += "lineEdgeBottom={" + self.lineEdgeBottom.description + "}"
        return descString
    }

}

extension VisionLine: Equatable {}

public func == (lhs: VisionLine, rhs: VisionLine) -> Bool {
    return lhs.lineEdgeTop == rhs.lineEdgeTop
        && lhs.lineEdgeBottom == rhs.lineEdgeBottom
}

extension wb_vision_line: Equatable {}

public func == (lhs: wb_vision_line, rhs: wb_vision_line) -> Bool {
    return VisionLine(lhs) == VisionLine(rhs)
}
