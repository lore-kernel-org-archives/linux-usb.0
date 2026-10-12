Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD30377A9C
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 20:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791836795; cv=none; b=p+B9ArhKC091s0NkHuKQ4eD0QNzWP5BrWQwtPyzPWf+0f7jRG6IQpthkIlmWH3Ad7t3XpX+CLE8j51L+JtX+HL+UDn2+7I060YQM2pTg6zLKv/7xboFvUN9Nhl/xStr62u0SaVjH4MK3exxPbr76yQbAsvQQ1aZUroHpEXGf3C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791836795; c=relaxed/simple;
	bh=TmbCJD6b1HS0t5QfHnVQZEbNYoXTp7LevXITI0I7LAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5RAJPlxzbKpuKEIwCXYooLhzOJLrz42jaqum+gwY9+qsiJbQiAszMNzzK+VySnAczEsDJFKx00OkZvKevaEJwfwwcbm8CEoLQlIu3O8x62ud3Dr0C1+HxBNPmW8S8MWy1hvCsj1mH7eTpzS5nKFqff8LOJsIjocjnnlmc7V+SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=oao5b89w; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="oao5b89w"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-917a64f28d0so57858846d6.0
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 13:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791836793; x=1792441593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wNQIu44JCi003fPRYl0iEpsbAlOqdcmn83C76AdGLFg=;
        b=oao5b89w2RCEsW6LCXIRoF5jEv7/FZ6Gj9tO4Wnib/shZ52Z27HcUDvMo34tuan8m/
         50rJX79HMvVWjepZqPMMkMJPj8HhmGsg/BQuzK1N2unKLDb5CLFU8yoKl9Pe9eyWvqbN
         GCnjjZbApjtvOwLuk0rx6mRmL+KPSGGzqxZsrfanDCM6TemxC5dU4uIjo4UVHibBSHqt
         v9VaFSzK+sz8L6baH5sPVA5/P1C0EeYL41AeanYJb+bOZIHmampn6BQEhbwwpci8+qcl
         L3hp8Wj1FZ6XVaTiVpBwr46MA7//FisNxPcSU3fj/ceJfnDAvQNVXCDkWLwRX+ADL0O4
         usNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791836793; x=1792441593;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNQIu44JCi003fPRYl0iEpsbAlOqdcmn83C76AdGLFg=;
        b=0bMgsYARzC0rJC5VvkA9ri/hbMveQMLspxtigHcLUOXd/m9M5/s/RKg18vsxvv/5MT
         9GURH9Ss7WVz4v/DzulRh9su01sAx8MmmrhQjQ0pEPvTom/ZEr+TqI48XvsccQcGQc7T
         KR0DpIDYUtikDFx4rnDmFQHQ+wFqDPlzkYVvkce9m8gHQ3d2tgyhMV9wRUlHuY38kx6g
         2QpRofgzRvOmlpxws39a1m9V1dWxBoSP6ILshBS2u5YokV/LWcxj/JSod2L5n3r8D+mQ
         HGSs2iDRnsBd40pRqyRU+mOK0Bwv+GntUBmz6YRAk0P+2+qNw0yvXWkQ3id2HpPWtEaT
         cfwg==
X-Forwarded-Encrypted: i=1; AKwUvBxRm1yDDLpw1UlfoMArMLfInb4fjVhU9dQKH/pigUWdQNoruifepvArG7w9FjRGUgWzKP6Vl4mnmYM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZMQqpqi3zjI/+xz5Laj0sLSHqF7kO04dcWACtQ31N7SpCQthr
	V23JwVXU8itsH2Cqt/109GG3cc6odCBvO6IfbivCqq1hbmx5xJVTm8I5W5jEEKcvXw==
X-Gm-Gg: AYBFou2Y/EHJ/JO7sJVVErZV5k6O30+s4ZRRZ9Sq+nPRFZA6TiNAuaok/TihuINH3+w
	Q+vDMJfzP2DIUixLu3QMcibg3zuZU5y12CZYmV4tJ9xSeivtKTCKEAmbtJgS8uYJNtO6/lu5FTq
	zrx0VQcGH9LzSEhRA6sTnBNl7YYRZKuuOR0TPNJkDwbTd6UJFjlzE7Ioc2touyOAFeisKtxf8H5
	91iBQx5En5QAF9iqOg9CIQ5klgnIH1RX0YpsHHxMYAJ22sgrkKx6zVddIaCywBmyuCuqJJTefXA
	wx5CXJMhuIytjrrcf0dt/RZ8QZ6hrimmvbg3fycVsectOqxQynZ8xx+PtvlixVb/W3LfTee8BOo
	Zugelskt9vU4xrhDeY0FiBIrOIctrK6lkgu8R7NWfovrqlmx8L+ByE0FgZejwqTORP2TrYphK/d
	OQvL4to15uVZFzQnjHLozI5Jb+T4DKsExnhdf0hZS4fjf9qNOsA1PmHeHQNBN5oRtlUZ8P/lxdY
	Xr6icXJjg==
X-Received: by 2002:a05:622a:148c:b0:535:8d35:6355 with SMTP id d75a77b69052e-535a6073d08mr165366511cf.5.1791836792690;
        Mon, 12 Oct 2026 13:26:32 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b76b030sm87256001cf.17.2026.10.12.13.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 13:26:31 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:26:28 -0400
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
Message-ID: <8545800a-a37f-482a-9b06-cbdd70312b7a@rowland.harvard.edu>
References: <20261004215937.302247-1-omermetekaya0@gmail.com>
 <20261007200049.079aeb75@kernel.org>
 <7c4a2f1c-f16d-479b-a11f-cef962d5e2c7@rowland.harvard.edu>
 <20261008094338.301a75fa@kernel.org>
 <06a81ea1-b17d-40bd-82d9-922de946b86f@rowland.harvard.edu>
 <2026100910-petition-embattled-94cb@gregkh>
 <20261012194902.aEq58Q6b@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012194902.aEq58Q6b@linutronix.de>

On Mon, Oct 12, 2026 at 09:49:02PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-10-09 13:31:17 [+0200], Greg Kroah-Hartman wrote:
> > > As far as I am aware, there aren't really any guarantees on the 
> > > context of a USB URB-completion callback.  The kerneldoc for struct urb 
> > > in include/linux/usb.h says "The completion callback is made 
> > > in_interrupt()", but that is most definitely out of date.
> > 
> > I don't think so, I think some platforms still have those callbacks in
> > irq context, unless we changed to threaded irq handlers everywhere?  I
> > could have missed that, but we should still write the callbacks to
> > assume that and then we should be fine even if we aren't in irq context,
> > right?
> 
> The HCD invokes the completion callback usually in IRQ context. I think
> the VHCI is an exception here.
> For the forced-threaded mode we disable BH before the IRQ handler is
> invoked. I think even dummy_hcd invokes them from the timer if my memory
> is right.
> 
> > > Drivers shouldn't rely on any particular context guarantees.  Not even 
> > > whether local irqs are enabled/disabled.
> > 
> > Agreed.
> 
> I would suggest to make VHCI invoke the completion callback with BH
> disabled. usbnet's tx_complete() does also defer_bh() which schedules a
> BH worker via queue_work(). While this works without disabling BH it
> leads to waking ksoftirqd and an additional context switch which we
> could avoid by dealing with it directly.

Today you fix VHCI, tomorrow some other virtual HCD will cause problems.

Should we document any requirements that all HCDs will have to follow 
and that all completion handlers can rely on?

Alan Stern
