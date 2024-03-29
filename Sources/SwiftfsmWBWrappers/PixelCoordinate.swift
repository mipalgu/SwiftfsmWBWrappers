/*
 * file PixelCoordinate.swift
 *
 * This file was generated by classgenerator from pixel_coordinate.gen.
 * DO NOT CHANGE MANUALLY!
 *
 * Copyright © 2020 Callum McColl. All rights reserved.
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
 *        This product includes software developed by Callum McColl.
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

#if canImport(swiftfsm)
import swiftfsm
#endif

#if canImport(GUUnits) && canImport(GUCoordinates)
import GUUnits
import GUCoordinates
#endif

/**
 * A `pixel_coordinate` is the whiteboard representation for the position of a
 * pixel in an image in centered pixel coordinate. The centered pixel coordinate
 * coordinate system is defined using four fields (x, y, resWidth, resHeight).
 * The x and y fields are contained within this type, however, the resWidth
 * and resHeight values are contained elsewhere. This is to save space within
 * this message; often multiple pixel coordinates are used and having to
 * stipulate the resolution width and height for each coordinate is wasteful.
 *
 * The x and y fields must conform to the following constraints:
 *    `-floor((resWidth - 1) / 2) <= x <= ceil((resWidth - 1) / 2)`,
 *    `-floor((resHeight - 1) / 2) <= y <= ceil((resHeight - 1) / 2)`.
 *
 * This places the (0, 0) point in the center of the image. The coordinate
 * system can be depicted graphically as follows:
 * ```
 *                            ceil((resHeight - 1) / 2)
 *                                       ---
 *                                        ^
 *                                        |
 *                                       y|
 *                                        |
 *                               -x       |        x
 * -floor((resWidth - 1) / 2) |<----------|---------->| ceil((resWidth - 1) / 2)
 *                                  (0,0)*|
 *                                        |
 *                                      -y|
 *                                        |
 *                                        V
 *                                       ---
 *                           -floor((resHeight - 1) / 2)
 * ```
 * Importantly here, the (0, 0) pixel is in the 3rd quadrant. This is because
 * when even numbers are used for resWidth and resHeight, the (0, 0) point
 * would be between pixels. Below is a table detailing the bounds for common
 * resolutions:
 *
 *           Resolution      |                    left/rightmost pixel                |               bottom/topmost pixel
 *     (resWidth, resHeight) | (-floor((resWidth - 1) / 2), ceil((resWidth - 1) / 2)) | (-floor((resHeight - 1) / 2), ceil(resHeight - 1) / 2)
 *    -----------------------+--------------------------------------------------------+--------------------------------------------------------
 *     (640, 480)            | (-319, 320)                                            | (-239, 240)
 *     (800, 600)            | (-399, 400)                                            | (-299, 300)
 *     (1280, 720)           | (-639, 640)                                            | (-359, 360)
 *     (1920, 1080)          | (-959, 960)                                            | (-539, 540)
 */
public struct PixelCoordinate {

    public var _raw: wb_pixel_coordinate

    public var x: Int16 {
        get {
            return self._raw.x
        } set {
            self._raw.x = newValue
        }
    }

    public var y: Int16 {
        get {
            return self._raw.y
        } set {
            self._raw.y = newValue
        }
    }

    public var computedVars: [String: Any] {
        return [
            "x": self._raw.x,
            "y": self._raw.y
        ]
    }

    public var manipulators: [String: (Any) -> Any] {
        return [:]
    }

    public var validVars: [String: [Any]] {
        return ["_raw": []]
    }

    /**
     * Create a new `wb_pixel_coordinate`.
     */
    public init(x: Int16 = 0, y: Int16 = 0) {
        self._raw = wb_pixel_coordinate()
        self.x = x
        self.y = y
    }

    /**
     * Create a new `wb_pixel_coordinate`.
     */
    public init(_ rawValue: wb_pixel_coordinate) {
        self._raw = rawValue
    }

    /**
     * Create a `wb_pixel_coordinate` from a dictionary.
     */
    public init(fromDictionary dictionary: [String: Any?]) {
        self.init()
        guard
            let x = dictionary["x"] as? Int16,
            let y = dictionary["y"] as? Int16
        else {
            fatalError("Unable to convert \(dictionary) to wb_pixel_coordinate.")
        }
        self.x = x
        self.y = y
    }

    #if canImport(GUUnits) && canImport(GUCoordinates)
    public init(_ other: GUCoordinates.PixelCoordinate) {
        self.init(x: Int16(other.x), y: Int16(other.y))
    }

    public init(_ other: gu_pixel_coordinate) {
        self.init(x: px_t_to_i16(other.x), y: px_t_to_i16(other.y))
    }

    public func pixelCoordinate(resWidth: UInt16, resHeight: UInt16) -> GUCoordinates.PixelCoordinate {
        return GUCoordinates.PixelCoordinate(x: Pixels_t(self.x), y: Pixels_t(self.y), resWidth: Pixels_u(resWidth), resHeight: Pixels_u(resHeight))
    }
    #endif

}

extension PixelCoordinate: CustomStringConvertible {

    /**
     * Convert to a description String.
     */
    public var description: String {
        var descString = ""
        descString += "x=\(self.x)"
        descString += ", "
        descString += "y=\(self.y)"
        return descString
    }

}

extension PixelCoordinate: Equatable {}

public func == (lhs: PixelCoordinate, rhs: PixelCoordinate) -> Bool {
    return lhs.x == rhs.x
        && lhs.y == rhs.y
}

extension wb_pixel_coordinate: Equatable {}

public func == (lhs: wb_pixel_coordinate, rhs: wb_pixel_coordinate) -> Bool {
    return PixelCoordinate(lhs) == PixelCoordinate(rhs)
}

#if canImport(swiftfsm)
extension PixelCoordinate: ExternalVariables, KripkeVariablesModifier {}
#endif
