Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175571;
	b=LHXh3F+lRBIdYYiNuzNZTr8a9uu9jZKuJ/x4stwHMVQZI+r7shm8a6yNrkdhcUqrkij7
	 UxQEHLezN8FgaUapABA9QbMp3oN7DEGHfVAIKkgXQkqZYMrZwyRcZIWjSVTs2sacWRNGl
	 b4COVZagJ3wO9q2poYqm1Qcy1/zFce+b+49CHanK4MqhS67xCj5V0Ky1xQvHvWvPSTqCQ
	 T1UWZFMVT82BVZpXWdieLystCjLQf/EpKOIEatZvtviog0bC37yC3S7cXcFj0GISPyGOq
	 wcJ3cMBk8gy3GUNf13rqw4SYRnjiG3H9OHShVioT8Yq9wMQnR+Ho0F8iiqx27s0gzSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LAgvIdQQwmp1OleVudQumUn8l7JMaos3FxIAqmwJxIc=;
	b=NqQJOO7mjMGDcFEnjKYgWZoXo3y56FTzIsejuU/NXXmCx8G8ztBH9mwil0sVK7mBSw+U
	 pW0LtZ+i28g8mxiUj8QbXAanVPvbETfWOvCvId6Q5m7U39z1Ffqfq9/HQS5FROpwGOCTN
	 0K6Bkp/9nDiNc1ut2HcXRP3QKX2dvBoLVIxDqCrdwDyZVWOs54eNG5Uz7Lo6qpDwWkLMT
	 JYmK+OBtgvt6PriA6tVGQMSGLIBsbRw7tStt8i6FsTUt8weV69KXIIqiSx81pIyAqrzv4
	 bDDVyp2w+WnDZRJmOgA7/gMRe1hEPsdj6E/RI/bOC1E2fX28sHcepoci/5FkPVIzfZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="KO/NIHxw";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005E5606A333
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 11:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 005E5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KO/NIHxw
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso8784205e9.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 03:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795175569; x=1795780369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LAgvIdQQwmp1OleVudQumUn8l7JMaos3FxIAqmwJxIc=;
        b=KO/NIHxwBC0mednmwAI8pRPijQVr6PeehxPjlr+r+mn/+azrSmaZxAJKd9fcJdS/RB
         hWzD0ABPIz41LXkSpWZSW0prTyYH4/BpsQvn00MByDG23v0gb0uZKc68+WIMEXxGVRoA
         jpL1QLZ17XiMqbvXwB4E3iqiwFJtrjOWohTaojPRYnvqsSc/9G5wEiexYkMm8+SFNBye
         V3kD4STrICzPC6kOXhZiBSWmHqPu/RYunNBqogZtQjtVhEGavdi5psYhgBPlI+SuLTHE
         WlB1YShx4HeTIRlSUfu9oYsTD1gFcxv/co3ITbH6dMaxECIkDi+cDtxWqa55dnrTOWEh
         n9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175569; x=1795780369;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAgvIdQQwmp1OleVudQumUn8l7JMaos3FxIAqmwJxIc=;
        b=qHdPdjfX0eVdQM++8fghBxIjSL5FaJM3zG9gGlH3b3SdvL3P2Cw0JFvWaXeHRxKrTq
         ggyTy6b19NAF9XoAS2W5KIACUXr48kLv2fnJ+beP5o/q7JTMy6FvpvkJtuGbMbZFqbPK
         T6J2EC4QaQoZtpUYvdSJsL5A+a4vaOrcn8ZmAT8+DU8+fVM5uB/nyhCU12Bq0AFbN/eA
         PiIs4DfKus+nM5mvQ5SY886+9pW7HZSvyGxFyXyATIP3+LIgHVaLj6XlwAYjuDtNXfYX
         H7l4KQsmq5eL12XIG4FLBhWC/CxX8hdeJSRxIWQydD8VL4zJxF5p/Sx4XQgrruB5O41Y
         9ITw==
