Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7DC39EF1B
	for <linux-usb@vger.kernel.org>; Wed,  8 Apr 2026 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775637230; cv=none; b=MX0FCHfAsqtHYOH7isMLDBeVmjhHrdUaSI682SuJtK/G+y8SJwxIy9Rp5Mq5thgDzEcocNgONqLIu2xXyEHA4wFyOHGoSg1lBhVqAoN/Q8ngXrxsh70DEwJHMkOqd1+Ppp2n7v6hRYoBW3m95BsSKnh4Ebez9kKrUS8gM+1iuPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775637230; c=relaxed/simple;
	bh=OKjKmjKCU62uaCjhibuDqhSE1AGMzLcspem2OqAtVYs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PXRB6QGYO+QLcXpXYFpMcuaWGRzlIfp7dUE161E1SB4oeeHNICWgcPsZ4l6RSvc/cRTMQKclYXbcvLZFKkph9W9l05X+eXyxWEieTpNSUR2mEmHylMWtGPQyUEuy/gSDF/AbjZPDmIAsk8YfKaTDWK3P0CBRbGnXyQYbM0UZKSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p77gfSBu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p77gfSBu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488971db0fdso48094505e9.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Apr 2026 01:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775637227; x=1776242027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pbj1pinyLCpTvRMDqb5wMltAGKRQ0z6dfcrCaaij6ks=;
        b=p77gfSBuAxonX9liwZs+8/t5Mudz4WzeCGIoIxYvYIjpyA3tLkryVpFL4NFPypkswo
         y2I+VVzgrjUd10ofAtxbWy3xVVEKHqt40qaZsvsUZrUFxhR+SJWWfeKZLncB6lu5M9z7
         /+yfuyXJi4tdiDDIfAtiauxD6s2BzLDVxZOt3VB9BUohrKOIcuoxctCRQ2uky0cJ/5QH
         S/4m8vwXpUVv1OmZmqFztiCNstj0LouYQEiQ3VihAskewy6QWq02TBIsXihwa/puJMRb
         rhzyNRlSkyBQTp3xfIzWsSk9ZK+aCijcv+/iy3FjYDiO1qmk0cD8TX+KrngXTsIh4qxN
         P5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775637227; x=1776242027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pbj1pinyLCpTvRMDqb5wMltAGKRQ0z6dfcrCaaij6ks=;
        b=sJP+H5MBcLptWRiXn5Kp/CM5RE2d6g0drjprGS5AzTzsC0HoEnDKm+Dj6adMizXuqz
         hWPzCvw+rM93z1bVEZI5Y3QkmcGuOa/3fvKIvNm6wVtOig4soBUEv8ZNTTjZfyRWLnXT
         iJDbpn26I2W1PHNDjFh2YHoY2vsR0HSmMsbab4XcKpqpeJ9vruPYgbDbD7S6dPPsdVNx
         6dW/fbsGuxIo4cc98Y9Bg/JFVaYis6AwnUnOjhoHGqorqCdUj4dwebLTbpaxd+n0BcI0
         QU706XEtsHAkDFLQw/JXnkYnvhWbnqX37IpTdgzmss997n1SI+xMpK19AjXSBlGBGhzs
         RC3g==
X-Forwarded-Encrypted: i=1; AJvYcCUCbcxtZcPJshtL2h/jxKXqwJzLPELVeozkU9vz3cJk4o6awduOusBbuFfF89S5YuaB6U1mTMGtOZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuIAtIkALovUkNcQaNw9vTu3bp/QxcwnyfJZQGRXFZPQG+Nlf0
	jXt8SN0HNMGFGZcM7qMmAD9Jeflj0rnqgGdhXHFN3uU8OeEVb93IsBAg
X-Gm-Gg: AeBDiesGnZW5lxjbL17tONbE//bEE82fanP9seVAPvR/sWFFjaUmR4fcFrBgmkT3fU+
	bTz72sKBiOVH0YkGsLHedTRMGyL3QsIn3Y/KLdaYRtted598aNuw4dWvZxcscrrnzRIJNilmcfi
	oLhEPX36EIFRc6Sc39GSIGj2PyFA27WPakmFGIUTZVVJY/rnPMnYvSFzUcSuylRiPeEluga/tfg
	IwgLf1jozBtgmmJNSUocRuSE6qjKupsJ6WukZWlXZudagtRpViHWHGYP50IgP0Wa6rA0m5QNFXP
	rhPL0pMRkzCa9UpQMRFoPBhqvLi6SaemUgCuw5cmUbSyMSOcbj+HTlz33iGrhJVVI9JFr2lI8xE
	cq2LGJf7bP+MU3kRTdzt7+/hVBRkYdRSHSf00WILNJDYcqEZjhjbDrROPkawt7OdeyU39RcUSj8
	Cvp4quqSM03wDGR7Dec5c2y9ewHat2HLnK
X-Received: by 2002:a05:600c:3b1b:b0:488:8bdd:cfb9 with SMTP id 5b1f17b1804b1-488996b01c8mr283650655e9.1.1775637227307;
        Wed, 08 Apr 2026 01:33:47 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c5db33b4sm17711325e9.6.2026.04.08.01.33.45
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 08 Apr 2026 01:33:46 -0700 (PDT)
Date: Wed, 8 Apr 2026 10:33:43 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Petko Manolov <petkan@nucleusys.com>, Simon Horman <horms@kernel.org>,
 Morduan Zang <zhangdandan@uniontech.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+9db6c624635564ad813c@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: rtl8150: avoid using uninitialized CSCR value
Message-ID: <20260408103343.19cf599a.michal.pecio@gmail.com>
In-Reply-To: <76d6b341-27d5-44aa-92fb-3b8966d609df@lunn.ch>
References: <93FF85BB9F33CD2B+20260402070743.20641-1-zhangdandan@uniontech.com>
	<20260403154538.GA187715@horms.kernel.org>
	<20260405085212.GA8491@cabron.k.g>
	<76d6b341-27d5-44aa-92fb-3b8966d609df@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 6 Apr 2026 01:38:06 +0200, Andrew Lunn wrote:
> > > -	get_registers(dev, CSCR, 2, &tmp);
> > > +	if (get_registers(dev, CSCR, 2, &tmp) < 0)
> > > +		tmp = 0;
> > >  	if (tmp & CSCR_LINK_STATUS)
> > >  		netif_carrier_on(netdev);
> > >  	else  
> > 
> > I was wondering if calling netif_carrier_off() is the right thing
> > to do in case get_registers() fail.
> > 
> > There are multiple get_registers() calls that don't check the error
> > and if we do this in set_carrier() maybe we should do the same
> > thing across the whole driver?  
> 
> What does it actually mean if get_registers() fails? The device is
> gone? Hot unplugged? If so, you are going to get a cascade of errors,
> and then hopefully the USB core code removes the device?
> 
> Are there any legitimate reasons for get_registers() to fail if the
> device is still plugged in?

In principle it might be temporary EMI or a flaky cable. These errors
rarely reach drivers due to retries in USB layer, but in extreme cases
the device may be in unknown state and it may become functional later.
IIRC net layer has some operations which are presumed trivial enough
that they would never fail, so this could be annoying.

It does seem rare enough in practice that for 25 years nobody noticed
carrier status being set to a random vaule by this driver.

BTW, some functions like rtl8150_reset() pre-set data to a value which
will be safe in case of get_register() failure. But here, unhandled
set_register() error is dodgy - the 0x10 bit may never turn on.

Regards,
Michal
