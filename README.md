# VHDL UniPD - Esercizi di Circuiti Digitali

Questo repository contiene una raccolta di esercizi e componenti hardware descritti in **VHDL**, realizzati per il corso di Circuiti Digitali all'Università degli Studi di Padova (UniPD).

## 📂 Struttura del Progetto

Il codice è organizzato nella directory `circuiti_digitali/`, suddiviso in sottocartelle per ogni singolo componente o esercizio. Attualmente include:

* `decoder_2_to_4/`
* `encoder_4_to_2/`
* `fulladder/`
* `isPrime_ex/`
* `mux_4_to_1/`

Ogni cartella è indipendente e contiene i file sorgente (`.vhd`), il testbench relativo (`tb_*.vhd`) e un proprio `Makefile` per automatizzare la simulazione.

## 🛠️ Requisiti e Strumenti

Per compilare, simulare e visualizzare le forme d'onda, è necessario avere installato il seguente stack (testato su ambiente Linux/WSL):

* **[GHDL](https://github.com/ghdl/ghdl):** Compilatore e simulatore VHDL (viene utilizzato lo standard VHDL-2008).
* **[GTKWave](https://gtkwave.sourceforge.net/):** Visualizzatore di forme d'onda per i file `.vcd`.
* **Make:** Per l'esecuzione dei `Makefile`.

## 🚀 Come eseguire le simulazioni

Entra nella cartella del circuito che desideri testare (es. `mux_4_to_1`):

```bash
cd circuiti_digitali/mux_4_to_1
