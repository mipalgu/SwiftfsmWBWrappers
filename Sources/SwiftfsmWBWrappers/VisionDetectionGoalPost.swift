/*
 * file VisionDetectionGoalPost.swift
 *
 * This file was generated by classgenerator from vision_detection_goal_post.gen.
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

#if canImport(GUCoordinates)
import GUCoordinates
#endif

/**
 * Results for the Goal Ray Tracer (guvision). 
 * Results are a percentage of the image utilised, at whatever the resolution and FOV happen to be.
 * You can check the vision_detection_goals message for resolution information.
 */
public struct VisionDetectionGoalPost {

    public var _raw: wb_vision_detection_goal_post

    public var sightingType: GoalPostOptions {
        get {
            return self._raw.sightingType
        } set {
            self._raw.sightingType = newValue
        }
    }

    public var orientation: GoalPostOrientation {
        get {
            return self._raw.orientation
        } set {
            self._raw.orientation = newValue
        }
    }

    public var topLeftCoordinate: PixelCoordinate {
        get {
            return PixelCoordinate(self._raw.topLeftCoordinate)
        } set {
            self._raw.topLeftCoordinate = newValue._raw
        }
    }

    public var topRightCoordinate: PixelCoordinate {
        get {
            return PixelCoordinate(self._raw.topRightCoordinate)
        } set {
            self._raw.topRightCoordinate = newValue._raw
        }
    }

    public var bottomLeftCoordinate: PixelCoordinate {
        get {
            return PixelCoordinate(self._raw.bottomLeftCoordinate)
        } set {
            self._raw.bottomLeftCoordinate = newValue._raw
        }
    }

    public var bottomRightCoordinate: PixelCoordinate {
        get {
            return PixelCoordinate(self._raw.bottomRightCoordinate)
        } set {
            self._raw.bottomRightCoordinate = newValue._raw
        }
    }

    public var computedVars: [String: Any] {
        return [
            "sightingType": self._raw.sightingType,
            "orientation": self._raw.orientation,
            "topLeftCoordinate": self._raw.topLeftCoordinate,
            "topRightCoordinate": self._raw.topRightCoordinate,
            "bottomLeftCoordinate": self._raw.bottomLeftCoordinate,
            "bottomRightCoordinate": self._raw.bottomRightCoordinate
        ]
    }

    public var manipulators: [String: (Any) -> Any] {
        return [:]
    }

    public var validVars: [String: [Any]] {
        return ["_raw": []]
    }

    /**
     * Create a new `wb_vision_detection_goal_post`.
     */
    public init(sightingType: GoalPostOptions = NoPostDetected, orientation: GoalPostOrientation = GenericPost, topLeftCoordinate: PixelCoordinate = PixelCoordinate(wb_pixel_coordinate()), topRightCoordinate: PixelCoordinate = PixelCoordinate(wb_pixel_coordinate()), bottomLeftCoordinate: PixelCoordinate = PixelCoordinate(wb_pixel_coordinate()), bottomRightCoordinate: PixelCoordinate = PixelCoordinate(wb_pixel_coordinate())) {
        self._raw = wb_vision_detection_goal_post()
        self.sightingType = sightingType
        self.orientation = orientation
        self.topLeftCoordinate = topLeftCoordinate
        self.topRightCoordinate = topRightCoordinate
        self.bottomLeftCoordinate = bottomLeftCoordinate
        self.bottomRightCoordinate = bottomRightCoordinate
    }

    /**
     * Create a new `wb_vision_detection_goal_post`.
     */
    public init(_ rawValue: wb_vision_detection_goal_post) {
        self._raw = rawValue
    }

