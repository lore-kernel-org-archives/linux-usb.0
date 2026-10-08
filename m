Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42304E021E
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 15:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791474129; cv=none; b=TtwM8uvPntVXb0b9HjG0MiYe9Bsk6xSg1iNnemvnAupsr3lOeuU2BTCoK61IX6tBSSiR6FbTAcgduYSyshmHG6uyuUwRKTTx9ptXwrKa0ee/A9pt6mEAgfKM6ibZjJQ9mN2CbTjFmVQtqTmQFb2cNTRGSPxsqQ6FGVWdj8HbYy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791474129; c=relaxed/simple;
	bh=p45yao1RQtKXl68qwuddwSHT2qqwACdieU8/+vJP4+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V7aZN6hybovyykBeJzEb3VRUf8i4ELx2v3xRttwQiy7uV6fkZhA2O539D3fBc8FOt551h5ij+5rcoW/32Fr3usJREXemTNvgaBzjVubeDRYQ0jVwZT7q68GMP2M690jkDHeMvYsmyz9lUmrru72G/7RWuZVGBwI6Njyh2fOdCOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSeVAN98; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSeVAN98"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so56153385e9.2
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 08:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791474126; x=1792078926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhN0Im/ZOMl3TVldoeLhsQ7Yvsx3fhHCKqS8ZGHq8nc=;
        b=sSeVAN98q4k5cXt1DQUOgpImiWFGoLYTtac1but9LP+mF8+fdJ+1w9I2VgNu+PR/5r
         cjc5F/bq/meaFRpyuB0VQxiAYRIMVOyxkGZSvMFdeh6dWg4XHCLeoJ7S/a7Q1zptTE4O
         vwE5jc1qz6ZcEucGhmUnVQ3H9UnIemKtQGXuCFkXsGhuoTtjqMsTyAfqYtuVyTJj8z3O
         QZ+4ppyzJMKaYHncrES/IWND4b9QZJs6XmIGjI4grziLPhHmNq+A9GosuJYA5EQ9TQiY
         2enxHHnnmS6FV+EzY36o5rvmD7CRwMLnkrKslRuNfOs1dx079y3GX3S4MiYN6d5knBa4
         33bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791474126; x=1792078926;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhN0Im/ZOMl3TVldoeLhsQ7Yvsx3fhHCKqS8ZGHq8nc=;
        b=W8Y7kP5ObwAFwGfKkZXTzAPQ8Lb8bC5ejaDl1JkW/rlXXsAiZqJ7aP8FhAt7QaCYYV
         F/2OCDHRvLlxkjRHtZhDsyEw3DZp2PNvW3W/uCQOsKqprwzs156/rUpBAtV3S2cDSG9Z
         b1efhCRsxjm+MbioXxCJ0aGRZcnTDV+LqDPIjrK0vC0s+psQWzFflYkh2/EdQhiNZvc/
         WEr9U15Letf8sl0MwZE+Z58u0/+xTpxT9vXONxHJIuLqaNMsfxW1WO1R2yRYEiF/ZPXo
         S1AIGQCit4ZHg6uJMdrA9ytwO4gvO6SuSYcYuYociF2rli+sfCR18wXEyvnTX8ZIQTLE
         Nksg==
X-Forwarded-Encrypted: i=1; AKwUvBwyZj+DA6l8byZwNeGPqhlZFat4t5LIRB4KJXIZXKt16+L3hb3AzHPYXSflpQB67/WnWQqbdj5iY9I=@vger.kernel.org
X-Gm-Message-State: AFuF++mIl30/W4GPBRLnCCRtAIxpOfMKCGv1DDKdhj1s2oJC8zo8r1pn
	CPOCFEdbj1A7ASpYD1a9tMN2ha4HAmfPOCZMTn5fqmTvCFNDfqsfqz0G
X-Gm-Gg: AYBFou3mZl0J89u3i49Gtu2REYtW2xyM4Hz4JHThrPjHcIHxVOIBLBeKQt+G8Ma/q6l
	wo3syJjbsxuVXnHDngvpdUDevqkNSL6DhuxLn3MXCi3gvp+V0q5o1W7cf8Pvb6Oq8zywAP1XRFP
	bW7Y7fLHCRVoHt0FakHO/TDh9UEa7gB9RXoteSNdfNty0d3NozF9FoQC0KVfL9RzHXw1mM+rnNx
	xXfFxxzOeZi2hTHt3iLEdGLKuzieXEKnsKxdLOjuabv+BiyDWHoizGQtS+8/uVFGS0oHjX+puf/
	jv6XB+gYAINobroqJAZqWv/6d3lJTHWo3du06SD4FNmxjdEXRMd0Q4hLPoTB6UnIA3zfqW1UqkD
	6xOTqncU8U4JBbr5L6Lf3I1hkK/EG/y4s39DDHcdVPc9pqfpBMQDPbatlyVwUQdEWcpRM98z9yW
	9Zd/dka79KavXEncXUQ9nw7md5WHp/f+ZCvgpDpyNwSz34tN2nlMUG+6Kri2rJJBMGbD5yCdLkz
	fmq04ws
X-Received: by 2002:a05:600c:3e0b:b0:4a0:c02:938c with SMTP id 5b1f17b1804b1-4a1804459e5mr112838975e9.25.1791474125821;
        Thu, 08 Oct 2026 08:42:05 -0700 (PDT)
Received: from [192.168.18.21] ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db6521a1bsm184697f8f.23.2026.10.08.08.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 08:42:05 -0700 (PDT)
Message-ID: <79a32d7f-ded3-4ef6-be78-3424ac1d5542@gmail.com>
Date: Thu, 8 Oct 2026 18:42:01 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] usbnet: fix EVENT_RX_PAUSED race in
 usbnet_skb_return()
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, oneukum@suse.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261007220311.113827-1-omermetekaya0@gmail.com>
 <179141094859.2527009.4935200551311639225@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <179141094859.2527009.4935200551311639225@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/8/26 01:09, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

Sashiko AI suggestion.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

Theoretical.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
> 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

