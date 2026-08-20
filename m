Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9240411A0A
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 10:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220933; cv=none; b=WGfvirl/RkpYHOiX4exzoKrMf1xSA3v+S+0owCf08ejyhanuLkLWMAVuJ/tcpfSw7ejPREyR2eOI2JtBx5zCt3iPCmCgX6SU5oN5YOXxncgE6XRGsDpy/HGKtuRQ78bgg5jf0Vq9VmHNBro0eZU0JdxVkXb5BdZ30i8KgtguHsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220933; c=relaxed/simple;
	bh=yi52HTwj5/V8AkISUNtnecpfAfVpbB7rUItTur0eknE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cnS4f59BM7xI1aDxc4zCr20oNqWj+bEt8fE7dDPm4Sz2n3arfkb81BdWMtKhBJDsFogq4n2B/STJ2O/JmQ0YYh0/QcQ4BHEwyNReJDDzBhlfmNXLvHyKkqx4ASRddEXVVZC4N2T1FrnVN8RuXnTnxdjFtH7yTnpco3Db3DJvRCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gp7LaGCT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gp7LaGCT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f71156e1aso947803f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 03:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787220918; x=1787825718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=73EKv/y0Hi9qvT6SwJd1WZqVvHE7yq7MtYlPP4tI3D4=;
        b=gp7LaGCTV9mM2p67TAdnwWtXn1B05kzyGKw0YbXpsvQx74eq9Z+uzLc4yofEBbYOLd
         iOeHcUJc47HgdJceYgvAuXKqk0oWV87ZmPdPwPTR6gC0WhM9pjbpEnLzwfRoa3lw6j4g
         HtW47v4NzHcs6suHdtmbYaiSXgFCFuQrq+It2+BcdmhzpAv/uXlHQQLEwjX+jFBVfPOD
         JGT/WpR/Whca6xcgE6CgT3mVYHbZn9qe+X4RCL/FFPytFSFMJYGpYoRQKrm9A7jRQplI
         rg50XcsnVlkRDDAQbz8HTrJaRuHRK5PNf8b0dj7b6IG9iVO245VNE3fgRFo6Xswazztz
         MBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220918; x=1787825718;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73EKv/y0Hi9qvT6SwJd1WZqVvHE7yq7MtYlPP4tI3D4=;
        b=ckQyZpwpnFMhactJIfC29QiVOsJImITLaLrcKnVjDxT5Lt6AHeHu7bNYt12Mowln76
         Gywnm2Gp0HqCoZuuIdkxFBOK/1SVAJVs0UfqG6Eevry1Tv5ngpZ+eKrAZV+zDmpGfwBX
         DUzaNcX9umXjNiVb0ZQ4JwxLcGE7GpHzh3k0IEGSn+rVCl/m5tDbf1V2yR4AaIdd3ML1
         F7IHVOeIcfUqvrrjqt6MlmAxl9qDHFKyR4WieNXDa5U7fk0eGl7llrAjGeBG9BDqUVm9
         Z+urMyU7mGpL8B2OY/XAP9H/eEoSTtuS2lXfRILHDUBZunJXpwKVVt2piNj+oebIhX2H
         IBpQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7lmzwofYNRrPPWVxKEsXVF0vhNTZe+LxNHGYpwD8yX8kednYAI1ot0gtyLj0BsD3W4fybHmB5Dz8=@vger.kernel.org
X-Gm-Message-State: AFuF++kOVBtckwCEvREsNaqG6TbHZ+L1i1AiozrfCIEOgohggyjI5qfH
	JWdmTlRDxxXS7eLQ0/mAYPkCuWbP9E9awhO3Ef44rlEV/ztJIkRWvldCnfDJqnzPXwUVsepNaNU
	yfKIAMcc=
X-Gm-Gg: AR+sD11ooD8Vb0pOh0stayplF662X9ddc5EDc7c/ygKndZpeUs/i0NNXCYQuxgjYuNR
	FWP/xRM2EWTGjdAZkbeMi90AIPYf8oJypa0XDnwhdv1cGdjqFANPuBXkhr27m17RD5KrRlwHxjn
	OO3uXgl9HhvKXzjMz8WEWPY77UG9jws9+D79l9wQ7XZNpsrRwh/U+19ILCeQdPuZgo1eznTKFYa
	zINoVqAaaJLSfpckXoaL0CjtlXG4rrUMS5KT7OrkL/asFQB4hoJZG6t8ZkAjdrO2+4PVQZs7Tga
	XmzZuF24JKnMge8tW02QpEk/j4KHTxPPcYZPn7WtlFf0mI7QYTZi9JnNPYUHsJP+LONYviLwHvU
	ZWfc0Nuu2e+SaHRgcsIggaMR7f9MVM6c/Md4QriQmAmNTdF+t8aQupqG80XKmCGGzzew3iPPoBM
	j+rLTYlbNuKySzdJtFN5UALAmLgOYQH49wakNPDBkA9UnttjakzsE2MhDGg4+5ysNtaGqVts3B
X-Received: by 2002:a05:6000:468c:b0:482:b813:8315 with SMTP id ffacd0b85a97d-482b8138536mr5738861f8f.21.1787220917614;
        Thu, 20 Aug 2026 03:15:17 -0700 (PDT)
Received: from [192.168.0.163] ([109.76.167.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d9783sm11601123f8f.37.2026.08.20.03.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:15:16 -0700 (PDT)
Message-ID: <f8d660b2-965c-4955-8ce1-3871f84b3811@linaro.org>
Date: Thu, 20 Aug 2026 11:15:15 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic: cancel reset_work on stop
To: Fan Wu <fanwu01@zju.edu.cn>, linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260819161448.76597-1-fanwu01@zju.edu.cn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260819161448.76597-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2026 17:14, Fan Wu wrote:
> pdphy_stop() disables IRQs but leaves reset_work pending.  If the IRQ
> handler schedules it just before disable_irq(), the work runs after
> remove() frees the struct via devm.
> 
> Call cancel_work_sync() after disabling IRQs to close the window.
> 
> This issue was found by an in-house static analysis tool.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index c8b1463e6..abb9d0321 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -544,6 +544,8 @@ static void qcom_pmic_typec_pdphy_stop(struct pmic_typec *tcpm)
>   	for (i = 0; i < pmic_typec_pdphy->nr_irqs; i++)
>   		disable_irq(pmic_typec_pdphy->irq_data[i].irq);
>   
> +	cancel_work_sync(&pmic_typec_pdphy->reset_work);
> +
>   	qcom_pmic_typec_pdphy_reset_on(pmic_typec_pdphy);
>   
>   	regulator_disable(pmic_typec_pdphy->vdd_pdphy);
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
