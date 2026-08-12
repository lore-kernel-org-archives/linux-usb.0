Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152BE360EE1
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 19:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563116; cv=none; b=TFRkw/iIybyK1DGuE3ki0HLk5Yeu+wA5lHd09uWX+kGXhmiYDS8adHN/XSpDPpTJOqW+y+1dsV7nV4CCWXnwRNWNY5SXn14ilebJz9fYM2QagELz5YkkiXoMLmkIB7rf1pKN4awhxQx88mO4A9AjpHyGkbBJ8t+/hymr3LnhTGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563116; c=relaxed/simple;
	bh=+qQRiiUCwQCD20Re9tDOWLm8g4UGUDN1XvkW0NPnfeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLzo7xSEjtgaoZDGiQO7meCcp7/NY+Ua7a7rJvOERos9IkWMEGvmJTviG5zo3pohAQAwjUnmwf53oqbNLcQ+Fw9qg5/QGvohV0SAKDuS351o1pKY0ocf7qK/ZYYhW8uHieESuKuE9hXosrpFLhP8s8/CSQGBPnc0zjRreKnEHsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VSF6y1+v; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VSF6y1+v"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-49c38a4f110so802168b6e.1
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 12:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786563114; x=1787167914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JO8wtDZ5KajjBoQwQfJOX0LnbQbHRiyuBi4hT4PtKNA=;
        b=VSF6y1+vtutnQm/EvqffHKrP0Sdi+0qT++1K4ASC8f63M/bVDsqbMiq5QUcJzF81T6
         1jrKTxFQq6uWh68lv///k5KskrK0I3PaLJCba9UpVToSnwnt6MxFJeMhMCc5VDD+fX/L
         bFvq9aC6VI6JqXjQe1OiUFxqSAzbwQrtrHwrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786563114; x=1787167914;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JO8wtDZ5KajjBoQwQfJOX0LnbQbHRiyuBi4hT4PtKNA=;
        b=PdCk9FE5pBMJnFaf8WrhMazUZDVAiVJshdIj/BiXBaJbHZ1z5g0m+B+V2GTQ8u5gJd
         lTpjoX6mLLJ0yNTGwA/kZRGOeYSrqIe4N8A+prvGxg5LE2deq1+Gdr/GIz/BWy/mBVU6
         NXPGisa8TpDK6YqDhbqG/VXCzKpdey+xLPO5gonMfIVY7bzT0eTlXZGY0xqRa0B/W8iI
         4uULDn+3NSsNmKZPwWPYJ03RPY/vMiolgqE95oNFBUYexM2UmegKG0MZWenJUeCWn5KI
         k8Wqhk6+np5bCq/951mNvn8H6JPAKO0IuEn0qCTCUNJdd5QERpeUCHg1r+MeM+NvyK/b
         SQtw==
X-Forwarded-Encrypted: i=1; AHgh+RpwjxNc5Tfy9xWQFna/yW5tzqOunb2GbviFQ/JyQP4CJUUdRMnCQKA49TYSOiycJtsjGtvNR1QSHD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxUBoCUPW87Z14pWr7MPLULXnDUEiySjFDwI1XybLbLakZlqhf
	oKWT5zvarjOUPcB956xU5IqlSNhoILQdKmX/5Mp6EdAQAqt0iqhFMhDZGABZtr0VYiA=
X-Gm-Gg: AR+sD11YtB+XjgRqAsldDfai+XRMgsL9M+MAxLKZtGWGXXGrDwLjOwHaukQMPZmv2U6
	iXC8/2IQEBPWj4+wOlm5DrLlAlqTQ8B0xM5KMXkFMVM/i5G7Xy9WcGrrd9Gwrm+lLIk1xBWBiEG
	WNd4131h+GE5Fx54Ztm5au0OtZ2Q7gi7eBtVFb5DNFyXElYsUQG7LTvQ5PMED7UcXvBwjgW9yzC
	02Rb7D5YzszRysH7t7d/Njm5k6nj90xCh7Lz00bhfUXZRtpYCxMmyNBA9wVLj1+gm+1yqx60AnU
	bbm81BxU17+7zVzByd36JVDZ9YfLMwKTU9QFpNcY+tZv3rs5bsJAKMjWHkPcNze3h/bPJ+Jy0p3
	mHkhs+/mcjeDyOgvsaDZIFaZLebus/Mt6TAuNdv4x8GP8UcUgh0RXwxLKWZb+3iy3w0chjeo9CZ
	j038Sn9PZVClhg7qtIa7mJb8Y21kUpk9Q/472u8cQpz7DDuLPuX+VnpJpDWFuQTaU6zhjVzQ==
