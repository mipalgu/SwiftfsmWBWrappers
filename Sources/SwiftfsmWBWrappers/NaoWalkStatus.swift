/*
 * file NaoWalkStatus.swift
 *
 * This file was generated by classgenerator from naoWalkStatus.gen.
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
 * Status message for the walk engine created by UNSW.
 * LICENSE:
 * https://github.com/UNSWComputing/rUNSWift-2017-release/blob/master/LICENSE
 * Source:
 * https://github.com/UNSWComputing/rUNSWift-2017-release/blob/master/robot/motion/generator/Walk2014Generator.cpp
 * Some of their documentation:
 * https://github.com/UNSWComputing/rUNSWift-2017-release/wiki/Motion#walk2014-generator
 */
public struct NaoWalkStatus {

    public var _raw: wb_nao_walk_status

    public var walkEngineState: WalkEngineState {
        get {
            return self._raw.walkEngineState
        } set {
            self._raw.walkEngineState = newValue
        }
    }

    public var odometry: Odometry {
        get {
            return Odometry(self._raw.odometry)
        } set {
            self._raw.odometry = newValue._raw
        }
    }

    public var odometryResetCounter: UInt8 {
        get {
            return self._raw.odometryResetCounter
        } set {
            self._raw.odometryResetCounter = newValue
        }
    }

    public var computedVars: [String: Any] {
        return [
            "walkEngineState": self._raw.walkEngineState,
            "odometry": self._raw.odometry,
            "odometryResetCounter": self._raw.odometryResetCounter
        ]
    }

    public var manipulators: [String: (Any) -> Any] {
        return [:]
    }

    public var validVars: [String: [Any]] {
        return ["_raw": []]
    }

    /**
     * Create a new `wb_nao_walk_status`.
     */
    public init(walkEngineState: WalkEngineState = wes_Disconnected, odometry: Odometry = Odometry(wb_odometry()), odometryResetCounter: UInt8 = 0) {
        self._raw = wb_nao_walk_status()
        self.walkEngineState = walkEngineState
        self.odometry = odometry
        self.odometryResetCounter = odometryResetCounter
    }

    /**
     * Create a new `wb_nao_walk_status`.
     */
    public init(_ rawValue: wb_nao_walk_status) {
        self._raw = rawValue
    }

    /**
     * Create a `wb_nao_walk_status` from a dictionary.
     */
    public init(fromDictionary dictionary: [String: Any]) {
        self.init()
        guard
            let walkEngineState = dictionary["walkEngineState"] as? WalkEngineState,
            let odometry = (dictionary["odometry"] as? [String: Any]).flatMap({ Odometry(fromDictionary: $0)  }),
            let odometryResetCounter = dictionary["odometryResetCounter"] as? UInt8
        else {
            fatalError("Unable to convert \(dictionary) to wb_nao_walk_status.")
        }
        self.walkEngineState = walkEngineState
        self.odometry = odometry
        self.odometryResetCounter = odometryResetCounter
    }

}

extension NaoWalkStatus: CustomStringConvertible {

    /**
     * Convert to a description String.
     */
    public var description: String {
        var descString = ""
        descString += "walkEngineState=\(self.walkEngineState.rawValue)"
        descString += ", "
        descString += "odometry={" + self.odometry.description + "}"
        descString += ", "
        descString += "odometryResetCounter=\(self.odometryResetCounter)"
        return descString
    }

}

extension NaoWalkStatus: Equatable {}

public func == (lhs: NaoWalkStatus, rhs: NaoWalkStatus) -> Bool {
    return lhs.walkEngineState == rhs.walkEngineState
        && lhs.odometry == rhs.odometry
        && lhs.odometryResetCounter == rhs.odometryResetCounter
}

extension wb_nao_walk_status: Equatable {}

public func == (lhs: wb_nao_walk_status, rhs: wb_nao_walk_status) -> Bool {
    return NaoWalkStatus(lhs) == NaoWalkStatus(rhs)
}
