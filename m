Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6832A3CF049
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 19:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956519; cv=none; b=CPbuh2r5OmFLE6tBMpfNZmZeGQ5+VIiPNifW7Ycw/fMh0eFY649q5yCnlM4tOmvU2QCDApRHDrWsrJgzEXo13R1Ov8qoNO58YTBz6Syqs+tECI0eMs7c9nxtFgiOLajMtQhOyOIvlHzvyzNqbRVzW+ssgxgNnJY1BZVO9Kq6Dq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956519; c=relaxed/simple;
	bh=BkYIMS0JnSL28vOZWi/cHFLfEWOXmS4UmQtiEoXZZ7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9R7OVH3jkDaAM4+SBRtmrEQRrBKCyA6GB7KqnXOXnvnqHE/MyVWzpEU/yO+kKA7e89tOBfpQ2Jk8WtHAnpw70hQvmcdOoAUrIBBGSBDqi02VC8NQ91PYM8vo2gdQ74O7yOt/MO5/QxiA0JJEEptqLcXPfbPO+159RrNZgce6t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net; spf=pass smtp.mailfrom=tremby.net; dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b=KE9Zkve0; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tremby.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b="KE9Zkve0"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso1638050a91.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 12:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tremby-net.20251104.gappssmtp.com; s=20251104; t=1785956510; x=1786561310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mh62BX5l1Y0sg6n2akh7SCRoxpY5yT4NGuFBJRc5BUo=;
        b=KE9Zkve0kGwv6A4hEE0ec6/pJxuHU7WDQilfH2PcovCos1mESyiAUv6zAaNYeMh/HG
         gvugS8r+j/l3T7WyqaCIqkDhYgWTqN8CMZRsaL1ot0cxupTA4vdIBJ4cxdLRfEdxRReT
         aRgUET+KjFnDZZB63iAcKxjVnQc7D2TZ68JMkOU8/abfP4dA0Nv2Egzde1xkqsbGou+Z
         2H9nk6li6oOu1Hw2Ns6SSULsFzTiM8yjRMzs88LADkhDS8YDk5OfIMwlViu4lqMn50iR
         8OeZ+n49U/+x187gsnxdYXxYlyDi+0AvrtBsixRZGiScHYkrKsrx0YHMlpwuN+O9Hs4i
         Xseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956510; x=1786561310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mh62BX5l1Y0sg6n2akh7SCRoxpY5yT4NGuFBJRc5BUo=;
        b=TXfyR57GeCo+3YoappqqINiNPm/8Wn0G7THWuLII0s3ibPbEtAIMezOwX1jBEfGEFw
         dKZvmZhc0qyTvoDtVNk5SAf7lnZefJIE/XOnzEuDu+ESMHMHDvQwm11TtKyHzFuUE1GW
         45WP0CTWEQF7CLwqIzhoQG0QEEKCjJU6dV10HYhBYKb3WNSxpfEa6dKvlcatBoHgbVYH
         /E6i40t49ggRIe4yDANX5PEp+h2rz353bIeu0785r2G4zBtt6oFWv6kibd2BFCr42FfA
         fXPxirfTf9TubMeMdlvvqktUzCbOq5N6VwgBvcvL5HzBPk61bZrVnVFWCR9ct/8OgjGk
         G3ZQ==
X-Gm-Message-State: AOJu0YwHpz/bJvMj+V917i0u4R3+QYRxf0cvLIBvuq011DT9l+67tfup
	ma8wT/OSgXg7LCT1gLNG5RF/xRKSJfHbFJLUYgx44pQmPa/B8OeQWIRW+nZXbhbEBCHhYqezIAK
	BjK7yPRtTcg==
