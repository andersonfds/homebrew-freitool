#/bin/ruby

$script_dir = File.dirname(__FILE__)
$formula_dir = "#{$script_dir}/../Formula"
$freitool = "#{$formula_dir}/freitool.rb"
$repo = "andersonfds/freitool"

def replace_text(file, text, replacement)
  text = File.read(file).gsub(text, replacement)
  File.open(file, "w") { |file| file.puts text }
end

def get_release(tag_name)
  data = `curl -s https://api.github.com/repos/#{$repo}/releases`
  require "json"

  releases = JSON.parse(data)
  return releases[0]
end

def find_asset(partial_match, release)
  assets = release["assets"]

  assets.each do |asset|
    if asset["name"].include?(partial_match)
      return asset
    end
  end

  return nil
end

release = get_release("v#{$pin_version}")
version = release["tag_name"]
arch64 = find_asset("aarch64", release)
intel = find_asset("x86_64", release)
sha256_arm = `curl -sL #{arch64["browser_download_url"]} | shasum -a 256`
sha256_intel = `curl -sL #{intel["browser_download_url"]} | shasum -a 256`

replace_text($freitool, "{{VERSION}}", version)
replace_text($freitool, "{{SHA256_ARM}}", sha256_arm.split(" ")[0])
replace_text($freitool, "{{SHA256_INTEL}}", sha256_intel.split(" ")[0])

# Add to git and push to main
`git add #{$freitool}`
`git commit -m "Bump freitool to version #{version}"`
`git push origin main`
