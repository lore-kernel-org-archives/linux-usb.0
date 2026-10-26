Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008305;
	b=UM7LnfOkSim30YdghGm39bPiPru+9thmSGGDZ9M05+DNsNj3Yb3GzIYEXko0A2eBoyUw
	 JbCY75bT28/pBLWA8dIAlQPOAQpcoHzEODF5pz0C5zl/WCaChJ+vwRq2qF4QtZj4ewf2h
	 Ux9muF3XHZYsJEwFa7iBluU9tgocRXB0Z5wF2VPRb8tqxY5eAlRgyoFqT0itXfVAeHlUA
	 Cz+DFfP5jXlFUFqqG8J/8m/6Aq4TqZeWNZor/x/arIFIQ8i7UdxuXOvcv8vsVv4ZVPLC3
	 VxB+p/Ldn1kst/S1XDjEruPmn7Qz1skMKrze0MeNy0Cn3836pJRcNAasiz1fHFabWcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JgmEPFVnTpRCUP0N3Fa9flIVssp/Qodc0qLnWI6QuoY=;
	b=ohTJvBxiW5giE9lDB/GZkE0fPRr8npkt4ecH+ydR/0Nt1CobqU4+Dng1ALqhFpONf7ha
	 9zkumUbuY8O+kU1xpSDrc0f1N38+up1m36Zwsl0X/Vv8HUUCL2u8nDuEvGT09i6nEVRyg
	 G91wPmEUJMrp8Uw73EacJSQRN1fyCORUpDdJSKGaIdVONgZiuxAgWZvfAPtgz2dEI9jJl
	 MxxUE0OTjGpNu+zcOarmaswbSph7QypATiyhFGIhwChZlfbqh5XS/20dAyHz3zqwqTNbZ
	 /RSrViuNYA6acz7pe16+d1wdQkO2iu93Ej9DsxMev93EmjkNTVloTYN+M9pF/rZ/vnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b5WJ9F4b;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3D1606A31B
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 09:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C3D1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b5WJ9F4b
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e46e449e8so802827f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 02:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008304; x=1793613104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JgmEPFVnTpRCUP0N3Fa9flIVssp/Qodc0qLnWI6QuoY=;
        b=b5WJ9F4bSphojEDAJDX+pK0H7Gf9c7M3okyhoj4NxXuHpmB+hulS1HoJTGhAe5vtEV
         jkBy9c7GJk6+3tkxmBQhexeo55w7dEPnJRCZ8M68vhkLyK4/ek1Ex9mQCE0XNRRplWoD
         1QWnl4Cz4PiP4HbaTPst3t9gMLQmuSMzX79pfOtJmWmr/GLNsIbzJS+pHQ3WGWmcZ/0Z
         dqWXM8FeI/yAcRcLOip6Cf5nOOR/5MK74Pv82rHufzOglaT7dcsb6nHTHCsA0MZ8ZcEI
         26z6Z0C4bhAFvGHUCVa2v5sZieJfuRe/NcGXlE8HfIfb+cHHcwZrwq6lHKA9aSGv6l1W
         flYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008304; x=1793613104;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgmEPFVnTpRCUP0N3Fa9flIVssp/Qodc0qLnWI6QuoY=;
        b=Dp6ieKUdYw6VFVry7t5zH4kob4VTTj9zNsqnykYXVX8I//7TGLWo+0moaNhCNhuzRH
         XE1INPCazdaMTa3G8ZGFh/kt5oOQLpOaesT6XamdHHfLYdR/nMaO4gVSMc034waXhWVs
         n6Oz189IofkzBs3YsQc/wobtStDd9tjWB29hmhevDMu4IL4JN8Ebpzu0fOavJRTa6uH8
         TgYzAkfD8/rQqaLrKyOnCHPS4W4JTPgbjlWLa4+DN2WHc2yc1chHOzqgQ1Gc/7gkNAh6
         Tw7ZhS6BttlnLGeOFbor4bbnEL8YhnnnHkzMPnliaIr3I/uGgHWh19jvCTqsrUmkdMJQ
         25MA==
