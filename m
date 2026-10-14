Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9444377EC3
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 19:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005778; cv=none; b=aYvlOsx/+0GjJxyA97upiM9HxwIkklH41HPcj/mtvV6fWP4LpD+/I1H4XqjWlOjgmCUUxOUFaQL3ZeMyNyYTORIJZs+ZQ4wxqZMeUjTnrlb6VB768wdm7mM1gV+RoGCnJHA27W4wYzo8xAJ9K96AWKqu1IxAl871eRqXkJ9XWMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005778; c=relaxed/simple;
	bh=k6hKy/iiYeC/tEylC9tyq/YIA9SjKP5IbxcHCVu/FJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EADKWJQwYJl/xbAb2uCLvKor18Y7kTKLqlKeoBcfW6ZxXwmqEGa8gBbnXvWB8EZGZ7Vwvtg6Z5eonY2+XEPV3P7icw+9pbEGydj1xKAfzxe9Il3q7i9w7lkLcJsE/r4Ib3BHtR2vRA3SltRYDIXjHh2xquZ6+GLLxlEn+QB9fC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Z7hotjxh; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Z7hotjxh"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5338f65913dso7944691cf.2
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 12:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792005775; x=1792610575; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MGLMFg8/OHrH6F2KqpVf23oCqRTqDJ+Uyk4rdMujuIo=;
        b=Z7hotjxhBazBD4FeCixATp5dqFbxOh2t6H/zXUpcvgYayXw7gTPBAc+y22Pyf936r5
         C54lUeOppLhraWJcVfzgWiPXeiGBg1Qv7FNwG9s3rl6UsegSAjxwzUvrvXd5Pk0/19JS
         +tH+F6DBPbkcBVFOC5oLSTOslUxFOlq9y3gGkp7OG7FRr4J+tJ1ExbIMF/PqP2kmWOg1
         pL/48tFt+6p18OReIxVJ0SLw3AxLqqBjd3eJH1NKs1qGFoGzcdvcX4Vt0idK0EOR9aL+
         0F04DEJl8bAeVvpjzvrCrNXDZ3lDYPJKug69vh7fs7vwm1/j+orbd27uEttTOsY9CM62
         Gs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792005775; x=1792610575;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MGLMFg8/OHrH6F2KqpVf23oCqRTqDJ+Uyk4rdMujuIo=;
        b=KGbaj3DBqQd/l5vg3WscAnIyArgPx8B22nFnIwNgmNj+xHW3L0nrkiWrnh7+C+Mtr2
         ALyj7LLdTV0Kw2PWT8K89XZMa/A+bDzqEb+1gY3Itv4YgjEK+d/FQJYFs7FnDctershB
         Opdp6XHlQ4pILSjmMDIFc/zBzk+CdURavMnbfqlxIK5C6h+BTca5gFWoDXbY6esmYP5a
         2/kbQ2M4oSn7PD/m6vdioyl/GCgDSJNsdqGMOh9X6AhiIDZGKc+PK+83n61YQPEesdC6
         GiA+JNaOMym0r7jpk2oM9qfx7GVRt3fQ7AsZbrtzNoWI7aTKfysUJnEXLttnbp2KAIHK
         7HqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzyu8FMiNq1pGCfjaggkZCXZGMmi7hWlwKdI8li1hOH4ViWbjJJwh7u+X9cMp+1MChUEhNqXIKSu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPflHNRVzXE7hopvsN2+o9BRZ1vaoiA5w0y+buPdNBuUlqEj5G
	dZpFKgsBStBk0VHvCEHSxdgpWMD6YPZy5lkFTY/K1SP3wTXxPD4MWEAIXJbfy1R3lQ==
X-Gm-Gg: AYBFou1q8q+MSBOAuSH0D+KDcPJJfr18Z4uZQpuk3WpTzOrgOFWtlmowKPajACfzVUV
	9GCCAAR3lYSKmuoEaG68VuoqH4flBujjl3bShGXo39Wlwg2Gh6FKq3uQSMllE7C21c3uFp/vX0Z
	nQyfQ9B1eL1/OquVqcljviToNxWduxyXKls6Ucey7RVDuqW55klh7qn1/sg5MO9m18sTEHssTZk
	bsnPAY62YIZF8K5qHMRZSqljleDUSsRqPOYm2pRGKy2H7sxYlqfAu8NiQidJ5zHPWE1UXebKVmO
	q9jXInXBURNRsgIXlMht9WX1ArXTfsKbYiUmylBEHzISlAcZUZ13Nx2rk6NdJGerthyT5+3h6gN
	OKzHqmOi2XhCBVmQyDdnYG8u7m8vMX/3wVCKkpCQArGcEGrS3WdwAf/Xj9SUuobgc9xNSok0E56
	6wO/a4dEn6MNczFVYzKmZxgkxpOp3mTZBqyNSUT4oNAEh4sn9PNUEs0DKORgxw7FxUtthZoeRu1
	5JcBJu+YkF8wLRnAy4aRT2rNtDt2vPRYAMrxixN2Q==