X-Gm-Gg: AR+sD138yLNycyYUQYO4DCUryP5VC4SBQYxDh9K1V9p51vxdGckAlLXFdNsU1XdCHN1
	Tw7h0/NEl05gjcBjiwJ7SmrXLkdCkqARg3UfoVwWimxGCR5oyCSPryXA0RWgGX80e+cZWWgH63i
	lLRRWhS+2M6QV1ozS5FAvU+9bzX7KqYqcxcIhwAaBTsFZYu2cA/gtIDeUZhNGa39AiFIJTm0Sw3
	wmUG9LPgDEro9pgIZAPOJbLGuQPwo/rfyfrYd0h68nPWAxY3tPYAlSYlhIZTyr0YZl6N6ONyFXS
	1JZd90a2GzYJJE4LPpjEQseBf/fXbp1gh0sjFisA7lOcr4V88smufraLpzU/mgVMJoFTnRJ6oVt
	Vw/ZzvDWVjJrTRnqZyD4/RTHHxNd9hm2rm06jRjXerdxaNLThOukOWHT++Dm1vReQgmLY9+W0hp
	1fJa5+VfvfqZ57AW2AuejaDn6K1IbwuWizzXmUw4BJ15Yr707ZxMgmzPOdEoklBIL1uB+Qxhqdm
	K56mEpAxoljhHBdM6H10OZ6YNFnDGIk01QLeC4uMeruzlU=
X-Received: by 2002:a17:90a:ec86:b0:38e:bbf1:de34 with SMTP id 98e67ed59e1d1-3903c537a12mr10000507a91.7.1785956510256;
        Wed, 05 Aug 2026 12:01:50 -0700 (PDT)
Received: from localhost ([2605:1700:2080:8400:6387:b412:85a5:8bb7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903d2f9a9fsm2150287a91.1.2026.08.05.12.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:01:49 -0700 (PDT)
Date: Wed, 5 Aug 2026 12:01:47 -0700
From: Bart Nagel <bart@tremby.net>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <anOHQ4yEdhYvrXOo@spiral>
Mail-Followup-To: Michal Pecio <michal.pecio@gmail.com>, 
	linux-usb@vger.kernel.org, mathias.nyman@intel.com
References: <20260723081440.0228c59e.michal.pecio@gmail.com>
 <amJ9jAtK8rNWDO7V@spiral>
 <amKUdIRBrsFiDTiV@spiral>
 <20260725115956.321185a1.michal.pecio@gmail.com>
 <ame6T_LjiJBeJ2W3@spiral>
 <20260728003131.085171ee.michal.pecio@gmail.com>
 <ampPGn-3C9PSEZQz@spiral>
 <20260730130814.65f7891c.michal.pecio@gmail.com>
 <amuTKengDzr0IL6b@spiral>
 <20260730235953.2d51e0cc.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730235953.2d51e0cc.michal.pecio@gmail.com>

At 2026-07-30 23:59:53 +0200, Michal Pecio wrote:
> On Thu, 30 Jul 2026 11:13:59 -0700, Bart Nagel wrote:
> > At 2026-07-30 13:08:14 +0200, Michal Pecio wrote:
> > > I'm slightly curious what exactly happens there (probably MSE after
> > > Short Packet on a single-TRB TD), and whether Missed Service Error
> > > may point at a Link TRB, because the current fix wouldn't handle
> > > that and the stream could still hang. So your failure rate may
> > > actually be reduced to 1/255 of what it was, but still not zero.
> > > 
> > > If possible, please boot the patched kernel again and run it for
> > > a little longer. If it fails, post dmesg starting from the "Miss
> > > service interval error" line which is followed by "All TDs skipped".
> > > 
> > > And while that is running, also collect another log:
> > > 
> > > cd /sys/kernel/tracing/
> > > echo 1 > events/xhci-hcd/xhci_handle_event/enable
> > > echo 1 > tracing_on
> > > grep -B5 Missed trace_pipe | tee /tmp/trace
> > > 
> > > This is supposed to log 6 lines for every Missed Service Error, so
> > > it will grow, but not terribly fast.  
> > 
> > Before I make a bad assumption and collect a useless log, please
> > confirm for me exactly which debugging I should enable. Just the two
> > you gave above, or also one or both of the ones I was using before:
> > 
> >     echo "func handle_tx_event +p" >/proc/dynamic_debug/control
> >     echo 0xff >/sys/module/uvcvideo/parameters/trace
> 
> Yes, please keep handle_tx_event, otherwise xhci_hcd debug messages
> won't show up. UVC trace is not that important.

OK. I ran it with your temporary patch for around 24 hours with heavy
system load and didn't get any freezes. The logs are large; please let
me know if there's anything I can grep for which might tell us that
the potential 1/255 chance of a freeze still being possible is ruled
out.

If you'd like me to run it longer I could, but I otherwise intend now
to switch over to your more formal patch. I will post a question in
that thread shortly.

--bart
