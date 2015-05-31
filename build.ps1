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

function Update-Polymer-Iron-Component-Page() {
    Update-Nuget "polymer-iron-component-page" "iron-doc-viewer"
    Update-Nuget "polymer-iron-component-page" "iron-flex-layout"
    Update-Nuget "polymer-iron-component-page" "paper-toolbar"
    Update-Nuget "polymer-iron-component-page" "hydrolysis"
    Update-Nuget "polymer-iron-component-page" "paper-header-panel"
    Update-Nuget "polymer-iron-component-page" "iron-icons"
    Update-Nuget "polymer-iron-component-page" "iron-selector"
    Update-Nuget "polymer-iron-component-page" "paper-styles"
    Update-Nuget "polymer-iron-component-page" "iron-component-page"
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
}

function Update-Paper-Elements() {
    $package = "paper-elements"
    Update-Nuget $package "core-a11y-keys"
    Update-Nuget $package "paper-behaviors"
    Update-Nuget $package "paper-button"
    Update-Nuget $package "paper-checkbox"
    Update-Nuget $package "paper-dialog"
    Update-Nuget $package "paper-dialog-behavior"
    Update-Nuget $package "paper-dialog-scrollable"
    Update-Nuget $package "paper-drawer-panel"
    Update-Nuget $package "paper-fab"
    Update-Nuget $package "paper-header-panel"
    Update-Nuget $package "paper-icon-button"
    Update-Nuget $package "paper-menu-button"
    Update-Nuget $package "paper-input"
    Update-Nuget $package "paper-item"
    Update-Nuget $package "paper-material"
    Update-Nuget $package "paper-menu"
    Update-Nuget $package "paper-progress"
    Update-Nuget $package "paper-radio-button"
    Update-Nuget $package "paper-radio-group"
    Update-Nuget $package "paper-ripple"
    Update-Nuget $package "paper-slider"
    Update-Nuget $package "paper-spinner"
    Update-Nuget $package "paper-styles"
    Update-Nuget $package "paper-tabs"
    Update-Nuget $package "paper-toast"
    Update-Nuget $package "paper-toggle-button"
    Update-Nuget $package "paper-toolbar"
    Update-Nuget $package "paper-scroll-header-panel"
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
    
    Generate-Package "polymer-iron-a11y-announcer" $version
    Generate-Package "polymer-iron-a11y-keys-behavior" $version
    Generate-Package "polymer-iron-a11y-keys" $version
    Generate-Package "polymer-iron-ajax" $version
    Generate-Package "polymer-iron-meta" $version
    
    Generate-Package "polymer-iron-component-page" $version
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
    Update-Polymer-Iron-Component-Page
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