X-Received: by 2002:ac8:5f0c:0:b0:533:3d83:c20c with SMTP id d75a77b69052e-5359fae8d7dmr290066141cf.23.1792005775330;
        Wed, 14 Oct 2026 12:22:55 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5361284b1e4sm4745731cf.31.2026.10.14.12.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 12:22:54 -0700 (PDT)
Date: Wed, 14 Oct 2026 15:22:51 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	=?iso-8859-1?Q?=D6mer?= Mete Kaya <omermetekaya0@gmail.com>,
	oneukum@suse.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
Subject: Re: [PATCH net v6] usbnet: fix smp_processor_id() use in preemptible
 context
Message-ID: <89da3b1f-60e5-4f18-9592-3d6d7175c437@rowland.harvard.edu>
References: <20261007200049.079aeb75@kernel.org>
 <7c4a2f1c-f16d-479b-a11f-cef962d5e2c7@rowland.harvard.edu>
 <20261008094338.301a75fa@kernel.org>
 <06a81ea1-b17d-40bd-82d9-922de946b86f@rowland.harvard.edu>
 <2026100910-petition-embattled-94cb@gregkh>
 <20261012194902.aEq58Q6b@linutronix.de>
 <8545800a-a37f-482a-9b06-cbdd70312b7a@rowland.harvard.edu>
 <20261012212527.5sFqlGYu@linutronix.de>
 <41af30de-4725-4913-9ad8-54d1dea2d4b8@rowland.harvard.edu>
 <20261014191141.GxlJhR1e@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014191141.GxlJhR1e@linutronix.de>

On Wed, Oct 14, 2026 at 09:11:41PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-10-12 22:09:25 [-0400], Alan Stern wrote:
> > > > Today you fix VHCI, tomorrow some other virtual HCD will cause problems.
> > > 
> > > We don't have other virtual HCDs, do we?
> > 
> > Well, we've got dummy-hcd.  And just recently there was an RFC post with 
> > a virtio USB HCD implementation.  It wouldn't be surprising to encounter 
> > other ones.
> 
> dummy-hcd is timer driven (so BH). Without looking at virtio I would
> expect it to be interrupt driven.
> 
> > Also, don't forget, URBs can complete in several different ways.  
> > There's normal completion, explicit unlinking, unlinking because the 
> > device was unplugged, unlinking because the device or HC is going into 
> > suspend, and so on.  And there's a difference between URBs sent to 
> > root hubs as opposed to devices actually on the bus.  Not to mention 
> > that in some cases completions may occur synchronously with submission 
> > or unlinking, even though they usually are asynchronous.
> 
> True.
> 
> > > Do you want to document it yourself and have me do the VHCI bits?
> > 
> > At the moment, the only thing I think we can actually guarantee is that 
> > completion handlers will be called with local interrupts disabled.  No 
> > commitments about process context vs. interrupt context vs. BH context 
> > or anything else.
> 
> "local interrupts disabled" as is local_irq_disable()? If so, that is
> not the case. If it completes in BH context (due to HCD_BH) then
> interrupts remain enabled.

Yes, but we can call local_irq_disable() before invoking the completion 
handler -- if we decide that would be a good thing to do.

Otherwise I would say that we don't guarantee anything.

> > Of course, in special cases you might know more about how a particular 
> > HCD works.  But except for platform-specific settings, it's hard to be 
> > certain that your driver will always be used with that one particular 
> > HCD.
> > 
> > If this is okay with you, I can write a documentation patch.
> 
> Sure. The kernel doc for usb_hcd_giveback_urb() says BH or caller's
> context. I think you need to clarify that part and once we have tha, we
> can proceed with the drivers.

What do you think?  Should local interrupts always be disabled, or 
should we offer no guarantee?

Completion handler routines will have to be conservative, so if we don't 
guarantee anything then they will need to disable interrupts themselves 
whenever they require it (for example, by using spin_lock_irqsave() 
instead of spin_lock()).  The core could save them this extra effort, at 
the cost of unnecessarily disabling interrupts sometimes.

USB isn't a tremendously fast bus, so the overhead probably doesn't 
matter much.  Which tradeoff do you prefer?

Alan Stern
