# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.4.1-base

# install custom nodes into comfyui
RUN comfy-node-install comfyui_essentials

# download models and put them into the correct folders in comfyui (one RUN per model)
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors --relative-path text_encoders --filename umt5-xxl-enc-fp8_e4m3fn.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/diffusion_models/wan2.1_t2v_14B_bf16.safetensors --relative-path diffusion_models/Wan2.1 --filename Wan2_1_VAE_bf16.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors --relative-path clip_vision --filename clip_vision_h.safetensors
# RUN # Could not find URL for lightx2v_I2V_14B_480p_cfg_step_distill_rank256_bf16.safetensors
# RUN # Could not find URL for Wan2_1-InfiniTetalk-Single_fp16.safetensors
# RUN # Could not find URL for wan2.1_i2v_480p_14B_fp16.safetensors

# copy all input data (like images or videos) into comfyui
# COPY input/ /comfyui/input/