export function createExtendedClass(
    cls,
    name
) {
    name = firstupper(name || createRandomString(10));
    return eval(`(cls) => class ${name} extends cls {}`)(cls);
}

export function firstupper(s) {
    s = s[0].toUpperCase() + s.slice(1);
    return s;
}
export function createRandomString(len) {
    const chars = 'abcdefghijklmnopqrstuvwxyz';
    let r = '';
    for (let i = 0; i < len; i++) {
        r +=
            i === 0
                ? chars[Math.floor(Math.random() * chars.length)].toUpperCase()
                : chars[Math.floor(Math.random() * chars.length)][
                      Math.floor(Math.random()) ? 'toLowerCase' : 'toUpperCase'
                  ]();
    }
    return r;
}

class Test extends Object {}

console.log(
    createExtendedClass(
        Test,
        process.argv
            .slice(2)
            ?.join('')
            ?.replace(/\s/g, '')
            .replace(/-/g, '_') === 'RANDOM'
            ? createRandomString(10)
            : process.argv
                  .slice(2)
                  ?.join('')
                  ?.replace(/\s/g, '')
                  .replace(/-/g, '_')
    )
);
