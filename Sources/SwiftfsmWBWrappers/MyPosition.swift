/*
 * file MyPosition.swift
 *
 * This file was generated by classgenerator from my_position.gen.
 * DO NOT CHANGE MANUALLY!
 *
 * Copyright © 2020 Morgan McColl. All rights reserved.
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
 *        This product includes software developed by Morgan McColl.
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

import GUCoordinates

/**
 * Provides a class for the current position of the robot in its frame of reference.
 * The 0 point is where the robot started (wherever that is). This message is not related to the particle filter
 * at all.
 */
public struct MyPosition {

    public var _raw: wb_my_position

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

    public var heading: Int16 {
        get {
            return self._raw.heading
        } set {
            self._raw.heading = newValue
        }
    }

    public var computedVars: [String: Any] {
        return [
            "x": self._raw.x,
            "y": self._raw.y,
            "heading": self._raw.heading
        ]
    }

    public var manipulators: [String: (Any) -> Any] {
        return [:]
    }

    public var validVars: [String: [Any]] {
        return ["_raw": []]
    }

    /**
     * Create a new `wb_my_position`.
     */
    public init(x: Int16 = 0, y: Int16 = 0, heading: Int16 = 0) {
        self._raw = wb_my_position()
        self.x = x
        self.y = y
        self.heading = heading
    }

    /**
     * Create a new `wb_my_position`.
     */
    public init(_ rawValue: wb_my_position) {
        self._raw = rawValue
    }

    /**
     * Create a `wb_my_position` from a dictionary.
     */
    public init(fromDictionary dictionary: [String: Any?]) {
        self.init()
        guard
            let x = dictionary["x"] as? Int16,
            let y = dictionary["y"] as? Int16,
            let heading = dictionary["heading"] as? Int16
        else {
            fatalError("Unable to convert \(dictionary) to wb_my_position.")
        }
        self.x = x
        self.y = y
        self.heading = heading
    }

    public var fieldCoordinate: FieldCoordinate {
        FieldCoordinate(position: CartesianCoordinate(x: Millimetres_t(x), y: Millimetres_t(y)), heading: .degrees(heading))
    }

}

extension MyPosition: CustomStringConvertible {

    /**
     * Convert to a description String.
     */
    public var description: String {
        var descString = ""
        descString += "x=\(self.x)"
        descString += ", "
        descString += "y=\(self.y)"
        descString += ", "
        descString += "heading=\(self.heading)"
        return descString
    }

}

extension MyPosition: Equatable {}

public func == (lhs: MyPosition, rhs: MyPosition) -> Bool {
    return lhs.x == rhs.x
        && lhs.y == rhs.y
        && lhs.heading == rhs.heading
}

extension wb_my_position: Equatable {}

public func == (lhs: wb_my_position, rhs: wb_my_position) -> Bool {
    return MyPosition(lhs) == MyPosition(rhs)
}

#if canImport(swiftfsm)
extension MyPosition: ExternalVariables, KripkeVariablesModifier {}
#endif
