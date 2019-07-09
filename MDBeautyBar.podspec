#
# Be sure to run `pod lib lint MDBeautyBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MDBeautyBar'
  s.version          = '0.1.5'
  s.summary          = 'MDBeautyBar 美颜界面'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  美颜界面界面 "#import<MDBeautyBar/KCBeautyBar.h>"
                       DESC

  s.homepage         = 'https://github.com/KnowChat/MDBeautyBar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yinhaofrancis' => '183398721@qq.com' }
  s.source           = { :git => 'https://github.com/KnowChat/MDBeautyBar.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MDBeautyBar/Classes/**/*'
  
   s.resource_bundles = {
     'MDBeautyBar' => ['MDBeautyBar/Assets/*.png']
   }

   s.public_header_files = 'MDBeautyBar/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'Masonry','~>1.1.0'
end
