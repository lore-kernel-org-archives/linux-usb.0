Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C9C3B52E4
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 08:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931676; cv=none; b=gTsRWb6ic00/hL7pfIjH+37TtuTK5eNrzZ8gyWWcKsQfYzfx7cj0YvTNuXcq245Xs9XwhcSnkFETVS3EMGxqAysgTYNu9gn2wIPwxIDyidPsUgA5AiukPpcDbDPul05pFMP+5lCC4M0qxoDm4MaH+49ARZyfrFdhJrQKsA/yBTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931676; c=relaxed/simple;
	bh=3jgcZ8o1zrd+LpKWxHjCs1BSQBs4rt/MQMxp0Sktki8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnbvD4hXCRvnO+Z2+hXPEeXro+z2YQp13OuHjOxHv1MTgVeFOCG4qIdzKzupi2RVq9CTZ4q+o4vCmxYZDQuY5RyZ9UgJ1Wy6xlMvuPJhjJrN9zJ8M2pXS374xK2KQzG2WkYpIpy/loWcONXfzlU5O/OsPp9rEcEpKkyZcDCA2jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g1N7gdG5; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g1N7gdG5"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15bf399d3bso340437066b.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 01:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783931665; x=1784536465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rA2cjAX9vtTnvbyes1SFxozVo0D/ypmsrdhxlEKadJ0=;
        b=g1N7gdG5TO6piVXwgT+v/2SSwDsDtEZFcAgITK9TccgOMvjyWModQhcnSRt2S3ErsT
         ac+m1sKjhc1gCQhMpyv5p3gKicYVZ8dhFdRzMuZY99m2hqwGWrQCglWllZdBjiJFMsKH
         r3bJZ89RxZ2ySeWytLcVxZKNzRrEcHqk3ad56gdlhuAqwoPzRxvbkc77SZfX79sBJ3zk
         uVG+WrHlaVSGNIMlK6mFseSRJCknlfqbO4PE7QLuNs60ufoVykVYYnbKVcJg5dsSap+M
         cq8gpcs29onVJKXDdjTG5nssyeDIRlPi6C1Lh4/G9lNQSxCNCqRydT0aJ5L6J+fo+fGE
         TSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931665; x=1784536465;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rA2cjAX9vtTnvbyes1SFxozVo0D/ypmsrdhxlEKadJ0=;
        b=kSCLupP0XXSZoV/q7XjkM3EmXyt0o7FLsc78q7LZ7Vb+7HEzuVZYIU5IgADYtXxy9T
         1o9EYg9dLdw9jn5E1vp2gYWC5Ttg/NRvg1PwkKS4N2OdjTm8uXv4qVz7QU/1V0fE+n4g
         e1yR94HTQqAXKYo/TKoL4U7CpzZl8zMbooCewmUnsBNXJgCexXuArlavTXKmmAFDnL5T
         yiupECD8ZLHAGX/W4ZV90SMYZqy3T9DlxIl2zZ0zuVBl8nxzGEGdJN8U+UJTtcYydt7I
         Jxv9QrSrYvY/yBCrxkAEwAl+BchECFmqSO3J18lkT6N4cTvybedYfmPiNWFbagdsqBVw
         wVYg==
X-Forwarded-Encrypted: i=1; AHgh+Rpu3opdwHdGce7RkSWZ9uO+c6LS4yatdq2/45rlFpVrD97eztcZLi9ePqBTTpOU/cmi2/4x2JxyHXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLGJLgXOtatf71To1cBB4PWxifBPwryxEeO/WNnj4lkv/b0pbz
	oqRfmT24C3H+ar+dSCb9BHmLuCiVEAZrcj33b82sZYwvO/OEl93Un7n9nN5CSoJcU24=
X-Gm-Gg: AfdE7claGwkcVS+5LSETfw5qTrP2dBuLJuIk4CFjKkzgQfX0sNomxsHO5URNbQFyIHn
	IJRNVN5J0fATzWLmUi+3ncAwhPpHDPNgH9pOkyoEX/5wtT4yWBJa4CrVJ0a1zr8Wd1eKvGGLhvW
	7lKLakaVJ83jVylPgI2PFYpHXdoKsKiXk1yBt0s12g7anvj7IIdznFbrqy+P8QwAjjHaGz59+ZG
	4RGGuzK2NDEmyNYq7ekAfFcxTXO9tOTUODqCtGyDEthmfdzhGPYI4KQiLXBHFtOofg5GqdWdCYN
	E/vd/9nFtnvQivwRlh/dY6Smvlta6QvzzMh5Jx1OcCitCwR6JSV9YaTuNMeBwVTFP5UTxTMGAjt
	TqedXZXAHlTn5oJCJwJfBGCnW6oVxosL53Qq9pvsU3DUBhrLMLzQiYmJ/GL1tgjsfrru5/Aaolb
	fRKt9c9huUlZyuBfY0FHVgPT4=
X-Received: by 2002:a17:907:1c89:b0:c12:a16f:6867 with SMTP id a640c23a62f3a-c161e8b0271mr353954366b.26.1783931664621;
        Mon, 13 Jul 2026 01:34:24 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.2.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad82279csm979905366b.13.2026.07.13.01.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:34:24 -0700 (PDT)
Message-ID: <a205f7ee-7894-4d6d-a752-b10b036b6c36@linaro.org>
Date: Mon, 13 Jul 2026 09:34:22 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: tcpm: qcom: initialize currsrc explicitly
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Casey Connolly <casey.connolly@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, lvc-project@linuxtesting.org
References: <20260713080631.GB1275@altlinux.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260713080631.GB1275@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/07/2026 09:06, Alexey V. Vissarionov wrote:
> When regmap_read() fails, the execution goes to done: label, where
> currsrc is passed to rp_sel_to_name() and used as an index after a
> proper check. However, to make this situation easier to notice, an
> explicit initialization of currsrc with obviously impossible value
> is suggested. Alas, we can't simply use zero value here because it
> means TYPEC_SRC_RP_SEL_80UA.
> 
> Found by ALT Linux Team (altlinux.org) and Linux Verification Center
> (linuxtesting.org) using SVACE.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index bf985efe1cd6bea4..d7cb69cf6044841b 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -461,8 +461,8 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
>   	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
>   	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
>   	struct device *dev = pmic_typec_port->dev;
> -	unsigned int mode, currsrc;
> -	unsigned int misc;
> +	unsigned int currsrc = 0xFF; /* error, easy to notice in the log */
> +	unsigned int mode, misc;
>   	unsigned long flags;
>   	int ret;
>   
> 
> 

This patch makes sense but doesn't require a Fixes: tag.

With that changed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
