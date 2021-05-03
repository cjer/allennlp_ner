export TMP=/home/nlp/danb/tmp
export TEMP=/home/nlp/danb/tmp
export TMPDIR=/home/nlp/danb/tmp

for RANDOM_SEED in 54360 44184 20423 80520 27916 63795 30528 78160 12345 95148; do
  
  mkdir ud/output/predict/multi_${RANDOM_SEED}
  echo ${RANDOM_SEED}
  
  allennlp predict ud/output/models/multi_${RANDOM_SEED}/model.tar.gz ../NER/data/ud_ner/token_gold_dev_dummy_o.bioul --output-file ud/output/predict/multi_${RANDOM_SEED}/token_gold_dev_dummy_o.json --use-dataset-reader --silent  --cuda-device 2
  allennlp predict ud/output/models/multi_${RANDOM_SEED}/model.tar.gz ../NER/data/ud_ner/token_gold_test_dummy_o.bioul --output-file ud/output/predict/multi_${RANDOM_SEED}/token_gold_test_dummy_o.json --use-dataset-reader --silent  --cuda-device 2
done
