Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B08C4457C6
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 14:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790433679; cv=none; b=Z/LnHuliwX8DywJRwfdinjuyLp/e9+R7U6RSo7KZpgZmu+HM8CepM/qrMTPuoEPdUT8tOHtYkmFs4ty7dsqWrrEJIs+kZiOcrrG00gLWHy/QWGm0vNxeWwm9s1yZfmtvuzJIii0+V/vu6O7swb/XRUYlrarnwQ9/U4zZHnHEHFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790433679; c=relaxed/simple;
	bh=oiXRKP29ZUO2dA9Y55/UdFoG+3sZBM2fEQlPHS6Cq0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LMY7haJ47659Ob4Bnxs/tCTz+RcHkR6m4EeXEfUbND3pNEmG20eVwMIc/xvoxoqr738irXOrCsbZaQ+Cfuv+2M/T5MzQEEksP+WNNOEdvxFe9e5ciW1WsspUc+Rb6yB2ZMNfKc0TgHpALuEHiNkg75R2l1gHnNj+s2Ykx6Ea0Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HaixJ3C/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HaixJ3C/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so12912515e9.2
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790433675; x=1791038475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xu9tR3djwphJGXzBWF0dvsjvBTAcOuke1f5Yy3j2+xk=;
        b=HaixJ3C/PEqlB8xy7XkJ5E62RmE2vOri8GJdzeGQYyHzyA3WSllt+VmuriuGCzmNj/
         u0VKfbkoXU83Hg9CsaEceucvyvr3MjIvBj2HlN7c5R+UtFZtpb6yxurzAtgPi1dDGWMG
         WhG/1r2dTsBtahbmLChe0mYvbDlzSrWZ7OisL0/Ux9xXJjbtv/a7YTDUQ4xZouzNUf7P
         T+/wBdbo8lZLtW9FTa8iVI3F7LMSbrlrOqH+QtJbQWa2fv2jkLdDY9QbpCYlg+juU4pZ
         /w3p55uy8+quyOERdV7a3x2Oq3UN7vlDm6gDtgx53COS51dSaBQS+hAbxIIvDHNiB1Vz
         UCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790433675; x=1791038475;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xu9tR3djwphJGXzBWF0dvsjvBTAcOuke1f5Yy3j2+xk=;
        b=SXlQkm3/wbj3zACy+uxN3XgjW4caV10nvc+7OI4ZDqGcFJkdmAO3hLnYvFVj8nb/v6
         VbnjZM3LfaJ9oGClWBM1KjAi428ALbPxJFF9Zw6NiRZCUTbtCfOoTpVtk6DRvEuj/x1a
         cMm3ZiXk7n9VJuoTPDbFp3oJa62nuIdl7SMEObGgdMEy6kp2KJ/v113tVMDv0SsQnQrV
         XRX6XB1/KC+KnFpj7QZIXi3k09751sgXzLOQWGNZXWSpKe5ZlAIlbeJPb2hPlym22+tB
         EJOpCEu1voNmeSmCa+7eB8U353PTTCh5zS6b7xIRyixAlg5z5wm+64EsXbhDDkwqiYWj
         5PHg==
X-Forwarded-Encrypted: i=1; AKwUvByhrxfLTmKYiWU8mtJkDhmXs4uibPmoN33ngHl68HL3O/IaCCUHSA9b3HxiZoPoHsjk8NTgaXmdLZg=@vger.kernel.org
X-Gm-Message-State: AFuF++nuI1izE8w1Cu2XktvDD3PIUXo2XZiQNDDqKTyt+IqvTypsfjFg
	2jZttUX8XpjFr8FiL0E3al0KqQS8RjSNvE2IcpzMLLEuO3wjwAaQqCVsVSxkctBxOX8=
X-Gm-Gg: AYBFou3Z5TtCsff857bnLBlZBCbVvIQedX92Aa1qIk7jLxQnU8qHXAy9EIT/mrtHLdy
	QoanQmztp4q6Hm6W93Oj2XkJZ4TAIoj2PmUIvzyrPpsltWuMrcWR1pbxdl4dPXSCPVYYDnfU/ft
	KTtqaC6gxLJl69BlKbJccxr7N9yl+mhP2fmslYMKcdUmvYEUfMXT52GA/9sVlXjXxnITdfIgheP
	7UpksTWD14rgIYpSaEGfQZdcB4uXirUbZIPO6O91YFL0HXppefTongtl960wuFgvAygmzviJfCG
	UOdpqWzujkUaCK+KF6TYDuFlS2nhoDxmqOsY6a+sjwGnURZoKgzDu5Raye1tRoDZr0sJ0mZfoHl
	8unZ1zQk/adNGwmczXYPaopbkz9n4/qk1M0pvcpycwVVPE3a3Cvbp1jSe0cA5lG6nRm24bVZqUB
	PWvQSHP+odoBgXuhHqf+1xfaQ8EHglXgvi5PAAug+Dnwkm4NKIVvsJjQmCXGSA3PKtshZ6ySOoi
	v6P/WP46LrpQYIfy34KpBY=