X-Received: by 2002:a05:6808:640f:b0:4af:5b7e:e5ce with SMTP id 5614622812f47-4b227790286mr185589b6e.3.1786563113727;
        Wed, 12 Aug 2026 12:31:53 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b22347c0basm631294b6e.6.2026.08.12.12.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 12:31:52 -0700 (PDT)
Message-ID: <647d51b8-bc02-40a7-8cf0-3a76f950c7ad@linuxfoundation.org>
Date: Wed, 12 Aug 2026 13:31:50 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] usbip: usbip_host: remove legacy rebind_store in
 favor of drivers_probe
To: Jeffin Philip <jeffinphilip14@gmail.com>
Cc: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, shuah@kernel.org, stable@vger.kernel.org,
 syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com,
 valentina.manea.m@gmail.com, Shuah Khan <skhan@linuxfoundation.org>
References: <e3473010-e995-40b6-9040-e38f51d1a6c9@linuxfoundation.org>
 <20260812024050.11267-1-jeffinphilip14@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260812024050.11267-1-jeffinphilip14@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/11/26 20:40, Jeffin Philip wrote:
> On Tue, Aug 11 2026, at 16:53:23 -0600, Shuah Khan wrote:
> 
>> On 8/11/26 10:05, Jeffin Philip wrote:
>>> do_rebind, which sleeps normally gets a mutex lock. However, it does not
>>> or should I say, cannot check for null udev between spin lock dropped in
>>> rebind_store and entering do_rebind. This is a potential race window
>>> already. So, even if we check for null udev under spinlock, we cannot do
>>> it outside. Regarding do_rebind, it is called during stub_device_rebind,
>>> but that function is called during module exit when all files are removed.
>>> So, do_rebind is not designed to work in a concurrent environment in the
>>> first place.
>>>
>>> We have a safer function that can already do what do_rebind does,
>>> drivers_probe. So, we use drivers_probe to rebind the device rather than
>>> use rebind_store.
>>>
>>> usbip tool references this function immediately after the device is unbound,
>>> which is safe for the tool itself but since we opted for drivers_probe, fix
>>> it by using drivers_probe rather than rebind_store after unbinding device
>>> which is more safer.
>>>
>>> Tested and working in both userspace via the tool and manually echoing
>>> the busid in the related nodes. rebind node is still left active with a
>>> warning to use drivers_probe upon encountering rebind_store.
>>>
>>> Thanks,
>>> Jeffin.
>>>
>>> Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
>>> ---
>>> Changes in v3:
>>>    - Removed rebind_store in favor of drivers_probe to eliminate race
>>>      condition
>>
>> How did you find this problem?
> 
> I found the problem on syzbot and had to reproduce it using the following
> commands:
> link to issue: https://syzkaller.appspot.com/bug?extid=af76b01c9a0f0ab60fb0
> echo 'add 1-1' > /sys/bus/usb/drivers/ubsip-host/match_busid
> echo '1-1' > /sys/bus/usb/drivers/usbip-host/rebind
> 
>> Is this generated code or did you write it?
> 
> No, I wrote the code myself.
> 
>> Also, the first patch removes code in rebind_store(), replacing it
>> with a pr_warn()? The second patch points it driver_probe() - what
>> happens with just the first patch?
> 
> It just prints out a warning. I did get a -Wunused function warning
> while building the kernel for testing and considered removing it. I
> ultimately didn't as scripts running on newer kernels(if this
> was merged) would break as there is no rebind node. Should I remove it?
> and is pr_warn not the right way to deal with this? If so, please advise.

Okay. But why is this change split into two patches? Does just the first patch
work correctly?

> 
>> Did you run tests to see if you can bind and unbind devices - does the
>> driver work correctly?
> 
> Yes the tool works correctly after switching to drivers_probe. Devices are
> bound and unbound correctly.
> 
> The function also caused an invalid opcode while testing in an unpatched
> kernel with a different sequence: write to match_busid, then write to bind
> and rebind, followed by writing to unbind.


thanks,
-- Shuah
