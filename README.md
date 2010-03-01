Designer Decimal
====

I'm fairly certain I got this idea from a story on Reddit, but between writing this and moving it to github, the ephemera machine that is the internet has devoured the original source. If you happen to know the source, please let me know.

To create the designer decimal of a string, convert each character to [ASCII](http://en.wikipedia.org/wiki/ASCII) with enough leading zeros to take of three characters ('A' becomes '065', etc). Add a leading '1.' and a trailing ['004'](http://en.wikipedia.org/wiki/End-of-transmission_character). The result is a decimal encoding of your string, which the original article had the clever name for "Desinger Decimal."

This project does the boring encoding bit for you. Since I was bummed that the results are so long, it also finds a rational approximation which may be more suitable for sticking on business cards.

My first few attempts were incredible slow to converge on a rational approximations, and I had a lot of fun researching better methods.

Usage
-----

    $ perl designerdecimal.pl Lyndon B. Johnson
    For the name 'Lyndon B. Johnson':
      Your designer decimal is 1.076121110100111110032066046032074111104110115111110004
      Your rational approximation is 1162140322362708323736326654 / 1079934508723274540452148297
    Took 53 iterations

Thanks To
-----

["Algorithm to Convert a Decimal to a Fraction"](http://homepage.smc.edu/kennedy_john/DEC2FRAC.PDF) by John Kennedy, for describing a performant rational approximation algorithm.

License
-----

Designer Decimal is associated with CC0.

To the extent possible under law, the person who associated CC0 with this work has waived all copyright and related or neighboring rights to this work.

See http://creativecommons.org/publicdomain/zero/1.0/ for more details.
