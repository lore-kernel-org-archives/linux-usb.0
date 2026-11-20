Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207204;
	b=IyWIV+uMExwZKa2E8NZNYwIQ6R1K35JqGaCY38Krir6EEL9aQiJjX0u3/R9ppod4LjXq
	 ygcgphYnOJSd7GPvn1A6hgekkiwRTc7VCJz5qGFR7wqya8Y3Sgm9hhmNumi/FEMSZjOcz
	 7L0qtGgVblRp5o5qeK5TauvZe26CxMpxL1xXBY8mM+ZLCe6INdKvF2HnGFiZrZCleFJC+
	 V1sNN5AtKvXm/zNdzad0D2E92r/xIykzwWZzbPy0I1/mnl6MqtzhBOJZGRiS9zv7G+zNl
	 llGA7SXJLZduupMOr84T2QAjNaPGXjSRcoXyNx0Aa+8u7IUTClfjtJ3qf49aVjPRQYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=plXis2+j3KrzvWPo/wIbjtAol1ui8nmUlIWvCiL6mj8=;
	b=xLAVR74JKOEFtkDWeqYCZrypFZ8VsfG6TROg31SSTJLbBNA4m88DuuA0jxP49Oe/+Lq3
	 NC8bLR8F5dDOMU67UCUL41xOqUoA0a13UHUbLLgOtzcNPc/hu+e99SiwvSSw+1pWExCAQ
	 gOmqweXR6nrzdp/3PeKFlXTXdOSAbdmH/wGIAPgtKrwhFNUtpMDk4cbXOWUDRfPE1H49R
	 9e+eN6/Sj0Jw430r8kmA79lwCy7Jm0IZyfwclXD1fwbDOWyYO1LLJgUOgdnYuQ2/ckkR4
	 DQTGr2tBFpZV+5B5R002NNfZIau4mIMsItfe84liZlwphuiVGSAhaQMhWbXw0/+Rwtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=KYT35hgz;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5EB606A6FD
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 20:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC5EB606A6FD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=KYT35hgz
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-86288992de5so1030074a34.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 12:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795207201; x=1795812001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plXis2+j3KrzvWPo/wIbjtAol1ui8nmUlIWvCiL6mj8=;
        b=KYT35hgzB0DochTPRWROstEG4t95As8xU+kxij1UaDdw/iyzi16e6JJWSOsGBWM91p
         629IjMoFpo5YIjTy1tg6b+mA5qLUs9a3R16AZHEQrQZaE6Uh5VyRuOn4VSSUWah9NdTa
         gtxGhVJ+Biz5BRK791PY2FyAxvIzOPdMX8+6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207201; x=1795812001;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plXis2+j3KrzvWPo/wIbjtAol1ui8nmUlIWvCiL6mj8=;
        b=LSQYx2LA487ZGTZKznsazDzSHwSZHNLvH2xpoecBfrC4ETqkVLzr0yHZSHqd9SRFJ2
         3Jo+CIX63o5Lr6EDiz5hI0UqBZVTk8l5VPCptZwwfyrUabU5HNoX/NM1lsDUbb5er6Fc
         aMOYLw+EiS1y3BxTQi1mv8NQEI7UwfUSDPaWPoeB5p6zKqWJbIm+m7C7c32H8p9Z12VK
         S6YrsnSxaENxy7bp0bTjeeP3q+oYwDUvWsP39PA/6x3cCVp7ZJLpTi+fDIPj6lyTR/3B
         8QosbbCHUowNjfZ8eb6SoJ1ZYJzXNjfjfHSw+KaSlAsz/YAHoqM+nr7EjbqvdNBI6TON
         UaNw==
X-Gm-Message-State: APuU4Z9tUdhF1dX+wQZ89zhcIbHVsxPnp4lDsexajA3gCJOgAF9dJZxY
	3xKkWgEzAhfeWzZoQo14KPxDGHaTXNz6LxoojSYHgIXMwVzEiTSavlUzTGVBPTsYcO4=
