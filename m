Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FD04B0496
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 23:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786060560; cv=none; b=mhGKEz1Hqth0SAeIYDDj3Or4x/GAV60TKH7eBxgSJoLkarTByj2nI/I2qYpxxNY7RzxAEZVKTq3ahPr+87VjIHlL/SwijZnoc5pk1hpfu6b2QZhV+Ca4M+QCAM3Is4TSDAiWEmNKWh12JrZ74odSyA3wdyYVyL2fJg4fPPFWLns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786060560; c=relaxed/simple;
	bh=Yzna//NwtR8zPjpm9cs8EXwZP+V0ywgfzo046gOQPio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dsFLPb9/YW1Cu/MpZfPJObhVVQisxpoUGGvQZpSk5qSpRPUxeMtPncpNKR0SReDReXultcggvRVKdfYMU+EhepPIVbSHA2cRofT9Xliyrk0xgp8X9j9pRszQvE6EzJ/7zhPNohl55tzxv4Wjl7KLwI5y+hiIRKg00Ib9f38QpIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U8t64tEu; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U8t64tEu"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso2484116a12.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 16:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786060558; x=1786665358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/T+n8sN5VnkglxyfMBw6K8D9WLEnW5GbMB82HdKKrE=;
        b=U8t64tEunm7eJyJYpJyz6wBmGQjQF6YMCcbl9HA5jHEdPLtXoGD9gBti0ZRAiY5tTl
         evI/2ZVvZkZKr/iOxC5WUMWKHB/c6JAu74BK/OaPkcDusHiTFUtwgZH/ib+7jwal0P9L
         W5Q86AQ7COc5ntikXKt2sJx3XCLcFPrzZjIoPRhiK8CyFYifN4cm+ayqgdnNWUrI+C6u
         quvEU8OA3bOd25nq8+YMsbj+G2dUEuUQFaUS3hhv37WeF6//R9SGtxDpVbaZmyXsvWJL
         kDL92IgkMReyBdaHX6lAAYbXx1zkPeU7B4x3V5B8l/E+UR1wyRhce96yenRhKDIuJVpF
         SFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786060558; x=1786665358;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/T+n8sN5VnkglxyfMBw6K8D9WLEnW5GbMB82HdKKrE=;
        b=AzBE2RtLewQJnMmw/Hbu0XbcpU9aenmCCmFWeHgK2tjzoBlP8zMr4pCo1sLYNit1e8
         HcbC+jYhPnlKRfoZ79cBcN9iy3obfWKoEeXljSPwAU/PrGA6cMtqwboJ+FGp9X11DZpB
         oLcVR2aHBWeSAFEzYcxAKmr/cZjYlu4wq6Vtz85I9aav320ThCpAl/JSJBSu8nUfdrJL
         0OKVfQhP2xxTecwXdJ5FTPdNoUIfAdbLSxjpQIlUBscN2j8u5qqCBil3wp356zBLVb7m
         8QcHDIuSGyGAA245OrW8yRMQBRsKotaW4wuC5Y5Oh8eFsLIE++3eQBn0cIx6DtQjn0Jf
         R7Gw==
X-Forwarded-Encrypted: i=1; AHgh+RpJ1xC0sXnh+yDyY8r+VTyHaR57epXxSWhYUAaJC9oGBvHnlKj6E1kpTSGg+ksybonR5jyJfKBxkDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/2xAnEKivJl2q16pry/OVdFQ+iZ3iBpUwO5rTGFcyjTubngay
	HOHjp23LKDFRCjxY94M58J71CnzrO9RIefqSLkVix/38xWJadP1XQ+a3ehu6naBHAg==
X-Gm-Gg: AR+sD10ZrSMy6OrN4WweLPndzPAb40gYz6Yq55j1spgl4jx5pvNwV3h22XhxGvIBZrV
	wPE1N0lfzf2yem7MF54fxhW91mFIfPN+oYsURDDvXh4BcwzVr6/Pt0f4AkbUtxDNm8A8NynCgLn
	o+qa/XOaYzFivXGtJmtvwZgeq1SqluljxH71NvsnyaktQ0a3+FaTjhvRHxD2TbTPcTtXXwkHHEY
	E2r2THh/yvI8iK3iJUlh+VKsQgTyZMSVx5Rf+/e29l04LTBtJeY/FVL8O59aG204EFHL/XkUbeq
	5il0VwsJXoz86z4AC60cFSgRmdnCxSXyqiL2DKTmPyivjYczRhLLifcPSUPme5RMnr0EmtGdltw
	faC1VyoiI6K5pzhbbyHht/M6aqaNH2agYNZFu0f3KEulhQTToEsGEwutHExuzKeIGWACYQxJTE4
	6+JobOgobfRee4UnTK4aHQ+W/mz5ab5314+iyzXtOs0EXQ/YWmZhHQtVmvVeQCa8djOQKysvhVb
	+O9fd7xlD6uY3/nM8YG2QGjW6Q9tJPmwwpBa8bAthZ1Sf1PTjiN7YsAJfRJ9SOB8F8NLjeJkJO7
	EpqEFrOOcN2Xn59Y1+ctecN/5Rw=
X-Received: by 2002:a05:6a20:da12:b0:3b4:75c0:3ec0 with SMTP id adf61e73a8af0-3cb85ea6f79mr21308619637.30.1786060557536;
        Thu, 06 Aug 2026 16:55:57 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:b0e:e09a:2979:5a02? ([2a00:79e0:2e7c:8:b0e:e09a:2979:5a02])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86f98esm344844eec.6.2026.08.06.16.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 16:55:56 -0700 (PDT)
