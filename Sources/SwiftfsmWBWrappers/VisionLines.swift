/*
 * file VisionLines.swift
 *
 * This file was generated by classgenerator from vision_lines.gen.
 * DO NOT CHANGE MANUALLY!
 *
 * Copyright © 2020 Eugene Gilmore. All rights reserved.
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
 *        This product includes software developed by Eugene Gilmore.
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
 * Class use to represent lines detected by vision for a single camera and posted
 * to the whiteboard
 */
public struct VisionLines {

    public var _raw: wb_vision_lines

    public var lines: [VisionLine] {
        get {
            var lines = self._raw.lines
            return withUnsafePointer(to: &lines.0) { lines_p in
                var lines: [VisionLine] = []
                lines.reserveCapacity(7)
                for lines_index in 0..<7 {
                    lines.append(VisionLine(lines_p[lines_index]))
                }
                return lines
            }
        } set {
            _ = withUnsafeMutablePointer(to: &self._raw.lines.0) { lines_p in
                for lines_index in 0..<7 {
                    lines_p[lines_index] = newValue[lines_index]._raw
                }
            }
        }
    }

    public var numLines: UInt8 {
        get {
            return self._raw.numLines
        } set {
            self._raw.numLines = newValue
        }
    }

    public var frameNumber: UInt64 {
        get {
            return self._raw.frameNumber
        } set {
            self._raw.frameNumber = newValue
        }
    }

    public var res_width: UInt16 {
        get {
            return self._raw.res_width
        } set {
            self._raw.res_width = newValue
        }
    }

    public var res_height: UInt16 {
        get {
            return self._raw.res_height
        } set {
            self._raw.res_height = newValue
        }
    }

    public var computedVars: [String: Any] {
        return [
            "lines": self._raw.lines,
            "numLines": self._raw.numLines,
            "frameNumber": self._raw.frameNumber,
            "res_width": self._raw.res_width,
            "res_height": self._raw.res_height
        ]
    }

    public var manipulators: [String: (Any) -> Any] {
        return [:]
    }

    public var validVars: [String: [Any]] {
        return ["_raw": []]
    }

    /**
     * Create a new `wb_vision_lines`.
     */
    public init(lines: [VisionLine] = [VisionLine(wb_vision_line()), VisionLine(wb_vision_line()), VisionLine(wb_vision_line()), VisionLine(wb_vision_line()), VisionLine(wb_vision_line()), VisionLine(wb_vision_line()), VisionLine(wb_vision_line())], numLines: UInt8 = 0, frameNumber: UInt64 = 0, res_width: UInt16 = 0, res_height: UInt16 = 0) {
        self._raw = wb_vision_lines()
        self.lines = lines
        self.numLines = numLines
        self.frameNumber = frameNumber
        self.res_width = res_width
        self.res_height = res_height
    }

    /**
     * Create a new `wb_vision_lines`.
     */
    public init(_ rawValue: wb_vision_lines) {
        self._raw = rawValue
    }

    /**
     * Create a `wb_vision_lines` from a dictionary.
     */
    public init(fromDictionary dictionary: [String: Any]) {
        self.init()
        guard
            let lines = dictionary["lines"] as? [VisionLine],
            let numLines = dictionary["numLines"] as? UInt8,
            let frameNumber = dictionary["frameNumber"] as? UInt64,
            let res_width = dictionary["res_width"] as? UInt16,
            let res_height = dictionary["res_height"] as? UInt16
        else {
            fatalError("Unable to convert \(dictionary) to wb_vision_lines.")
        }
        self.lines = lines
        self.numLines = numLines
        self.frameNumber = frameNumber
        self.res_width = res_width
        self.res_height = res_height
    }

}

extension VisionLines: CustomStringConvertible {

    /**
     * Convert to a description String.
     */
    public var description: String {
        var descString = ""
        if self.lines.isEmpty {
            descString += "lines={}"
        } else {
            let first = "{" + self.lines[0].description + "}"
            descString += "lines={"
            descString += self.lines.dropFirst().reduce("\(first)") { $0 + ", " + "{" + $1.description + "}" }
            descString += "}"
        }
        descString += ", "
        descString += "numLines=\(self.numLines)"
        descString += ", "
        descString += "frameNumber=\(self.frameNumber)"
        descString += ", "
        descString += "res_width=\(self.res_width)"
        descString += ", "
        descString += "res_height=\(self.res_height)"
        return descString
    }

}

extension VisionLines: Equatable {}

public func == (lhs: VisionLines, rhs: VisionLines) -> Bool {
    return lhs.lines == rhs.lines
        && lhs.numLines == rhs.numLines
        && lhs.frameNumber == rhs.frameNumber
        && lhs.res_width == rhs.res_width
        && lhs.res_height == rhs.res_height
}

extension wb_vision_lines: Equatable {}

public func == (lhs: wb_vision_lines, rhs: wb_vision_lines) -> Bool {
    return VisionLines(lhs) == VisionLines(rhs)
}
