Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378850;
	b=g0boEkfFzPHcIU7JHC+iaE0wB1NdsDNhBBtAZEhAPxeyGDVlJZzjbL5dvsSjmCkp/B2l
	 EvVazYEvqtHcFwSKKB6Q0e+mkQLiHcB5Qzi5f2Lh4QVEthNoeoa/wYpLr4Xt4fpumlETi
	 iPvO9dleIf+Ae5aYuSKV++acy0El35Obokcl96RSGMC708B8wo1uGQNaETE+cJcGH4/vK
	 yb6ER8kv3/3aOsgsTQNug0CCXAwhTlvl634tfV+uJ+Mewe7pHztp1zQGMrsdPX2PXVjX2
	 Njh+hh+wjfspNeJhpKJxdRQgG1vkV+zGNaRqF5TMNL7j2k4hPpeYvRIR7X5e4Vcr3Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FMmE5g1sOpByMOfnDKLbtK5O3vhD4LZZZqXjGPprOuY=;
	b=LGzJr/D2pv8EcfyJqHhx6wdVuEo6UcXbs4WEeWoP1gptQycXITwoCkibK+Ek8XJdzlXA
	 weI3rnUzab85zoZ0oSZ79j7KWhTMgexd6JvQDjqrOvnGEOKSfz4C/DVbcgPXpr+QF/FU5
	 DLrTCMpYJLKmQmh+kQgEqMllL9ezQvp7SkeLtFdryXFeJnt3dZ+zSDjFzLwhONh+mh1sF
	 AOic+rjxMFRCbmKHe9nuSWR0LHsqGvd3HG2178MOKZDlVlUrg+9W/Wrr3bwysfGs9850a
	 iNx+ZrCdT+xJTW7ljsH+aJ3O2cA3khqEb9xdEspgS5TcEJrs8IjHISFs1Tx+yVyXJ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gkAHACoS;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1329A606A31D
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 16:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1329A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gkAHACoS
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c5358fc28so745823f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 09:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793378843; x=1793983643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FMmE5g1sOpByMOfnDKLbtK5O3vhD4LZZZqXjGPprOuY=;
        b=gkAHACoSOcJCKNZofdu+CTTa+bGqVPAJG/3x4+J1z2sxmTNgpD6dZCx3Wt7FAmLTKg
         CA61OS9avrdCIqMimwfn2G0S+10P7gSeFFQiKADy3bByYfZqTNHupPalsZnnRADHmZ3P
         TnLpg22TqRKXwqSLAXDeXWEeuzN3U7r19+Y/FVjWjiESjuue6pmVp6ILr7vC8yuDBaac
         GrDxB9aEzWKAtLlnX/2TDjA/7n5Gk+iCbmR9NnfHIGlMjQnXEFp7ukxPZWUxUoT5vYCd
         U5D21YCMVSuSxXUpZxpScAW1rK4SLm1uTCWljn9ChxTtmAR0vmdCcHx8Jjl2dXfQTUyc
         hpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378843; x=1793983643;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMmE5g1sOpByMOfnDKLbtK5O3vhD4LZZZqXjGPprOuY=;
        b=keTMvIg6Nb24Q59z789hbEa+YfzeBhYqYtX6Xp35pITO18RNEXgmTil0g04wbCneHa
         lCcaJQg8fakCr+99vR9Jce6DeuhrOYxckzaZiFsYFj3Kw1LJVlb4QeiR0fxL8WbMk+Tg
         Cw/QgV3X4yUMiI/CMlfP6hbxHL6i2lKON1G5LWrRB5LMj6Rkv5IdKQZ0WizGaw9t1dg6
         kGvqunjuztq9Wjd05pTSwv0MNDGFz22IPnkRxc33J0FlZ4QYYWuErZOdI6GH1bdcAsmF
         zb1jCQm58nhdlTPyXXaME37iQq37VyYtuhmSsmEIa3cJL29B8dEg5MDRyHbSChO4Eqme
         gXuA==
