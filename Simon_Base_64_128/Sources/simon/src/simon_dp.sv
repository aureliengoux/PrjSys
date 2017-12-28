module simon_dp (
                    clk,
                    nrst,
                    plaintext,
                    rkey,
                    compute,
                    ciphertext
                  );

// Pour pouvoir utiliser les types de données prédéfini dans le paquetage
import simon_pkg::*;

input  clk;
input  nrst;
input  compute;
input  data_t plaintext;
output data_t ciphertext;
input  rkey_t rkey;


// Registre de données
data_t Dreg;
// Signal interne
data_t Dnext;

// La sortie correspond au registre de donnée
assign ciphertext =  Dreg;


// ... A completer ...


endmodule
