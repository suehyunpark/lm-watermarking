RUN_NAME=llama_dipper

GENERATION_OUTPUT_DIR=output2/"$RUN_NAME"

echo "Running generation pipeline with output dir: $GENERATION_OUTPUT_DIR"

python generation_pipeline.py
--model_name="meta-llama/Llama-2-7b-hf"
--dataset_name=c4
--dataset_config_name=realnewslike
--max_new_tokens=200
--min_prompt_tokens=50
--min_generations=10
--input_truncation_strategy=completion_length
--input_filtering_strategy=prompt_and_completion_length
--output_filtering_strategy=max_new_tokens
--seeding_scheme=selfhash
--gamma=0.25
--delta=2.0
--run_name="$RUN_NAME"_gen
--wandb=True
--wandb_project=xyz
--verbose=False
--output_dir=$GENERATION_OUTPUT_DIR

python attack_pipeline.py
--attack_method=dipper
--run_name="$RUN_NAME"_dipper_attack
--wandb=True
--input_dir=$GENERATION_OUTPUT_DIR
--verbose=False

python evaluation_pipeline.py
--evaluation_metrics=all
--run_name="$RUN_NAME"_eval
--wandb=True
--input_dir=$GENERATION_OUTPUT_DIR
--output_dir="$GENERATION_OUTPUT_DIR"_eval
--roc_test_stat=all

RUN_NAME=llama_cp

GENERATION_OUTPUT_DIR=output2/"$RUN_NAME"

echo "Running generation pipeline with output dir: $GENERATION_OUTPUT_DIR"
python generation_pipeline.py
--model_name="meta-llama/Llama-2-7b-hf"
--dataset_name=c4
--dataset_config_name=realnewslike
--max_new_tokens=200
--min_prompt_tokens=50
--min_generations=10
--input_truncation_strategy=completion_length
--input_filtering_strategy=prompt_and_completion_length
--output_filtering_strategy=max_new_tokens
--seeding_scheme=selfhash
--gamma=0.25
--delta=2.0
--run_name="$RUN_NAME"_gen
--wandb=True
--wandb_project=xyz
--verbose=False
--output_dir=$GENERATION_OUTPUT_DIR

python attack_pipeline.py
--attack_method=copy-paste
--run_name="$RUN_NAME"_cp_attack
--wandb=True
--input_dir=$GENERATION_OUTPUT_DIR
--verbose=False

python evaluation_pipeline.py
--evaluation_metrics=all
--run_name="$RUN_NAME"_eval
--wandb=True
--input_dir=$GENERATION_OUTPUT_DIR
--output_dir="$GENERATION_OUTPUT_DIR"_eval
--roc_test_stat=all

RUN_NAME=llama_gpt

GENERATION_OUTPUT_DIR=output2/"$RUN_NAME"

echo "Running generation pipeline with output dir: $GENERATION_OUTPUT_DIR"
python generation_pipeline.py
--model_name="meta-llama/Llama-2-7b-hf"
--dataset_name=c4
--dataset_config_name=realnewslike
--max_new_tokens=200
--min_prompt_tokens=50
--min_generations=10
--input_truncation_strategy=completion_length
--input_filtering_strategy=prompt_and_completion_length
--output_filtering_strategy=max_new_tokens
--seeding_scheme=selfhash
--gamma=0.25
--delta=2.0
--run_name="$RUN_NAME"_gen
--wandb=True
--wandb_project=xyz
--verbose=False
--output_dir=$GENERATION_OUTPUT_DIR

python attack_pipeline.py
--attack_method=gpt
--run_name="$RUN_NAME"_gpt_attack
--wandb=True
--input_dir=$GENERATION_OUTPUT_DIR
--verbose=False

python evaluation_pipeline.py
--evaluation_metrics=all
--run_name="$RUN_NAME"_eval
--wandb=True
--input_dir=$GENERATION_OUTPUT_DIR
--output_dir="$GENERATION_OUTPUT_DIR"_eval
--roc_test_stat=all
--evaluation_metrics=detectgpt