Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15020451984
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432905; cv=none; b=PwA1zTHvMfkWFSDOWeOk2Zl8oQL888/Z4ZEGLk+meVUeyDUQedMEO/uTty94qMpklLSZnOWL6ZryjBomyOZ0tatlT5Y6v3I7bn8RrctTjTWyqysYdXuaEiuqvf7qu96B5UrfgWnCg3NV1oEHBMtT9bhah+9BsBSrUASyrWspICU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432905; c=relaxed/simple;
	bh=7vUh66oXceOvBZh+BHUwEREpPut071+FDoigXD4wyck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUkLi+nE15U/7/pqqEFoimtMGH6QhjcBcxGhXX2f4lVmmH9+4wHKBE6YERalHmFwA0V/UcYT/+6CoJPMHnhyYzHRVaKpiH9U1ArHwZrwuk6bWEQU4pP5tBAXu87irSGgFJgLiPDBMh9zLixcRsbS28469myRM7nEkROjCux/nhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EKyalSxv; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EKyalSxv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so9378865e9.0
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790432902; x=1791037702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRyn178SjOYN2ExubyMZSe0BAzVjg4ClqLKh84+ypJ8=;
        b=EKyalSxvq0hBxCCIXaymCWFifaWylDdddOEbRxrZiziaYkZky1xJTW9IL3rbKuo/QB
         /S2h5nDhk4I9Y0Xf4OwFv3P8bAHzQVaPOyuTqSNe5iM+tBdzn4hK43R2ckKqC40FOY9U
         VMs59fbopJ9IuxAOv4dTpXeQSKdsWc7AgHKc3wa1ZTwIneNplp5bOBeZmL+keLfLK3+P
         yWFMbpWx+Zi/CyxScfdOPeHMyJEWF8CpEJQt9J51hjZn2Fk1EF7tk0IRCH+PKci47yzB
         ve2LhHsK1tNbA4Q48iHI/1+gJ2c/Xqby2UeoSctSgEd8J3MvSvtYq6sQC3E8qm6W9nFk
         kqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790432902; x=1791037702;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRyn178SjOYN2ExubyMZSe0BAzVjg4ClqLKh84+ypJ8=;
        b=Lyifj8BUBCbwlPn+0swwyexyHHKghnufPmPiAuexObfGBIdjr0X3TrR6mHXnl/DJwK
         rLuuSO/Kkw7Uw0ARb5sMZrMRc7LCCIyuA8dkPm6XrwyacDUuFG084MJenkMy5kvyvneA
         AH+f29r/Me/XdUFDMD99d+LN6cHeNVRgbevcQtzUDEGpZryy8OGwL9TShOXgkAJOccSb
         ubiPWW5lXUb+xHzTjcSCiWk+Is17zsp7F/G7RgozJAHmA/iDiDxyNEO91dE/D1q15it4
         W1k7dxpMGVYBsS2SAPCRj6r2RJju8k2xTN0LvC/9Bq3UhLyd/dJ5m9AT72Ha2eoLVSaP
         xk5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwj35+P2pjrq3B4TSs/uniQMJNOFOzm1CuYt0kl9vRrwjw2x1oWjXYiggi/j5uMeL+Pfl8sK2nTC14=@vger.kernel.org
X-Gm-Message-State: AFuF++k59a/7HmBjpEUJF30RjhlIysrfVrWbmqf2rtpwdOEydanktFZE
	hGvInDXytxFm1onDc9jKFqmKm/E7EjwByVlUBaTyS2AieCuKwrfyf5kWtVh9/FQEGEo=
X-Gm-Gg: AYBFou2x+H6eKKBxA2RAEMXlNQzUfAmoInKe4AGiT/LZ4iFns56imeuxEsxYYqCorn4
	SsjXDxvrc3RuCLyjxLOANXGhhIYRsmKj2w6bfc0GFpuZVB1uON/gSv2xzX5YPQAUepr0Y+b3aQL
	2SH1hT1ShYwhP4woAtj3BOJFfHFW/vWlGiwx9ycHYKIVC/hPXB5wXm4aUygeuyYbOHlLa65r2IV
	/eDRQnzaf6jp215is/MI588v6AxpQ57i8UodHat2pPGZ605163DjzIid3kwvQjlr/yOfP6EqzkT
	6nAenbTRtlb9GN9NCaZVvi4kxNvDbYkOV4Dr1Ll7RWZX7HXZ1XNDLA7mwUP674QjSZK1YyOhdw8
	wiHl/ASsQZL0rZ8JICbrSnZ/O/CidkccDHKRR9J48OfTO8+ZKcSOdp/5uemIT2G1ZOr8g8QowFz
	VAcXswcDkgYqvJbZZnfzUxO+NoQYMlaZYmZATjf7JDg1YMR7rZzqTNIdel4gT0JUFI+FUfXKSKW
	QAW9j850ZhXEu+7NvXcHw==
X-Received: by 2002:a05:600c:4f12:b0:49f:ce78:356b with SMTP id 5b1f17b1804b1-49fe6700d0cmr169059275e9.28.1790432902328;
        Sat, 26 Sep 2026 07:28:22 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4271sm320463865e9.5.2026.09.26.07.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 07:28:21 -0700 (PDT)
Message-ID: <d2a29116-967b-4ca1-a6de-510d68afec0b@linaro.org>
Date: Sat, 26 Sep 2026 15:28:20 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/12] arm64: dts: qcom: pmi8998: Add USB Type-C port
 controller node
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-8-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-8-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add the pmi8998 Type-C port controller and PD PHY device node.
> 
> The Type-C CC logic is at USBIN base 0x1300 and the PD PHY is at 0x1700.
> The node uses the 'type-c-change' interrupt from the USBIN peripheral
> for CC state notifications, plus the 8 PD PHY interrupts, including
> fr-swap.
> 
> The node is disabled by default; individual boards enable it and provide
> the USB-C connector description with PD capabilities and port graph.
> 
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/qcom/pmi8998.dtsi | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> index cd3f0790fd420..878e577c667d0 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> @@ -24,16 +24,43 @@ pmi8998_charger: charger@1000 {
>   
>   			io-channels = <&pmi8998_rradc 3>,
>   				      <&pmi8998_rradc 4>;
>   			io-channel-names = "usbin_i", "usbin_v";
>   
>   			status = "disabled";
>   		};
>   
> +		pmi8998_typec: typec@1300 {
> +			compatible = "qcom,pmi8998-typec";
> +			reg = <0x1300>,
> +			      <0x1700>;
> +
> +			interrupts = <0x2 0x13 0x7 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x2 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x3 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x4 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x5 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x6 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x17 0x7 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "type-c-change",
> +					  "sig-tx",
> +					  "sig-rx",
> +					  "msg-tx",
> +					  "msg-rx",
> +					  "msg-tx-failed",
> +					  "msg-tx-discarded",
> +					  "msg-rx-discarded",
> +					  "fr-swap";
> +
> +			status = "disabled";
> +		};
> +
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

