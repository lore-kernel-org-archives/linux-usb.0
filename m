Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE9F243956
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 06:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330301; cv=none; b=dOtl1D2GrtSRiSqT/+h6Lm7aqL7buPhHu4BdC+Al/0JGLPCNFFDGDicTajqi+tWzouMcB0PS+zqzDkVHIt1iB+cgJUj91PbAPlQJLjNwXl+IWusTzXpLDeQit8JedNn6QPqi8Tk8AGXkfTqSD+X4oSBqzFBwfJLyRoEjM80tj6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330301; c=relaxed/simple;
	bh=+9WVtePxyc1YGLLA0sPGLdbtBaT6Ojt4x5bVpPLtDXo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=sTeAL/Puaprze7JzVRzYzX0Rp3bjfoTtua4fdKDBlccbMQcUGhH0uMBOZ17kltG+CDytNoPywBgusxCxLIldGu8ZVk2jLC2/j6gYyVZLWqk9O0SQRzGh7gzac969ORiMGMvCHy7D3Ki1KlZMAuL72oDhO29ubz5Q/lqMwdsb6HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oyfboyT5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oyfboyT5"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so4559175e9.2
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 23:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788330298; x=1788935098; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tWJyN3i/V1hy+bh8hawCPCJ0S6kVzHf5TYVU3e2rRUc=;
        b=oyfboyT5oo4wv5ZVuJFhklRgfLC15EmSsQJAw/BEr73kVQLgfzNqlOSKo3vYFxWN21
         d94w7LDMgDu8lqRIqcMSLyLkE5Q7jyuoqupsns+8uf4Y+WTdkcgI14xi4ivxgA5VneM7
         QKWO0Ah+FLfeyIwAsgE5fGFOf8HVy28su9G/0IxCoFqERO8P2toZa/T9EcnyJj8rUWpL
         wvCmA4UGtxWgrpvR6JDgHBDGxk4t6EoY9oW6WHgVQ2p5DsWFy8CMwj+PR6ZDVZot2ToD
         1s2o85jzOhAZYoZjlJu+V66uUh/SNv7mxEG9IZnrEcge4cAOeCHcaTjYUHS2YbFNS15W
         OYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330298; x=1788935098;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWJyN3i/V1hy+bh8hawCPCJ0S6kVzHf5TYVU3e2rRUc=;
        b=jubIDbvBQmm+BN5NyO0E/iKP3oGSBYj0aMDrk5WlYUmlgaus1ff1rw66aSot4OyzIL
         vPOJK2UOeyiL6Rf+QuH+ho0kQKUF/zrhuIdVeArUVyJnjl0GwC9sXFzyga9BxPLdraOT
         tSWsPCgRseqkUGmX8bbL79T3L1nQmXa0tvMxgMmE7aFRVmEPCA0KmPzEwO1v+uHURniG
         5xjHDYDQkqFfMIodRfN+npuLidodyXP/EYUF6XuKPxuqgnUj6iYSuQAG6UZRVIatsyIH
         A3AcgPKWmkjPa42FeT5v8XrhNPxpGPrb3qFEO0VXZwO6PV+P9EYM4wFPEm3Ose+c/nsN
         de8w==
X-Forwarded-Encrypted: i=1; AHgh+Rr0HVt7NRblB/9rNpsuAU+tK9Pte1Cv5+ZLvVdu6dS+twgb/oBmQMMsAx2h8472hyaE0SIl6WakXDI=@vger.kernel.org
X-Gm-Message-State: AFuF++k45By7HZwFYkZYYj4lWArKNc9XaQLM4zbV5qScY70EaKIFJenF
	exedi7+1vnNEenq8Cvc6ZMJMl+ecyaTjzk2syls4p9pim5xWIKB5Ji3q