X-Received: by 2002:a05:600c:4e12:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49fe66b6e0emr156760565e9.14.1790433672783;
        Sat, 26 Sep 2026 07:41:12 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm228645705e9.13.2026.09.26.07.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 07:41:12 -0700 (PDT)
Message-ID: <8f6c3e69-f616-42b4-8e33-f05ac0812722@linaro.org>
Date: Sat, 26 Sep 2026 15:41:10 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/12] usb: typec: qcom: Add gen1 Type-C port support
To: David Heidelberg <david@ixit.cz>,
 Alexey Minnekhanov <alexeymin@minlexx.ru>,
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
 <20260926-typec-v1-6-31adc19f32c6@ixit.cz>
 <4f089c98-a479-45c9-9b11-0207c895367a@linaro.org>
 <f83b2992-9214-49b7-be3d-28ad435a73c9@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <f83b2992-9214-49b7-be3d-28ad435a73c9@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/09/2026 15:32, David Heidelberg wrote:
> On 26/09/2026 16:22, Bryan O'Donoghue wrote:
>> On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Add a port backend for the first generation of the Qualcomm PMIC Type-C
>>> block, found on PM660 and PMI8998.
>>>
>>> On gen1 the Type-C CC logic is part of the charger's USBIN peripheral
>>> (base 0x1300) instead of the standalone Type-C peripheral used by
>>> PM8150B and later PMICs. All Type-C events (CC state change,
>>> tCCDebounce done, VBUS change and error) are signalled through a single
>>> aggregate "type-c-change" interrupt, the handler re-reads TYPEC_STATUS_4
>>> to find out what changed. The PD PHY is register compatible with PM8150B
>>> and is reused as is.
>>>
>>> Differences to the PM8150B backend:
>>>   - get_cc() returns -EBUSY until the hardware reports tCCDebounce done,
>>>     instead of using a software debounce.
>>>   - As a source, only the default and 1.5A Rp can be advertised, 3.0A
>>>     requests are advertised as 1.5A.
>>>   - The PBS workaround of the downstream SMB2 driver (TM_IO_DTEST4_SEL)
>>>     is applied on every power role change.
>>>
>>> VBUS sourcing is optional and only used when the connector provides
>>> a vbus-supply, as the charger doesn't expose a VBUS regulator yet.
>>>
>>> Assisted-by: LLM
>>> Co-developed-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
>>> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>>   drivers/usb/typec/tcpm/qcom/Makefile               |   1 +
>>>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |   9 +
>>>   .../typec/tcpm/qcom/qcom_pmic_typec_port_gen1.c    | 605 ++++++++++ 
>>> +++++++++++
>>>   .../typec/tcpm/qcom/qcom_pmic_typec_port_gen1.h    |  15 +
>>>   4 files changed, 630 insertions(+)
>>>
> 
> [...]
> 
>>> +/*
>>> + * Failure of this workaround write is non-fatal and
>>> + * we can continue with the role transition.
>>> + */
>>> +static void gen1_typec_pbs_wa(struct gen1_typec_port *port, bool sink)
>>> +{
>>> +    unsigned int val = sink ? 0 : PBS_CRUDE_SENSOR_ENABLE;
>>> +    int ret;
>>> +
>>> +    ret = regmap_write(port->regmap, port->base +
>>> +               MISC_BASE_OFFSET + TM_IO_DTEST4_SEL, val);
>>> +    if (!ret)
>>> +        return;
>>
>> Why would the write fail and why wouldn't that be a critical case if 
>> the write did fail ?
> 
> Heya Bryan,
> 
> thanks a lot for reviewing the series. For the rest notes, I'll 
> incorporate that and/or think about it later. Here to quickly answer to 
> this note,
> 
> this one quirk is definitely NOT REQUIRED. Originally, I was testing the 
> driver without it on sdm845 devices, and everything worked without it 
> just fine. I ASSUME in some situation or with some devices combination 
> it may come handy, thus likely if it fails, not much usually happens 
> (and clanker was suggesting to port this one from downstream, so I did).
> 
> David
> 
> [...]

I ran this code though an LLM and it is babbling about the "shape" of 
things to hand you LoL.

Anyway the pattern matching part flagged this:

"Write outside the node's reg. base + MISC_BASE_OFFSET + 
TM_IO_DTEST4_SEL is 0x16e9, the MISC peripheral. 03 declares reg = 
<USBIN>, <PDPHY> only."

Worth also verifying.

---
bod
