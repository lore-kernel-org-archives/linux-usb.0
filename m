Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F33A31354F
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 00:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785372997; cv=none; b=iQb86MiDCs2/UiCL1IMxuEUL8vEh2ZUDlQQd/DEgioPNaYnHTlYdN/XEpZt6eKJbT1uv5XI7tFHuJ4rfoWLm2SVBki1oUyuZ7cusxbMjgtZaEMekiWfoDnT1ndjJ3oJMoEQuBv9mMiF2t4u7bSjUt9ly/E6ISHcWAcvMI71tq0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785372997; c=relaxed/simple;
	bh=3ObghyUyPlLo9ITrR6S/QXV4UB1t410DjLMNdBrKvzU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=h7SNK15keCT1xlOrY2CZfsRsnFhUd/moBB9WP1xgPt58/N1LkiX8QWn/YNTJ6+3EVomI/W8WQvMbajeGNrgb/LopDBv7PKlj0XLkD8aU2aZGZG+ugGn3iMbiRUVGvft2W1wEB0MXDiamobHvS6Lh5Ji6SZTb1pOWDlx3EUOLyso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I5cR9FQO; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I5cR9FQO"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1235001a12.2
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 17:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785372996; x=1785977796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i8UGR9cVOX6uh57M+KLNA0BVZnOPxXsCVTw3GnHIK7o=;
        b=I5cR9FQO4fXQdPj3tJIv+TTPNgvICUu5PrdibGkUPwPJyxmVA70gnjf3/g94ckH1xO
         GqpOtELuMMmFl5LOP9z/vkPfO6zgrza5pGiDn1oMapWErnsUpOt7JZ2HvAvRcdQxXd63
         UQLutRg4V770nSDLgMSz18Agmg8I1kS6NCyF1ZQxxP2B0OZk4aG/UJu9qp10in2d98m0
         4icoScf+Qz+K92WOXRnvRyNho/7XJelLMSBVUBPqcEGPxHwMm3Le3vafjCiVHvlJjg2E
         UVi/TWgHR0YmSDSE7/J/FzRoD4Ehg+pij6SyLC1kyvTzJqt/7Aj6ysIq0vem0XmrwOyz
         QhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785372996; x=1785977796;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8UGR9cVOX6uh57M+KLNA0BVZnOPxXsCVTw3GnHIK7o=;
        b=tRv9oj8IQH+lkSjqJVDLs4BNT/gZmFM3QDK0PqTZzk5Y/r6NvE6gVDUJ7mJ/T0bWOC
         juFvD3OPc3yMDjuKJpovRwNSCOLdwVizfN70AwJKX+xoOqggqk5K9cVB5aIT69vT2kZU
         ANl2fmebYPu8KubvyvMAHWE3dlAITq93mfhg1ebWkLO+gk0HWPu85lh2zHBE+Z4llwju
         OyBkikWOMeBW5gjRUmV20pCyRTKyqT6213uscCMpIot0457EgXSEL1SufazcGAUozgQm
         /kGN20JXwy8xqtzyPWf/sQQy2FJMlgKzcdhunBZurPFRnPOUVWXVr0A9A/y54u5dQKte
         g9KA==
X-Forwarded-Encrypted: i=1; AHgh+Ropc1UurMjJpKS9VLtdRMnSFDn8uI5P32RXc8L8wXwqeeprqUUuo+SroPfqSZW5hGQxPho2ETo2rxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvvwL69Rh+ZHFyo9Y1TuYHGQ/H9ruY6XkOkwGaIdpidaf9f4iO
	a8/Oz4lh+umcvLB24aTZEjEGSgtn+80Brs13l8XCLD97JRi/KLOK4mpe2qyDR46Qzw==
X-Gm-Gg: AR+sD129PtvwtTIZkZNW/4npGstzcibJk/mEtcUqcjrJ/y06Rlq9V1wrpHL5jAhpqIA
	hCk82FM62sGXuUsUnTx/e0GcnJm5h92yQpGrOsByCvFj0s1p3Xd2t7V8UH9wknU+P24qcMsEE6m
	v4sDYsAxJIYrGi8n4g7FU8HMimiNGEOhQYNZNQ9zsxvVBJQexp9UkGdnJ6QiqGHq+BrhZeYJrIF
	hyH+282q+YqYBfTjAfZi1X/5okP5CoTdgpqEnn65OyctjznH6aazsGFyXwUkTaB0OTQsxXojsxF
	zAwVt6iihL5ddqXL+5q8pq2kcEU7QHTiTwI5ov4SO9owO+Bn3mqViR34TV+NabHCFOf4AiO7iA1
	8CjyNNtG0p3pdpUmOmYdY45xYPiP4ZQoD+0YlX2k1dLS47SKZ3nENOd9CikDZPk/wPQrZwNqvJJ
	n46TjZM4vCVGdB1aFrkzafDNSSSkiCdqv6wLXustDuFsFQW+NtT4kh5CIVhLygGZmiskC9KTbr/
	Ko1w8c94//ui6fJutqNYrm2jNuXQJYOpd3XYZ6eUlzRO/WVPb775FEHLeciRMiaqLtZl1v5pC1d
	pa0R1LtEeAH5SNGZ0Lc=
