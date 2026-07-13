Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90168367F4D
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 07:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927554; cv=none; b=mKK5eG84D0L0S49BVUVkEQ4gc2RMFTeg2n9DQQQtYKsWYmVT6xxQkvjkRJVd11VSoXq5sBNUk6KDnk6vovb0oP/jcI0m/nLkvIBz7i1aWcVUMyfOI4wPvBQeqOzWPjkxMvEG5Vaob122sIYd+iR0XzXVc0p1JRyUxfwt3RDQElY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927554; c=relaxed/simple;
	bh=sdb7hNnfZU4xa66TG6apshq0nm3eABknK1TTSn46rQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=of3fANan4XrV8BrML3n49xqCB2aNFJLy7XKf/MAeLlkwdVqWIxjpbCDxOWuMhgw+0ZlKn28JQidkBK5/nRqLYPdU/uZiD6G4g3C05SyKMKUbmY7RyWqCrZoFiulNzpb4Dhpg/aoe83PibizMyzl8AjefratN32vkmE/GNfN0zVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LFoZ6Mmq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LFoZ6Mmq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47db714766aso1848054f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 00:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783927552; x=1784532352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1WXLGm6wnRp99fch2cbicY8GNR72/fbb36n+Fy/XvE=;
        b=LFoZ6MmqlAKLJBlKoT5F0RuVpIHltY8qIMTLwZeb4cO7CwIFuC/MJyW6+nPI4Yl6hF
         zCuz4O7+rAlL8GW7x/XLPZ8WPag+0/CAxUkr3PQ0s5u3MvV9X0lbX2/mGuWhsJjh95xG
         PtERgAaZJ6vohjshv36jZOohU2zqsnM+eqDTfAUSzkf3tpXen3yyPgGum0uWTzQvV2I+
         zTbVLHfaQojov1eiPHH6THEUD8d1Z4OLuk8PD/3rHG4KEAeCXWM0Zhi0MpqgFbLhgzmI
         d1KRf8gbf0m6XH0Oi5Q+UfHDd1FQ1WlScGqGguqLfpsRtoK+zrG3JGYtlmn+IRZLKXGA
         qjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927552; x=1784532352;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1WXLGm6wnRp99fch2cbicY8GNR72/fbb36n+Fy/XvE=;
        b=fJXkZfuk8ey1NcgQneIODAojnesLVTMNGs36uzRjVdPCvKx8Sunp65VIeVhz40xx+p
         hBcvlvMpTKwmUBtLpYRTZlgujXcWOVpQZgoPjSjkC1nsRo/ErXwe0ys4zMKKm0ngTg9C
         ezTnwQ/yWUht6db+LABq63NroYJMw1D/EEUjCqJDEthLHjrvYObkm7dW3ZrQXJ4dqXOZ
         MU0H1UdHSfVo6TxQa+LMTTluGYADfkOwjdpdcMfVwcfW4FaQLx+quYrn2BapUTFnC2ft
         0nWusv2xgv9vtSt4hBxOwnSyhOty6kcLT7qwJnemYjjpZCEF9DGYfpgfzp4sz726sDFX
         H3Yg==
X-Gm-Message-State: AOJu0YxZEcso+JNvsl9HlQ4SBWQpZWo5m9aHLt9I23IeMyzVHnlF0xlm
	ZAgFAUZn2KhoubmE9isQymdhDiemFJIMMBlNaYR2CajBiRS0YTuELkWlWIQMxwDACNc=
X-Gm-Gg: AfdE7cki51CjPVACA9zVKEyaHs2yrb4SVnta+SKDF4MTlD0Ayt9hRgmbuV9XAIei4SV
	RF5loEUH4ephSHG/Z/ugZMBDSg6Klmf+RPQUzWdHsusAONciPKbreEu5sOjwRarR4OBHVuNqCHk
	BDN4+Q2sqm3+XAKUCR+KrWStWuOY1U1nNcWYieX2s9IgYm3UeJibktYYNcd4kn7mW0Zz+9txy3N
	u2+FL8O/VcCJ9PDr8G3B9ReMJ2noGs4MQqYi3dZSWKzF66xSduoaAuIR03NUXRQugaw3+mHOmph
	BxSJBD/7bHp8aH4u2abk6NaPzoh1R0ceyIFhFdkx7A6DTCphlm6zxzBaFlvqUP8OlRxUKITu41S
	bL48UKAsRA5IwC4vPZlwfCV5LhZXFkHuV/Rls7lKKDe/QKrgMpmgUmq5VY/0KVH1lLUJArmF/mc
	qhCu93rRXfJ/5RedCD98peBkISHWMpiGjBw9uU7Ksf4EX6CHrRzM4ZaEX6wS6T
X-Received: by 2002:adf:e19a:0:b0:47e:96f2:52ab with SMTP id ffacd0b85a97d-47f2dc85da3mr9655289f8f.7.1783927552009;
        Mon, 13 Jul 2026 00:25:52 -0700 (PDT)
Received: from ?IPV6:2001:a61:13ba:f01:2ca8:b242:796e:b61? ([2001:a61:13ba:f01:2ca8:b242:796e:b61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm77172278f8f.35.2026.07.13.00.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:25:51 -0700 (PDT)
Message-ID: <86495c12-0642-4206-918a-6217e74609f3@suse.com>
Date: Mon, 13 Jul 2026 09:25:51 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] usb: adutux: fix unlocked read_buffer_length write in
 adu_open() (data race)
To: Kanishka De Silva <kpskanna1915@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAKJ0_Ldatt+6_q_Sudg8nCnJLz5Vc8eihK9O6mwKh7tKBZm8iw@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CAKJ0_Ldatt+6_q_Sudg8nCnJLz5Vc8eihK9O6mwKh7tKBZm8iw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.07.26 06:45, Kanishka De Silva wrote:

> I reproduced the race by extracting the exact code paths (locking
> primitives, field layout, and control flow) into a standalone
> userspace program and running it under ThreadSanitizer with pthreads
> simulating the IRQ callback and open() paths concurrently. TSan

Hi,

thank you for this elaborate testing.
However, are you sure of your simulation?

That is, can the circumstances you are simulating really arise?
adu_interrupt_in_callback() cannot really run after adu_release_internal()
as that calls adu_abort_transfers(), which in turn uses usb_kill_urb()
on interrupt_in_urb.

As the driver implements an exclusive open policy and uses a mutex
to guard that, it seems to me that adu_open() can race only against
itself and adu_release, both taking a mutex precisely to prevent
that.

	Regards
		Oliver