X-Forwarded-Encrypted: i=1; AKwUvByD/dYJsp2kTXlaRKUXFAEX09Tn40C3GNUIfdWLBr5Fd6Dmu4Jfa0JlAZsG4jgMgMljhn1uRroD9I4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIx0bbj+s1724KfR8DrIK9QfUIpdbapv2rv0eVliPjOZBanBd3U
	UU8VjQWQmm8phgbZAIV/ldW6NHBpjWRoIjWVBW4iTX2Y69auNOwJY4Yw
X-Gm-Gg: AYBFou2QolNsWeaqwXr8SXteLh/9o7ttsHdFt0oRoQxe8B0hPhCHS8oI7XTbHXXuSYf
	PhjtH5xUPX/HcV9OIWBRdor25nokMl2/6qfIUQ0Jv5AC9Iqovid8gBWU31uEmev4YslQ4yBNr6D
	3VJixpdLUfi6b3ntd+zO3XB3C193br30jObMJ7NvX6PipPJHITinyg8pOSOlQTkpxrof0LZjl74
	bFzUd5KHJvxzAWHmZRu8HNKr1lR+IURuiFx3KhCmWVxEc66wsFyeKfbitVkXqO2RVu5lAOzkq23
	IQOGULGpLZQmKbkXE1K73k6LknxkgOaQKad+bDa1BgwQ6DkizhgDkzisgg6FBe6EHzrHEE680tY
	4uId1sY+B3kKlBe1X+Ve6tRisa54HkGJXjm9kl7HjJPRTLC9zzxurzR2VMrSVm6hqjzMjb+m3Yr
	TibFXiI8BEULCJEqxxVy88SLF1uMjWlZ75iVC02W64Yrm3OjBbwWkD9JJ2qmHIHPNXE9CLdBVup
	Bw8BIbdeu0pZSeQVf7ozJA5Bpv1alY7u/5d0Qo1RtgSviKzwxGSYjT4sSA55keII/9CMS1DvCFl
	wvRuu5h1djNXzIurX8wzK1vhQkbyGHBeGafzgg==
X-Received: by 2002:a05:6000:184b:b0:48d:deaa:4dbb with SMTP id ffacd0b85a97d-48e6e2fc210mr6951364f8f.40.1793378843333;
        Fri, 30 Oct 2026 09:47:23 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm3901707f8f.25.2026.10.30.09.47.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 30 Oct 2026 09:47:22 -0700 (PDT)
Date: Fri, 30 Oct 2026 17:47:18 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Dennis Wissel
 <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron
 M5 (3434:d068) at boot since v7.3
Message-ID: <20261030174718.1f28218a.michal.pecio@gmail.com>
In-Reply-To: <3ddd9334-6dee-48cf-8a62-82cebbe51d7f@rowland.harvard.edu>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
	<20261024203558.3181711-1-yiyu@yiyuzhou.io>
	<SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
	<20261025111410.2c14fcef.michal.pecio@gmail.com>
	<7082e2e7-8d05-46b8-a26b-5b888a7a0545@linux.intel.com>
	<20261026105139.6b86cb3c.michal.pecio@gmail.com>
	<3ddd9334-6dee-48cf-8a62-82cebbe51d7f@rowland.harvard.edu>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 14:56:49 -0400, Alan Stern wrote:
> You can read the login in hub.c:hub_port_connect_change().
> 
> Broadly speaking, if the port is enabled after a connect-change
> event, the core tries to resuscitate the child device (and checks
> whether the descriptors have changed).  Also, if the child device was
> suspended when the connect change occurred, the core will try to
> resuscitate it by treating the change as a wakeup event.

Thanks.

For USB2, this seems to happen if a reset was queued before a brief
disconnection and executed after it.

We believe the issues reported here happen when a device disappears,
usbhid sees -EPROTO and tries to reset it, then the device comes back.
But what happens to a device that reconnects during probe doesn't seem
to matter, as long as it ultimately gets probed (reasonably fast).

So I wonder how important is this feature and what motivated it? Are
there known use cases that depend on it? Like devices disappearing
mid-operation for a few ms which need to have their state preserved?
Should we worry about things breaking if xhci-hcd begins to act like
the device is gone: ESHUTDOWN completions, ENODEV on submit?

And if this happens to a hub, can we rely that its children will be
freed and reenumerated, or may they also get reused somehow? If they
can't, are they guaranteed to go away before the hub is reset?
(Because that would be convenient...)

Regards,
Michal
