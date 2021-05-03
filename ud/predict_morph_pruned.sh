export TMP=/home/nlp/danb/tmp
export TEMP=/home/nlp/danb/tmp
export TMPDIR=/home/nlp/danb/tmp

for RANDOM_SEED in 54360 44184 20423 80520 27916 63795 30528 78160 12345 95148; do
  
  echo ${RANDOM_SEED}

  allennlp predict ud/output/models/morph_${RANDOM_SEED}/model.tar.gz ud/output/predict/multi_${RANDOM_SEED}/morph_pruned_test.bioul --output-file ud/output/predict/morph_${RANDOM_SEED}/morph_pruned_test.json --use-dataset-reader --silent  --cuda-device 1
done
