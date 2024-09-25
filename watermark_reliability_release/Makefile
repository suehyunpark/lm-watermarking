GENERATION_OUTPUT_DIR=./output
LLAMA_PATH=meta-llama/Llama-2-7b-hf


lefthash_gen:
	python generation_pipeline.py \
    --model_name=$(LLAMA_PATH) \
    --dataset_name=allenai/c4 \
    --dataset_config_name=realnewslike \
    --max_new_tokens=200 \
    --min_prompt_tokens=50 \
    --min_generations=200 \
    --input_truncation_strategy=completion_length \
    --input_filtering_strategy=prompt_and_completion_length \
    --output_filtering_strategy=max_new_tokens \
    --seeding_scheme=lefthash \
	--use_sampling=True \
	--load_fp16=False \
    --gamma=0.25 \
    --delta=2.0 \
    --run_name=lefthash_gen \
    --wandb=True \
	--wandb_project watermarking \
	--wandb_entity suehyun \
	--wandb_tags=lefthash,multinomial,gen
    --verbose=True \
    --output_dir=$(GENERATION_OUTPUT_DIR)/lefthash

selfhash_gen:
	CUDA_VISIBLE_DEVICES=1 python generation_pipeline.py \
    --model_name=$(LLAMA_PATH) \
    --dataset_name=allenai/c4 \
    --dataset_config_name=realnewslike \
    --max_new_tokens=200 \
    --min_prompt_tokens=50 \
    --min_generations=200 \
    --input_truncation_strategy=completion_length \
    --input_filtering_strategy=prompt_and_completion_length \
    --output_filtering_strategy=max_new_tokens \
    --seeding_scheme=selfhash \
	--use_sampling=True \
	--load_fp16=False \
    --gamma=0.25 \
    --delta=2.0 \
    --run_name=selfhash_gen \
    --wandb=True \
	--wandb_project watermarking \
	--wandb_entity suehyun \
	--wandb_tags=selfhash,multinomial,gen \
    --verbose=True \
    --output_dir=$(GENERATION_OUTPUT_DIR)/selfhash \
	--overwrite=True

lefthash_gpt_attack:
	python attack_pipeline.py \
	--attack_method=gpt \
	--run_name=lefthash_gpt_attack \
	--wandb=True \
	--wandb_project watermarking \
	--wandb_entity suehyun \
	--wandb_tags=lefthash,multinomial,gen \
	--input_dir=$(GENERATION_OUTPUT_DIR)/lefthash \
	--verbose=True

selfhash_gpt_attack:
	python attack_pipeline.py \
	--attack_method=gpt \
	--run_name=selfhash_gpt_attack \
	--wandb=True \
	--wandb_project watermarking \
	--wandb_entity suehyun \
	--wandb_tags=selfhash,multinomial,gen \
	--input_dir=$(GENERATION_OUTPUT_DIR)/selfhash_gpt_attack \
	--verbose=True

lefthash_cp_attack:
	python attack_pipeline.py \
	--attack_method=copy-paste \
	--run_name=lefthash_cp_attack \
	--cp_attack_insertion_len=15 \
	--wandb=True \
	--wandb_project watermarking \
	--wandb_entity suehyun \
	--wandb_tags=lefthash,multinomial,gen \
	--input_dir=$(GENERATION_OUTPUT_DIR)/lefthash_cp_attack \
	--verbose=True

selfhash_cp_attack:
	python attack_pipeline.py \
	--attack_method=copy-paste \
	--cp_attack_insertion_len=15 \
	--run_name=selfhash_cp_attack \
	--wandb=True \
	--wandb_project watermarking \
	--wandb_entity suehyun \
	--wandb_tags=selfhash,multinomial,gen \
	--input_dir=$(GENERATION_OUTPUT_DIR)/selfhash_cp_attack \
	--verbose=True

