const rules = new Intl.PluralRules("en", {type: "ordinal"})
const suffices = new Map<Intl.LDMLPluralRule, string>([
    ["one", "st"],
    ["two", "nd"],
    ["few", "rd"],
    ["other", "th"]
])

const ordinal = (x: number): string => {
    const suffix = suffices.get(rules.select(x)) || ""
    return (x + suffix)
}

export default ordinal;