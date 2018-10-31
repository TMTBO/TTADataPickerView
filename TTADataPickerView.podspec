#
#  Be sure to run `pod spec lint TTADataPickerView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "TTADataPickerView"
  s.version      = "0.4.0"
  s.summary      = "A Swift mixed data selector"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
  A picker view allow you to pick the titles you want and the date, time or dateTime in one view!
                   DESC

  s.homepage     = "https://github.com/TMTBO/TTADataPickerView"
 
  # s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "TobyoTenma" => "tmtbo@hotmail.com" }
  
  # s.platform     = :ios
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/TMTBO/TTADataPickerView.git", :tag => "#{s.version}" }

  s.source_files  = "TTADataPickerView", "TTADataPickerView/**/*.{swift}"

s.requires_arc = true

end
