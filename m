Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867113;
	b=tiS+/rfwM9D3wOjRQnWuGGsrNcTuSLiJR3dA+ihHlQp9L3BfXU4YEImtD98cc86RJbkF
	 sChZktwzJEQT8x5TYiPoyS1LBgXg/2yObUsYgyvbPJyThzRh8eK20x90Ut1vfOBPem5z3
	 1ePz9AUeVGQKj/l6MuJ43xgP6WhMvQWV2eRiU60Qf/Aow56RFOlFpyyMr2GR78vdhYvBu
	 AkOg5GXthaMzFc8w7Vs7nq9z85xeEyc7m2/+Z1FAyJPzAtFxHoTI7i4v7FCVs30hVyggk
	 TYxLAxJAz7qWQ2xp8FI2qED63A0V6c6eD5ApX/y8jsEzpM7vgXyhh5X9jRidmpNPQvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=xU3I1i3uzQX8SslMA2tW2SYNiqUCEQAUMT2RX5egxJg=;
	b=U7wFZH/JAWaoLPiM0Dd69rMrciDZAIlHn2kbVh5DQGLsPK/wvIYuAQxMVkX2V+w96Xjq
	 bqt+CUGepBNW32SlI8jrgaJ9io3aCZC6kC1tedy9BcQFAD1Gq3e7gSQN13b1zGKX6lR0U
	 VSujreGjcXr5qOIVs8NKgAJ65OgR+7RVtgJ66uKvD0D7lDxaFLszQfPXuoUEECOUhfmUm
	 UQxsjkRGMLL2pgP/FwwtJ2qywYGvJfx8s5rxD2ZUcjkfJ9Sz6f9xpumlFINTzQlXJN2m9
	 evZEOtXcsUZI/P8IFp/Q/KQFQ3qy6r7+vOAwVXu56glpJc9C7BQVLMCwGqr2CH+Za2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lqGAMV0I;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA77D606A323
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 22:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA77D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lqGAMV0I
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3a9ee822fso486990a91.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 14:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794867112; x=1795471912; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xU3I1i3uzQX8SslMA2tW2SYNiqUCEQAUMT2RX5egxJg=;
        b=lqGAMV0I50rZFiPx27w7QnxS6xlytaJwIzGMrdQhAk0fYIkPLxw/dmrWf5ALxxMVGb
         yT9RRzV4JSYR8q4I4q0wcWV6Q/JpdvtIEHKxvB7Y6mty7jNqWfVaszchw3OUJ5+ibi11
         cjM1FStPHuZO50pPVsq2DL1yVeB6jMTJFyiRKebGMcgebTvrdAnBvQm5wlvD63glsyIh
         3iuNbu4lPunRuxr75CfCanfRrd8MCbrl+ftFpR7eYZnHDdeEYUz0x4FBz4XZA4WxQ4sP
         yEWIp9a1QbCHPNtggkgHX9DcTpDM+SseGBCDntWYlHKKJjtPzf/7+rdzCElb1IP9OodK
         EhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867112; x=1795471912;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xU3I1i3uzQX8SslMA2tW2SYNiqUCEQAUMT2RX5egxJg=;
        b=MfnonI/x7hqt/YWq+NKA/O+Ec5JlIt9D0X0arIZq6UFeRPfUAzf6iWbNoSLb1ycOeo
         UeP+U2SiOXS9+UHzDVc2KThEv2smFAOAcYIp1ertNZV/FPxuq5WiSN5Ut1lyD4sg+TBW
         ODS6J2PeEZVcuNpyVZlkHdHHGmSBUuKZUQJ67rxeqSIWgwBFUF5izTx7TxU3Q3MtYsd7
         XzJJljs7+8FCqlf2Ok6lNGQJ3j7KTdxuBd+HatvyCbrJJ9i8sLMSUCPkjYYD/cSaOumD
         V6LmhnNpdcHtMpNKut+mqLyQ86Wr95eqOMSTH6MMAleHTRkm4+lTTJHfh0orclDPDLuh
         kXBQ==
