### 1.0.5 (7/10/2019)

* Idiomatic refine. Changing `allow_empty?` question like, to `allow_empty` inference.
* Fix YAML pattern keys as string, instead of symbol;

### 1.0.4 (06/10/2019)

* Fix date requires crashes;
* Included `allow_empty?` property into `formats` node, that allow estratto to send `nil` value when data to be coerced does not be the same expected by coercer;

### 1.0.3 (05/09/2019)

* Implement coercer error improvement, that expose data, and line number that raises error