Message-ID: <a37923ca-ce08-43c7-bc90-19c63b7a5830@google.com>
Date: Thu, 6 Aug 2026 16:55:54 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] usb: typec: tcpm: Add support for Battery Status
 response message
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hansg@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
 Purism Kernel Team <kernel@puri.sm>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260714-batt-status-v5-0-9de4aa900b69@google.com>
 <20260714-batt-status-v5-2-9de4aa900b69@google.com> <amVJ1u67qHENBQ5l@venus>
 <5cdf0238-24f8-402f-a72a-d490f8d9c99a@google.com> <amvLtvDbJ8g-1rJ3@venus>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <amvLtvDbJ8g-1rJ3@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sebastian,


On 7/30/26 3:24 PM, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Jul 29, 2026 at 05:56:29PM -0700, Amit Sunil Dhamne wrote:
>> [...]
>>
>>>> +/*
>>>> + * As per USB PD Spec Rev 3.18 (Sec. 6.5.13.11), the number of fixed batteries
>>>> + * that a port can be queried is restricted to 4.
>>>> + */
>>>> +#define MAX_NUM_FIXED_BATT				4
>>>
>>> If I understand the spec correctly, the presence of a fixed battery
>>> should never change for fixed batteries. I guess the rationale is,
>>> that one only has to the battery capabilities once for these kind of
>>> batteries. But for the Linux kernel this concept does not exist and
>>> all batteries are potentialle hot-swappable. For real hardware with
>>> TCPM and hot-swappable battery, this code will now incorrectly
>>> expose them as fixed battery and violate the spec. I think this should
>>> at least be mentioned in the commit message.
>>>
>>
>> You are completely right. I was approaching this primarily from the
>> smartphone side (Pixel 6), where batteries are effectively fixed and
>> inaccessible to the user. Because I don't have a setup with TCPM +
>> hot-swappable (in the context of the spec) batteries to test with, I only
>> implemented the fixed case.
>>
>> I mentioned this constraint in the cover letter, but I agree it could
>> have been in the commit message as well. Since Greg has already picked
>> this series up into his tree, I can't amend the commit message now.
>> However, if you think it's necessary, I can send a small incremental
>> patch to add a comment in the code clarifying this assumption.
>> Otherwise, we can leave it as-is until someone has the hardware to
>> properly implement and test the hot-swappable support. Let me know what
>> you prefer.
> 
> You tested only the fixed variant, but your implementation is in the
> generic TCPM and does not check if it runs on a Pixel 6. If you
> touch generic code you need to think generic :)
> 
> Generally I would expect it is "safer" to expose batteries as
> hot-swappable when they are fixed than the other way around.
> FWIW the kernel's power-supply framework has no concept of fixed
> batteries.
> 

Misclassifying a battery would lead to compliance failures. Also, 
classifying a fixed battery as hot-swappable (even if it's a telemetry 
message to the port partner) may indicate to users that it's safe to 
hot-swap batteries which may not be the case (either for mechanical 
reasons or data corruption when suddenly removing battery from live 
battery powered devices). So I don't think it'd be safer.

Would it make sense to introduce a device-tree property (e.g., something 
like fixed-batteries label) so the hardware can explicitly define this? 
Let me know what you think the best path forward is.

>>>> [...]
>>>> +	batt = port->fixed_batt[batt_id];
>>>> +	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_PRESENT, &val);
>>>> +	if (ret)
>>>> +		tcpm_log(port,
>>>> +			 "Failed to fetch power_supply_prop_present ret %d",
>>>> +			 ret);
>>>> +	else
>>>> +		batt_present = val.intval > 0;
>>>> +
>>>> +	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_CHARGE_NOW,
>>>> +					&val);
>>>> +	if (!ret) {
>>>> +		charge_now = val.intval;
>>>> +		ret = power_supply_get_property(batt,
>>>> +						POWER_SUPPLY_PROP_VOLTAGE_AVG,
>>>> +						&val);
>>>> +		if (!ret) {
>>>> +			energy_now = div_u64((u64)charge_now * val.intval,
>>>> +					     1000000);
>>>> +
>>>> +			/*
>>>> +			 * Battery Present Charge is reported in
>>>> +			 * increments of 0.1WH.
>>>> +			 */
>>>> +			present_charge = (u16)UW_TO_W(energy_now * 10);
>>>> +		}
>>>> +	}
>>>> [...]
>>>
>>> What about fuel gauges, which expose POWER_SUPPLY_PROP_ENERGY_NOW
>>> instead of POWER_SUPPLY_PROP_CHARGE_NOW?
>>
>> Good point. Our fuel gauge uses charge_* properties, so charge_now was
>> sufficient for our immediate use case, but it makes sense to support
>> energy_now natively for other users.
>>
>> Since the original patch is already merged, I could write an incremental
>> follow-up patch that checks POWER_SUPPLY_PROP_ENERGY_NOW first, and if
>> it's not supported, falls back to calculating it via CHARGE_NOW *
>> VOLTAGE_AVG. Please let me know if this works?
> 
> That sounds sensible to me.

I will send a new patch for this.

Regards,
Amit

> 
> Greetings,
> 
> -- Sebastian

