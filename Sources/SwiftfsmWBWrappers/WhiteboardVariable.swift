/*
 * WhiteboardVariable.swift 
 * SwiftfsmWBWrappers 
 *
 * Created by Callum McColl on 03/07/2020.
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

import GUSimpleWhiteboard
import swiftfsm

public final class WhiteboardVariable<T>: Snapshotable, ExternalVariablesContainer where T: ExternalVariables {

    public let wb: GenericWhiteboard<T>

    public let name: String

    public var val: T

    fileprivate init(wb: GenericWhiteboard<T>, name: String, val: T) {
        self.wb = wb
        self.name = name
        self.val = val
    }

    public init(name: String? = nil, msgType: wb_types, atomic: Bool = false, shouldNotifySubscribers: Bool = true) {
        let wb: Whiteboard
        let offset = "\(msgType.rawValue)"
        let offsetName = withUnsafePointer(to: &wb_types_stringValues.0) {
            let buffer = UnsafeBufferPointer(start: $0, count: Int(WB_NUM_TYPES_DEFINED))
            let p: UnsafePointer<CChar> = buffer[Int(msgType.rawValue)]!
            return String(cString: p)
        }
        let actualName: String
        if let name = name {
            actualName = name + "." + offsetName
            wb = Whiteboard(wbd: gsw_new_whiteboard(name))
        } else {
            actualName = offsetName
            wb = Whiteboard()
        }
        let genericWb = GenericWhiteboard<T>(
            msgType: msgType,
            wbd: wb,
            atomic: atomic,
            shouldNotifySubscribers: shouldNotifySubscribers
        )
        self.init(wb: genericWb, name: actualName, val: genericWb.get())
    }

    public func takeSnapshot() {
        self.val = self.wb.get()
    }

    public func saveSnapshot() {
        self.wb.post(val: self.val)
    }

}

extension WhiteboardVariable: Cloneable {

    public func clone() -> WhiteboardVariable<T> {
        return WhiteboardVariable(wb: wb, name: name, val: val)
    }

}
