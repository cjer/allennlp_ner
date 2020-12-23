export TMP=/home/nlp/danb/tmp
export TEMP=/home/nlp/danb/tmp
export TMPDIR=/home/nlp/danb/tmp
CUDA_DEVICE=$1
TRANSFORMER_NAME=$2

for RANDOM_SEED in 54360 44184 20423 80520 27916; do #63795 30528 78160 12345 95148; do
  
  mkdir output/predict_alephbert/${TRANSFORMER_NAME}/morph_${RANDOM_SEED}
  echo ${RANDOM_SEED}
  
  allennlp predict output/models_alephbert/${TRANSFORMER_NAME}/morph_${RANDOM_SEED}/model.tar.gz ../NER/data/for_ncrf/morph_gold_dev.bioul --output-file output/predict_alephbert/${TRANSFORMER_NAME}/morph_${RANDOM_SEED}/morph_gold_dev.json --use-dataset-reader --silent  --cuda-device ${CUDA_DEVICE}
  allennlp predict output/models_alephbert/${TRANSFORMER_NAME}/morph_${RANDOM_SEED}/model.tar.gz ../NER/data/for_ncrf/morph_gold_test.bioul --output-file output/predict_alephbert/${TRANSFORMER_NAME}/morph_${RANDOM_SEED}/morph_gold_test.json --use-dataset-reader --silent  --cuda-device ${CUDA_DEVICE}
  allennlp predict output/models_alephbert/${TRANSFORMER_NAME}/morph_${RANDOM_SEED}/model.tar.gz ../NER/data/for_ncrf/morph_yap_dev_dummy_o.bmes --output-file output/predict_alephbert/${TRANSFORMER_NAME}/morph_${RANDOM_SEED}/morph_yap_dev.json --use-dataset-reader --silent  --cuda-device ${CUDA_DEVICE}
  allennlp predict output/models_alephbert/${TRANSFORMER_NAME}/morph_${RANDOM_SEED}/model.tar.gz ../NER/data/for_ncrf/morph_yap_test_dummy_o.bmes --output-file output/predict_alephbert/${TRANSFORMER_NAME}/morph_${RANDOM_SEED}/morph_yap_test.json --use-dataset-reader --silent  --cuda-device ${CUDA_DEVICE}
done
