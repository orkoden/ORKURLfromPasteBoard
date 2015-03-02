#
# Be sure to run `pod lib lint ORKURLfromPasteBoardTemplate.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ORKURLfromPasteBoard"
  s.version          = "1.0.0"
  s.summary          = "Get NSURLs from a pasteboard full of text. Supports IDNA."
  s.description      = <<-DESC
  Gets URLs from a pasteboard. Instead of requiring a user to enter URLs by had, just pick it from the clipboard. It checks text content for strings looking like links and turns them into `NSURL`s. Also works for internationalized domain names (IDNA).
                       DESC
  s.homepage         = "https://github.com/orkoden/ORKURLfromPasteBoard"
  s.screenshots     = "https://raw.githubusercontent.com/orkoden/ORKURLfromPasteBoard/master/ORKURLfromPasteBoard.gif"
  s.license          = 'MIT'
  s.author           = { "Jörg Bühmann" => "joergbuehmann@gmail.com" }
  s.source           = { :git => "https://github.com/orkoden/ORKURLfromPasteBoard.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/orkoden'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.dependency 'Punycode-Cocoa'
end