X-Forwarded-Encrypted: i=1; AL+hErEB/7iOEwc6x5g3PGmpM0cJZVTJrsJXM96q+dkusKdCd1pOOs80HPD9MralvJiRENOKIvDfVp8Pdlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z90Xy4/J8nFqN5rI/HbS46YufTQWLWwlPWbm2PgmKewORJRyz3P
	WL9mEFh8M7mCuwm1w5q5RaYqZdeW+pCau09NuepKQNxiIUnZJeJAXhqRcpVhYy11caBLmicvlI2
	6+kICZVpPzg==
X-Received: from pljc7.prod.google.com ([2002:a17:903:3b87:b0:2e5:712c:5c7])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5608:b0:3ac:c024:b275
 with SMTP id 98e67ed59e1d1-3b1b089e262mr11929294a91.9.1794867111923; Mon, 16
 Nov 2026 14:11:51 -0800 (PST)
Date: Mon, 16 Nov 2026 22:11:47 +0000
In-Reply-To: <20261112010928.23716-2-shishunbo@cmss.chinamobile.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261112010928.23716-1-shishunbo@cmss.chinamobile.com> <20261112010928.23716-2-shishunbo@cmss.chinamobile.com>
X-Mailer: b4 0.17-dev
Message-ID: <179486710796.2938203.16103592872804674838.b4-review@b4>
Subject: Re: [PATCH v3 1/4] usb: gadget: f_hid: fix sleep-in-atomic-context in f_hidg_get_report()
From: Neill Kapron <nkapron@google.com>
To: Shunbo Shi <shishunbo@cmss.chinamobile.com>
Cc: nkapron@google.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

> The second copy_from_user() in f_hidg_get_report() is called while
> holding hidg->get_report_spinlock with interrupts disabled.  If the
> user page backing the ioctl buffer is not resident, copy_from_user()
> takes a page fault and sleeps, which is not allowed with a spinlock
> held: it triggers might_sleep() warnings with
> CONFIG_DEBUG_ATOMIC_SLEEP and can deadlock the scheduler on other
> CPUs spinning on the lock.
> 
> The first copy_from_user() into the freshly allocated entry is
> already done before the spinlock is taken; only the "report already
> exists, update it" branch still copies inside the critical section.
> 
> Since the data has already been fully copied into entry->report_data
> before taking the lock, updating an existing report only needs a
> plain assignment between two kernel-memory objects, which is safe
> inside the spinlock.
> 
> Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
> ---
>  drivers/usb/gadget/function/f_hid.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
> index 3c6b43d06a6d..b778eb633b79 100644
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c
> @@ -654,6 +654,11 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
>  	if (!entry)
>  		return -ENOMEM;
>  
> +	/*
> +	 * Copy the report from userspace into the entry before taking the
> +	 * spinlock: copy_from_user() may sleep, so it must not be called
> +	 * with the spinlock held (and interrupts disabled).
> +	 */
>  	if (copy_from_user(&entry->report_data, buffer,
>  				sizeof(struct usb_hidg_report))) {
>  		ERROR(cdev, "copy_from_user error\n");
> @@ -668,13 +673,7 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
>  
>  	if (ptr) {
>  		/* Report already exists in list - update it */
> -		if (copy_from_user(&ptr->report_data, buffer,
> -				sizeof(struct usb_hidg_report))) {
> -			spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
> -			ERROR(cdev, "copy_from_user error\n");
> -			kfree(entry);
> -			return -EINVAL;
> -		}
> +		ptr->report_data = entry->report_data;
>  		kfree(entry);
>  	} else {
>  		/* Report does not exist in list - add it */

Thanks for the patch, however it duplicate's Yu Zhang's previously
reviewed patch in [1].

[1] https://lore.kernel.org/all/20261020051446.92179-1-yuz08559@gmail.com/

-- 
Neill Kapron <nkapron@google.com>
