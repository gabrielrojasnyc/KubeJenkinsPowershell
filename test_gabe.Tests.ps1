# To simulate failure pester check
Describe 'Service' {
    it 'is summit installed' {
        get-service -Name Summit | Should be $true
    }
}