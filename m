Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619789;
	b=KDF8a8CZ50E5zoMUyEsmFeWUenFrz4xD0e+Wc7PNMzG6Z+7/wJKk22fQm+zmtGTbJmBI
	 HlLpKgcniMJeBWaazndTC01iiJxG1kjwti2QBtHy7w44RbQHVL16pZkGxtvSmNp/twSfE
	 nSucmDcGHJ+u4qanYE8m+QRnCKk/WXHgRoeYXgp4/cz51fdw8nwtgfXu3ZLK71e7I+kzX
	 ZKaiA9L/bHj8YlIvyUeUkyGaPt1fWjhQYJfnksUuWooQj3PpMAq9nL/gWVBqoxH6rNNTO
	 iXwzfMWsax4Jfle7NLMldBNe2Q3KWp72aTc0DX8OVbAZRg7BdGNqw731WoYgvFhzpkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fZhnpMGuy8q+jXTQK/RAHc/+Uuj/d7tbWlMf2HdxJHU=;
	b=GgNWeJFzB1KM2FsfDYxGDxtH0la7mZXL0apbuDO+341GbJAviR+84J/ppSBTRCvWM6RI
	 4yv22DSvdKGIbCoEgdUvhMgHiDC+FyXyHHPUNjekPFn6PHw1kZ93dUTXEZwba+Q0GyL3P
	 8bb1Cnw2ERahC5GSjVEW7KQ2UABcQqKbC9X+Sd4LAWdYLdN8Jos80QunJkE2BUSYpwWOl
	 8HwZWTwpXaGcUGvppJURX/GpPAHUqA0UXTQBq7HCnUkxxVIHCdkEaz3grxugQz7/Jy+Oy
	 GZjxV8wUnlUDajuQV3dvYCvjJKrsZJYzIqhqFgnKoOF5FAf4kt53IyHDV8edzY3S3zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RHwphIVO;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FE7606A329
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 15:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56FE7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RHwphIVO
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c513a854320so97928866b.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 07:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795619787; x=1796224587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fZhnpMGuy8q+jXTQK/RAHc/+Uuj/d7tbWlMf2HdxJHU=;
        b=RHwphIVOhqawxkHBNyWJGoTHoIONjZw5hdSAz7G6eZpZxXYutLRqFVyHNPqp2DVpKp
         Vzql0LSSc14wBe/3iQ8C5qavy0zPHQmEJTHMUlNB6Kq4by58yqRIFqKJAULrdtW2oObw
         UyGWoAUb9M33dFb/sKbWkRyC/hBX7EUKe2f/RQ1QJaPMWd4NbckoW4P263kzgPAX954R
         oc4glW1QnHwsJ7eXrhGm7qzd8FztHw6IcH2MmSXLyqALc/7tw16xDwcSBAE0bO+PwpRe
         pwKg+j0vnSt5Ddi0B2HJrmJD1LoPUKgchSeUrXC1XA3Dd2GTOdiUOdIfjsGM7vVPddoN
         JKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619787; x=1796224587;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fZhnpMGuy8q+jXTQK/RAHc/+Uuj/d7tbWlMf2HdxJHU=;
        b=J4kF6eGoCkE2VwsUG6PLosSPJKqiSvMPQbPvNylD6iJxUKzb8ikLIVzrJErBDE3GWj
         2eLWZHqaGNI/B0OjqFBaYYuoN6IF6o9eQADGB7e+VKUzu/TjV2RqcKnM8dqTUOb2KqQk
         sYTohSpj8SFWsIqSEAVRSa3nOiVEVdMRqfaqHRiF6z9fcmGxOxbn1LRRtid/KObHHcQv
         Ef4Hy33nCxhPkPZw6T7fWZZiKDwAGt2kX0rBu/PW5WdBvHQVZrrjncpad0zuhSNuA0nm
         +P7KQYvPk5YQx/ybD01JLufk6oCLTIp9Z6QhugZObXx5JjZHYmu3pp/XKlqDbtkyCL1t
         3pSA==
X-Forwarded-Encrypted: i=1; AL+hErG91MqRInPhCBlGIvTotmNaKbhSi14iWevMNU9ZuVU0qPXsum86khfUdq5xG+KDL125xjcFLUC2wpk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EBRVJ2Z9bvITT5B+WoTu2wys7mfSHf0fc3lDl7ba/r4ReF3bk
	AUnUvDF30nC5eVYsjp6X/NPpXu9SkFxRXj48BX3tDPZEUZRahfB8Zb74
