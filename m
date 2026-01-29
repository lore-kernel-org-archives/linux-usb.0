Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4421DDC2B
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 03:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769656004; cv=none; b=n7EtA8vwVvRhN++gVMxKpQ4so/yuWpYbgvz1AXygZqvLdXrrbsV+c077mAVKJRhFMg+X40NZm1rjoJ3h+xkjj2wTK31FFfv0xpa71eLe5xGvf7ubMVYo6t8+7/yfBhvNCWHPTisAIeUgRVEqgApdDDkdcGqFeGjRJv20LHJKC2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769656004; c=relaxed/simple;
	bh=ClUrFSgjVxReMKfJCaSgfHbEWaq6moGz2Q597pro6uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdUNTPAoifJLgl6eoVZUZlM+mZYcxdtMVy4NVLTizrj3NVAK5+AO+PU/JBvLtO8gsupD6KIn+rJN76Kzo4VyHY/OdKQuX/I5TrMLMN6978F5G4yegPvhxrARqV3imwAp2/IF0QHehiclklvcUCUj0P7eDbKHKBUIWjLt0kRAj1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oGsiqsNB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oGsiqsNB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a7bced39cfso4347275ad.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 19:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769655998; x=1770260798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=66Nk3W8pAT4A9JWYxPUFkCtlkAoYwkhLBGEM5Ej1VxE=;
        b=oGsiqsNB3Ffyn+BEVSkglixvuugAgU1Xla6BOG2nXskoBh+Sterk9yHffrkp3BK2Oz
         L7wdkAodnEhCWz/1a+DIdNWD9H2kcQ9z6kqfPM1M/EO4b049g/kEVZmG7hg61259vZFr
         qC4b3BzeKVX3dfQDEcR/vPQ5x+bPOME5v9pYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769655998; x=1770260798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66Nk3W8pAT4A9JWYxPUFkCtlkAoYwkhLBGEM5Ej1VxE=;
        b=XCyFb8z8uBUVgY9HBEkc47TQ8QQrNHlftCVmPRqHdhO2C29OhwxoIP/BJnPp7FzJmn
         drHZOJryXIiHj/YeAwsfrAcUBc+vdzZp5/+Agl8YIWsWOybLigqFvkOSn+mz/BkEbVDO
         35cz/+K6Vp49oJUZ5u3+dHv7opQ7aIViNavx796ur+wFxsPWCIUNdLHM2kTxfx4RSeAn
         zJsN6nCNvDdgm5q3ax8Zpbdb+YaGbdzDMBLDPqWuc4Sr1EncN59w8l1tQVMDucF8Wm+3
         Um2W9CsBoBHqS/RVATD4mvFCCkF80NCg68TaRoNty6MytFTTZJ13acCUUYxYENtdc/6r
         QJzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3PsKBIZbiCwj/i2OnqRyHLiOyzDrTbgOJB+OrDoAF/dldoPoH5vFJRfHR6GHKswOOOJy5GhDhURk=@vger.kernel.org
X-Gm-Message-State: AOJu0YydyKev6LeuBRkD8Py92DohCi9it9qIXvj7Pyjb/HwD4peCWj0C
	s2p2gauru5cmERT1UBvJk3vzP55TSMXK1ZpfrGAo9f9CSgk/3CO9PMF7u058HXi0Rg==
X-Gm-Gg: AZuq6aKku9D5TglBSIaYGhum63aJ5h0bZoGwJRJ1pB66sN75mORkXCCcmTAVZA+buWq
	OrK5LfSaP9OE0BkiQLfLlSBFneC49U/a5XUyII/SwgwcZtn/W+zfbIdaPki4+H93y43QFRc/KAu
	7+8iJwkq7TmLR6tkVsE0evE+qG15nk4cx8skMNKm3Xto+cCzrb/IdQeCs8FvRaw6LwPR23ml7Xp
	vbMb2X1Q5cxN6GR+bD3DL67Ls5JMIpSzUbOqilp1a4qHSOpSH1V5LS50gkmaJyF1G4f3FL1RyKd
	NdPWhVWn3yKyYisAWxZrDBr4g2Dctm86MU1STL3MFn6uWDFGqEjMcXSvkTe3C2X0H4BuiwgG2mv
	l2Aac4cSfR/n+0BfExXxgs8E2IMFuy/TAQowkMu/r/IjBzVo0fbZSAjGRdLVFf19p021Gi0PjWc
	ZuUp575Kc/ZQfdKl3mqeJaRzuIERgNsGyrJTTuRC3xdXTxjYRCKA==
X-Received: by 2002:a17:903:2f87:b0:299:bda7:ae3c with SMTP id d9443c01a7336-2a870da0e2fmr68388235ad.14.1769655998304;
        Wed, 28 Jan 2026 19:06:38 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:356d:f98:467f:7e27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c22672sm3742764b3a.51.2026.01.28.19.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 19:06:37 -0800 (PST)
