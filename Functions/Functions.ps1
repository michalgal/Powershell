function Right-Trim ([string]$string, [int]$trimChars)
{
    <#
    .SYNOPSIS
    function trims n number of chars from the right side of the string. Provide string to be trimmed and number of chars to be trimmed from the righ
    #>

    $trimmed = $string.substring(0,$string.length - $trimChars)
    return $trimmed
}

function Left-Trim ([string]$string, [int]$trimChars)
{
    <#
    .SYNOPSIS
    function trims n number of chars from the left side of the string. Provide string to be trimmed and number of chars to be trimmed from the left
    #>
    $trimmed = $string.substring(0,$trimChars)
    return $trimmed
}
