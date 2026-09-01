Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C6C49C4BE
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 23:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788304351; cv=pass; b=Kp/Jq4CmiQjsI/DoxbrX9G31JSYIxBwUId2MNTQsuvOyUyleBljRv74J2nEA7RN9IUSsDoKsgOe92axjMS/TRp9CR/Pfp2RC9zGUmHLzQcbCdBArpB7m9rvvP54GBqJ21kgLQ52O+1EA17EVWI0UiR4rz5PHQcT2I0aOxRoNNtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788304351; c=relaxed/simple;
	bh=8RFmVgoZUYYPwojEUNAJzrW/NY8oS2T/YWuIOXAr3tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSe/vX53sMIYU2QOS64p89FvVSv7c3wgIYhi1vcHF7SRRGEF7aZXTOpcsFiiXeWCa0hPx7JpYPOWLPoxhZSy3kQt9Sv6Qwf05PaWaZKv9/XeS1h6Y+ClS31p5oF0ZC1wKtySZimGGhTrgXcJQdijEMxDePNFD/A8xqRyswHjUFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P88JUiY8; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P88JUiY8"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39266382df6so361637a91.3
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 16:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788304349; cv=none;
        d=google.com; s=arc-20260327;
        b=dv2t6U06IfDf4Bo97cJE3fJ3HK8eW2cSC4feoxIqLueDgbbadvhqMuTKyzxrbaUSCf
         Hv1PZ0fu8CIrFgr3LpKGEWAIOkYLVdSEbYj0vq+tpLf9zRjdggO/e/U8QgvfIVQWud6N
         vuArPSaG8CTJDottTiGjH/3msmrGXbY4Y1ynalT/Uf8WXK2PPUMiopr6SfpQqZNauyx+
         tfRFnQYD8maEM7WawfIUgar4U6zqUI58CIr0iHM2wr8qYcHvMwn6Oyun2e/gilMtwmXv
         jTqBiNq31u8lTJB+ANF4WS8AHQ49S0qhvDO08BFzeKx3ZVQHHNCyZXzJGX+Nkq/Kg9wX
         CooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=01GPFfh5P+Ox9iO1fOokqrxnZgCOOcZluKfK/EpmKQk=;
        fh=L07cmepgEULrIpSxZcj+/MUxaTN8NsdOOOfi0UlCJIc=;
        b=CpzGGTzLlc8qkGgy/1y9FHaQV1gm/4cKcN0UvUAGi6bHwuux1tc5CSjmcxAav307j8
         x2FuWzaRoLQpX0gqqpEK7fHWHFA6HRlQK9oLvHuc+LAeWMyg1YU3RMw5/IUOAejZiKLn
         V1cvqaYe3BED+W+hp3a8JTILmhLFoi6gsiSqyqj3OxFYPsztvYsfBBcr0iQT7+Qi4iO2
         ESnREjRrH7Bt37WKRanFUtecl62MOO6+f/zCuBHfsxy0STC5Eo6cnFyaon5484jH4FK3
         JyUlfEHHw8DDPm6VbZ0Ig0g6KY41PZTn3r3gCWLrESQDCZMzGYm5cRMivLl9/YhoM64c
         t+Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788304349; x=1788909149; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01GPFfh5P+Ox9iO1fOokqrxnZgCOOcZluKfK/EpmKQk=;
        b=P88JUiY8Nngh/Lk2AJon4bVnsqUoVR3LDawraGKfwhL/tjletZjvxcZXmBEDeYqrPt
         L3qWIamICf7ayGe41Bx7BYuCad5YgX5af0dnv8LMFi8K8a9gEoX5vHiv9kbmbwHe2a+i
         zbqcNqTLhzwvtS5TTuRfuVcs3u+t8mjcoRuiM4i9Sq9HvdnWbsWlgWVgtn4iHigTBxj6
         WW/U5VnKdAg5PXxd/BiR+MB4TNq5IRmoXOUqI/SULfYYxYJACyck0eeGdvZiqhlmySHR
         0T2dGkNTlkZvEsFisLRF9234ecPVzto/VnxwXr7pVeG04Zl+UYMgVDquh7O7bNbPtHoT
         ZiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788304349; x=1788909149;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=01GPFfh5P+Ox9iO1fOokqrxnZgCOOcZluKfK/EpmKQk=;
        b=KBntoXmHrtyAJFWqajbSPCRL1ZfdzHxx/6xRUeqiPpeaPULFDGSMo4Z3BGUPbqiL6W
         muwqstUWC49K57HeCj/sm4YhBa3V3MWNvLv597ti2le8dDN6tHXArshRr9vf6x2HSzWd
         neW57PaPUdnQQMSB7Ksg/49b8vso3b5pGM8biNYv1M0yTd82r24BFZKgEtaO0qCKvTae
         j8IqZ5pIVBFx/+hb7+zt8fGBZTvIVsn4RhZlSkoO3A2dZTpMrvluTNMwetzt7ml3JHHE
         hCYya5RvJ69Qbi5o6+w6oERtf9JKMGOGT0l+NcWf7ilXVqZbPC80/Pnnj1CvKTJkqwgm
         KlzA==
