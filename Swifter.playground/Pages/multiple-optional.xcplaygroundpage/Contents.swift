
import Foundation

var string: String? = "string"
var anotherString: String?? = string

var literalOptional: String?? = "string"

var aNil: String? = nil

var anotherNil: String?? = aNil
var literalNil: String?? = nil

if let a = anotherNil {
    // This will output.
    print("anotherNil")
}

if let b = literalNil {
    // This will not output.
    print("literalNil")
}
