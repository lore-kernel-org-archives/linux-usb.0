Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE918324B22
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 20:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781297413; cv=none; b=Sui0tkDji2HHf6c2YxC6Ls0+KXjDq/fU/kslG6Ng+jbFKBF1ruSx4VoopPR7opIJ6TpfIhZRqUJLFu8LAlS/y9YHDzvBdUPhw6yOpSxco5muOgZo9Cy9dgHzsEi6up0atNbyTW19ylv2MqKXjjXs3kDeCFqHjdpiw1RUWePtQ6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781297413; c=relaxed/simple;
	bh=WyA5RJUXxVo8ZC5/B0u1S1KVddgB2Bx19Pcwt6jsi8E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YggQxB0K/VCAFoERqj6sk9nhJ2iN5p/bFengOP3CVTiRMMYuJLhp3bWDhQw1aoSb+h6lJmtuwBMt4ra1pj3hvyCHDeN48to84dbaRcQyqYphCSRAEuAC3lFPnnn+eGtcIkvTFgVOvAr+rhZVzAcnxSb3Kual/AQfK306TUbKNFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DoOwm5RC; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DoOwm5RC"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-307263ad0cbso2273229eec.0
        for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 13:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781297410; x=1781902210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ozaCV3zBgAf35CcRqA9qTwtf3B/zxP/F1yET9wpKDeI=;
        b=DoOwm5RCPu/ucgIcFNEXwQ6pg14jqC+O2P1YEw+931aQMcc4R/6HWupC5ZGCsOeJSD
         OUiRV3WuJTwWJvFOxeLcN1pWqVqtmQwy4u9IOAI789taACBaaS21rON3v7mg4vLdaFQM
         DRrh8eRrMqrXhP7majtkttQraD8PjtL+YuKZsh2VpP9IVwadOb5cpSMhToDekCXpuvoT
         5Z5NZD7ss5/Rua00eD5SFSnmWt2/Ax4qCVI8UqwvybEpmM6SOw9mpMPNVzHarDtE0LOM
         ZhFxHdA4aYufevJhqO78wnPeiFLmF9CIIoflX03pLo9xrmsHLwgJnHFwzupcDsmAdouK
         kz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781297410; x=1781902210;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozaCV3zBgAf35CcRqA9qTwtf3B/zxP/F1yET9wpKDeI=;
        b=DTLHdJGhQwquyLoLOBZ6SXCfqooTLYOX6Mruh33t6SOEl9BxoWfDG1FuxlJdGCs947
         Eb40j16sxmoYKDNf5KNKwErISeIhFWRDq+wkUX7L7w5SkfVNGeph7jr5vKRRur5sTj3m
         H/h9SO8vMos8gy4qtJ5fZ8dHcjZjI1P1JkJwB5RIhQJ/JMrsCeAWj5ng7WKrIFxali9T
         wBJ7QiVy8caFqBKzWSX4FJ3r1gJ7q+xPwhpPHMp23Yt+N3EEbtl1/oYfn9qWSMmomhUO
         wKlFAYW9eIc4pwqQ5eSHyH946W2mKWmSnEPZ6c2ZvSWPVgRpJ49F6Fo4/fJbSqSqWpC4
         xNmg==
X-Forwarded-Encrypted: i=1; AFNElJ+yXRwAT1+honyB61/mFj9Q5Aj11dTWoqqzX0UGvLyfi4jBG47Gknc5aOY4D17kkOLlWW1Z+Ucxp0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvguwjZhO2i6jnORstd/dTQ408IK/OwM3lJqSyOXAYvjXBTZHZ
	Cw46sufnjzDbiQDRSNoakXwANU9sPoLi44XZn2GobPswS3ASe45MLJ4yq9pOf1cTBQ==
X-Gm-Gg: Acq92OEDv+MK8iwHgm3iI43xU6myFVsm/V/kh+6iOdT9HEUX+tsA7kSFuU+RXqzHzKW
	hgAfi5ZgjjueFKlzSE2dd/4NifRszio0IXbzCqgrklRXgTy1KTWGevOSFVvU35/gAJQ/EGbl2Pc
	KGVSZ03spbiBf6IubaBaTzDc5PUpEwF+nUlbx++eCJxRt/NQBBtS9YEuhKhK6pYj6wFuhtpVHnq
	XWYC3KSjqaoWd/YmTI5afbnkQZz9CDbmo4zjGNlc6IWCrxowLBPneKO6vMi1Qshob7Chg2/DQzY
	zc7aDeJCjAJnYDufPtOZS+Qoz6wHB3tzp0ifwG3jn9WXYy7HpHEEws9fMRDtGELQIIm37tXWRx8
	4MEy37ophFc7iZ4N2jlIxMeGbChXfTbSp4nU4iW2khlNNL2nWnJtncH51cKpiDzyo35ZXfY76tA
	xzFQ2EEMTo4JcbhXxp+zJ5kDnpi55ZDxR9MqmYvcsPuGwsYsQKVDWul6cXo2NxVE7uf39F4uAF6
	4BZcvXSQuV0SQAW091YO5cYdfhmEcEI63WhCla7Y5lTUP4VFxwZwLOdGA==
