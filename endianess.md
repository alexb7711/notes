# How to write endian-independent code in C

## When endianness affects code
* Endianess does not apply to everything
   * Bitwise and bitshift operations are fine on `ints` for example
       * the ordering of the bits are still the same as when they came in so the operations are performed correctly
   * `char` arrays can be accessed one byte at a time. However, this is not true with an `int` or `long`.
* Endiansess does matter when using a type cast that depends on a certain endian being in use. For example

```
unsigned char endian![pic](2) = {1, 0};
short x;
  
x = ∗(short ∗) endian;
```
    depending on the enianess, `x` can be represent different values.
    
## Test endianess at run time
the listing below tests the first byte of the multi-byte integer `i` to determine if it is 0 or 1. If it is 1, the running platform is assumed to be little-endian. If it is 0, it is assumed to be big-endian.

```
unsigned char endian![pic](2) = {1, 0};
short x;
  
x = ∗(short ∗) endian;unsigned char endian![pic](2) = {1, 0};
short x;
  
x = ∗(short ∗) endian;
```
Another way to determine endiannes is to use a character pointer to the bytes of an int and then check its first byte to see if it is 0 or 1. The listing below shows an example.

```
#define LITTLE_ENDIAN 0
#define BIG_ENDIAN    1

int endian() {
    int i = 1;
    char ∗p = (char ∗)&i;

    if (p![pic](0) == 1)
        return LITTLE_ENDIAN;
    else
        return BIG_ENDIAN;
}
```
## Network byte order
Network communication protocols must also have an endianess. This is commonly referred to as _network byte order_. To enable conversations, sockets provide a set of macros to convert to and from host to network byte order:

```htons()```
Reorder the bytes of a 16-bit unsigned value from processor order to network order. The macro name can be read as “host to network short.”

```htonl()```
Reorder the bytes of a 32-bit unsigned value from processor order to network order. The macro name can be read as “host to network long.”

```ntohs()```
Reorder the bytes of a 16-bit unsigned value from network order to processor order. The macro name can be read as “network to host short.”

```ntohl()```
Reorder the bytes of a 32-bit unsigned value from network order to processor order. The macro name can be read as “network to host long.”


## Reversing the byte order
The goal is to write code that doesn't fail, regardless of the endianness of the machine. *It would be nice to avoid having to specify coditional compliation flags and just let the code automatically determine the endianness of the machine.* The following method check and reverses endianess of a `short`:

* Method 1: Using bit shifting and ANDs
```
short reverseShort (short s) {
    unsigned char c1, c2;
    
    if (is_bigendian()) {
        return s;
    } else {
        c1 = s & 255;
        c2 = (s >> 8) & 255;
    
        return (c1 << 8) + c2;
    }
}
```
* Method 2: Using pointer to an array of characters
```
short reverseShort (char ∗c) {
    short s;
    char ∗p = (char ∗)&s;

    if (is_bigendian()) {
        p![pic](0) = c![pic](0);
        p![pic](1) = c![pic](1);
    } else {
        p![pic](0) = c![pic](1);
        p![pic](1) = c![pic](0);
    }

    return s;
}
```

Now lets see how an int would be handled:

* Method 1: Using bit shifting and bit ANDs
```
int reverseInt (int i) {
    unsigned char c1, c2, c3, c4;

    if (is_bigendian()) {
        return i;
    } else {
        c1 = i & 255;
        c2 = (i >> 8) & 255;
        c3 = (i >> 16) & 255;
        c4 = (i >> 24) & 255;

        return ((int)c1 << 24) + ((int)c2 << 16) + ((int)c3 << 8) + c4;
}
```
* Method 2: Using pointer to an array of characters
```
short reverseInt (char ∗c) {
    int i;
    char ∗p = (char ∗)&i;

    if (is_bigendian()) {
        p![pic](0) = c![pic](0);
        p![pic](1) = c![pic](1);
        p![pic](2) = c![pic](2);
        p![pic](3) = c![pic](3);
    } else {
        p![pic](0) = c![pic](3);
        p![pic](1) = c![pic](2);
        p![pic](2) = c![pic](1);
        p![pic](3) = c![pic](0);
    }
```
# References
* TODO: Fix this reference later
    * [|How to write endian-independent code in C](https://developer.ibm.com/articles/au-endianc/.md)
