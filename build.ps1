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
    Update-Nuget "polymer-iron-ajax" "iron-ajax"
    Update-Nuget "polymer-iron-meta" "iron-meta"
    Update-Nuget "polymer-iron-flex-layout" "iron-iron-flex-layout"
    Update-Nuget "polymer-iron-behaviors" "iron-iron-behaviors"
    Update-Nuget "polymer-iron-validator-behavior" "iron-iron-validator-behavior"
    Update-Nuget "polymer-iron-validatable-behavior" "iron-iron-validatable-behavior"
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
    Generate-Package "polymer-iron-iron-doc-viewer" $version
    Generate-Package "polymer-iron-elements" $version
    
    Generate-Package "paper-elements" $version
}

function Push-Package() {
    param([string]$name, [string]$version)
    $nuget = ".\Nuget.exe"
    
    &$nuget push dist\$version\$name.$version.nupkg
}

function Update-All() {
    Update-Polymer
    Update-Prism-Element
    Update-Marked-Element
    Update-Polymer-Iron-Elements
    Update-Paper-Elements
}

function Push-All-Packages() {
    $version = "1.0.0"
    #This package is deprecated.
    Push-Package "polymer" $version
    Push-Package "polymer-core-component-page" $version
    Push-Package "polymer-core-elements" $version
    Push-Package "paper-elements" $version
}

$version = "1.0.0"
Update-All
#Generate-All-Packages $version
#Push-All-Packages $version