    /**
     * Create a `wb_vision_detection_goal_post` from a dictionary.
     */
    public init(fromDictionary dictionary: [String: Any]) {
        self.init()
        guard
            let sightingType = dictionary["sightingType"] as? GoalPostOptions,
            let orientation = dictionary["orientation"] as? GoalPostOrientation,
            let topLeftCoordinate = (dictionary["topLeftCoordinate"] as? [String: Any]).flatMap({ PixelCoordinate(fromDictionary: $0)  }),
            let topRightCoordinate = (dictionary["topRightCoordinate"] as? [String: Any]).flatMap({ PixelCoordinate(fromDictionary: $0)  }),
            let bottomLeftCoordinate = (dictionary["bottomLeftCoordinate"] as? [String: Any]).flatMap({ PixelCoordinate(fromDictionary: $0)  }),
            let bottomRightCoordinate = (dictionary["bottomRightCoordinate"] as? [String: Any]).flatMap({ PixelCoordinate(fromDictionary: $0)  })
        else {
            fatalError("Unable to convert \(dictionary) to wb_vision_detection_goal_post.")
        }
        self.sightingType = sightingType
        self.orientation = orientation
        self.topLeftCoordinate = topLeftCoordinate
        self.topRightCoordinate = topRightCoordinate
        self.bottomLeftCoordinate = bottomLeftCoordinate
        self.bottomRightCoordinate = bottomRightCoordinate
    }

    #if canImport(GUCoordinates)
    public func topLeftCoordinatePixelCoordinate(resWidth: UInt16, resHeight: UInt16) -> GUCoordinates.PixelCoordinate {
        return topLeftCoordinate.pixelCoordinate(resWidth: resWidth, resHeight: resHeight)
    }
    #endif
    #if canImport(GUCoordinates)
    public func topRightCoordinatePixelCoordinate(resWidth: UInt16, resHeight: UInt16) -> GUCoordinates.PixelCoordinate {
        return topRightCoordinate.pixelCoordinate(resWidth: resWidth, resHeight: resHeight)
    }
    #endif
    #if canImport(GUCoordinates)
    public func bottomLeftCoordinatePixelCoordinate(resWidth: UInt16, resHeight: UInt16) -> GUCoordinates.PixelCoordinate {
        return bottomLeftCoordinate.pixelCoordinate(resWidth: resWidth, resHeight: resHeight)
    }
    #endif
    #if canImport(GUCoordinates)
    public func bottomRightCoordinatePixelCoordinate(resWidth: UInt16, resHeight: UInt16) -> GUCoordinates.PixelCoordinate {
        return bottomRightCoordinate.pixelCoordinate(resWidth: resWidth, resHeight: resHeight)
    }
    #endif

}

extension VisionDetectionGoalPost: CustomStringConvertible {

    /**
     * Convert to a description String.
     */
    public var description: String {
        var descString = ""
        descString += "sightingType=\(self.sightingType.rawValue)"
        descString += ", "
        descString += "orientation=\(self.orientation.rawValue)"
        descString += ", "
        descString += "topLeftCoordinate={" + self.topLeftCoordinate.description + "}"
        descString += ", "
        descString += "topRightCoordinate={" + self.topRightCoordinate.description + "}"
        descString += ", "
        descString += "bottomLeftCoordinate={" + self.bottomLeftCoordinate.description + "}"
        descString += ", "
        descString += "bottomRightCoordinate={" + self.bottomRightCoordinate.description + "}"
        return descString
    }

}

extension VisionDetectionGoalPost: Equatable {}

public func == (lhs: VisionDetectionGoalPost, rhs: VisionDetectionGoalPost) -> Bool {
    return lhs.sightingType == rhs.sightingType
        && lhs.orientation == rhs.orientation
        && lhs.topLeftCoordinate == rhs.topLeftCoordinate
        && lhs.topRightCoordinate == rhs.topRightCoordinate
        && lhs.bottomLeftCoordinate == rhs.bottomLeftCoordinate
        && lhs.bottomRightCoordinate == rhs.bottomRightCoordinate
}

extension wb_vision_detection_goal_post: Equatable {}

public func == (lhs: wb_vision_detection_goal_post, rhs: wb_vision_detection_goal_post) -> Bool {
    return VisionDetectionGoalPost(lhs) == VisionDetectionGoalPost(rhs)
}