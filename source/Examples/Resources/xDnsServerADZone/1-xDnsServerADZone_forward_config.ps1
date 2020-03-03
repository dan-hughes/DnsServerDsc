<#PSScriptInfo

.VERSION 1.0.1

.GUID 4345433b-17e1-4c0f-a59e-8a1f03947dea

.AUTHOR DSC Community

.COMPANYNAME DSC Community

.COPYRIGHT DSC Community contributors. All rights reserved.

.TAGS DSCConfiguration

.LICENSEURI https://github.com/dsccommunity/xDnsServer/blob/master/LICENSE

.PROJECTURI https://github.com/dsccommunity/xDnsServer

.ICONURI https://dsccommunity.org/images/DSC_Logo_300p.png

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES
Updated author, copyright notice, and URLs.

.PRIVATEDATA 2016-Datacenter,2016-Datacenter-Server-Core

#> 

#Requires -Module xDnsServer


<#
    .DESCRIPTION
        This configuration will manage an AD integrated DNS forward lookup zone
#>

Configuration xDnsServerADZone_forward_config
{
    param
    (
        [System.Management.Automation.PSCredential]
        $Credential
    )

    Import-DscResource -ModuleName 'xDnsServer'

    Node localhost
    {

        xDnsServerADZone 'AddForwardADZone'
        {
            Name             = 'MyDomainName.com'
            DynamicUpdate    = 'Secure'
            ReplicationScope = 'Forest'
            ComputerName     = 'MyDnsServer.MyDomain.com'
            Credential       = $Credential
            Ensure           = 'Present'
        }
    }
}
