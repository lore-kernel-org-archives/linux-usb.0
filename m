Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616821;
	b=HsyZ1WILZLxME/vZAVMMTJguSOs0w9Y4y/SVTGpcsAfGOdh8b3saYBPiFiovhlKueuZR
	 5Vp9H48JYeiCPiRWxg0YINM36bw3sD0ICY3kFptw8OsZ1tyiZkiGVv3/5yU/1EI06pftF
	 H9g16M4PNkyVNanXbzTR36eKLxq+gKq82jMeRRLliEir8AH1Qqj8qsCo8iaYX8ZaOI8xf
	 ijjPIK8oomNFlZ43Xwk9mkTZt5r/N/b1gUoTU4Ge595FNAYDVNhLc0umaFxPJMXBzmFBL
	 G3x0eAVTxU0gZmYphXyCKgg/E8SPYkyKZQuJ97zq8/NzPm3kvBm5oQCIX/X/wUfDjWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nOfL+FVZ2BrVGbwc52XxXvSw2wKru+ljcM16VUgsDSY=;
	b=xYLwaBefeUip5EvJ9Tt+b5YM4uv8IETgz2Q9xYiAPSvsGXDNcwQ31lJHpcyR/84xY2DX
	 Z4jKvXA7SHdR4VpVnQV8DKaa3g3MB3R7tBpz39cQ9MD4oFiMZwqTzm2bYeLoW+WI1KBfx
	 bCQbzVwVwB2Txf0RWdwEWU4/4we4sVb0BjHCUVR/seDIlM5NQDCDBlnhJa25zbPFUR05q
	 DNNvOpObuvBEWcMm1qPsKaLEt/3QoHjja0Am9yo/dQ3G6F3Uq2tFozFt+QDPHPAakAA/t
	 st7hf9WopUah0KCNIYbxE86Fs+cUTEYFiJ1OOVcy2WeRzYCP7slyqGSr4qoZvy+1DRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E+KYL0ej;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B065D606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B065D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E+KYL0ej
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a358881793so3052183f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 06:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795616819; x=1796221619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOfL+FVZ2BrVGbwc52XxXvSw2wKru+ljcM16VUgsDSY=;
        b=E+KYL0ej5L8NVJgoZU9STxOaqN5SOEr3DBlsqsFwlMlHgkqo4kNPwC3SOOlMIQASAr
         Vcf2oyZx31L7Mmsp57zAecqrOoxcpMpJwtn0UkmT24kKH54YaSnhaairutIqbvrdKbZ9
         +H6p2rs7yrNghlql3ztopmaf3+RaWFUt/N+g5Rwy6uKGLkfsAjew6zBZPY5zCrYHV1d0
         MGn0l8EKrFt3q9TUTSNCYWScLUTeYnKIzAOJ+mg8eF9I5inPBo2GUtByJ7ntI+8izJlr
         /mJ/eylFfZJ6qQPdWk2fuhRgnTI23jtUyVST3Ywxy/ZvhVu2iFhKMG5e70UUnDBeX+Xp
         uHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616819; x=1796221619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOfL+FVZ2BrVGbwc52XxXvSw2wKru+ljcM16VUgsDSY=;
        b=Qm1kDwn95sYzc+hu6+/syacs8ovTToj7ICLUBvQUzW21eZgEYMg/OCpy5j050HCs72
         PM8WtHK7ZZKZzcG6GHNbwD9XQEv6+Z0OLrlPk5Xu4+060h+Zre8teneEGLhrXJeEkOjV
         Noiqm/QZ3vze5VwGFtm9AgIohb7RPm/dh7WnOBBmsgi0rKre0wUx1gSEIJyAbOiryVLR
         FiZya4YkaH7R6vv4V3HJvYMh8OGTLOoLALwT8WP79MLNoJ62U983ihhwvCAndVplVHpc
         jaJkSjYWOLUvE3RvE+TNeb1dVQ9QUE0GYAgpwDuwHdRVfpSb6Z9NroaB9StxeK87RUxG
         IfJQ==
X-Forwarded-Encrypted: i=1; AL+hErFPiRN007M343HJH8kg3iYu4pD0kwcUb6YYSsNMSnU5/xOP47KaFuenHhR21zvy2ohVhZkv5IXJo+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9maUUltzbZKPM4LA1GijBMX+s/HUMBjGZwzdamKs8Hze/gwMU4
	LyQ4DcASPJBcb2zCMDIwon7NZ6blAsi3J6cy9/LNPLrn8SeLZRAqmAQw
