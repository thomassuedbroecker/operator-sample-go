#!/bin/bash

# **************** Global variables

export CHECK_IBMCLOUDCLI="ibmcloud"
export CHECK_JQ="jq-"
export CHECK_SED="12.3.1"
export CHECK_AWK="awk version 20200816"
export CHECK_CURL="curl"
export CHECK_BUILDAH="buildah"
export CHECK_KUBECTL="Client"
export CHECK_PLUGIN_CLOUDDATABASES="cloud-databases"
export CHECK_PLUGIN_CODEENGINE="code-engine"
export CHECK_PLUGIN_CONTAINERREGISTERY="container-registry"
export CHECK_GREP="grep"
export CHECK_LIBPQ="psql"
export CHECK_PODMAN="Podman Engine"
export CHECK_OPERATORSDK="operator-sdk"
export CHECK_GO="go"


# **********************************************************************************
# Functions definition
# **********************************************************************************

verifyPodman() {  
    VERICATION=$(podman version)

    if [[ $VERICATION =~ $CHECK_PODMAN ]]; then
    echo "- podman is installed: $VERICATION !"
    else 
    echo "*** podman is NOT installed or running!"
    echo "*** The scripts ends here!"
    exit 1
    fi
}

verifyLibpq() {  
    VERICATION=$(psql --version)
    echo $VERICATION

    if [[ $VERICATION =~ $CHECK_LIBPQ ]]; then
    echo "- libpq (psql) is installed: $VERICATION !"
    else 
    echo "*** libpq (psql) is NOT installed !"
    echo "*** The scripts ends here!"
    exit 1
    fi
}

verifyGrep() {  
    VERICATION=$(grep --version)
    echo $VERICATION

    if [[ $VERICATION =~ $CHECK_GREP  ]]; then
    echo "- Grep is installed: $VERICATION !"
    else 
    echo "*** Grep is NOT installed !"
    echo "*** The scripts ends here!"
    exit 1
    fi
}

verifyCURL() {  
    VERICATION=$(curl --version)
    echo $VERICATION

    if [[ $VERICATION =~ $CHECK_CURL  ]]; then
    echo "- cURL is installed: $VERICATION !"
    else 
    echo "*** cURL is NOT installed !"
    echo "*** The scripts ends here!"
    exit 1
    fi
}

verifyAWK() {  
    VERICATION=$(awk --version)
    echo $VERICATION

    if [[ $VERICATION =~ $CHECK_AWK  ]]; then
    echo "- AWK is installed: $VERICATION !"
    else 
    echo "*** AWK is NOT installed !"
    echo "*** The scripts ends here!"
    exit 1
    fi
}

verifySed() {  
    VERICATION="$(sw_vers -productVersion)"

    if [[ $VERICATION =~ $CHECK_SED  ]]; then
    echo "- Sed is installed: $VERICATION !"
    else 
    echo "*** Sed is NOT installed !"
    echo "*** The scripts ends here!"
    exit 1
    fi
}

verifyIBMCloudCLI() {  
    VERICATION=$(ibmcloud --version)
    echo $VERICATION

    if [[ $VERICATION =~ $CHECK_IBMCLOUDCLI  ]]; then
    echo "- IBM Cloud CLI is installed: $VERICATION !"
    else 
    echo "*** IBM Cloud CLI is NOT installed !"
    echo "*** The scripts ends here!"
    exit 1
    fi
}

verifyJQ() {
    VERICATION=$(jq --version)
    echo $VERICATION

    if [[ $VERICATION =~ $CHECK_JQ  ]]; then
    echo "- JQ is installed: $VERICATION !"
    else 
    echo "*** JQ is NOT installed !"
    echo "*** The scripts ends here!"
    exit 1
    fi
}

verifyIBMCloudPluginCloudDatabases() {
    VERICATION=$(ibmcloud plugin show cloud-databases | grep 'Plugin Name' |  awk '{print $3}' )
    echo $VERICATION

    if [[ $VERICATION =~ $CHECK_PLUGIN_CLOUDDATABASES  ]]; then
    echo "- IBM Cloud Plugin 'cloud-databases' is installed: $VERICATION !"
    else 
    echo "IBM Cloud Plugin 'cloud-databases' is NOT installed !"
    echo "*** The scripts ends here!"
    exit 1
    fi
}

verifyIBMCloudPluginCodeEngine() {
    VERICATION=$(ibmcloud plugin show code-engine | grep 'Plugin Name' |  awk '{print $3}' )
    echo $VERICATION

    if [[ $VERICATION =~ $CHECK_PLUGIN_CODEENGINE  ]]; then
    echo "- IBM Cloud Plugin 'code-engine' is installed: $VERICATION !"
    else 
    echo "IBM Cloud Plugin 'code-engine' is NOT installed !"
    echo "*** The scripts ends here!"
    exit 1
    fi
}

verifyIBMCloudPluginContainerRegistry() {
    VERICATION=$(ibmcloud plugin show container-registry | grep 'Plugin Name' |  awk '{print $3}' )
    echo $VERICATION

    if [[ $VERICATION =~ $CHECK_PLUGIN_CONTAINERREGISTERY  ]]; then
    echo "- IBM Cloud Plugin 'container-registry' is installed: $VERICATION !"
    else 
    echo "IBM Cloud Plugin 'container-registry' is NOT installed !"
    echo "*** The scripts ends here!"
    exit 1
    fi
}

verifyBuildah() {  
    VERICATION=$(buildah --version)
    echo $VERICATION

    if [[ $VERICATION =~ $CHECK_BUILDAH ]]; then
    echo "- buildah is installed: $VERICATION !"
    else 
    echo "*** buildah is NOT installed !"
    echo "*** The scripts ends here!"
    exit 1
    fi
}

verifyKubectl() {  
    VERICATION=$(kubectl version)
    echo $VERICATION

    if [[ $VERICATION =~ $CHECK_KUBECTL ]]; then
    echo "- kubectl is installed: $VERICATION !"
    else 
    echo "*** kubectl is NOT installed !"
    echo "*** The scripts ends here!"
    exit 1
    fi
}

verifyOperatorSDK() {  
    VERICATION=$(operator-sdk version)
    echo $VERICATION

    if [[ $VERICATION =~ $CHECK_OPERATORSDK ]]; then
    echo "- operator-sdk is installed: $VERICATION !"
    else 
    echo "*** operator-sdk is NOT installed !"
    echo "*** The scripts ends here!"
    exit 1
    fi
}

verifyGo() {  
    VERICATION=$(go version)
    echo $VERICATION

    if [[ $VERICATION =~ $CHECK_GO ]]; then
    echo "- go is installed: $VERICATION !"
    else 
    echo "*** go is NOT installed !"
    echo "*** The scripts ends here!"
    exit 1
    fi
}

# **********************************************************************************
# Execution
# **********************************************************************************

echo "Check prereqisites"
echo "1. Verify grep"
verifyGrep
echo "2. Verify awk"
verifyAWK
echo "3. Verify cURL"
verifyCURL
echo "4. Verify Sed"
verifySed
echo "5. Verify libpq (psql)"
verifyLibpq
echo "6. Verify Podman"
verifyPodman
echo "7. Verify ibmcloud cli"
verifyIBMCloudCLI
echo "8. Verify kubectl"
verifyKubectl
echo "9. Verify operator-sdk"
verifyOperatorSDK
echo "10. Verify go"
verifyGo

echo "**********************************************"
echo "Success! All prerequisites tool are installed!"
echo "Please ensure you use the right versions!"
echo "**********************************************"