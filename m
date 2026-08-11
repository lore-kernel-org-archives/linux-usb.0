Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255623AE1BC
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 22:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786487954; cv=none; b=cTWzSvL94BjMpwkjedk+d/g2lfaDvdTTuFksIbH2gYoxiZxL6p88HcjdQSOW6c6ioieNSgmb7178YP1ak82ERReARKv/VKPRMtIDOcv+aF0QQYVWI8wrBOOdt0OL205ssiyYNdQQNnAV+AeQ0fcPQncohO5c33itwumxNUpdYAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786487954; c=relaxed/simple;
	bh=kQ+fdYLDhgGWWrJs09YPGMYtOEZLeknZ+epQWvrMl0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdNSQTHcbG4iOvqhGmzHYSewNsblwrlh3TRKWUscOviR2NJaPhFcQt7AhLxaKkkmm83HjfSpSZ7f9WFHzZWEEgNxOCthfMwvJi6PUtxEhEE2EIal1TkiOCcZgJaSznxfNfRxPLK4Tlz5twh0ce+E5XLblhRVtMtxXxYKyPclN3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fsvbUPFK; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fsvbUPFK"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e9eaf04bfaso213547a34.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 15:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786487951; x=1787092751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYA0I95z6d9/WlICxAA3jTqC1JPj7QxjoWJUfGcNVY4=;
        b=fsvbUPFKlG9+4XYUvC17iRIEcyS8HVkXK1x6vLdSUTReBRqg4sXrwrDSUW9EI5drSI
         I1/yBQ6v5D7JBppoFBrryrPpi3V9kdO7tHZn5KYzzq5U4vLzThpYtJo/o3twRrBBhnk4
         KZF5ZSGwphEhXwDJMGcCVf68SsDHGS5kemOys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786487951; x=1787092751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYA0I95z6d9/WlICxAA3jTqC1JPj7QxjoWJUfGcNVY4=;
        b=V74Kqv5O1ndP6nZhe05MFpOhdqZFICwoZUC56yNslUzV3XStvVIj3DDvH/WtZnJ3u8
         NsFAUovCa84xpU9wZSg7jB52+H9NTuXti+XQKpf7z+/DNTG2A+27HWW/yYfYChDDViYg
         CoIxz9OJ7lRlAqRF6KQ4Z5kmHdBbg1TDinLd2xAO7ro4p33VaLifwN7VCcWQJZXSOEXx
         FCHglZRqDm1cYoTuVFBTf35A7gvPLJ9v66UQDEa8ElLPJNzik16Ow9YX2yV94oWUmxqP
         8KSmpol/79MiqBqVrX4VmcdKbiuVY5IALQbBAemg6owcknW9KqztbqtpBSwbLe0fY6QO
         xjZg==
X-Forwarded-Encrypted: i=1; AHgh+RruDqp4TQRRIf81H6ysN7DncU14lI/W9T8KSnt7JZVwDvBxIvsCifZBG4JFvN4HQ+E3/z1yqwGoQhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YymS/LIOZ2uYMFY9lDVmhBMuCm4kvbG8ipknpDuYL9B7mifiBAe
	iAy9BtzESF5pw7uSVztLGTrvARNZSv7kolyA/4czSQ4zwdWd4vyPamRcQNLfYchcZbs=
X-Gm-Gg: AR+sD10Je51nf6t5mA6ZsRTPZNUv8yyhsZNqvRnxSPkD2SaZChtgY0/fgxzS3Ep12VL
	tl4VSD6ZJBwwnJ4WuVNqJWnWiUmKwLjeo7cpAERpbLt8Eg1E7M+SkoZWpeZLTYigUEFm8rbahjW
	QqUk9uivUv6hSFlaRSDMvTNAwi7M0d8nYd6VNknpHPrivoOQsKuOPxSDC+Fwx6A91K6Iq1Gy9wn
	3gARFJLle7JFSbapfQkyZKJJ6pB/yhnchPe/+NRaF6b0WEd9Vh2KGJ1JIWdyqtXf3gXrlZt7+q7
	x6EFzYSnSk4q+7O+RDlu1o0ZPAtXQ8+qjmwZPaRy+JADLxMdH6s0cDwKuIlPT6jLhPCl4eZcS+r
	H1etWRH9dtb7qHMdVRpt4SlLrb/Ry7ZOIbDrmgG5BiihldZRztScP7utq131XMhXo760WSWyyX8
	71CJ67rwA/p/Mh0a6ysZqK6KDwl0HTwz3daohUMCuEK2WJHbQlEfofUfSMYHu6/kVrhCewUw==
X-Received: by 2002:a05:6830:82ad:b0:7e6:f083:130e with SMTP id 46e09a7af769-7f3b791b0f2mr587825a34.4.1786487951697;
        Tue, 11 Aug 2026 15:39:11 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3b3475bfesm1063173a34.27.2026.08.11.15.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 15:39:11 -0700 (PDT)
Message-ID: <246f34a4-e564-4f0a-911c-1f9f0b4ae1e9@linuxfoundation.org>
Date: Tue, 11 Aug 2026 16:39:08 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: fix use-after-free in event_handler()
To: Aleksandr Nogikh <nogikh@google.com>
Cc: syzbot <syzbot@kernel.org>, syzkaller-bugs@googlegroups.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Valentina Manea
 <valentina.manea.m@gmail.com>, Nobuo Iwata <nobuo.iwata@fujixerox.co.jp>,
 i@zenithal.me, linux-kernel@vger.kernel.org, syzbot@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <ee9bc932-2fbf-4e8f-90e2-6cf604be9ff1@mail.kernel.org>
 <b47d2b37-0aba-46cc-afaf-cf824d99524e@linuxfoundation.org>
 <CANp29Y51K1Y0Z77oUEQmDpVPjJuz3fQhvvZp2=fw3GWSPiCg3w@mail.gmail.com>
 <34d4ca1b-ce89-444f-bb02-245287edfad0@linuxfoundation.org>
 <CANp29Y4NLVebq6L7STgcFJYSJo81ZpO4hNvaJQT14OGDZqwzxQ@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CANp29Y4NLVebq6L7STgcFJYSJo81ZpO4hNvaJQT14OGDZqwzxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/11/26 07:07, Aleksandr Nogikh wrote:
> On Mon, Aug 10, 2026 at 9:33 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
> < ... >
>>>
>>> During unbinding, we must wait for the scheduled removal event to
>>> finish before we can safely free the device structures. From what I
>>> see in the code, once we have reached wait_event_interruptible(),
>>> there's no way to abort the process or somehow gracefully handle the
>>> error.
>>>
>>
>> Yes I agree with you on rewinding being hard.
>>
>> Care to explain the scope of this assist?
>>
>> Assisted-by: Gemini:gemini-3.5-flash Gemini:gemini-3.1-pro-preview syzbot
> 
> It was generated by the syzbot's AI patch generation agent:
> https://github.com/google/syzkaller/blob/master/docs/syzbot_ai_patches.md
> 
> We manually review the patches it suggests and upstream those we
> believe are fully correct.
> 

As you are reviewing this generated code, did you look into scenarios
where the driver to hang in wait_event()?

thanks,
-- Shuah