X-Forwarded-Encrypted: i=1; AKwUvBwssPop8cMdOdqkYpr+U3v8zlrQiySfHUUO+AFTd/dXeYHpDAF258rstqeaETJ4ji9dVpuqET6Wb6c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJF/EKtBT0LFc1LlXAbJ19gQUmWfTMRhA19eVxht33jbfz1h65Q
	H4x05OipSt5xvc1nXaVH77B1KOGMZYnwOpmlg4UWdIrZFQFFc0wOlNBNGi4Gcg==
X-Gm-Gg: AYBFou0iMs9I3VY6Va6/Xean18ow6tlclifH5Ax1n2FXkamSsQHv44LNqprCDnLEfpr
	GANMBqBwNFeVyBpwO61PonjvsX3IN9Q7R2DFWyzOQ4YYIMtcGntk4dSO/bbWO6szeXq4o8rlC/X
	t4wqG8HneK0IdRzFiyvWhL9JcCK/uSyH2KvkYfkvS8mnmqbC+rSP8VK23XNCEpk2Cq5JatZCoqs
	SUb6LIb+j7W83c48Ze88X2k7P7dEVXBZRTeE2UecjgGiv2peOuZgJ/vgmhqkG9KcK2r5eNdFT9x
	vvVJc245FOEVQHoj9sSaX3o0wpXK6xRWLJwYSE8I+roocCmLCvrtQxm6of1SI4xiXVUnwkzzO88
	pr8cWmpQL9+s12G4pYWvJQYRyUfooZZ39P54fnRxOlCsCWB87JstZiX90VkF70k//dCkAyyn0vA
	gg90VBm3LfO1NuA/XLMZ9zE9upnWCP+w/51tJzrbnOfibULaGyQONlWwSrHbD00qFk7qjy+yBRN
	4RLdqXlmvCCFZOLLy1c6Y7hBEMvIcLvc5UK0YgA3MkbjemGv5AyrTTRU+3IpZ05
X-Received: by 2002:adf:f284:0:b0:48e:2980:d396 with SMTP id ffacd0b85a97d-48e3eb8d6a5mr9414467f8f.37.1793008303936;
        Mon, 26 Oct 2026 02:51:43 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdd5b3sm15297823f8f.53.2026.10.26.02.51.43
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 26 Oct 2026 02:51:43 -0700 (PDT)
Date: Mon, 26 Oct 2026 10:51:39 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Dennis Wissel <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron
 M5 (3434:d068) at boot since v7.3
Message-ID: <20261026105139.6b86cb3c.michal.pecio@gmail.com>
In-Reply-To: <7082e2e7-8d05-46b8-a26b-5b888a7a0545@linux.intel.com>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
	<20261024203558.3181711-1-yiyu@yiyuzhou.io>
	<SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
	<20261025111410.2c14fcef.michal.pecio@gmail.com>
	<7082e2e7-8d05-46b8-a26b-5b888a7a0545@linux.intel.com>
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

On Mon, 26 Oct 2026 11:18:34 +0200, Mathias Nyman wrote:
> > That's not good, your HC seems to be executing stale URBs, probably
> > from before the device was reset. I suspect we reuse the default pipe
> > without recovering it from the broken state left by EP_DROP_PENDING.
> > (Such bug may have existed since forever, but only in USB3 and cases
> > which seldom or never happen. 7.3 generalized it to more cases.)
> > 
> > But is USB core really resetting a device for which the hub has
> > reported disconnection? Something isn't as I would expect.  
> 
> I suspect udev, xhci virt_dev, and thus xhci ep0 ring stays intact
> even if device has a short disconnect during reset/enumeration.

But this doesn't make sense, right? If the port reports connect state
change, we have no idea if it's still the same device or not, I would
expect udev to be discarded. Or is this some "USB persist" magic?

I didn't want to dig into the hub driver or bother Alan, I hope we will
get that debug log showing what usbcore is doing there.

> So even if we give back all pending URBs and clear the
> EP_DROP_PENDING flag we continue using the stale ring. We should
> either either move dequeue pointer, set TRBs to no-op, or clear and
> reinitialize whole ep0 ring at device reset.

This may need to be fixed regardless, because EP_DROP_PENDING on EP0
can result from xHCI "Error" aka USB3 "Inactive" state, which (AFAIU)
may be cleared with warm reset, without reallocating the udev. That's
the "existed since forever" issue I was thinking about.

Regards,
Michal
