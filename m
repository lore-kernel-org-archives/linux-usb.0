Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C7F38AC7E
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 06:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010036; cv=none; b=QTJx6uCv+eJJZwp6UppNArG6TrjzqOOxvN7LAXUPNdIZ75kcghikzoQXDh3TjE2acpY56QqchmqKf8F9qeKsbswFAtT4kffCs0OcAfnIpvGScEwnE6iZu3vi482qqEf85VeFM8vO4f3o09Sw89jHJKXsj2jmWYh9sVg6A6Q8GLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010036; c=relaxed/simple;
	bh=QyXyUIEjbJhtNHfUEsgKzNkLwk4T451USFyfPbPc34U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cL5GVf0W10YFQG5hinh+dIONXJCqLFMvZhRhpnwCqnNuHuopPyw4GAmAlIM39o9KnWE9BksocCO8CNzZ+IsO8TbdtAt3pShEBTQiuhdRkLwtKfFmA7ey4/Nw6Vz3MMyRInTcr+OoXNgueXLUYNO/JghTG7GfTASVfdfKY80Hzmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JpdbWPrp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JpdbWPrp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493f431e317so4980745e9.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 23:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784010033; x=1784614833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWonftaRHsp2QJOOP2/Zw1LuKiveR0smAimlqpU3fYE=;
        b=JpdbWPrpl1Cf5ra0ia0raaKyH4tSDbEzkcMPnsDyqzcesFu2nIx74wz/VAl5g6ohMI
         1CE6uQQ2q6ujKWhfHWaA1wkgaOHvlK8v6iq+bs0BEXlGWcz8gsf67sN2Mhs+3LGR9qdt
         1BaY7zshBIhR8JXPxcHA91myvsd3FdX4BgpwbYI23YnFzld/kewtUUxAQWKEc9VIKadX
         lRCpRYRcb5tlDl3iYLcefp1RVfv2MDsQ62a7jwzgxQK5z6WUFBucG6eR7xWVoMetBS1V
         uvWwCRgPEy14VL40paLYf77OOWfspqeicEMlGWwXZdGZDfzB04rrrcF38PV6h4FU7gN5
         dZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010033; x=1784614833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWonftaRHsp2QJOOP2/Zw1LuKiveR0smAimlqpU3fYE=;
        b=Pg/5mAX6Fio5267pW6F9r67Q85Ts7ctRmr2GQppytXLcMshnCCDmObR6BGW+JZHZw3
         uQnmn71b/wPWh4B94IB42Wn9uPR+p/lzVcr2ueez/GVw3B17LW68K6k6djVxgMPCauHt
         GVbZA0mKRnkwXoE3swWG4K8/RxxBoh622RhUShXftd2aEFTxAGGX/F8cTdFPa0KssDi1
         Vmqu6I9SQeXvd4EF4NwdjmygLwc3FLvr/FOCb4L2+Vf/ZZP/ETYsj9OlLC1JcH72+sSz
         I/8SpyuLmEP5GWmlgaI0QcHC2cO1joKzwm8ZjXNTHeXtUvQwkAWvDEO6Frlglpwgr6rY
         bzXg==
X-Forwarded-Encrypted: i=1; AHgh+RrsU/Q9q2wf3r+EMeMibOIAg0i7tk8pWSLTFnNbb3HpmjVc5sjDE0ny//+Jg6TYTn5FeON8x4GVesY=@vger.kernel.org
X-Gm-Message-State: AOJu0YykBK/smuR1nGt50CN+HlL2L+busBs8tXaCRJwstLcZPWODuB9w
	QU7Z0wRFJYauF47MBbD3DitN7FaHcjT1IFAkmhTPf4pp9p7G3CkK+aOvme5LJ8oVh2Rm+xwQJ2w
	tI5YG
X-Gm-Gg: AfdE7clpt40b0kGnJGM5PU8ZggKIFwvNyrww2f3Z8b0YziztPSIk7AbhaTqEMsumcUK
	My2OLdO214eFsJZ7U8CMtrMCHHjv1JTjosa4liBTra8AFefMtU9SCLJ45gEv6AbVzfPzmdhqHgT
	7SUrSHhhbcMW9uR0PZdCb9+eiuxm7CevQdKigRoS5BnhC2/qPwdLgrLrPhsb1Cr/Vlsl+KAwurW
	pf54otxF1BHaskEDfTjP7akYegyG/8KYDkmC3XcGtZM3r6ewrN/5pPMY7xk2YXrB54/feCTZ7Xa
	boFvyDfcXufunGZGritQmuFh2ZPqNYK8veqfEYIumDQAqW26H2xEkn0fzp3pBd25iC5W+u9r2g8
	BrSjN4pjC4Qzpb0z8xtLZG6cOy2Jgd5AzWQYjRAyROImsXK2zSiONfz5+lEsjIhdClipdtfpxPU
	1C6LT/m9o5+N0hKlMgx0Dxhzb2FCF7R3MxWSoMd/Q2Pl09Fg23xMrax+U=
X-Received: by 2002:a05:600c:16ca:b0:493:c1bc:79bd with SMTP id 5b1f17b1804b1-493f88180f9mr76016865e9.20.1784010033439;
        Mon, 13 Jul 2026 23:20:33 -0700 (PDT)
Received: from ?IPV6:2001:a61:13c3:1c01:3157:c849:4aaa:fa65? ([2001:a61:13c3:1c01:3157:c849:4aaa:fa65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495087366c0sm95826825e9.7.2026.07.13.23.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 23:20:33 -0700 (PDT)
Message-ID: <f298dd66-987f-4e37-ad26-621dac5b5d1f@suse.com>
Date: Tue, 14 Jul 2026 08:20:32 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] usb: core: strengthen size check in
 usb_parse_interface()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260713-usb_core_patches_1-v1-0-7721c2b33f53@kroah.com>
 <20260713-usb_core_patches_1-v1-2-7721c2b33f53@kroah.com>
 <b2498cb4-61f7-429a-920a-e27ecd7986e4@rowland.harvard.edu>
 <2026071406-ambiance-rogue-39bb@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2026071406-ambiance-rogue-39bb@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14.07.26 07:53, Greg Kroah-Hartman wrote:
> On Mon, Jul 13, 2026 at 12:13:04PM -0400, Alan Stern wrote:

>> No, because usb_parse_configuration() has already performed this check.
>> A malicious device can't avoid that earlier check, and so we don't need
>> to do it again.
> 
> Ok, this is my fault.
Speaking about fault here isn't likely to be productive.
The error is easy to make. I made it once. We have the power
of using comments. That place needs one.

	Regards
		Oliver

