Received: from mail-ej2-f30.google.com (mail-ej2-f30.google.com [74.125.228.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B48445ADD
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 21:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789939347; cv=none; b=tJZRQeGCZvqAlx0m2V0BHwgY5i2TQrCqQ2/JyWyVGxMaQAZDMcMcX8ljQalI6dykFbDTKlfsuPMSaTMPFUnS2l38nM4vsNPwxX2IuCEb8MP4PZtm6g0pQqVC0QE/4ZT7T5hZ5SgjkvT3anLukMc6/SigaOsWrqSYQsFISq74fsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789939347; c=relaxed/simple;
	bh=9r5IQgj6NLgv+3k+36IgWhzd2nOBT0RKKorj7JZ+C3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s2xsZX38QF1+IFRW9OWEeaQ+v1uGho9Z2uGwYao9DUpPjOOITvkWo8rKPsVduz90a8X2bNId87IEpeXL0pAbnzDz4C3aCjOKgAQo/r2o6aMw8W3ATKz2eCLON2Aaqjw8T2NyYuMbUR55inmdHCU+lyQ+MHiU4/nTu7ZEEYKoPuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iwLgM50N; arc=none smtp.client-ip=74.125.228.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iwLgM50N"
Received: by mail-ej2-f30.google.com with SMTP id a640c23a62f3a-c2a4fbc5586so110037366b.2
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789939342; x=1790544142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z3SMgxfhab4VA9DKQFqi+MK/1Tv47IexSislTxFzKx0=;
        b=iwLgM50N8ca41NVmc6ocfx75AeceG2YNPYXxf2+3QBx1EPyhhRXxNflSh+268rVSix
         kiWMMqRxoOMMWsUrlRO9oP2B5c1UScHxUlU7Od+PPTmXEsnTb3Mtmq+7vMa0EGpG9DA8
         gPB9UZQ9+HgnK+T4ucPMqOoPlrvqyHZW/aZlvrbm8+ViqC8ej14vaWY6obJoGsYKFn+R
         sAjgz5yu8cm8SDCqjvdOuxv4c5u/X/gI3sVpXyTQoBFgi/wf8pZLHpkWMRyGZh7r0YTJ
         YkyLH1pm7ObNa9MKlVzeL7VNmaap5gFQwR7MYB+KZ3KWbV8CZ0ibQJtaN4/k8lzbUs6q
         s4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789939342; x=1790544142;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3SMgxfhab4VA9DKQFqi+MK/1Tv47IexSislTxFzKx0=;
        b=eDxZG/MyJaEYUfz/VR8sGObkZZNDkxbE+/7YnIqMvlhd7L/rfnJujATsoAxRJ+sgdV
         uP6FrWX0gmmjTqqEjSzsYNAegeasAmdDwB2qEx6X2z+L7dxQ65fKnguSLyUTH1+x/3pn
         eq2g3A6P5U4uRNE4qUDN1nKvRot5wEcNUDksJAHDDtJtKUDh3zx8r9faXBHVqBv1XreQ
         6DOJnnegSyExlYOcpEBZJ4JnOEmlcoeha5fecZGAZ9C0LCjT2oyMmDW66fxJDP0ogQwq
         Mr9gE7db/Vn8KhRe1uO5T51/7kNvo8XtF65LeLXhjH0bmEnKj6SE3+TvESnv4sfPflsE
         IJbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFrjz2m2nEDJDzU9xEzW+nZz00rwpJaYsiCHtIMgxb3E7r/sVCmpCU4/W4CXB/E0vv1cin1VR8W9I=@vger.kernel.org
X-Gm-Message-State: AFuF++mWcmlgQPnGNg7jbnwKc/A48QpyQ86JsfZ76CA6u7rkXiI0c6bv
	pn8EbhGgqYGj8pwHeTiThcQLlsB7LKCaspGIuhew4uNyIg1pOXJQO5UzSbLBL1xCvis=
X-Gm-Gg: AYBFou0uieoyy8R4qANmqQMgz+UGIRyWOfZJvSpqD/wXXS9+r7F93QR7pM2wkMl6BDD
	scz4cL7gK4zAb9bABxbTw3zr5ZJQux4FB24uZ1pP+hLqB+3/Yx55FvUBf+vNXKMWwNR4Qe8e8lJ
	w73FUxQITUFasT+IeKEpuVsXzvgUvYiM07aBblsXS+WjT7GmthL4FUy5ijfymLZLNQckgVkCxnv
	lopcEJd8GqKTIYRoULzB/lm0QcdZeSxvuTrtTZkCjuEaaLdyb7qXakqK4PUL6poy9Yf5YBny4yR
	dzxrqbDpiZO2HPitnDOYq8c+lhJTzHZM6aQczGmVQdJbrkLi5eQfAUGYzBrKAnfT7dlZ7r0AR4l
	HanomSoo66EtKBCL7cDVAq6Cxu18d67lBrN1iCOjVHFthpo4DBPRmagXJumH/sUU3QIAsOM0uvW
	wQDDrdfQ9zpfYyjDZIGXFwVREB6QIRlXWR6jriJXySET9Zq0Q2svPzahUA6ezH7gOEiBJTUzO+y
	Sjo8Q4STC8=
X-Received: by 2002:a17:907:a310:b0:c29:c213:1ec9 with SMTP id a640c23a62f3a-c2a156a52b5mr729661766b.9.1789939342055;
        Sun, 20 Sep 2026 14:22:22 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.73.189])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a640f9ef5sm122971066b.25.2026.09.20.14.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 14:22:21 -0700 (PDT)
Message-ID: <018776b2-a73e-4c2a-8ce5-798367e65c94@linaro.org>
Date: Sun, 20 Sep 2026 22:22:19 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,pmic-types: require one of the
 VBUS sources
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
 <20260920-fix-tcpm-vbus-bis-v1-1-cc9347bbe81a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260920-fix-tcpm-vbus-bis-v1-1-cc9347bbe81a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/09/2026 15:37, Dmitry Baryshkov wrote:
> The commit fe2195b019f6 ("dt-bindings: usb: qcom,pmic-typec: deprecate
> device-specific VBUS") deprecated the old, device-specific VBUS supply
> property for the sake of using the generic vbus-supply of the connector.
> It also removed the old property from the list of required properties,
> so now schema stopped requiring any VBUS supply. Add separate claude
> demanding that either an old one or a generic property are provided.

This is a weird sentence.

> 
> Fixes: fe2195b019f6 ("dt-bindings: usb: qcom,pmic-typec: deprecate device-specific VBUS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index ba790c4488b7..db487562cec4 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -91,6 +91,14 @@ required:
>     - interrupts
>     - interrupt-names
>   
> +oneOf:
> +  - required:
> +      - vdd-vbus-supply
> +  - properties:
> +      connector:
> +        required:
> +          - vbus-supply
> +
>   allOf:
>     - if:
>         properties:
> 

Other than that this seems logical.

Once fixed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
