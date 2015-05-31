 param (
    [switch]$update = $false,
    [switch]$generate = $false,
    [switch]$publish = $false,
    [switch]$useMyGet = $false,
    [switch]$noiron = $false,
    [switch]$nopaper = $false,
    [string]$apiKey = "",
    [string]$version = "1.0.0"
)


function Update-Nuget {
    param([string]$nugetPackage, [string]$bowerPackage)
        
    rm $nugetPackage/content/Scripts/$bowerPackage -Recurse -Force
    cp bower_components/$bowerPackage $nugetPackage/content/Scripts/ -Recurse -Force
	rm bower_components/$bowerPackage -Recurse -Force
}

function Update-Polymer() {
    # Do nothing since this everything in polymer-ciclic
    Update-Nuget "polymer" "polymer"
    Update-Nuget "polymer" "webcomponentsjs"
}

function Update-Marked-Element() {
    Update-Nuget "marked-element" "marked"
    Update-Nuget "marked-element" "marked-element"
}

function Update-Prism-Element() {
    Update-Nuget "prism-element" "prism"
    Update-Nuget "prism-element" "prism-element"
}

function Update-Polymer-Iron-Elements() {
    Update-Nuget "polymer-iron-a11y-announcer" "iron-a11y-announcer"
    Update-Nuget "polymer-iron-a11y-keys-behavior" "iron-a11y-keys-behavior"
    Update-Nuget "polymer-iron-a11y-keys" "iron-a11y-keys"
    Update-Nuget "polymer-iron-ajax" "promise-polyfill"
    Update-Nuget "polymer-iron-ajax" "iron-ajax"
    Update-Nuget "polymer-iron-meta" "iron-meta"
    Update-Nuget "polymer-iron-flex-layout" "iron-flex-layout"
    Update-Nuget "polymer-iron-behaviors" "iron-behaviors"
    Update-Nuget "polymer-iron-validator-behavior" "iron-validator-behavior"
    Update-Nuget "polymer-iron-validatable-behavior" "iron-validatable-behavior"
    Update-Nuget "polymer-iron-autogrow-textarea" "iron-autogrow-textarea"
    Update-Nuget "polymer-iron-collapse" "iron-collapse"
    Update-Nuget "polymer-iron-fit-behavior" "iron-fit-behavior"
    Update-Nuget "polymer-iron-form" "iron-form"
    Update-Nuget "polymer-iron-form-element-behavior" "iron-form-element-behavior"
    Update-Nuget "polymer-iron-icon" "iron-icon"
    Update-Nuget "polymer-iron-iconset" "iron-iconset"
    Update-Nuget "polymer-iron-iconset-svg" "iron-iconset-svg"
    Update-Nuget "polymer-iron-icons" "iron-icons"
    Update-Nuget "polymer-iron-image" "iron-image"
    Update-Nuget "polymer-iron-input" "iron-input"
    Update-Nuget "polymer-iron-jsonp-library" "iron-jsonp-library"
    Update-Nuget "polymer-iron-localstorage" "iron-localstorage"
    Update-Nuget "polymer-iron-media-query" "iron-media-query"
    Update-Nuget "polymer-iron-resizable-behavior" "iron-resizable-behavior"
    Update-Nuget "polymer-iron-selector" "iron-selector"
    Update-Nuget "polymer-iron-menu-behavior" "iron-menu-behavior"
    Update-Nuget "polymer-iron-overlay-behavior" "iron-overlay-behavior"
    Update-Nuget "polymer-iron-pages" "iron-pages"
    Update-Nuget "polymer-iron-range-behavior" "iron-range-behavior"
    Update-Nuget "polymer-iron-signals" "iron-signals"
    Update-Nuget "polymer-iron-test-helpers" "iron-test-helpers"
    Update-Nuget "polymer-iron-doc-viewer" "iron-doc-viewer"
    
    Update-Nuget "polymer-iron-component-page" "hydrolysis"
    Update-Nuget "polymer-iron-component-page" "iron-component-page"
}

