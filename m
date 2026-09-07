Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00DB4A8A2E
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 11:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781139; cv=none; b=u3px02alMb4+Kxrk9DbpCL6M2sqxST8VRlL98G6dhyhChdQNgSGYwhBLsuwEAyCX5MesALcyaO9ESk0H81UjZ9EhSgIviIt2NVSSNF3ipjHLIsNxpe6FGkPI6RYvOJvlEKKkpX0QX7glHRhcMH2EUWIMNgL/j0D+OLUMSmsTj3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781139; c=relaxed/simple;
	bh=7pSMEByB7R4uwEx4lR7TNQm7S98V/dF0hA7MZYBm4H8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jhq0BcH62lOJERLcmrXgT7+LkaCBhJoHDcg8gkRso35ei+u4Lb9sbRGKLRqr0W/sEc0DnxmjKwuW7/4hZopWMsHtBKhTZE2oh15Dgeym1S47SMxu1Jy9n3aTSTbOpN0/x3B6rcKK0w06bYohTfTYBX+1oWOoQYjz/kf4zkQCkaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D5apak0v; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D5apak0v"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495590dde14so49538275e9.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 04:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788781135; x=1789385935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JTxWf7Z9THbI+LNbFW3uX14W5LzvtbTTU9b0mD+aQ5s=;
        b=D5apak0vWBt2mSW5LrB0IjvQ8rYPxzo2Gd8GBTp7qwtCbCTtDjzWEPAkbqIrhEsGRs
         exfS3GQQK9vrTxWQGPaL44stBDoH16b5GuYR6bThLiVwIK7xUhIx7ufkbZD2uDOen7ak
         1yKeobsRxqP7UpWfLwG7fUknB6Ja4Kc0VWOkQiUH5Q547VUSov7F3B8hyIkx+1zKQrU9
         Vt0SzWfPhWr5y1jwClX2WVeszlH8/IinQvu8/HmHwjwFdhIwyQmRRMsL+wM+nlEFQAHJ
         MwMQXlvhYgNI6Yhn/bbbepFL5bVg8OOwlzZQcxHyzxGwLI1/J5Zryx+Z3/HRehIeEVaX
         EP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781135; x=1789385935;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTxWf7Z9THbI+LNbFW3uX14W5LzvtbTTU9b0mD+aQ5s=;
        b=RX2UNIcDOD4ZHp+wPO9XU27KN2jkGJvkXmGAGSAZVQZ+cPlzsJdqV7bFGErbUF8/KB
         WplY8SyGWwaIQiDo5w/86TvBVZ9BD8eZnBU14Y7Ajg4HjQcpGs8rz6IqE8+jgL0VfiLL
         UHBMAYKva8VIxnHawcV/1QdEmiWvgO7RwUTkiPk2pH1S/mQbMygek5+aAp8ACNGVtHKb
         0IIRGDBcBbiGRLbk6Did5BJsiQLbfXyPBQohaU2tH/QKCKUj+D63mqxuaVqiim2gU8eT
         6E7s33gav6PpOcbZ3M5DJMY8BJyBJP/ur4ArV/UYX/5yq4YSi3GnCXwywM4BsEssqRCY
         Nj7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxa812d1YGNdwHcyaANP0iWUEWyTxP/QDB4SsOj9mbOGGmGvi4bN4QtQ8OPepxZoPIn/jkZJZOtvsU=@vger.kernel.org
X-Gm-Message-State: AFuF++k2Atk1sJGf/2N01spqKHvD11F6PH5zsL/U4EY2GsLom/a4jSzY
	WjVTCywJkDFj1CO/zbWKlAxUhvYSB6e7t62Z/dApPXqtISkhh3pPAF7b12VO4BNk/sw=
X-Gm-Gg: AYBFou1q+V9fd65XIKWgF06YiQS299QNT6rM0P90lit/jDHCnL8kwMGk1difI07y6SI
	kvRt8SNNzWuSLBkPDjk2Fe3OZhZFexji4TQO8WVrZGP52zW6+wq+VXReu2Zm3ppTapNNWRaWLtq
	0iZJt9sx/kxuSyYnkuAos4P9qAiLhke/rWWeyYvofoXQ0cp8PITDH86kARgpfPBslPgnHrbo7IW
	a2P2ZCpjBWQtw9D16fshobau9OeIDf/yPRF6meV9etRvbFWcjBvEjOORxDaPADPvlyZh0qGfG+G
	NEFpGd10CMtgbuSlJS05cNht13Z8UGboUAU8aMeg4utRDfFOjSWUsxiAbdzSS01YmYSxQf4kORW
	ZrctsDrnng5K6yxQy5YoGR1crz3Vfqwq0rpGL39fKVp5miu3XfSVcwvek7qO93prBLmHpIS5kAk
	qBkuBIM+DYotdhoU8eM15JdZcoV0VtrBUyXEUARs1i4KE6k5Y0SeO9ZVAU/nl29ox5h1q8yvVSh
	USMjMuh8muQNgiqxKLfDiTavLI=
X-Received: by 2002:a05:600c:3507:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49cf7fe6900mr417183625e9.3.1788781134823;
        Mon, 07 Sep 2026 04:38:54 -0700 (PDT)
Received: from ?IPV6:2001:a61:1340:dc01:654b:3cf0:59cd:498? ([2001:a61:1340:dc01:654b:3cf0:59cd:498])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm264862305e9.3.2026.09.07.04.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 04:38:54 -0700 (PDT)
Message-ID: <6e0dbfed-cadd-4274-8165-886725413d0f@suse.com>
Date: Mon, 7 Sep 2026 13:38:53 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] usbnet: fix smp_processor_id() use in preemptible
 context
To: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>,
 netdev@vger.kernel.org
Cc: oneukum@suse.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
References: <20260903165456.498079-1-omermetekaya0@gmail.com>
 <20260905224553.595766-1-omermetekaya0@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260905224553.595766-1-omermetekaya0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 06.09.26 00:45, Ömer Mete Kaya wrote:
> usbnet_skb_return() and tx_complete() call this_cpu_ptr() before
> disabling IRQs, which triggers a BUG when running with PREEMPT_FULL:
> 
>    BUG: using smp_processor_id() in preemptible code in tx_complete
> 
> Fix by saving IRQs first with local_irq_save(), then calling
> this_cpu_ptr() and using the non-irqsave variants of u64_stats
> update helpers, since IRQs are already disabled at that point.

Hi,

thank you for the patch. However, if the problem is preemption,
when not simply preempt_disable()/peempt_enable()?
Why is it necessary to switch off interrupts?

	Regards
		Oliver

