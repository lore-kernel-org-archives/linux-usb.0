Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998058;
	b=ANVLKD71TOXDe19YVWrPBXkhaSFa7M7Ezg3bfWH3eKydZggEcFb7pDEZygFYnBRrC2UL
	 5ZUXY58JmmRIUp9+yzKqT5ncN5FQeCqEcPua93qvmOWR6SX9MR9U5wyzSHvDqj7ad2nGP
	 n771KdiUj6FzO7orGJqVf+I/W6BObS3DbjM+jo0mse3/Fmrmj5JA9GtlgX/88EaVQqFNE
	 g7f3l+ew0HhCF+7a76Pi+T8Fy/MiRlZe5G2KVNPqYOtec03yf3CqX/DSbpIiYc//PTCu6
	 J5GNG6V28inK7E0AlQgswJC+CpgkdGvLnycHqE3jZ8d6FQocEE7ZFAVh+1lAUKL3ZAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=U2QQjyWbT70hmVOjy+Urh/lCP/006FZhYTJo1HSrud4=;
	b=xLUC+6wHYGW/mBgcBsPD6yXNDEvzXcXW7oSPbeXY+IN1x5aM+8tYgWyjcgytCFnQo2sa
	 nwVdgLEYx3S5cywQohm5k3paci8wzMUcqPstOK2eTwmLKXBc3kxFFV74DyIHvPbs2Ov8p
	 lVjya1IK1PHl34cVg9CVPUJpN0Li5pSEsANLUZjIt+GfpW2W03soswEiTYEfMEYhmL/Rr
	 Auf/DTM47Mp/V17Ck9yzCpfldDMBFqlzMvEhXq9dMasxOuIOsrJSJgH3brOeJsTQsHRpd
	 D5pcBBiPeOmouF5QrYjH5zHdnvBXt4NYJUDVu3Ix91d9+3o+isojWjAXsDh/IaHAl9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DEAu9e2l;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12317606A33A
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 10:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12317606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DEAu9e2l
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so8272035e9.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 02:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794998056; x=1795602856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U2QQjyWbT70hmVOjy+Urh/lCP/006FZhYTJo1HSrud4=;
        b=DEAu9e2l6lcFtub7YY15vLcAuymsn2f87/Ab5eUiMwE0ab9eFPpvtTVcaoIfCzDmEC
         05wKF2hKpdRJav6N21n77rZziny2gbjZf3GVg7n0wDz/a53QWlo9YD31XUsUsSRxrbnG
         8kjP9MS+4v2X6PbX0A6uJ0D3ipmu5ecMkQw8DnqeUXaftqz+x9TIrQdZcU2R0n26KA2k
         FJIRUmzJYAk1yz+y9BVpwuZOFOJVF+k8g1QbkF44T/VuTANUIObIKUhqU9u2YSCsNi5Z
         D0Iy8qjLYE+AXQhsL22zjaMgbL5NUG2Xja5vkFXQhD4AlFEd4c/VX/hThAVP8SDFlHEN
         QLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998056; x=1795602856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2QQjyWbT70hmVOjy+Urh/lCP/006FZhYTJo1HSrud4=;
        b=EYRedeRgWMOEcCp7Jlh1tvouPMBS5Zvn665uRsGy1lpC/CsxZDC8ASm2dybeP2VA1z
         lX5Bp2X01cvyg0QOjeeozcyKvYXmFpuDTKDVovoqJEc4uy55/U/HyGeeuPiX1Uxncc1b
         a8BjhugLv7GkvLSQ++L13eMaxvZKnBI3FXN+g4iIOIOfP/RhSVW/6asBxNIPeO/vEJct
         RspogX1m6MDpCuImxVjwCsCDsl/jxkGRxm61Amrav7JKA8hm/GD7JLJtD5qauxf4cSt9
         zIB7K+SLkvRmjkAXPtTZEGSNdm7zOuL9DdRSAzfd249MCSK/nZp5JUFO9MoxwZKEE4j/
         VoMA==