function Update-Paper-Elements() {
    Update-Nuget "paper-behaviors" "paper-behaviors"
    Update-Nuget "paper-header-panel" "paper-header-panel"
    Update-Nuget "paper-styles" "paper-styles"
    Update-Nuget "paper-material" "paper-material"
    Update-Nuget "paper-ripple" "paper-ripple"
    
    Update-Nuget "neon-animation" "web-animations-js"
    Update-Nuget "neon-animation" "neon-animation"
    
    Update-Nuget "paper-button" "paper-button"
    Update-Nuget "paper-toolbar" "paper-toolbar"
    Update-Nuget "paper-checkbox" "paper-checkbox"
    Update-Nuget "paper-drawer-panel" "paper-drawer-panel"
    Update-Nuget "paper-dialog-behavior" "paper-dialog-behavior"
    Update-Nuget "paper-dialog-scrollable" "paper-dialog-scrollable"
    Update-Nuget "paper-dialog" "paper-dialog"
    Update-Nuget "paper-fab" "paper-fab"
    Update-Nuget "paper-icon-button" "paper-icon-button"
    Update-Nuget "paper-input" "paper-input"
    Update-Nuget "paper-item" "paper-item"
    Update-Nuget "paper-menu" "paper-menu"
    Update-Nuget "paper-progress" "paper-progress"
    Update-Nuget "paper-radio-button" "paper-radio-button"
    Update-Nuget "paper-radio-group" "paper-radio-group"
    Update-Nuget "paper-scroll-header-panel" "paper-scroll-header-panel"
    Update-Nuget "paper-slider" "paper-slider"
    Update-Nuget "paper-spinner" "paper-spinner"
    Update-Nuget "paper-tabs" "paper-tabs"
    Update-Nuget "paper-toast" "paper-toast"
    Update-Nuget "paper-toggle-button" "paper-toggle-button"
}

function Generate-Package() {
    param([string]$name, [string]$version)
    $nuget = ".\Nuget.exe"
    
    mkdir -force dist\$version
    &$nuget pack $name\$name.nuspec -OutputDirectory dist\$version
}

function Generate-All-Packages() {
    param([string]$version)
    
    Generate-Package "polymer" $version

    Generate-Package "prism-element" $version
    Generate-Package "marked-element" $version
    
    Generate-Package "polymer-iron-a11y-announcer" $version
    Generate-Package "polymer-iron-a11y-keys-behavior" $version
    Generate-Package "polymer-iron-a11y-keys" $version
    Generate-Package "polymer-iron-ajax" $version
    Generate-Package "polymer-iron-meta" $version
    Generate-Package "polymer-iron-flex-layout" $version
    Generate-Package "polymer-iron-behaviors" $version
    Generate-Package "polymer-iron-validator-behavior" $version
    Generate-Package "polymer-iron-validatable-behavior" $version
    Generate-Package "polymer-iron-autogrow-textarea" $version
    Generate-Package "polymer-iron-collapse" $version
    Generate-Package "polymer-iron-fit-behavior" $version
    Generate-Package "polymer-iron-form" $version
    Generate-Package "polymer-iron-form-element-behavior" $version
    Generate-Package "polymer-iron-icon" $version
    Generate-Package "polymer-iron-iconset" $version
    Generate-Package "polymer-iron-iconset-svg" $version
    Generate-Package "polymer-iron-icons" $version
    Generate-Package "polymer-iron-image" $version
    Generate-Package "polymer-iron-input" $version
    Generate-Package "polymer-iron-jsonp-library" $version
    Generate-Package "polymer-iron-localstorage" $version
    Generate-Package "polymer-iron-media-query" $version
    Generate-Package "polymer-iron-resizable-behavior" $version
    Generate-Package "polymer-iron-selector" $version
    Generate-Package "polymer-iron-menu-behavior" $version
    Generate-Package "polymer-iron-overlay-behavior" $version
    Generate-Package "polymer-iron-pages" $version
    Generate-Package "polymer-iron-range-behavior" $version
    Generate-Package "polymer-iron-signals" $version
    Generate-Package "polymer-iron-test-helpers" $version
    Generate-Package "polymer-iron-component-page" $version
    Generate-Package "polymer-iron-doc-viewer" $version
    Generate-Package "polymer-iron-elements" $version
    
    Generate-Package "paper-behaviors" $version
    Generate-Package "paper-header-panel" $version
    Generate-Package "paper-styles" $version
    Generate-Package "paper-material" $version
    Generate-Package "paper-ripple" $version
    Generate-Package "neon-animation" $version
    Generate-Package "paper-button" $version
    Generate-Package "paper-toolbar" $version
    Generate-Package "paper-checkbox" $version
    Generate-Package "paper-drawer-panel" $version
    Generate-Package "paper-dialog-behavior" $version
    Generate-Package "paper-dialog-scrollable" $version
    Generate-Package "paper-dialog" $version
    Generate-Package "paper-fab" $version
    Generate-Package "paper-icon-button" $version
    Generate-Package "paper-input" $version
    Generate-Package "paper-item" $version
    Generate-Package "paper-menu" $version
    Generate-Package "paper-progress" $version
    Generate-Package "paper-radio-button" $version
    Generate-Package "paper-radio-group" $version
    Generate-Package "paper-scroll-header-panel" $version
    Generate-Package "paper-slider" $version
    Generate-Package "paper-spinner" $version
    Generate-Package "paper-tabs" $version
    Generate-Package "paper-toast" $version
    Generate-Package "paper-toggle-button" $version
    Generate-Package "paper-elements" $version
}