Date: Thu, 29 Jan 2026 12:06:33 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Tomasz Figa <tfiga@chromium.org>, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	George-Daniel Matei <danielgeorgem@chromium.org>
Subject: Re: [PATCH] net: usb: r8152: fix resume reset deadlock
Message-ID: <hexlvtc7l26jvnr7zfl52i7hynnyxkqu7ebzyijw4ucql6irvz@cb222yvs7ikz>
References: <20260128070222.3393746-1-senozhatsky@chromium.org>
 <CAD=FV=WLj0fG6CqN2GwK5DntaRwQP1K4Sm-b-uwtON=-ByJfcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=WLj0fG6CqN2GwK5DntaRwQP1K4Sm-b-uwtON=-ByJfcQ@mail.gmail.com>

Hi Doug,

On (26/01/28 10:05), Doug Anderson wrote:
> > rtl8152 can trigger device reset during reset which
> > potentially can result in a deadlock:
> >
> >  **** DPM device timeout after 10 seconds; 15 seconds until panic ****
> >  Call Trace:
> >  <TASK>
> >  schedule+0x483/0x1370
> >  schedule_preempt_disabled+0x15/0x30
> >  __mutex_lock_common+0x1fd/0x470
> >  __rtl8152_set_mac_address+0x80/0x1f0
> >  dev_set_mac_address+0x7f/0x150
> >  rtl8152_post_reset+0x72/0x150
> >  usb_reset_device+0x1d0/0x220
> >  rtl8152_resume+0x99/0xc0
> >  usb_resume_interface+0x3e/0xc0
> >  usb_resume_both+0x104/0x150
> >  usb_resume+0x22/0x110
> >
> > The problem is that rtl8152 resume calls reset under
> > tp->control mutex while reset basically re-enters rtl8152
> > and attempts to acquire the same tp->control lock once
> > again.
> >
> > Reset INACCESSIBLE device outside of tp->control mutex
> > scope to avoid recursive mutex_lock() deadlock.
> >
> > Fixes: 4933b066fefb ("r8152: If inaccessible at resume time, issue a reset")
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > ---
> >  drivers/net/usb/r8152.c | 27 ++++++++++++++-------------
> >  1 file changed, 14 insertions(+), 13 deletions(-)
> 
> This is effectively v2 of:
> 
> https://lore.kernel.org/r/20241018141337.316807-1-danielgeorgem@chromium.org/
> 
> ...and you've incorporated my feedback there. Thanks! :-)

Oh, nice :)

> > @@ -8674,6 +8662,19 @@ static int rtl8152_resume(struct usb_interface *intf)
> >
> >         mutex_unlock(&tp->control);
> >
> > +       /* If the device is RTL8152_INACCESSIBLE here then we should do a
> > +        * reset. This is important because the usb_lock_device_for_reset()
> > +        * that happens as a result of usb_queue_reset_device() will silently
> > +        * fail if the device was suspended or if too much time passed.
> > +        *
> > +        * NOTE: The device is locked here so we can directly do the reset.
> > +        * We don't need usb_lock_device_for_reset() because that's just a
> > +        * wrapper over device_lock() and device_resume() (which calls us)
> > +        * does that for us.
> > +        */
> > +       if (system_resume && test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> > +               ret = usb_reset_device(tp->udev);
> > +
> >         return ret;
> 
> Question when looking at the above again: have you thought about the
> consequences of clobbering `ret` above? I guess it's fine since
> rtl8152_system_resume() always returns 0, but it looks a little
> awkward. It's been long enough since I thought through all this code
> that I'm not 100% sure what it _should_ do if rtl8152_system_resume()
> was ever changed to return an error. Shouldn't it honor the existing
> error instead of trying to reset the device and clearing the error?

Right... so that "ret" thing, I thought about it and at the end I
just decided that returning an actual device reset error from resume
is still better than "return 0 but device is inaccessible" ("mission
failed successfully" kind of a thing).  I'm not entirely sure what
would be the best way to handle this.  Like you said, for the time
being, rtl8152_system_resume() always returns 0.  Do we expect this
to change in the future?  Probably not.  On the other hand if
RTL8152_INACCESSIBLE bit is not cleared then user-space will
figure it out eventually (ioctl calls will fail, etc).  So maybe I
can just keep the existing code and ignore usb_reset_device() return
value.

> Also: I guess you've added the `system_resume` variable here, which is
> different than the earlier patch. It seems fine to me, though maybe
> you want to consistently use the `system_resume` variable earlier in
> the function too?

Sounds good!

> In any case, both of the above are pretty nitty, so I'm OK with:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!