X-Forwarded-Encrypted: i=1; AL+hErHbqnPopdpx5Z0rWWISELesI8JFM9SwLIt/id+V73fni87x644D7z4B+z1l+jYx9byCzsJ2I/0cVJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z89Z9G08/hBY9yBqPLbEPd+RI/A4ZzJgMWrE9B0XrPPUd5BGrCK
	HF0OpIsJh2gXt/r/b0Gtqkl2xYGwtisnwIGZxE8f6zELuN3AgJqK6xnpJRkxnl0cpQ4=
X-Gm-Gg: AYBFou1IbIBriLIezD4tzpUCMGUTxn+F7y+HrpOKE/Jke9AoZLhkEl+h8W8Kq2yEeIL
	sa49twONRF4rIxZgRyMaZWmenWnit2Bwc2W88oqYaPUGUnroQ3LvX2h77d2fW6c21Dca32ZtfZ2
	lVV1BkQ4o6VWPj0RlFqmo57Q5dB23+W/WER2gqwi4qDK/ULxTkgSaQ4l7TryiiVztcQRSq9vyKK
	jIoC9A40mqXGdE0Kl3Sn0S1Az/bj50DTNhbjEq1AhSbjKrkbG6FXNyVlK2hTRLyGnqihrFbW+kH
	CBxE/wUxw5PXQ6iAdjefjWOJgFKvgDVMt1by1NEhOVJtX4gnM1MPuhZTY4pmmHmW9100CQTs9Ny
	kdNcvz0EYCEbXFD7zm9SITIOrKRJpjq0urumgM4ZCZ+pktQT2NedwUdb0T+xPbhBToG/yzhr1d5
	qmaelM6C7DyhoKHDRKdwTEhlU+jcMHH4gBWP5DZoNuyXE4tlXXFEZXQAXTCDstrgK6gmEEVZTsH
	+LZTfy/8p1WxOU2cK+d6IqVeWlBEVAozDqnTUbZpQm+4SUWyOG8GcrmGnbEIb/ww1JwLC+OiFyI
	3q22sTpUG8BJ6PCxHU979vJ3MhFSaMx9RLpGhgnrIw==
X-Received: by 2002:a05:600c:64c6:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4bb887c2c98mr60927405e9.4.1795175569215;
        Fri, 20 Nov 2026 03:52:49 -0800 (PST)
Received: from [192.168.0.167] ([109.76.69.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm113806905e9.1.2026.11.20.03.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:52:48 -0800 (PST)
Message-ID: <4e832b25-bd98-4a48-890a-02d54d3b117f@linaro.org>
Date: Fri, 20 Nov 2026 11:52:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: typec: qcom-pmic-typec: pdphy: disable the PD
 PHY on stop
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20261120-topic-tcpm-qcom-fixes-v1-0-9a152f906fba@linaro.org>
 <20261120-topic-tcpm-qcom-fixes-v1-1-9a152f906fba@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261120-topic-tcpm-qcom-fixes-v1-1-9a152f906fba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2026 09:59, Neil Armstrong wrote:
> qcom_pmic_typec_pdphy_stop() only terminates the ongoing transmission and
> clears the RX frame filter, the PD PHY itself stays enabled.
> 
> Use qcom_pmic_typec_pdphy_disable() so the PD PHY is also turned off
> before its supply is released, leaving it in the same state as before
> qcom_pmic_typec_pdphy_start().
> 
> Assisted-by: LLM
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index 435e07659d65..08cf65951796 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -545,7 +545,7 @@ static void qcom_pmic_typec_pdphy_stop(struct pmic_typec *tcpm)
>   
>   	cancel_work_sync(&pmic_typec_pdphy->reset_work);
>   
> -	qcom_pmic_typec_pdphy_reset_on(pmic_typec_pdphy);
> +	qcom_pmic_typec_pdphy_disable(pmic_typec_pdphy);
>   
>   	regulator_disable(pmic_typec_pdphy->vdd_pdphy);
>   }
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
