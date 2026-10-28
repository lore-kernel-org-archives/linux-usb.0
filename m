Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197189;
	b=KyKKnRKMM1xfLRPezKt5zmCcBX96y8EU2vgogbImT3p2hVkOMTypm7wdM/QixWY3M7AG
	 lNVgCEzMS0/y2C5H8kzC/evhhC57H9GQcQAiDboo/LJECObxJfXqDIA3zmt8+SHv5LgpH
	 7pU1xzogYU119QWxe5e6+9SODMHBYhP0PeGA1MwZP2isEw4tHYn326RX8IAtB12ELEGWa
	 +s3BgXyLzrT9WGSJgo0tHOnd33m0AL9Zv0QO0q9Q5+4qrfP0Mm+UczttJg6ib4cMW9QWh
	 yIEb6L3H/LKoKDHTAEe5tttiuebZHJbdDW2rpq5oN7sgoqMEDPFAf0Uw28OnzAh/EfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=2H3A8D9Kfzs4a3owQ5BPwXAYOqUMetp23YVGpSjQgWU=;
	b=Y1EW2+8SZys1hJVzbyTdUa/nKit3pbJ0jtHoLYUcXqmgXqNu8Tvo0f0ct+QCTlZD7E0O
	 IiTVeXXs442oVu9IxHCz22cUr/fPBTpjHS8elat9HH7itakEin52zntd/O0ZgN7uKL/rI
	 Ho06avqQfJWtOhU4vKGg1KhrunPbk5zuNnnvou02fxYuAgjsjg34ZWE6c/yRXxs20Ozze
	 fxaHzPw305pCMpx4j/xfGjNDRn/hHkiU2zOTrAWHQ0S1+EOCF3KBR8V+AHywJejX4IpZ1
	 E94reWzvlhOIIpGia+b6yHCwIgt4bJeBFgwa5YZTLLHaWE4ryUKFJsd8bzyD1qMqv6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=GdvMZQtS;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593B1606A31C
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 14:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593B1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=GdvMZQtS
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93e63ee7b4cso118052685a.2
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 07:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793197188; x=1793801988; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2H3A8D9Kfzs4a3owQ5BPwXAYOqUMetp23YVGpSjQgWU=;
        b=GdvMZQtSCzsjFmDVmFxXEBL8MomhzDIvuenHfdOIMwDaOINLcBQA9hvAamH/dJWNM3
         YFvCrR0aN8fYCz/5W4UkuwGrsKrICnBHRfc/KQz5pda8MfQ43SC7lyQlAc+VpL1WQgsI
         9pKDH35q1eViSzZADcsHyyR29Ybzf4un4cVJJXXnBDLAqQKedcOeo4NPniWuoS7KYJQ2
         k5Db3XT3uFY3R6BPiM8lcrri03aQyqf093FUYzGCn63du3nbwzLeUcD6GyUuTB7auWup
         wY2cX9RLkEeXCMIUUEDJ9gnqMZv89bvh11vxpKZ4WvX5JmeTn+z3FYfGIB3BanPTQ7Ks
         0gQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197188; x=1793801988;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2H3A8D9Kfzs4a3owQ5BPwXAYOqUMetp23YVGpSjQgWU=;
        b=urJdfFhWZKfD7Q56cD7WzZFJ/38gCVg7XiJXMvDDFynYanEQh1OCkXSyCqWTst7Cmw
         ES1hoPrMVL9ftVnj9uXRQb6JHDsSxetnwqlUVd7/J2UxDkInJTlKfygTcg9b+HySwAfr
         6AjT7znZjHEgVtp17c4zVYgTM1gkD0Nz2XBMTGYpuP1BDW05SiMNTKCMfZSv1DZzyl6r
         YJRk7klJyBr/HOu2aiuBVTnMmE161fnby7nMOkv3n/i9ojL3l4iyVZAF/TvH8jPl/YK1
         6hFfqkKAomDr8OhIWZ6spby5o128CLNtXRhANS1A49DBCXhB9GB75iyIeq6VIEccoOtO
         +s2Q==
