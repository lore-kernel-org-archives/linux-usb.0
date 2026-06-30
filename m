Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FED53F6C2D
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 12:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822374; cv=none; b=Ny+ZmrkTTpmqcWxmnp0sjRn01kyn952Zi3eHcuqUKAyl/WTZb3dKL5JpyvxeJpq9a5kBH3lC9JiZFdAMxXaOH8NWxrTQ6BlQ86Pnv5mvItQ2iW0GeV610e5wvdXbR0EDLlu7mtoz8UwLWt7slcpbyp2NkJ+443VxU7kiF2lPNRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822374; c=relaxed/simple;
	bh=iNZdEwsKAsDKmuUkLTwjjBV6QowQJ1zKUsUe+DlegcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AwHxBH7887lfWL5XY0HB92JxGjlfG/2+RM6IEqYDF+lflTQpwIfZE79UAX2K2bAA7B80GMRfzqPpL+Bcy7R9e5DgHrWMeWg0ySsaFoq1GtlD5soCfwS7DNf3XaZquB6wpTZLlstw0FpzB3gcegfEbB3mMWzYQps2920qrQeJobc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hwMp78is; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hwMp78is"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6974a6e54dbso8198043a12.2
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 05:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782822371; x=1783427171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BA2X/zcRsTk5hQYuVduQ2jmFWHnaeTrwS0kSMxtBRhY=;
        b=hwMp78ishpNWIJm342X6Zc/jOIq3cOvUliathnzfnXYRzyLW+VPTHwZBf/+6MS/2w5
         bKFkPoZUXBPfQaz1dxTvAsTzfW51xntvHVxhh0OB5R6O02RkVJDXjdN0DPtBMr+982/x
         LMAd38ZCAhOpqDZqP7kvl70pkVp4H5bMz1e0UL9sE9+vC2iwee8Q1ISzLXpW7WcUyUkA
         id/bA0lmVUEqN12uY/0sPonO+UG+WGEZZQSBXKatmXNJAqUwhTPkm9l+FlCChAvgWdtT
         ulGOb5RFTA36m4Ea4dPbvR9GX2yeRtXWY0aR9ZindtvAT6mOWUrYbhyb3xGErylAh2SU
         ZuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822371; x=1783427171;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BA2X/zcRsTk5hQYuVduQ2jmFWHnaeTrwS0kSMxtBRhY=;
        b=VKGxsQiub9YtRuFJk0OIiwLqccTFXDrrSejVN3cCojl9QENWT+Q52OKs4hoALnN5Yo
         dDGk0mtddvs0iLF/rgvQtSHDT6MYR61jqXo/MAsVB0VoOTd+O+RcrlevkDb3qOCIt4UE
         uFoed6/aMjD95CQSYicHpoiqrs7wfI9ssKCpQN74C4n0e3JMXKyDlGTJ4UL9qD4f0XkY
         NWa5mvKQPOMDsVupXyjAO9VOgjhHkp6lsLaqgQiaTp4qLjLoflESAlOR0H4J3NcFl9j7
         1hsk2Jygru4a0YpKds2qx3DtGGYJH13xeXWQqZAycwKXesx/tgilAmxV3WsoQX1dhozf
         1HdQ==
X-Forwarded-Encrypted: i=1; AHgh+RpoU7mdAt1O0kBaONnSQ/87fVW3BrXSyorJnXA5jX5SqzQhrGwrBvmc5WgJHaw8RlVGXqCUHC1xxwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfLn13yElh/J0S3l5n0iwc1jKTDbET0bQZH8RYribWziq0Ri6i
	phIiCYRGxXeg5jIl0Sz1pO2r7qvdWxKp4PGSjOS3q6K5vCRGevvoeNg8degqSqDo7g0=
X-Gm-Gg: AfdE7ckKaf+lmKEWSqJtG0QWx0df42rVrzYtXtrtINxqfbGaSNoq0V9C/kgadtD6zTp
	YYrQVKDgLwsAJkW+HQCcu4EwCvk/UoJcaJDtACwhgVFIMs27iTjouMSSomFmG6KLHU1YeBcJE0E
	nWk/vje1fSvLEWl5ptVAJdTjAdSjHKF8wtK7GgJidmdr9dRhsOdtJjR2xxhhRO4ecN98FMQZafi
	k1dyot76cMms/IS104L2XDO5BQKrTmbEmO+2nb2/4k/FrULjQhI9lfRS8lvAYIeymeFz22ZByO7
	kU87amhf1oeprhhtjQ+Ry4zCeZ6AL/4cC0D+uy5vdR95+50lNF3kgB1dHRrwQ/uRFG9Ps10XCLU
	Dh1vYLx6w1F1wR6edTIdYtZTAAK2dakiexh78jhtVjVeNf4RWBWnxglKabhoPHHtKE1aZnLMuNI
	nOWOqvyx7hssiWViTSECfjPkkLuw==
X-Received: by 2002:a17:906:308c:b0:c12:86a3:d18c with SMTP id a640c23a62f3a-c12874224c2mr101140266b.59.1782822370707;
        Tue, 30 Jun 2026 05:26:10 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.103.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0d68asm115825166b.31.2026.06.30.05.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:26:08 -0700 (PDT)
Message-ID: <124ee5ab-f065-42b0-b8f1-3a61fd3dec59@linaro.org>
Date: Tue, 30 Jun 2026 13:26:07 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: avoid uninit values in
 dev_dbg() error paths
To: Vasiliy Kovalev <kovalev@altlinux.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20260630120114.185169-1-kovalev@altlinux.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260630120114.185169-1-kovalev@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/06/2026 13:01, Vasiliy Kovalev wrote:
> Several functions take a 'goto done' shortcut on regmap_read() (or
> switch default) failure before assigning locals that the trailing
> dev_dbg() then formats.
> 
> Initialize the affected locals at declaration.
> 
> Found by Linux Verification Center (linuxtesting.org) with Svace static
> analysis tool.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index bf985efe1cd6..c8379cdcb6da 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -366,7 +366,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
>   	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
>   	struct device *dev = pmic_typec_port->dev;
>   	unsigned int misc, val;
> -	bool attached;
> +	bool attached = false;
>   	int ret = 0;
>   
>   	ret = regmap_read(pmic_typec_port->regmap,
> @@ -461,8 +461,8 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
>   	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
>   	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
>   	struct device *dev = pmic_typec_port->dev;
> -	unsigned int mode, currsrc;
> -	unsigned int misc;
> +	unsigned int mode = 0, currsrc = 0;
> +	unsigned int misc = 0;
>   	unsigned long flags;
>   	int ret;
>   
> @@ -535,7 +535,8 @@ static int qcom_pmic_typec_port_set_vconn(struct tcpc_dev *tcpc, bool on)
>   	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
>   	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
>   	struct device *dev = pmic_typec_port->dev;
> -	unsigned int orientation, misc, mask, value;
> +	unsigned int orientation = 0, misc = 0, value = 0;
> +	unsigned int mask;
>   	unsigned long flags;
>   	int ret;
>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
