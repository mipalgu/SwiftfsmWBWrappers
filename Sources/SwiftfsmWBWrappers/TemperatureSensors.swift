/*
 * file TemperatureSensors.swift
 *
 * This file was generated by classgenerator from temperature_sensors.gen.
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

/**
 * Provides a common interface for the temperature of the leg sensors.
 * This is for a research paper only - NOT for actual use on the robot.
 */
public struct TemperatureSensors {

    public var _raw: wb_temperature_sensors

    public var LKneePitch: Bool {
        get {
            return self._raw.LKneePitch
        } set {
            self._raw.LKneePitch = newValue
        }
    }

    public var LAnklePitch: Bool {
        get {
            return self._raw.LAnklePitch
        } set {
            self._raw.LAnklePitch = newValue
        }
    }

    public var LAnkleRoll: Bool {
        get {
            return self._raw.LAnkleRoll
        } set {
            self._raw.LAnkleRoll = newValue
        }
    }

    public var RKneePitch: Bool {
        get {
            return self._raw.RKneePitch
        } set {
            self._raw.RKneePitch = newValue
        }
    }

    public var RAnklePitch: Bool {
        get {
            return self._raw.RAnklePitch
        } set {
            self._raw.RAnklePitch = newValue
        }
    }

    public var RAnkleRoll: Bool {
        get {
            return self._raw.RAnkleRoll
        } set {
            self._raw.RAnkleRoll = newValue
        }
    }

    public var computedVars: [String: Any] {
        return [
            "LKneePitch": self._raw.LKneePitch,
            "LAnklePitch": self._raw.LAnklePitch,
            "LAnkleRoll": self._raw.LAnkleRoll,
            "RKneePitch": self._raw.RKneePitch,
            "RAnklePitch": self._raw.RAnklePitch,
            "RAnkleRoll": self._raw.RAnkleRoll
        ]
    }

    public var manipulators: [String: (Any) -> Any] {
        return [:]
    }

    public var validVars: [String: [Any]] {
        return ["_raw": []]
    }

    /**
     * Create a new `wb_temperature_sensors`.
     */
    public init(LKneePitch: Bool = false, LAnklePitch: Bool = false, LAnkleRoll: Bool = false, RKneePitch: Bool = false, RAnklePitch: Bool = false, RAnkleRoll: Bool = false) {
        self._raw = wb_temperature_sensors()
        self.LKneePitch = LKneePitch
        self.LAnklePitch = LAnklePitch
        self.LAnkleRoll = LAnkleRoll
        self.RKneePitch = RKneePitch
        self.RAnklePitch = RAnklePitch
        self.RAnkleRoll = RAnkleRoll
    }

    /**
     * Create a new `wb_temperature_sensors`.
     */
    public init(_ rawValue: wb_temperature_sensors) {
        self._raw = rawValue
    }

    /**
     * Create a `wb_temperature_sensors` from a dictionary.
     */
    public init(fromDictionary dictionary: [String: Any?]) {
        self.init()
        guard
            let LKneePitch = dictionary["LKneePitch"] as? Bool,
            let LAnklePitch = dictionary["LAnklePitch"] as? Bool,
            let LAnkleRoll = dictionary["LAnkleRoll"] as? Bool,
            let RKneePitch = dictionary["RKneePitch"] as? Bool,
            let RAnklePitch = dictionary["RAnklePitch"] as? Bool,
            let RAnkleRoll = dictionary["RAnkleRoll"] as? Bool
        else {
            fatalError("Unable to convert \(dictionary) to wb_temperature_sensors.")
        }
        self.LKneePitch = LKneePitch
        self.LAnklePitch = LAnklePitch
        self.LAnkleRoll = LAnkleRoll
        self.RKneePitch = RKneePitch
        self.RAnklePitch = RAnklePitch
        self.RAnkleRoll = RAnkleRoll
    }

}

extension TemperatureSensors: CustomStringConvertible {

    /**
     * Convert to a description String.
     */
    public var description: String {
        var descString = ""
        descString += "LKneePitch=\(self.LKneePitch)"
        descString += ", "
        descString += "LAnklePitch=\(self.LAnklePitch)"
        descString += ", "
        descString += "LAnkleRoll=\(self.LAnkleRoll)"
        descString += ", "
        descString += "RKneePitch=\(self.RKneePitch)"
        descString += ", "
        descString += "RAnklePitch=\(self.RAnklePitch)"
        descString += ", "
        descString += "RAnkleRoll=\(self.RAnkleRoll)"
        return descString
    }

}

extension TemperatureSensors: Equatable {}

public func == (lhs: TemperatureSensors, rhs: TemperatureSensors) -> Bool {
    return lhs.LKneePitch == rhs.LKneePitch
        && lhs.LAnklePitch == rhs.LAnklePitch
        && lhs.LAnkleRoll == rhs.LAnkleRoll
        && lhs.RKneePitch == rhs.RKneePitch
        && lhs.RAnklePitch == rhs.RAnklePitch
        && lhs.RAnkleRoll == rhs.RAnkleRoll
}

extension wb_temperature_sensors: Equatable {}

public func == (lhs: wb_temperature_sensors, rhs: wb_temperature_sensors) -> Bool {
    return TemperatureSensors(lhs) == TemperatureSensors(rhs)
}