X-Gm-Gg: AR+sD13Rqnh9p1W41o2dv+d07m20QIuo3UuJyVb5vQdiYtLUUCDowJ9wCboQEoMzcOT
	hiKNqCfqDOUlEztNQMuEjopLXgnoZRYQpS9QLrjHGX0nOzWZm0sr3yKFIOjoDGrhQTTXp9KV4SU
	nnIKqtqmzrvnfrVfhGTLPBtRZOdL1JoIuAoOHKRZC6YcWHq5iHiJ2Z84i8QxKGmbkq+BaxF0tp7
	Z3Mn31zfKjktKjPzWryCunD0ig6VXLhttZPCaSh2CK7xQDcWraeZkTCt3Y5e0adNMJBmrtL/4SS
	6jif0frglcoFoZecQntH3XmGFpGhhu5+cIBPIx1BV9HOXTPlF0o9EexZ6eGWv3D+HCgdLBBFO7R
	G48IL65p/1AKNZ0r2TExLV3NnYQYQtjdpDCkVsju+/oRDgEAAdOaVVgXc/KXn1/QsgxXSN3LmIW
	B6n/6mK5a2xYD+8qO/LE76fWHsuqDPquyDKv+dCVeQbOAPU28ScVqrRw1DGsa32mb7+l2XdfufP
	6cMZIoZsLlUWrRfKQOq06hxDPS2EfP+5A==
X-Received: by 2002:a05:600c:4ed0:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-49ce57ec163mr42888105e9.1.1788330298294;
        Tue, 01 Sep 2026 23:24:58 -0700 (PDT)
Received: from valmpani.valmpani ([2a02:587:f24:b00:967a:9200:4108:5b68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47820e2sm44777905e9.13.2026.09.01.23.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:24:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] usb: gadget: pch_udc: don't call pch_udc_remove() from
 the probe error path
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
To: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Felipe Balbi <balbi@ti.com>, Mike Frysinger <vapier@gentoo.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 syzbot+3e2e533aa1b2a75525e7@syzkaller.appspotmail.com
In-Reply-To: <20260811-pch-v1-1-f79801c1cd91@gmail.com>
References: <20260811-pch-v1-1-f79801c1cd91@gmail.com>
Date: Wed, 02 Sep 2026 08:24:52 +0200
Message-Id: <178833029261.756768.6158388330855906762.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788330294; l=1074;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=+9WVtePxyc1YGLLA0sPGLdbtBaT6Ojt4x5bVpPLtDXo=;
 b=QMuDtdCXLmQa4xf202Kki0S9AqujJXwQ93dllJw6Q6bu+WYGtU1msskCdtIwpfhdQsMShJ6N5
 qivCyMinjqlBxJoy0ChnEI3tHkMywjUn3DMNimjy5Ljak2sDvkUWaV3
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

> Probe error paths go to finished label which calls phc_udc_remove. It in
> turn starts with an unconditional usb_del_gadget_udc(). If probe fails
> before the gadget is added then we put a non-initialized kobject
> (gadget.dev) and a WARN is triggered in kobject_put().
> 
>   WARNING: lib/kobject.c:734 at kobject_put+0x252/0x640 lib/kobject.c:734
>   Call Trace:
>    put_device+0x1f/0x30 drivers/base/core.c:3880
>    pch_udc_remove+0x47/0x510 drivers/usb/gadget/udc/pch_udc.c:2986
>    pch_udc_probe+0xcc6/0x1130 drivers/usb/gadget/udc/pch_udc.c:3109
> 
> If usb_add_gadget_udc() in turn fails, it has already dropped the gadget
> reference, so the extra usb_del_gadget_udc() is a double put.
> 
> Split the hardware/DMA teardown out into pch_udc_cleanup() and call
> only that from the probe error path.
> 
Hi everyone!

A gentle ping on this patch. It's already tested by syzbot so it
should be good to go. Please let me know if there is something
I could do differently.

Kind regards,

-- 
Vasileios Almpanis <vasilisalmpanis@gmail.com>
