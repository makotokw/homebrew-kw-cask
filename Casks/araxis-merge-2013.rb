cask 'araxis-merge-2013' do
  version '2013.4415'

  if MacOS.release <= :snow_leopard
    sha256 :no_check
    url "http://www.araxis.com/download/Merge#{version}-OSX10.6.dmg"
  elsif MacOS.release <= :lion
    sha256 :no_check
    url "http://www.araxis.com/download/Merge#{version}-OSX10.8.dmg"
  elsif MacOS.release <= :mountain_lion
    sha256 :no_check
    url "http://www.araxis.com/download/Merge#{version}-OSX10.8.dmg"
  else
    sha256 '6fdc0008ec06c51c3a4d41d6458aaca627f6746a1c876fc6c8b79eaf3e19721f'
    url "http://www.araxis.com/download/Merge#{version}-OSX10.9.dmg"
  end

  name 'Araxis Merge 2013'
  homepage 'http://www.araxis.com/merge'
  license :commercial

  depends_on macos: '>= :snow_leopard'

  app 'Araxis Merge.app', target: 'Araxis Merge 2013.app'

  # binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxisgitdiff"
  # binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxisopendiff"
  # binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxissvndiff"
  # binary "#{appdir}/Araxis Merge.app/Contents/Utilities/compare"
  # binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxisgitmerge"
  # binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxisp4diff"
  # binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxissvndiff3"
  # binary "#{appdir}/Araxis Merge.app/Contents/Utilities/compare2"
  # binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxishgmerge"
  # binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxisp4winmrg"
  # binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxissvnmerge"

  zap delete: [
                '~/Library/Preferences/com.araxis.merge.LSSharedFileList.plist',
                '~/Library/Preferences/com.araxis.merge.plist',
              ]

  caveats <<-EOS.undent
    For instructions to integrate Araxis Merge with Finder or other applications,
    see http://www.araxis.com/merge/documentation-os-x/installing.en
  EOS
end
