export TMP=/home/nlp/danb/tmp
export TEMP=/home/nlp/danb/tmp
export TMPDIR=/home/nlp/danb/tmp
CUDA_DEVICE=$1
TRANSFORMER_NAME=$2

for RANDOM_SEED in 54360 44184 20423 80520 27916; do #63795 30528 78160 12345 95148; do
  
  mkdir ud/output/predict_alephbert/${TRANSFORMER_NAME}/morph_${RANDOM_SEED}
  echo ${RANDOM_SEED}
  
  allennlp predict ud/output/models_alephbert/${TRANSFORMER_NAME}/morph_${RANDOM_SEED}/model.tar.gz ../NER/data/ud_ner/morph_gold_dev_dummy_o.bioul --output-file ud/output/predict_alephbert/${TRANSFORMER_NAME}/morph_${RANDOM_SEED}/morph_gold_dev.json --use-dataset-reader --silent  --cuda-device ${CUDA_DEVICE}
  allennlp predict ud/output/models_alephbert/${TRANSFORMER_NAME}/morph_${RANDOM_SEED}/model.tar.gz ../NER/data/ud_ner/morph_gold_test_dummy_o.bioul --output-file ud/output/predict_alephbert/${TRANSFORMER_NAME}/morph_${RANDOM_SEED}/morph_gold_test.json --use-dataset-reader --silent  --cuda-device ${CUDA_DEVICE}
done