X-Gm-Gg: AZFdTZexT++NFaC2M5mr2UIgqSb0kWoyhXCpoGXdGjx1JtK6r1BbSLXDR5wHErCiFYG
	r9MhyH9GsjBnKSp32SHGSjH1eHab8SwT5iWh51ss6TEEvCvqXJGKi+XZoEPhrSQ+IPYeMTxvnUK
	wRbK3dLLsh9oGLdu5/bnDkuVRHOcKO6PNMh1w1Tajz2i96N/47S9Zpr5Ly6gySIhN2A3ECnI4wo
	W5hgXVQM9XZJIpJlLqljlEJqX+WNaTJWB6nexr0TVRP363tH+hgVPq122urJsX1c7dwyrQBQ6RI
	tFiT8a+lodsQBX9ITEXAEa8h0hWGvSlbytv9AsVcktddyQ58ZbYHkJ1CPiycRnKSKBs0SpMjAkx
	1gpOy4G6cm7YAT5REOAsc/bmkSr0jw9VujYq4AEIc9RUZdcJujrNMcTNkZ4dr5aGrfbHL7ktlFv
	aboqWBpMl7551Y4KxA/j03Bq1Z65WQvYX8jBRSnP0WHo1peazuHmelEIIXbHkmdRe1TFjlg7ldC
	KkMWNLbfHvK8nJVw4EpvpMWwdco9bItSR6Mc8k3DzccZZmm1FppunX7oEhFwffL7MJGTiDqjG8Q
	ju0vjruosm6/kJf4T80auMbdBo/34PjmB/pf02DoMqOPQh3CwoDR7xU6Nc2sRrQP2A==
X-Received: by 2002:a05:6000:2310:b0:4a2:ee0f:4fa3 with SMTP id ffacd0b85a97d-4abad6a4224mr39050556f8f.8.1795616818830;
        Wed, 25 Nov 2026 06:26:58 -0800 (PST)
Received: from [192.168.0.61] (firewall-214-232.seh.ox.ac.uk. [163.1.214.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm31695107f8f.23.2026.11.25.06.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:26:58 -0800 (PST)
Message-ID: <a08cb3e1-10a0-4a35-9258-cd510b91985e@gmail.com>
Date: Wed, 25 Nov 2026 14:26:56 +0000
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
Content-Language: en-US
From: Tobias Heath <heathtobias@gmail.com>
In-Reply-To: <20261125132228.GE191152@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

Many thanks for your reply.


On this hardware the dock-side host router is pinned in D0 by active 
USB4 tunnels and has not runtime-suspended since boot (active_time=515s, 
suspended_time=0). The quiet host router does go to D3cold exactly as 
the spec describes. The s2idle_preserve=1 path keeps the state that 
runtime-PM would have kept anyway — it prevents the system-suspend path 
from forcing a D3cold transition that tears down tunnels users still 
have open. Would you be open to a v2 that scopes to 'suspend target is 
s2idle AND domain has active tunnels' rather than a global module parameter?


On 25/11/2026 13:22, Mika Westerberg wrote:
> Hi,
>
> On Wed, Nov 25, 2026 at 12:45:36PM +0000, Tobias Heath wrote:
>> The current implementation of tb_switch_suspend() / tb_switch_resume()
>> writes ROUTER_CS_5 SLP into each USB4 switch on entry to s2idle and
>> rebuilds the tunnel on resume, independently of whether the host router
>> and connected switches actually need that teardown.
> Well after router sleep is set and acked and the implementation specific
> method is run (typically ACPI power resource is turned off) the routers
> reset their config spaces to default except certain fields that are
> mentioned in the spec.
>
>> On AMD USB4 host
>> controllers (verified on Ryzen AI 9 HX 370; same expected on Phoenix /
>> Strix generation hardware), the switch config survives D3hot intact,
>> and the mandatory rebuild produces an entirely avoidable re-enumeration
>> cascade on wake:
> It is expected to go into D3cold and at that point you lose everything.
>
>>    * Every downstream USB device goes through USB disconnect + fresh add,
>>      device numbers increment, open file descriptors onto those devices
>>      are invalidated (audio streams interrupted, filesystem mounts
>>      unmounted-and-remounted by udisks, etc.).
>>    * PCIe hot-plug fires for the dock-side bridges.
>>    * The dock's PD controller is reset, producing a 1 - 2 s
>>      ADP1 ONLINE=0 blip that interferes with any userspace relying on
>>      AC state at wake time (for instance systemd's HibernateOnACPower=
>>      policy).
>>    * resume_devices takes ~2 - 5 s of avoidable work.
>>
>> Add a module parameter, thunderbolt.s2idle_preserve (default: off), which
>> skips both the tb_switch_suspend() teardown on suspend_noirq and the
>> tb_switch_resume() + tb_tunnel_activate() rebuild on resume_noirq, when
>> the sleep target is PM_SUSPEND_TO_IDLE. S3 and hibernate paths are
>> unaffected.
> Adding new module parameters should be avoided.
>
>> Measured on GPD Win Max 2 with CalDigit TS5 Plus dock:
>>
>>    Default upstream:  resume_devices = 2.6 s; USB storm per wake; AC blip.
>>    s2idle_preserve=1: resume_devices = 0.2 s; zero re-enumeration events;
>>                       AC stable; downstream connections (audio, storage,
>>                       keyboard) survive unchanged.
>>
>> The opt-in gate is deliberate. Where the TB tree is not preserved by
>> hardware across s2idle (e.g. some Intel generations under specific
>> firmware configurations), enabling this would leave the kernel with
>> stale state at wake; users are expected to test on their own hardware
>> before enabling.
> That's actually everything except your system according to the USB4 spec at
> least and I would also assume AMD follows that too. Why it does not enter
> D3cold is not clear at this point. Do you disable it via sysfs?
>
> There is also the power problem if you keep them alive.
>
> What we can do is to avoid the unnecessary runtime resume if the domain is
> already runtime suspended when entering s2idle but that's USB stack that
> does the wake up.
