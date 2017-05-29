#!/bin/bash

NPROC=1
export OMP_NUM_THREADS=1

NRNIV="../x86_64/special -mpi"
HOC_DIR="hoc"
HOC_NAME="bench_main.hoc"
MPIEXEC="mpiexec -np ${NPROC}"

NRNOPT=\
" -c MODEL=2"\
" -c NSTIM_POS=1"\
" -c NSTIM_NUM=1"\
" -c NCELLS=32"\
" -c NSYNAPSE=1"\
" -c SYNAPSE_RANGE=1"\
" -c NETWORK=0"\
" -c STOPTIME=100"\
" -c NTHREAD=1"\
" -c MULTISPLIT=0"\
" -c SPIKE_COMPRESS=0"\
" -c CACHE_EFFICIENT=1"\
" -c SHOW_SPIKE=1"

OUTPUT_FILE="../log/r$(date +%Y%m%d%H%M%S).log"
EXEC="${MPIEXEC} ${NRNIV} ${NRNOPT} ${HOC_NAME}"

echo $EXEC > ${OUTPUT_FILE}

cd ${HOC_DIR}
time $EXEC | tee -a ${OUTPUT_FILE} 2>&1

#gprof ${NRNIV} ./gmon.out >> ${OUTPUT_FILE}

echo "OUTPUT_FILE = ${OUTPUT_FILE}"

sync