X-Forwarded-Encrypted: i=1; AKwUvBxrGOHi7siV+/3OZLc3B1PelkxysVxL4tGxToYStn4OYhpmADaRu85ClTlkAXwwp6yjlbx28r1udTg=@vger.kernel.org
X-Gm-Message-State: AFuF++l4ZtpHH2IJ58eedF3r6jRnsE5kg1LrCIlHFmgCAd02Cg3aCFyk
	YaFfvuiko/Aqp1Rzo1T4wECXiDaM5nwKzWT53JyBH1cl0aY8cUF9aJJZ2KCS2aHA5TdsKNxjR1F
	5y/ZcyNzLOTnWu3t1GpT+HmEhv3TNqs0=
X-Gm-Gg: AYBFou3IaKfcRh5mYdP3eV7ECoRu+eNUV7QcKzZndDdqAQh5Xu20WD0gyor94Gwh4+0
	80NF4hXk4kFimFTzrXitx0c/cfWEn/DSR3fzWzGBmtzviFzLrbI1c5s534S/eg9aZoPQdnR2lni
	KtxyvV803vAMWUq2NB63Xf4N3IiB5CVH8IFQB0MKvif4X68Dt0KxtgktQI+deKMGEz+qZ9+/MZN
	OXdRgiJH6wQ9QrDfWLg1VRh85+ndOmzic2lnCKniGZLgM++OMmoi4pG55nVF8FBy4h4c9Q+YOzf
	YVNsayd9vVtDClftbiWt2yZ/FtBy4eIt8Or2bspdNPr9CZe3D2kw2XVypxUf+hSTateTyNeNONF
	K
X-Received: by 2002:a17:90b:5208:b0:37d:f206:a2ac with SMTP id
 98e67ed59e1d1-39aedf0d47amr642793a91.7.1788304349120; Tue, 01 Sep 2026
 16:12:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829011901.325379-1-rafad900@gmail.com> <991f3432-02af-47e7-b470-b21d36d09ac5@rowland.harvard.edu>
 <CALp66yH0C0WAgUDkXArbLHgwSdrJ0hfQP2id2xhztg-d=qK1Jw@mail.gmail.com>
 <23099c10-19ea-4626-b1a0-74a64fcb0dda@rowland.harvard.edu>
 <CALp66yGtNY1e3DFdRxMjf1YDnCLrsH_bg4gpyu-A1K0mRgOt2Q@mail.gmail.com> <211b5666-1777-45b6-b1dd-9e85276900b1@rowland.harvard.edu>
In-Reply-To: <211b5666-1777-45b6-b1dd-9e85276900b1@rowland.harvard.edu>
From: =?UTF-8?Q?Rafael_Alejandro_D=C3=ADaz_Cruz?= <rafad900@gmail.com>
Date: Tue, 1 Sep 2026 16:12:17 -0700
X-Gm-Features: AcwNN1VAxiPHHMPuQd5xCxqSUl1RRkB9p6xiPufD3mcBWcO93Hue7JIRvuc2D-4
Message-ID: <CALp66yFMQ+GTh=3iXWWMTcvDwc8e5tR0EpnmBDt=24E9Koo-wg@mail.gmail.com>
Subject: Re: [PATCH usb-next v2] USB: gadgetfs: Fix use-after-free in gadgetfs_kill_sb
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

I kept going at it and finally realized what was going on.

I added some logging statements as you suggested and
found that my 'how this bug is caused' is correct. It does
come from calling get_dev() after the error
paths, and the simple solution was to move get_dev()
right after the set_gadget_data().

As for 'why' the bug is happening, it basically comes from
the reproducer using failslab to force kmalloc() to fail inside
of usb_ep_alloc_request(). This will cause the following
error path to be taken:

dev->req = usb_ep_alloc_request (gadget->ep0, GFP_KERNEL);
if (!dev->req)         // This is true on failslab
     goto enomem;

This will then skip get_dev() and go directly to
gadgetfs_unbind() -> put_dev()
creating the unbalanced refcount.

It was tricky to understand given that it was failing only
on the N-th failslab attempt. Luckily gdb could do all the
things I needed.

I'm also happy to share that even Claude was not able to
figure this out and could only confirm this was the cause
after I pointed it out.

I'm certain of what I found and will proceed to create the
next patch with an updated message.

Please let me know if there is anything else I should add.
I'll wait for your response before sending it out.