X-Gm-Gg: AYBFou1l6XL4MgEene+GOE10RTJQlBfxILKfsD0uecR2lNgQ9LcbfBhQo/09VBSfsJn
	80HqCsZHo79k78DmFXJc/yq3Js5YoGNSMTtDsBgvE3Gb33tUY8KshJFyY0VsIC9Dk041qJ9NTql
	t0GGrs+BJBbN2aXTkeJW2S6YNV1VoAnL46eL7Ivs6SuhjBfFCu7hNza4VBubkZBrgBolU9M0Wfa
	FX7oQNLvq5MjDfapTLKGCwiMV3lUcqQN/n2TIvjVMdnhw/4TAL+sx3Muc+S/sNmlkfekYfCXBK9
	JxCWeyOeyNwu3/O0pxemErNaD73K6/2fGyiX48ugjhOjjVlVcrNSuGcx09rOOkBc64M9GMDM/8A
	Hc5v+exN6aXBtB9iilGaeCudKwvVu+cBQTdB51PCgZ0Aj2mEkGCY86MT4t9ZpsYXq4OLQTBaSUM
	KCrLYrqlSBRXGzp86FrYHfr87e+JE7ozzwlYNZWQ7KRuIsszp+/oqCQFmIAQhgHZKkUEa6q2dv7
	Hw7vZxrUeSttSC6b8jLLHfgB7z+pcrpnPkbhTgVebOAg/G/4PkKrtOEVzhj2Ul7IYS0eObnToDy
	57juhTV79dP0UXSPGXwBuQaRoosCTEb6b+r6dAg=
X-Received: by 2002:a05:6830:4c0e:b0:862:b1cf:cdcd with SMTP id 46e09a7af769-8631594f21emr3927053a34.16.1795207201193;
        Fri, 20 Nov 2026 12:40:01 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6e7sm3195252a34.12.2026.11.20.12.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 12:40:00 -0800 (PST)
Message-ID: <28270951-748d-4717-bb42-1e73e4847f71@linuxfoundation.org>
Date: Fri, 20 Nov 2026 13:39:58 -0700
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
Subject: Re: [PATCH 0/2] usbip: stability changes
To: John Ernberg <john.ernberg@actia.se>,
 Michael Grzeschik <grzeschik@puzzle.ch>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
 <131283b8-0d92-4277-9dc7-eebfe30de5ae@linuxfoundation.org>
 <d9cbecc5-3130-48f1-adfd-4483c1bb4031@actia.se>
 <5ffddf60-7549-45a8-8b7d-496967a4e91a@linuxfoundation.org>
 <f2bca889-4554-4daa-be61-635fc193a276@actia.se>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <f2bca889-4554-4daa-be61-635fc193a276@actia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 05:33, John Ernberg wrote:
> Hi Shuah,
> 
> On 17/11/2026 00:16, Shuah Khan wrote:
>> On 11/13/26 04:34, John Ernberg wrote:
>>> Hi Shuah,
>>>
>>> On 12/11/2026 23:46, Shuah Khan wrote:
>>>> On 11/11/26 04:34, Michael Grzeschik wrote:
>>>>> While using usbip on kirkwood embedded machine, I came accross
>>>>> some stability issues. This series is addressing the reference counting
>>>>> on and usage of the event handler itself.
>>>>
>>>> Tell me more about the stability issues? What doesn't work
>>>> without these patches? Do you have reproducers for these
>>>> problems?
>>>>
>>>
>>> Since we also had the issue that 2/2 solves: The issue we have is that we see occasional CI failures with ghost USB devices remaining on the client side after our system (server side) had been suspended, even if the device was removed from the server.
>>>
>>> Applying a patch 2/2 (or our version of it sent earlier) solved the issue.
>>
>> Hi John,
>>
>> Can you send Tested-by for the 2/2 - did you also test patch 1/2?
> 
> I have not tested patch 1/2 because we have not seen that problem in our use cases so far, so we do not have a measurement of "good" for that fix. Michael will have to comment on that one.
> 
> Regarding patch 2/2, it seems Michael prefers our version [1].
> I can provide a tested-by if you rather want to pick this one.

Can you please resend your patch? I don't see it in my Inbox.

thanks,
-- Shuah
