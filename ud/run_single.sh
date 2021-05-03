for RANDOM_SEED in 54360 44184 20423 80520 27916 63795 30528 78160 12345 95148; do
  NUMPY_SEED=`echo $RANDOM_SEED | cut -c1-4`
  PYTORCH_SEED=`echo $RANDOM_SEED | cut -c1-3`
  
  export RANDOM_SEED=${RANDOM_SEED}
  export NUMPY_SEED=${NUMPY_SEED}
  export PYTORCH_SEED=${PYTORCH_SEED}
  
  allennlp train mbert_crf_single.jsonnet -s ud/output/models/single_${RANDOM_SEED}
done
