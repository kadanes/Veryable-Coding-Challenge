//
//  VryPallete.swift
//  Veryable
//
//  Created by Isaac Sheets on 2/18/21.
//  Copyright © 2021 Veryable, Inc. All rights reserved.
//

import Foundation
import UIKit

public enum VBlue: VColor {
    case normal, light, dark, extraLight
    public var color: UIColor {
        switch self {
            case .normal: return UIColor(named: "PrimaryBlue")!
            case .dark: return UIColor(named: "PrimaryBlueDark")!
            case .light: return UIColor(named: "PrimaryBlueLight")!
            case .extraLight: return UIColor(named: "PrimaryBlueExtraLight")!
        }
    }
}

public enum VGreen: VColor {
    case normal, light, dark
    public var color: UIColor {
        switch self {
            case .normal: return UIColor(named: "SecondaryGreen")!
            case .dark: return UIColor(named: "SecondaryGreenDark")!
            case .light: return UIColor(named: "SecondaryGreenLight")!
        }
    }
}

public enum VGrey: VColor {
    case normal, light, dark, disabled
    public var color: UIColor {
        switch self {
            case .normal: return UIColor(named: "Grey")!
            case .dark: return UIColor(named: "GreyDark")!
            case .light: return UIColor(named: "GreyLight")!
            case .disabled: return UIColor(named: "GreyDisabled")!
        }
    }
}

public enum VCustomGrey: VColor {
    case normal, dark, light
    public var color: UIColor {
        switch self {
            case .normal: return UIColor(red: 0.49, green: 0.49, blue: 0.49, alpha: 1.00) // #7e7e7e
            case .dark: return UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1.00) // #4a4a4a
            case .light: return UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00) // #F5F5F5
        }
    }
}

public enum VBrightGreen: VColor {
    case normal, light, dark
    public var color: UIColor {
        switch self {
            case .normal: return UIColor(named: "BrightGreen")!
            case .dark: return UIColor(named: "BrightGreenDark")!
            case .light: return UIColor(named: "BrightGreenLight")!
        }
    }
}

public enum VOrange: VColor {
    case normal, light, dark
    public var color: UIColor {
        switch self {
            case .normal: return UIColor(named: "Orange")!
            case .dark: return UIColor(named: "OrangeDark")!
            case .light: return UIColor(named: "OrangeLight")!
        }
    }
}

public enum VPurple: VColor {
    case normal, light, dark
    public var color: UIColor {
        switch self {
            case .normal: return UIColor(named: "Purple")!
            case .dark: return UIColor(named: "PurpleDark")!
            case .light: return UIColor(named: "PurpleLight")!
        }
    }
}

public enum VRed: VColor {
    case normal, light, dark
    public var color: UIColor {
        switch self {
            case .normal: return UIColor(named: "Red")!
            case .dark: return UIColor(named: "RedDark")!
            case .light: return UIColor(named: "RedLight")!
        }
    }
}

public enum VYellow: VColor {
    case normal, light, dark
    public var color: UIColor {
        switch self {
            case .normal: return UIColor(named: "Yellow")!
            case .dark: return UIColor(named: "YellowDark")!
            case .light: return UIColor(named: "YellowLight")!
        }
    }
}

public enum VPink: VColor {
    case normal, light, dark
    public var color: UIColor {
        switch self {
            case .normal: return UIColor(named: "Pink")!
            case .dark: return UIColor(named: "PinkDark")!
            case .light: return UIColor(named: "PinkLight")!
        }
    }
}
