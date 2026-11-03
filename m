Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793748577;
	b=fwlmxjqqLaJ1GdwYEjCWEbx2IDeGIC4mrzfu7f6MQ0pHsIKJeA5PQqfA5B/9IgEwBfLp
	 ybtSybwFehUTui3ukJsiAlz8XIC09+u3GVGLRK56r/l9DTEkA9eMv0Ddw6OdaHtXspo+j
	 dbIOO2cQqlqZBQ9MZFfzhzyFYQMNmbJJ2TVsT5NWgZGHn5HzrhnbA/MT+FXyXzm7mvk4v
	 RVebNCPhzHjVKvtOz08Qf5aIA18GV//rc5x4+bmNeb8qk+ZK/+c1Yy5BYXgqF9SNZ/YBt
	 hS2c64b5461jOdofoQmP8SFri/sKrHbjAPwf2jrIs3nNBu+EBw2H6uXaO2VnQAFbIZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=tcwmxSswG0osb2wNIvi7vyPmUBBn7sZKQt8Rdp+1bek=;
	b=aCleTeBAxx4EEEmMTvP8bJb6kSejvz7X2C+fmWtJHVQUrp7rxTUkvvfbdrh+q72O/Xo8
	 64K5NTZSC0MytNrkvBC8NzL3undEE/shnODo+ifpikdQPHvMnLjmjZdb4uO6p1iBg8VC+
	 mcoOwJLyzf1DZ5Bxzj053Pz7ySjC0vXLJg2k3DCiAri4bJ7iUQWSvDy6pWMMNsufYQed3
	 PQkVgvVNWZw10s7ELu9qvNBzPcQO5+nNKO6HWEn8XQU4znRXc3rwilu/2oEXIGa0PN3f5
	 MoSVtSEdPtSqMlcedp+yPqBxWox3uXbRNUs3ic4lO4FurnsYs/Usd2YT8re8DTeHvRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NStNYWNs;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA73A606A329
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 23:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA73A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NStNYWNs
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-824413e10dcso56537a34.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 15:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793748575; x=1794353375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tcwmxSswG0osb2wNIvi7vyPmUBBn7sZKQt8Rdp+1bek=;
        b=NStNYWNs/0aa7FFRz2wNDMttagFoGCbe2c9D9YELxcxU8uCGKCed4CF04q9QTFynB/
         9esnmohHJU0PawBoGy3ybPIIGmfqzhB5+T4r2RULPf3lrXecOLHIPHI4JiHjfoEP+yRg
         ZOqN9G4GAXm/3iwG2FFiEZwFIneXKMid/qY6EqxG0+GrC8Xejn+c6plbyoF9TUsRtdVG
         bf1fxGmIo6uHScu2R7sZC2g9+BEH1zEuLx6LQvxjBe+KRzbxmz1PNhXLNrLkotQsPxs0
         tq6XmggGxIRHAUEIgoCvsZWl8GarnEuDE/f35uy1mWFTW+mnHIa5GSl2fjYzi/cquiS0
         2hSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793748575; x=1794353375;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcwmxSswG0osb2wNIvi7vyPmUBBn7sZKQt8Rdp+1bek=;
        b=LtS5GDxaHCt0KjanSHyczUvJUrU74LiaRjD+Cf91MTxGcKVtgZiinnkuZbDHnMTmb/
         r9CBL6IGcpj80PV1EZrwMokMQ2SKaV57XN+Iea0NZV+ATbb41xMOJBWSoGe9Hk+Vshr7
         0VVJ4CmrRo0tCYnDX9rORf5ScbfeL1XsBE9cs+cHD7WSTRjtsYpGD/wpbHzp6LulW832
         2SPEGnKOGI3GLhkznJYS/rtv//jk2jVM7ggR3qO+5zXmFVBT2peaFGJeufnNX0VuXwBT
         sghzlBt88Gm3CttJ4WGcLtcsdj5ZcZG3a+A8nGioRRuxqn/1zsR87t2JGZ1ccJp57bxo
         8JNg==
X-Gm-Message-State: APuU4Z/MG4wYXIhXAwnP9h87vUdCEurubSJyxoamtMV10QywJMI4Av+D
	T4hTGn3UeH14y/52Zz2aA6++YNwdyKazozRm/AJOn/nn7sUx/v0XnKRVnGzwosOKPJQ=
X-Gm-Gg: AYBFou0wTei3hbkXiOJt3Cr1/5NzkWQOP5PyNRJ1hxR9I3V6WTJdUJvLF9Dhh38mULv
	CbgjEoStqfrHf4N//BJxsqUrMszHnr8Y9lJ90FdFKhdoNOpMb+gILTSNINNoyLR7VhQe1BBlJie
	DcpGRg1ArSaAIZM+/7vfLnfTfodRtsw0But1e9qokyKypoS5xv4ElE7lhJz7uqGEFUPGgua31wd
	1BnOFAGeoAC7uwuMdpm+ifdwjBoNI6ZT9SihHncnF6Iq4uShGpoPtjOCJbuJlvkjklREOJppmK0
	cvjDvR0EW1hC752BtrYiUB3e1BVK20opnxtg1anJ7zwnlaRqETRdoVL6ykfaWnqCAKnODEAPlz1
	cVATkgJR2t8esfsHQR4/1HKVu1gYre8XyQuD/Ry8kkf3VavalRhwyxSvmAPXgWRHgK5V6+2pxaA
	4gSzag0ZartpgJH4waOkBAi/cNHHyg5MeDVpavjNCPHpV4u/ByEeG2Zopi11805tVwz47h5No2C
	cgH6Mt/noYyM/X4UF3AsD/Pj5dmjE615DF3U6H4lWrSFtyjocAIAHgrm62tWfgK212mENBgozD0
	EhIq51smfaFgTRztTF3lObmkLbLxOOeHeB4vwYZcXYEo
X-Received: by 2002:a05:6820:806:b0:713:de08:b031 with SMTP id 006d021491bc7-714f24820f6mr8660525eaf.53.1793748575581;
        Tue, 03 Nov 2026 15:29:35 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c1317c7dsm409153eaf.13.2026.11.03.15.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 15:29:34 -0800 (PST)
Message-ID: <56615102-0fad-4591-bee1-04d1efbd87b5@gmail.com>
Date: Tue, 3 Nov 2026 17:29:32 -0600
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
Subject: Re: [PATCH RESEND] usb: mtu3: don't run gadget completion callbacks
 with interrupts disabled
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261102-usb-mtu3-gadget-completion-callback-fix-v1-1-93c3a6dda31f@gmail.com>
 <sashiko-outbox-193807@kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <sashiko-outbox-193807@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 11:10 AM, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Does replacing spin_lock_irqsave() with spin_lock_bh() in mtu3_irq() break
> the USB gadget completion contract and risk a hardirq deadlock?
>
> [...]
>
> Should mtu3_irq() wrap spin_lock_irqsave() and spin_unlock_irqrestore()
> with local_bh_disable() and local_bh_enable() instead of using
> spin_lock_bh()?

Yes. With spin_lock_bh() the completion callbacks run with interrupts 
enabled, which usb_request's @complete doesn't allow.

I'll send a v2 that keeps spin_lock_irqsave() in mtu3_irq() and disables 
bottom halves around it, like dwc3 does in commit 84918a89d6ef ("usb: 
dwc3: gadget: Let the
interrupt handler disable bottom halves.").

Thanks bot :)
Ryan