X-Gm-Gg: AZFdTZehdCEhLujF270HGB5uei95w6E225tVdX9KvVrrlDnm6TcOjqNsIuhZLCW91D2
	OaGIZM+zqEvKlqCEICjPEGCtKiBZmY+ZER6Vi8yJRAeqwbUP7u8MAS5m8qrutr6zAqrY5zpJeRG
	S7b2az+gLjQoE+J5Pd43sYMCCXvOdRzWa5QBZQowNPUglMYq8krXwv0+UsC4WdbHfRIdv8iq0u7
	zn47u4r1TIoObv/lxc4xrIeU8CfbWaGcodzPvzjY/xABE5kXwyDrA34j1Mp+98614VWVYigvhbH
	Y1r8u6EmrU559C6af7FRk2URRQJ0bqA0L+zCvOEtTH2TjFcte1HE0Yn1HWrWJr4RUn2rf5HOKY/
	2hvG/S4xdq+jJTYigc+a+cpc7EnOgBwig9lATeiWr2/9ow4BoglVFnvEzO4YfkxVOTtd4+fz3jf
	XMCzyXSxCQJN2OGFgi5dfLGdjxvrZ+6wlzMZXfUVj0aiHiE/LTo6z1HVHV6b6uz3NrhiQdDRVbf
	i6DGS0gBxm6JOUZkNvQpeHW1/6ugNEZh+mJO8xYTPkbeyMgVoxeCdHl54+zpxNSqcl2rBWLOvtM
	h8aNhTqplS/qloMxU5bbSwbDyyBT7Qye8HvaALIWqnalKQCENfodhN7BvokSGf4lZA==
X-Received: by 2002:a17:906:3811:b0:c43:eae5:ee80 with SMTP id a640c23a62f3a-c513a84f5e8mr1208263466b.17.1795619787223;
        Wed, 25 Nov 2026 07:16:27 -0800 (PST)
Received: from [192.168.0.61] (firewall-214-232.seh.ox.ac.uk. [163.1.214.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51beef9244sm6971166b.28.2026.11.25.07.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:16:26 -0800 (PST)
Message-ID: <d05aa4e7-5c58-4311-a85e-6bfe9c31c62c@gmail.com>
Date: Wed, 25 Nov 2026 15:16:26 +0000
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
Subject: Re: [PATCH 1/2] thunderbolt: add opt-in to preserve tunnels across
 s2idle
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Sukhdeep Singh <sukhdeeps@marvell.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8fbb5876-e556-45a1-96b5-4a8061de9e5d@gmail.com>
 <31d3413a-9aa0-4208-8e15-3ba85829ef79@gmail.com>
 <20261125132228.GE191152@black.igk.intel.com>
 <a08cb3e1-10a0-4a35-9258-cd510b91985e@gmail.com>
 <20261125143531.GG191152@black.igk.intel.com>
 <8e87af01-02a8-4714-827a-62c5beb6f4e4@gmail.com>
 <20261125145207.GH191152@black.igk.intel.com>
Content-Language: en-US
From: Tobias Heath <heathtobias@gmail.com>
In-Reply-To: <20261125145207.GH191152@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Mika,

That's clarifying, thank you — I hadn't understood the two-paths 
distinction. The behaviour I want on lid-close is Path 2 (runtime-idle 
S0ix / Modern Standby), not Path 1 with the TB fabric preserved. My 
patch is a workaround that patches Path 1 to behave like Path 2, rather 
than using Path 2.


On AMD Ryzen AI 9 HX 370, I'll inspect amd_pmc debugfs (I assume the AMD 
counterpart of pmc_core) to confirm whether runtime S0ix is entered when 
the system is idle, and whether any particular device is preventing it. 
If Path 2 can be made to work on this hardware, the TB patch is probably 
not needed. I'll drop it in that case and keep only the atlantic fix.


Would you prefer I withdraw PATCH 1/2 now and respin as a single-patch 
atlantic submission, or leave the series open while I investigate?

Thanks for the pointer — it changes the framing considerably.

On 25/11/2026 14:52, Mika Westerberg wrote:
> Hi,
>
> On Wed, Nov 25, 2026 at 02:42:58PM +0000, Tobias Heath wrote:
>> Mika,
>>
>> Because s2idle is Linux's path to Modern Standby — "look off / wake instant
>> / state preserved". From ACPI's perspective the system never leaves S0
>> during s2idle; the tb_suspend_noirq callback fires anyway because Linux's PM
>> core runs the full suspend chain on every s2idle. That's the mismatch I'm
>> trying to address: the ACPI state says "we're idle in S0", but the TB driver
>> treats the event as a real suspend and tears down the fabric.
> Ah got it. So no it's not the same as Windows. In Linux there are two ways
> you can get to the S0ix and you are after the second one. First is what you
> are doing now, that's suspend-to-idle and it is pretty much the same as Sx
> is except that the OS idles the CPUs and is in full control. All the
> devices (not just TB) go through a full suspend/resume cycle (typically).
>
> Then there is the MS equivalent that happens when the system is running and
> is sufficiently idle. All the "important" devices like graphics are runtime
> suspended (screen is blank) then the system automatically enters S0ix due
> to the same mechanism, CPUs are idled. This is what you want I think.
>
> For that you need to look that you have all the drivers loaded and the
> necessary firmwares and there is at least on Intel debugfs files under
> pmc_core that show what is needed and what states actually are entered.