X-Gm-Message-State: APuU4Z8aflr2Vt5eWRtlqwufUD96hPj25znwTw0P/ze94PeJ5IcT/CRB
	xSrNjYMUx9d5/oNUpJSDrv8I44K+0a/EeVhkaIfBgprAf2cWYjVFmx4oZaMoZzu5R5NukWS84hw
	EvO6F
X-Gm-Gg: AYBFou3LR+UHWRxXShD8E0UJKlYkUotbUwuY46rM8AzdCgnSsXpmhWJ2vKWym+aahLf
	pSK1o+rI8kzgt176vq4aAyzxkU63kdPfI5BrS+Ey/eXQ/cpXILsbfLyPRT0VCCEKJzot+AqrOzR
	ajjwGARhMXdCkhz17JKRhMStbA/1W6m7aGq8xUMprR9Gkp54owmL3DpseqkOkCqwPn6g5OrZrBd
	ZNxVyUD9SlvyYN9/xGsewse2dh6m5SbBkkEwT7x5cwclumjfRQFrKefC0k+I9MdER7GQ5QLqMXL
	vsqYUw9/w6BOxZE4JaRD+UXU01TFOZKIJE6XCxSXYFbB4Fw+GCdV84sB9bEQob/jf4lz1v4nmOy
	l4Sjs8EyPzDdU31uRo6nl7wsjHjZl4s48T8ysOSypysyZumEK0Qaqo8Gr/FLHc5tnPKAyyHHwPm
	MsceS65KGqzSz5I9Cz+zeBdyvvbej/JpGJMg0jGGW0NFbQTDNH4jCGXBZApEXsrYX3A3hbHAeVr
	lHlPVziZUCdvPCm8WCGmZybLBPN92inKg6lgnA8TE4yniJ5MNNmCwU24X0Lqqq1HV26GZuKeDMh
	UweA7z2S9qEpTcz6A1XH+UdHCkIlVNhj8zWAHUdtUFbEwOhFQ8MGBZjDGHFjO+yKHq4AlnsURQ=
	=
X-Received: by 2002:a05:600c:354b:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb7da3a1bcmr37004325e9.26.1794998056414;
        Wed, 18 Nov 2026 02:34:16 -0800 (PST)
Received: from ?IPV6:2001:a61:13d9:c201:adce:19da:dc12:b6eb? ([2001:a61:13d9:c201:adce:19da:dc12:b6eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d29c622sm58981445e9.3.2026.11.18.02.34.16
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:34:16 -0800 (PST)
Message-ID: <c9b81081-05f3-4c48-8ed4-a02d13e3ec85@suse.com>
Date: Wed, 18 Nov 2026 11:34:15 +0100
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
Subject: Re: [USB] ASUS 0b05:1932: UAS performance observations and cache sync
 errors on disconnect
To: linux-usb@vger.kernel.org
References: <LV2PR11MB370525AFE7C54D5793207BA767F27C2@LV2PR11MB370525.namprd11.prod.outlook.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <LV2PR11MB370525AFE7C54D5793207BA767F27C2@LV2PR11MB370525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.11.26 08:22, Miguel Ulloa wrote:
> 8. Questions for maintainers
> 
> I would appreciate any feedback on the following:
> 
> 1. Are these findings useful for evaluating the continued scope of the US_FL_IGNORE_UAS quirk for 0b05:1932?

Yes, though it depends on whether it is possible to tell the devices
apart.

> 2. Is the cache-synchronization failure during udisksctl power-off a known or expected consequence of UAS device teardown, or does it warrant further investigation?

This is a known limitation of UAS not using soft disconnect.

> 3. Would any additional traces, kernel configurations, or more targeted tests help clarify either observation?


We should start with the output of "lsusb -v" for your device.

	Regards
		Oliver

