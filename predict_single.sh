export TMP=/home/nlp/danb/tmp
export TEMP=/home/nlp/danb/tmp
export TMPDIR=/home/nlp/danb/tmp

for RANDOM_SEED in 54360 44184 20423 80520 27916 63795 30528 78160 12345 95148; do
  
  mkdir output/predict/single_${RANDOM_SEED}
  echo ${RANDOM_SEED}
  
  allennlp predict output/models/single_${RANDOM_SEED}/model.tar.gz ../NER/data/for_ncrf/token_gold_dev_fix.bioul --output-file output/predict/single_${RANDOM_SEED}/token_gold_dev_fix.json --use-dataset-reader --silent  --cuda-device 3
  allennlp predict output/models/single_${RANDOM_SEED}/model.tar.gz ../NER/data/for_ncrf/token_gold_test_fix.bioul --output-file output/predict/single_${RANDOM_SEED}/token_gold_test_fix.json --use-dataset-reader --silent  --cuda-device 3
done
