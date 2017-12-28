module simon_ctrl  (
                       clk,
                       nrst,
                       start,
                       eoc,
                       compute
                      );

// Pour pouvoir utiliser la constante N_ROUNDS correspondant aux nombre de
// tours de chiffrement
import simon_pkg::N_ROUNDS;

input        clk;
input        nrst;
input        start;
output logic eoc;
output logic compute;

// ... A completer ...

endmodule
