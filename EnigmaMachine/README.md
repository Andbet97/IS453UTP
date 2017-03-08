# Enigma Machine

## About the Enigma Machine

The Enigma Machine is a device famously used in WWII by German forces to encrpyt messages. It worked by
sending current through a series of "scrambled" rotors, and bouncing it from a reflection plate, in order
to produce an output that could be mirrored and, in turn, decrypted.  

## Project Scope:

This particular script is based on the [**M3 model**](http://wiki.franklinheath.co.uk/index.php/Enigma/Paper_Enigma).

This project have four versions:

  -EnigmaMachine_v1.pl.

  -EnigmaMachine_v2.pl.

  -EnigmaMachine_v3.pl.

  -EnigmaMachine_v4.pl.

In the following section I'm going to speak about how to use everyone of this versions.

## Usage:

**EnigmaMachine_v1**

The predicate that encrypt in the enigma machine is **encrypt**, which has three arguments.

`encrypt([Input], [a,b,c], Output).`

The first argument is the **input string**, in the form a list.

The second argument are the **message key** for encryption. They are in the order they are encountered,
which is Rotor I, Rotor II and then Rotor III.

The third argument is the **output**, which should always be a variable.

The predicate that decrypt in the enigma machine is **decrypt**, with the same arguments.

**EnigmaMachine_v2**

The predicate that encrypt in the enigma machine is **encrypt**, which has four arguments.

`encrypt([Input], [i, ii, iii, b], [a,b,c], Output).`

The first argument is the **input string**, in the form a list.

The second argument is the **rotors setting**, in this list will be written which rotors
(from 'i' to 'v') will be used and the order in which they are to be used
in addition to choosing between rotor B (b) and C (c) in the last position.

The third argument are the **message key** for encryption.

The fourth argument is the **output**, which should always be a variable.

The predicate that decrypt in the enigma machine is **decrypt**, with the same arguments.

**EnigmaMachine_v3**

The predicate that encrypt in the enigma machine is **encrypt**, which has four arguments.

`encrypt([Input], [i, ii, iii], [10, 14, 21], [i, ii, iii, b], [a,b,c], Output).`

The first argument is the **input string**, in the form a list.

The second argument is the **rings**, in this list will be written which rings
(from 'i' to 'v') will be used and the order in which they are to be used.

The third argument are the **rings settings**, in this list write the configuration of the rings.

The fourth argument is the **rotors setting**, in this list will be written which rotors
(from 'i' to 'v') will be used and the order in which they are to be used
in addition to choosing between rotor B (b) and C (c) in the last position.

The fifth argument are the **message key** for encryption.

The sixth argument is the **output**, which should always be a variable.

The predicate that decrypt in the enigma machine is **decrypt**, with the same arguments.

**EnigmaMachine_v4**

The predicate that encrypt in the enigma machine is **encrypt**, which has four arguments.

`encrypt([Input], [i, ii, iii], [10, 14, 21], [i, ii, iii, b], [a,b,c], [[pair], [pair]] Output).`

The first argument is the **input string**, in the form a list.

The second argument is the **rings**, in this list will be written which rings
(from 'i' to 'v') will be used and the order in which they are to be used.

The third argument are the **rings settings**, in this list write the configuration of the rings.

The fourth argument is the **rotors setting**, in this list will be written which rotors
(from 'i' to 'v') will be used and the order in which they are to be used
in addition to choosing between rotor B (b) and C (c) in the last position.

The fifth argument are the **message key** for encryption.

The sixth argument is the **pairs to The Plug Board**, in this list will have lists
with each pair of letters for The Plug Board.

The seventh argument is the **output**, which should always be a variable.

The predicate that decrypt in the enigma machine is **decrypt**, with the same arguments.

### Examples:

**EnigmaMachine_v1**

![alt text](https://github.com/andbet050197/IS453UTP/blob/master/EnigmaMachine/Files/prueba1.jpg "Example 1")

**EnigmaMachine_v2**

![alt text](https://github.com/andbet050197/IS453UTP/blob/master/EnigmaMachine/Files/prueba2.jpg "Example 2")

**EnigmaMachine_v3**

![alt text](https://github.com/andbet050197/IS453UTP/blob/master/EnigmaMachine/Files/prueba3.jpg "Example 3")

**EnigmaMachine_v4**

![alt text](https://github.com/andbet050197/IS453UTP/blob/master/EnigmaMachine/Files/prueba4.jpg "Example 4")

### Credit

Thanks to the page [wiki.franklinheath.co.uk](http://wiki.franklinheath.co.uk/index.php/Enigma/Paper_Enigma) for providing a clear guide on how to make the Enigma Machine.