X-Received: by 2002:a05:7300:641c:b0:307:42fc:584d with SMTP id 5a478bee46e88-3093be13b99mr824349eec.17.1781297409079;
        Fri, 12 Jun 2026 13:50:09 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:2e25:e54f:a73c:729d? ([2a00:79e0:2e7c:8:2e25:e54f:a73c:729d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48c3dcsm5106983eec.1.2026.06.12.13.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 13:50:08 -0700 (PDT)
Message-ID: <f2730998-3e09-4647-91b3-7e86f82b59e3@google.com>
Date: Fri, 12 Jun 2026 13:50:06 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add support for Battery Status AMS
From: Amit Sunil Dhamne <amitsd@google.com>
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
References: <20260602-batt-status-v3-0-a7c1c271f3b0@google.com>
 <aiG1aJY7VURSJOZ2@venus> <6ea3d71f-ec81-44b7-a0f7-d10adcb4c834@google.com>
Content-Language: en-US
In-Reply-To: <6ea3d71f-ec81-44b7-a0f7-d10adcb4c834@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sebastian,

On 6/8/26 12:20 PM, Amit Sunil Dhamne wrote:
> Hi Sebastian,
>
> On 6/4/26 10:36 AM, Sebastian Reichel wrote:
>> Hi,
>>
>> On Tue, Jun 02, 2026 at 10:47:05PM +0000, Amit Sunil Dhamne via B4 Relay wrote:
>>> PD 3.1 v1.8 Spec necessitates a response to Get_Battery_Status request
>>> from the port partner (see "6.13.2 Applicability of Data Message").
>>> This patchset adds support to get all the battery type power supplies
>>> and query them to report the telemetry required to build a Battery
>>> Status Message. Right now, this submission assumes all the battery type
>>> power supplies that exist in the system are fixed (meaning cannot be hot
>>> swapped).
>>>
>>> Previously, I had sent a patch series [1]. However there were some
>>> concerns. Broadly:
>>>    * No client drivers
>>>    * Duplicating dt properties
>>> To address the above issues, we now have Fuel Gauge and Charger drivers.
>>> Also, I have rectified my approach to fetch information about batteries
>>> from the power supply core.
>>>
>>> While, the original patch series [1] added support for Battery Caps as
>>> well, this patch series only adds support for Battery Status. Therefore,
>>> I am sending it as a new series while incorporating relevant feedback.
>>>
>>> [1] https://lore.kernel.org/all/20250507-batt_ops-v2-0-8d06130bffe6@google.com/
>>>
>>> Patches in series:
>>> [A] "power: supply: Add helpers to get and put arrays of power supply handles"
>>> [B] "usb: typec: tcpm: Add support for Battery Status response message"
>>>
>>> Technical dependency of patches:
>>> [B] depends on [A] due to usage of `power_supply_get_battery_all` &
>>> `power_supply_put_battery_all` APIs.
>>>
>>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>>> ---
>> I think you want to filter on batteries that are
>> POWER_SUPPLY_SCOPE_SYSTEM? Otherwise this would also give you
>> battery devices for something like a cordless mouse.
> Thanks for pointing that out. Which one would you prefer?:
>
> 1. Bake this into the power_supply_get_battery_all() implementation by
> either passing the scope as an argument or directly implementing the
> filtering on POWER_SUPPLY_SCOPE_SYSTEM without the argument.
>
> 2. power_supply_get_battery_all() returns all battery type power
> supplies but tcpm filters them. Note that tcpm still keeps all
> references to all batteries because of the review comments in [2].
>
>
> [2]
> https://lore.kernel.org/all/4e4a63a4-9d07-4b77-a8dc-ba19c9a803f7@kernel.org/
>
>> You mention that this is assuming batteries to be always present,
>> but handle POWER_SUPPLY_PROP_PRESENT. So basically a battery, which
>> has POWER_SUPPLY_PROP_PRESENT=0 would violate the PD spec as Fixed
>> Batteries are not supposed to have this unset?
> Just to clarify, I meant fixed and not "always present". The spec
> defines fixed battery as:
>
> "A Battery that is not easily removed or replaced by an end user e.g.,
> requires a special tool to access or is soldered in."
>
> Theoretically, you could still have a phone with the fixed battery
> removed and the system powered by USB.
>
> So, while this is more relevant to hot-swappable battery case (, which
> is defined by the spec as: "A Battery that is easily accessible for a
> user to remove or change for another Battery.") it wouldn't be totally
> off the mark to add that check here.
>
> So while I lean on having the check present, I am okay either way.
>
>
>> Not sure if this is fixable, but you implicitly rely on the battery
>> driver to be probed before TCPM reaches this.
>
> Given the power supply architecture, the probe order is deterministic: a
> power supplier driver (e.g., the TCPC) must probe before the supplied
> devices (charger, fuel-gauge). Because of this, TCPM will naturally be
> up and running before the fuel gauge during early boot.
>
> Holding off TCPM interactions to wait for downstream devices to probe
> isn't a viable option. TCPM operates under strict USB-PD timing
> constraints. Stalling the state machine to wait for a fuel gauge could
> violate these timings and cause the PD contract to fail entirely.
> Furthermore, a fuel gauge is not required to establish a valid PD
> contract; Battery Status and Battery Cap messages are purely telemetry.
>
> The current approach handles this cleanly:
> (1) If a request comes in during early boot before the battery is
> available, we safely send an unsupported message.
> (2) The port partner will continue to retry for battery status/caps
> irrespective of the reply.
> (3) Once the system is fully booted and the fuel gauge has probed, the
> telemetry is reported correctly.
>
> We initially considered a DT-property based approach so TCPM would know
> the exact number of batteries (and their reference phandles) at probe
> time, but we moved away from that to avoid duplicating DT properties
> (based on feedback in [1]). The current implementation safely
> prioritizes critical power negotiation over optional telemetry while
> still fulfilling the PD requirements in the steady state.
>
>
> Thanks,
>
> Amit


I want to gently follow up on this discussion :) . Looking forward to 
hearing your feedback on the open threads above.


Thanks,

Amit

>
>
>> Greetings,
>>
>> -- Sebastian
