# bl_proportion: The ratio of blacklist to whitelist tokens when splitting the vocabulary (gamma) - best at 0.25, paper experiments with 0.5 as well
# bl_logit_bias: The amount of bias (absolute) to add to the logits in the whitelist half of the vocabulary at every step - best at 2.0, need to experiment with 0.5, 1.0, 2.0, 5.0, 10.0 to reproduce figure 3 (b), (c)
# num_beams: The number of beams to use where '1' is no beam search. - 8 for figure 3 (c) and figure 4 (b) => beam search
# use_sampling: Whether to perform sampling during generation. (non-greedy decoding) True => multinomial sampling
# sampling_temp: The temperature to use when generating using multinom sampling - 0.7 for figure 3 (c) and figure 4 (b)

# multinomial sampling
run_best:
	python run_watermarking.py \
    --model_name facebook/opt-1.3b \
    --dataset_name c4 \
    --dataset_config_name realnewslike \
    --max_new_tokens 200 \
    --min_prompt_tokens 50 \
    --limit_indices 500 \
    --input_truncation_strategy completion_length \
    --input_filtering_strategy prompt_and_completion_length \
    --output_filtering_strategy max_new_tokens \
    --dynamic_seed markov_1 \
    --bl_proportion 0.25 \
    --bl_logit_bias 2.0 \
    --bl_type soft \
    --store_spike_ents True \
    --num_beams 1 \
    --use_sampling True \
    --sampling_temp 0.7 \
    --oracle_model_name facebook/opt-2.7b \
	--wandb_project watermarking \
	--wandb_entity suehyun \
	--run_name multinomial_best \
    --run_name example_run \
    --output_dir ./runs/multinomial_best
	
run_best_llama:
	CUDA_VISIBLE_DEVICES=0 python run_watermarking.py \
    --model_name meta-llama/Llama-2-7b-hf \
    --dataset_name c4 \
    --dataset_config_name realnewslike \
    --max_new_tokens 200 \
    --min_prompt_tokens 50 \
    --limit_indices 500 \
    --input_truncation_strategy completion_length \
    --input_filtering_strategy prompt_and_completion_length \
    --output_filtering_strategy max_new_tokens \
    --dynamic_seed markov_1 \
    --bl_proportion 0.25 \
    --bl_logit_bias 2.0 \
    --bl_type soft \
    --store_spike_ents True \
    --num_beams 1 \
    --use_sampling True \
    --sampling_temp 0.7 \
    --load_prev_generations=True \
    --oracle_model_name meta-llama/Meta-Llama-3-8B \
	--wandb_project watermarking \
	--wandb_entity suehyun \
	--run_name multinomial_llama_best \
    --run_name example_run \
    --output_dir ./runs/multinomial_llama_best
