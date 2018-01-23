

//This Playground for testing and training on Enumerations


enum Directions { case UP , DOWN , RIGHT, LEFT }

var directionStr : Directions = .UP

if directionStr == .UP{ print("Go Up") }

else if directionStr == .DOWN { print("Go Down") }

else if directionStr == .RIGHT { print("Go Right") }

else if directionStr == .LEFT{ print("Go Left") }



//another way to create enumeration and deal with the values

enum WeakDays: Int { case SATURDAY , SUNDAY , MONDAY,TUSEDAYm, WENDSDAY,THURDAY,FRIDAY}

let weekdays : WeakDays = .FRIDAY

print(weekdays.rawValue)



//Compelete example for Enumerations

enum iPhoneEnum : String{
    case iPhone6, iPhone6s , iPhone6sPlus,iPhone7,iPhone8,iPhoneX
}

enum iPadEnum : String {
    case iPadAir,iPadPro
}
enum MackbookEnum: String{
    case MacBookPro, MacBookAir
}
enum DeviceEnum {
    case iPhoneDevice (iPhoneEnum)
    case iPadDevice (iPadEnum)
    case MacDevice (MackbookEnum)
}


func orderDevice(Name : String ,Device : DeviceEnum){
    var DeviceName = ""
    
    switch Device {
    case .iPadDevice(let iPadType):
        DeviceName = iPadType.rawValue
    case .iPhoneDevice(let iPhoneType):
        DeviceName = iPhoneType.rawValue
    case .MacDevice(let MacType):
        DeviceName = MacType.rawValue
    }
    print("Dear MR.\(Name) You have Ordered \(DeviceName)")
}

orderDevice(Name: "Emad", Device: .MacDevice(.MacBookPro))