X-Received: by 2002:a05:6a20:430b:b0:3b4:85db:1bed with SMTP id adf61e73a8af0-3c9008d247emr301869637.45.1785372994792;
        Wed, 29 Jul 2026 17:56:34 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:e4cf:de45:8976:b90b? ([2a00:79e0:2e7c:8:e4cf:de45:8976:b90b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265be48sm14041126c88.8.2026.07.29.17.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 17:56:34 -0700 (PDT)
Message-ID: <5cdf0238-24f8-402f-a72a-d490f8d9c99a@google.com>
Date: Wed, 29 Jul 2026 17:56:29 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Amit Sunil Dhamne <amitsd@google.com>
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
Content-Language: en-US
In-Reply-To: <amVJ1u67qHENBQ5l@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sebastian,

On 7/25/26 5:01 PM, Sebastian Reichel wrote:
> Hi,
> 
> On Tue, Jul 14, 2026 at 09:10:53PM +0000, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add support for responding to a Get_Battery_Status request with a
>> Battery_Status message. The port partner shall request the status of a
>> port's battery by providing an index in the Get_Battery_Status AMS. In
>> case of failure to identify the battery, the port shall reply with an
>> appropriate message indicating so.
>>
>> Support for Battery_Status message is required for sinks that contain
>> battery as specified in USB PD Rev3.1 v1.8
>> ("Applicability of Data Messages" section).
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
>> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> ---
>>  drivers/usb/typec/tcpm/tcpm.c | 138 ++++++++++++++++++++++++++++++++++++++++--
>>  include/linux/usb/pd.h        |  29 +++++++++
>>  2 files changed, 163 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>> index 7ef746a90a17..cd33ee131ebd 100644
>> --- a/drivers/usb/typec/tcpm/tcpm.c
>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>> @@ -12,6 +12,7 @@
>>  #include <linux/jiffies.h>
>>  #include <linux/kernel.h>
>>  #include <linux/kthread.h>
>> +#include <linux/math64.h>
>>  #include <linux/minmax.h>
>>  #include <linux/module.h>
>>  #include <linux/mutex.h>
>> @@ -232,7 +233,8 @@ enum pd_msg_request {
>>  	PD_MSG_DATA_SINK_CAP,
>>  	PD_MSG_DATA_SOURCE_CAP,
>>  	PD_MSG_DATA_REV,
>> -	PD_MSG_EXT_SINK_CAP_EXT
>> +	PD_MSG_EXT_SINK_CAP_EXT,
>> +	PD_MSG_DATA_BATT_STATUS
>>  };
>>  
>>  enum adev_actions {
>> @@ -387,7 +389,15 @@ struct pd_timings {
>>  };
>>  
>>  /* Convert microwatt to watt */
>> -#define UW_TO_W(pow)					((pow) / 1000000)
>> +#define UW_TO_W(pow)				(div_u64((pow), 1000000))
>> +
>> +/*
>> + * As per USB PD Spec Rev 3.18 (Sec. 6.5.13.11), the number of fixed batteries
>> + * that a port can be queried is restricted to 4.
>> + */
>> +#define MAX_NUM_FIXED_BATT				4
> 
> If I understand the spec correctly, the presence of a fixed battery
> should never change for fixed batteries. I guess the rationale is,
> that one only has to the battery capabilities once for these kind of
> batteries. But for the Linux kernel this concept does not exist and
> all batteries are potentialle hot-swappable. For real hardware with
> TCPM and hot-swappable battery, this code will now incorrectly
> expose them as fixed battery and violate the spec. I think this should
> at least be mentioned in the commit message.
> 

You are completely right. I was approaching this primarily from the
smartphone side (Pixel 6), where batteries are effectively fixed and
inaccessible to the user. Because I don't have a setup with TCPM +
hot-swappable (in the context of the spec) batteries to test with, I 
only implemented the fixed case.

I mentioned this constraint in the cover letter, but I agree it could
have been in the commit message as well. Since Greg has already picked
this series up into his tree, I can't amend the commit message now.
However, if you think it's necessary, I can send a small incremental
patch to add a comment in the code clarifying this assumption.
Otherwise, we can leave it as-is until someone has the hardware to
properly implement and test the hot-swappable support. Let me know what
you prefer.

>> [...]
>> +	batt = port->fixed_batt[batt_id];
>> +	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_PRESENT, &val);
>> +	if (ret)
>> +		tcpm_log(port,
>> +			 "Failed to fetch power_supply_prop_present ret %d",
>> +			 ret);
>> +	else
>> +		batt_present = val.intval > 0;
>> +
>> +	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_CHARGE_NOW,
>> +					&val);
>> +	if (!ret) {
>> +		charge_now = val.intval;
>> +		ret = power_supply_get_property(batt,
>> +						POWER_SUPPLY_PROP_VOLTAGE_AVG,
>> +						&val);
>> +		if (!ret) {
>> +			energy_now = div_u64((u64)charge_now * val.intval,
>> +					     1000000);
>> +
>> +			/*
>> +			 * Battery Present Charge is reported in
>> +			 * increments of 0.1WH.
>> +			 */
>> +			present_charge = (u16)UW_TO_W(energy_now * 10);
>> +		}
>> +	}
>> [...]
> 
> What about fuel gauges, which expose POWER_SUPPLY_PROP_ENERGY_NOW
> instead of POWER_SUPPLY_PROP_CHARGE_NOW?
> 

Good point. Our fuel gauge uses charge_* properties, so charge_now was
sufficient for our immediate use case, but it makes sense to support
energy_now natively for other users.

Since the original patch is already merged, I could write an incremental
follow-up patch that checks POWER_SUPPLY_PROP_ENERGY_NOW first, and if
it's not supported, falls back to calculating it via CHARGE_NOW *
VOLTAGE_AVG. Please let me know if this works?


> P.S.: Sorry for slow review.

No worries, thanks for your feedback!

Regards,
Amit
> 
> Greetings,
> 
> -- Sebastian
> 

