local train_data = "/home/nlp/danb/NER/data/ud_ner/morph_gold_train.bioul";
local dev_data = "/home/nlp/danb/NER/data/ud_ner/morph_gold_dev.bioul";

local cuda_device = std.parseInt(std.extVar("CUDA_DEVICE"));
local transformer_model = std.extVar("TRANSFORMER_MODEL");
local transformer_hidden_dim = 768;
local epochs = 30;
local batch_size = 16;
local max_length = 512;

local random_seed = std.parseInt(std.extVar("RANDOM_SEED"));
local numpy_seed = std.parseInt(std.extVar("NUMPY_SEED"));
local pytorch_seed = std.parseInt(std.extVar("PYTORCH_SEED"));


{
  "random_seed": random_seed,
  "numpy_seed": numpy_seed,
  "pytorch_seed": pytorch_seed,
  
    "dataset_reader": {
        "type": "ner_reader",
        "coding_scheme": "BIOUL",
        "token_indexers": {
          "tokens": {
            "type": "pretrained_transformer_mismatched",
            "model_name": transformer_model,
            "max_length": max_length
          },
        },
    },
    "train_data_path": train_data,
    "validation_data_path": dev_data,
    "data_loader": {
        "batch_sampler": {
            "type": "bucket",
            "batch_size": batch_size
        }
    },
    "model": {
        "type": "crf_tagger",
        "encoder": {
            "type": "pass_through",
            "input_dim": transformer_hidden_dim,
        },
        "include_start_end_transitions": false,
        "label_encoding": "BIOUL",
        "text_field_embedder": {
          "token_embedders": {
            "tokens": {
                "type": "pretrained_transformer_mismatched",
                "model_name": transformer_model,
                "max_length": max_length
            }
          }
        },
        "verbose_metrics": false
    },
    "trainer": {
        "optimizer": {
          "type": "huggingface_adamw",
          "weight_decay": 0.01,
          "parameter_groups": [[["bias", "LayerNorm\\.weight", "layer_norm\\.weight"], {"weight_decay": 0}]],
          "lr": 1e-5,
          "eps": 1e-8,
          "correct_bias": true,
        },
        "learning_rate_scheduler": {
          "type": "linear_with_warmup",
          "warmup_steps": 100,
        },
        // "grad_norm": 1.0,
        "num_epochs": epochs,
        "validation_metric": "+f1-measure-overall",
        "patience": 10,
        "cuda_device": cuda_device
    }
}