lefthash_eval:
	python evaluation_pipeline.py \
	--evaluation_metrics=z-score,windowed-z-score,diversity,repetition \
	--run_name=lefthash_eval \
	--wandb=True \
	--wandb_project watermarking \
	--wandb_entity suehyun \
	--wandb_tags=lefthash,multinomial,gen \
	--input_dir=$(GENERATION_OUTPUT_DIR)/lefthash \
	--output_dir=$(GENERATION_OUTPUT_DIR)/lefthash_eval \
	--roc_test_stat=all \

selfhash_eval:
	python evaluation_pipeline.py \
	--evaluation_metrics="z-score,windowed-z-score,diversity,repetition" \
	--run_name=selfhash_eval \
	--wandb=True \
	--wandb_project watermarking \
	--wandb_entity suehyun \
	--wandb_tags=selfhash,multinomial,gen \
	--input_dir=$(GENERATION_OUTPUT_DIR)/selfhash \
	--output_dir=$(GENERATION_OUTPUT_DIR)/selfhash_eval \
	--roc_test_stat=all \
	--overwrite_output_file=True

selfhash_eval:
	python evaluation_pipeline.py \
	--evaluation_metrics="z-score,windowed-z-score,diversity,repetition" \
	--run_name=selfhash_eval \
	--wandb=True \
	--wandb_project watermarking \
	--wandb_entity suehyun \
	--wandb_tags=selfhash,multinomial,gen \
	--input_dir=$(GENERATION_OUTPUT_DIR)/selfhash \
	--output_dir=$(GENERATION_OUTPUT_DIR)/selfhash_eval \
	--roc_test_stat=all \
	--overwrite_output_file=True

lefthash_gpt_attack_eval:
	python evaluation_pipeline.py \
	--evaluation_metrics=z-score,windowed-z-score,diversity,repetition \
	--run_name=lefthash_gpt_attack_eval \
	--wandb=True \
	--wandb_project watermarking \
	--wandb_entity suehyun \
	--wandb_tags=lefthash,multinomial,gen \
	--input_dir=$(GENERATION_OUTPUT_DIR)/lefthash_gpt_attack \
	--output_dir=$(GENERATION_OUTPUT_DIR)/lefthash_gpt_attack_eval \
	--roc_test_stat=all \

selfhash_gpt_attack_eval:
	python evaluation_pipeline.py \
	--evaluation_metrics="z-score,windowed-z-score,diversity,repetition" \
	--run_name=selfhash_eval \
	--wandb=True \
	--wandb_project watermarking \
	--wandb_entity suehyun \
	--wandb_tags=selfhash,multinomial,gen \
	--input_dir=$(GENERATION_OUTPUT_DIR)/selfhash_gpt_attack \
	--output_dir=$(GENERATION_OUTPUT_DIR)/selfhash_gpt_attack_eval \
	--roc_test_stat=all \
	--overwrite_output_file=True

lefthash_cp_attack_eval:
	python evaluation_pipeline.py \
	--evaluation_metrics=z-score,windowed-z-score,diversity,repetition \
	--run_name=lefthash_cp_attack_eval \
	--wandb=True \
	--wandb_project watermarking \
	--wandb_entity suehyun \
	--wandb_tags=lefthash,multinomial,gen \
	--input_dir=$(GENERATION_OUTPUT_DIR)/lefthash_cp_attack \
	--output_dir=$(GENERATION_OUTPUT_DIR)/lefthash_cp_attack_eval \
	--roc_test_stat=all \

selfhash_cp_attack_eval:
	python evaluation_pipeline.py \
	--evaluation_metrics="z-score,windowed-z-score,diversity,repetition" \
	--run_name=selfhash_cp_attack_eval \
	--wandb=True \
	--wandb_project watermarking \
	--wandb_entity suehyun \
	--wandb_tags=selfhash,multinomial,gen \
	--input_dir=$(GENERATION_OUTPUT_DIR)/selfhash_cp_attack \
	--output_dir=$(GENERATION_OUTPUT_DIR)/selfhash_cp_attack_eval \
	--roc_test_stat=all