X-Gm-Message-State: AFq9FYL1oT92EhsfwQ4VW2Ha+sGTsuWY1l40H5q95tHptnPYPvPGCOWv
	k3XaElF84NegWsVk9b8QRxz7KKH29VIXIjkXLEL/Ne1YtKHdy5r/h1f4EokzL4vutgGMJlczr1u
	U+vwxxw==
X-Gm-Gg: AYBFou15ITLQj7sUOh++r5JcpEvsdpw8mz3EkctR786fJzsPj9p6G4HIo6P7mpDqgWY
	l6bY5V7uIeUnf+IxIwDRGHGhSFLz34Wzkh3o2HRJfEuDzdFaiQjNLYQKdz4CP+4BM5dIBsDlgTa
	kvY8aghImlCl3INy1Sf5FDqmG4fgkLt5AOvlInDwl+XNSYaZ838wmJkzmJhiG3F4Gpcdr46t9qx
	pyI560YigIvKdM2N1KJ8l0YXxixnLD8jCqV9kIDGH9L4mgI7Vrcchmgi2zfk2PZjG/P7EuO+jDO
	mnTLXcG0SevbQ4P2ZPlp3oKgsb5O/Yf+Sn8/ks6vOyCLoKLmXW+7w9+RAqs83K0ge+IVjbhkerl
	Eli6bJIMBtT5H6UtCwK+EtXbcnM5zSwMNQjYa9iMaWQWdlJvcc8WYx1xocthquPqpiaSHMNJw8I
	ej6woPqgwnEym3gx5fLBOGXkJooAXhZKqFdIXRp6UUeFY5qE2bENn3lG9qpNOwR3cLxZFISiIie
	8cbnbe+NPN8Wuf6k29daQTk8LKrZ2cS6CEYlZ6kQ41WwAACj257TrC/BrCtQPyFblsvskyXVReg
	ZSvYGtLPgKwXyp9NQR2gDr/GdJzqWE96ui5obF2wyvbVtd8=
X-Received: by 2002:a05:620a:4081:b0:93f:12d4:6760 with SMTP id af79cd13be357-94408da916emr337736185a.68.1793197188031;
        Wed, 28 Oct 2026 07:19:48 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0a912d5sm1266670785a.40.2026.10.28.07.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:19:47 -0700 (PDT)
Date: Wed, 28 Oct 2026 10:19:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: SIMON BABY <simonkbaby@gmail.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: QUESTION] EHCI async QH/qTD lifetime on old 2.6.32.y, Octeon+
 with ISP1564
Message-ID: <069ef531-caec-42fe-9ae3-574b9b49e7d2@rowland.harvard.edu>
References: <CAEFUPH3_w2CNccQxr70qi8yv9zbcN9a9FvOt98m9vGvBL2H_pw@mail.gmail.com>
 <10a1cb15-d3cf-4a87-88db-87177fe60ae0@rowland.harvard.edu>
 <CAEFUPH0gM4oKAcRHr+vWO-Tat=BL9Ow4NSrsOeA9UREdCX0bEQ@mail.gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEFUPH0gM4oKAcRHr+vWO-Tat=BL9Ow4NSrsOeA9UREdCX0bEQ@mail.gmail.com>

On Tue, Oct 27, 2026 at 08:39:48PM -0700, SIMON BABY wrote:
> Hi Alan,
> 
> Fair point, and apologies for the way I phrased the question. I
> definitely wasn’t expecting anyone to remember the detailed behavior
> of the 2.6.32 EHCI driver after all these years.
> 
> What I was really trying to ask is whether the failure pattern sounds
> like a class of EHCI issue that was fixed in later kernels,
> particularly around qTD/QH handling, unlink/completion races, or
> DMA-related corruption.

I don't remember any reported bugs claiming that DMA was accessing 
memory it shouldn't have.

However, there have been lots of updates over the years, some of them 
touching on these areas.  It's impossible to remember them in any 
detail.

> We are currently comparing the EHCI changes after 2.6.32 against our
> old tree and trying to determine which fixes may be relevant.

That seems like the best approach.  Alternatively, you could just use a 
modern kernel.  Being stuck with 2009-vintage software is not a good 
situation.  Not to mention a huge security risk.

>  Your
> confirmation that current kernels are not known to exhibit these
> symptoms is helpful.
> 
> Thanks for responding,

You're welcome.

Alan Stern