function Push-Package() {
    param([string]$name, [string]$version)
    $nuget = ".\Nuget.exe"
    
    if ($useMyGet) {
        &$nuget push dist\$version\$name.*.nupkg $apiKey -Source https://www.myget.org/F/polymer-nuget/api/v2/package
    } else {
        &$nuget push dist\$version\$name.*.nupkg
    }
}

function Update-All() {
    Update-Polymer
    Update-Prism-Element
    Update-Marked-Element
    Update-Polymer-Iron-Elements
    Update-Paper-Elements
}

function Push-Iron() {
    param([string]$version)
    
    Push-Package "prism-element" $version
    Push-Package "marked-element" $version
    
    Push-Package "polymer-iron-a11y-announcer" $version
    Push-Package "polymer-iron-a11y-keys-behavior" $version
    Push-Package "polymer-iron-a11y-keys" $version
    Push-Package "polymer-iron-ajax" $version
    Push-Package "polymer-iron-meta" $version
    Push-Package "polymer-iron-flex-layout" $version
    Push-Package "polymer-iron-behaviors" $version
    Push-Package "polymer-iron-validator-behavior" $version
    Push-Package "polymer-iron-validatable-behavior" $version
    Push-Package "polymer-iron-autogrow-textarea" $version
    Push-Package "polymer-iron-collapse" $version
    Push-Package "polymer-iron-fit-behavior" $version
    Push-Package "polymer-iron-form" $version
    Push-Package "polymer-iron-form-element-behavior" $version
    Push-Package "polymer-iron-icon" $version
    Push-Package "polymer-iron-iconset" $version
    Push-Package "polymer-iron-iconset-svg" $version
    Push-Package "polymer-iron-icons" $version
    Push-Package "polymer-iron-image" $version
    Push-Package "polymer-iron-input" $version
    Push-Package "polymer-iron-jsonp-library" $version
    Push-Package "polymer-iron-localstorage" $version
    Push-Package "polymer-iron-media-query" $version
    Push-Package "polymer-iron-resizable-behavior" $version
    Push-Package "polymer-iron-selector" $version
    Push-Package "polymer-iron-menu-behavior" $version
    Push-Package "polymer-iron-overlay-behavior" $version
    Push-Package "polymer-iron-pages" $version
    Push-Package "polymer-iron-range-behavior" $version
    Push-Package "polymer-iron-signals" $version
    Push-Package "polymer-iron-test-helpers" $version
    Push-Package "polymer-iron-component-page" $version
    Push-Package "polymer-iron-doc-viewer" $version
    Push-Package "polymer-iron-elements" $version
}

function Push-Paper() {
    param([string]$version)
    
    Push-Package "paper-behaviors" $version
    Push-Package "paper-header-panel" $version
    Push-Package "paper-styles" $version
    Push-Package "paper-material" $version
    Push-Package "paper-ripple" $version
    Push-Package "neon-animation" $version
    Push-Package "paper-button" $version
    Push-Package "paper-toolbar" $version
    Push-Package "paper-checkbox" $version
    Push-Package "paper-drawer-panel" $version
    Push-Package "paper-dialog-behavior" $version
    Push-Package "paper-dialog-scrollable" $version
    Push-Package "paper-dialog" $version
    Push-Package "paper-fab" $version
    Push-Package "paper-icon-button" $version
    Push-Package "paper-input" $version
    Push-Package "paper-item" $version
    Push-Package "paper-menu" $version
    Push-Package "paper-progress" $version
    Push-Package "paper-radio-button" $version
    Push-Package "paper-radio-group" $version
    Push-Package "paper-scroll-header-panel" $version
    Push-Package "paper-slider" $version
    Push-Package "paper-spinner" $version
    Push-Package "paper-tabs" $version
    Push-Package "paper-toast" $version
    Push-Package "paper-toggle-button" $version
    Push-Package "paper-elements" $version
}

function Push-All-Packages() {
    param([string]$version)
    Push-Package "polymer" $version

    if (-Not $noiron) {
        Push-Iron $version
    }
    
    if (-Not $nopaper) {    
        Push-Paper $version
    }
}

if ($update) {
    Update-All
}
if ($generate) {
    Generate-All-Packages $version
}
if ($publish) {
    Push-All-Packages $version
}
