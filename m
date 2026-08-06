Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C3F47F775
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 22:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786053723; cv=none; b=PTPbF3ilsb0vy/5flPz/eUXdgLpTZYCifI6CO54rg+vt8wlTn8xe3lpf/q2oOb2bRmZpxXtoumu2GIn6xCTVkQyky7HJNMkPgwLPksPjiLlO0mxWGmjBjdUjJwoyj7aYbJ2MzHaDY3p5XXTniz3mia17DM3pDsU9xxBGlb52jtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786053723; c=relaxed/simple;
	bh=6FS2wPk4+CPAiiGjhJgm2TOpzfgGbyEGUm69hAAetaE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EfRooUCFKeYbigbyAGHa0MxkKUrQxRay9dQe0bJjBsg0RTrQqFZjUnJ9DKUbuf7ED3yNAg5p2tkjTRoJac5HGNAjk0lX4zC2GckP/TfIPN7B4VhHgAJ+HaeayY89RYYLJeOP8GbrNeYWMSxXulgzP0xm9QvtYeEyQYUHkdXF/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/tx1AIh; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/tx1AIh"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47fecbb7000so1395284f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 15:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786053720; x=1786658520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BpeB30LKpPq3lxGhfPSaVqfbRwpBu+F1FaXUsX/6PL4=;
        b=I/tx1AIhG74lonqZYuJtYxZJ089Dy6iRyFDPYq+U4HtWlXrRNHot4WJw2xe8LWHayP
         eShQh0pfaiCmR2Xi+fwxTQwE6+xsShjrR3J2efZUv8HCDzjteHqNVGZDpznxCb6+pGdD
         vHSJKq/aCINZS4Ep5XpZztJVOcda+CUwWjJPhgRjDfuCd+trQtC8bX2FVzFztNhYtm/c
         6HRQdYmDdPet8vj7IViyIacRPr7thTe5IO8Y/zyo2SVzYhjUCiKX/Z3pJr9BGc++HoDo
         a97ttF1+kYU1da7BZ+7OTXPLwaVzoW3XW4VUh5Cdvnyqh7gNSLxl8bCwcCiKNgmN3Y48
         VYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786053720; x=1786658520;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BpeB30LKpPq3lxGhfPSaVqfbRwpBu+F1FaXUsX/6PL4=;
        b=Vs6UMcpBWlSPU+bZLuB6SwkehTgWPerlKTyS1/RZNUrqhlHxDn8Mkl0nkGN1+oBCu9
         ls2phpUoUocJJSulp920NsN9c+7Z+/kPX3s6rkeRWfpSbhq5FrjY0QSVk2dz31KYVLV5
         NZHLEB1bfxIZ7N7gbDEMN5d3ZmoFHs8elvDS7eGj9mwEZyB3AzqnVLMc0D5SlN6oUSkE
         5RCrubOgtvw9KpNkNU+qhezWmsJapVB+t6B5k3WQXqrlU7qSACQWQ0oxvdMjPxqT1l5Q
         JJmYFeFk6vSmKzIVSGs212x7RvwCRUGwQuo0npJBANriZL/4/LmW56eHfofDKoOIky33
         2oGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqivjg9paSWCdS3JQrRGrOcWeG0JiL7X64PDhBp1aEWzR7xG0u8xE+XWlgHdGIwp+K86rYRLy/u2S0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj1x0ZFlw+T5z6NgHgiTC3rVeSQg9SZbe+O4/y+C1/nhjrESf2
	p+ufFVIjOzsVBTM1MhhuX9thnzBX7/8wqif+DcqZ6SPQxiTQRrk9sAUb
X-Gm-Gg: AR+sD118h794dtkSdiytZ4WzjWReZ4MBxeHQKW1PO/8/SoiCBKHOmBUWT9gBESuDX5A
	4mveCP1PuFvtwayF9g1n+hCGucN61XAAoUZQP4cQM2y4DQoDUA86O2g2+zxFNObgkKjUq/s7vMf
	rQryMVPmTME+HB2ib8oycC8WfCbTkZDLROSAuE+HYpy3Vd49+r4mfa6+8/SBGzDFg+CKQ6q3/a5
	5E0rGNGGmPdzAOHrJeSGNcCcxSILMI3FTyY6YmJLmpNpOXTFUeUyqZLMjcEm1/bwF6B7IDVHoou
	wEZ1P+zeFoRRuw8GDcwu7meqhX9gvj525eHBJlBJlJUIfEMipYMfOBwOONOfc8dXlGSbiiVg3Ke
	N6umP6O90tjHLryCG389KpH2eNbH32j/aBvua5qX4F/4csg3wpOy5N1VVp6J1ACAuPNZrnlyXmZ
	q0rvN7aSiVM7dpTvIw/czz3pvXl/UY+i7N1Vol2lTu7eQYbHUgoe0u4wJvEkTxkEN8RcUVip6W
X-Received: by 2002:a05:6000:25fa:b0:47f:f3d4:26da with SMTP id ffacd0b85a97d-47ff3d426fdmr19201019f8f.11.1786053719943;
        Thu, 06 Aug 2026 15:01:59 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b250e5sm9638968f8f.27.2026.08.06.15.01.59
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 06 Aug 2026 15:01:59 -0700 (PDT)
Date: Fri, 7 Aug 2026 00:01:55 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: dylan_robinson@motu.com, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com, stern@rowland.harvard.edu
Subject: Re: [RFT PATCHv3 1/3] xhci: fix frame id calculation and checks for
 isoc URBs
Message-ID: <20260807000155.2960c741.michal.pecio@gmail.com>
In-Reply-To: <0e2f28f5-aa38-4401-8287-b55aab577243@linux.intel.com>
References: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
	<20260521152715.288995-1-mathias.nyman@linux.intel.com>
	<20260806101706.72a8de47.michal.pecio@gmail.com>
	<0e2f28f5-aa38-4401-8287-b55aab577243@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 6 Aug 2026 16:25:15 +0300, Mathias Nyman wrote:
> On 8/6/26 11:17, Michal Pecio wrote:
> > Besides initialization, it's made -1 if and only if xHCI endpoint
> > state isn't Running at the time of submission. This effectively
> > means that to start a new "isoch data flow" aka "stream", class
> > driver must unlink the last remaining URB of the previous flow. If
> > the driver doesn't unlink (or tries too late), the endpoint goes
> > Running-Idle.  
> 
> If class driver doesn't unlink remaining urbs then list won't be empty
> and you have the exact same situation.

Obviously not, it can simply stop resubmitting and wait. Or there may
be no URBs left to unlink at all, when recovering from ring underrun.

Then HW endpoint state will still be Running, not Stopped, and new
URBs will be scheduled into the past, doomed to complete with -EXDEV.

> > Moreover, we know that Endpoint Context state is one of the least
> > trustworthy piecese of information, and notably it may remain
> > Stopped for a while after a doorbell ring. This means that multiple
> > URBs may be scheduled as new "streams" and get assigned the same
> > start_frame.
> 
> Ok, we basically have different opinion on how to identify when a new
> isoc data flow starts. You would rely on checking if list is empty,
> and I'm looking at harware endpoint state.

I would rely on SW state, sure.

1. The check implemented here isn't even right - see above.
2. Bogosity of xHCI HW is well known - see below.
3. For consistency with other HCDs, which use similar SW state.

> I don't trust the 'empty list check' as I'm not convinced there can't
> be cases in software where list is empty even mid isoc data flow.
> Something like extreme long interval and BH delay in class driver
> receiving URB.

Other HCDs implement a rule that resubmission from completion callback
on the same endpoint always counts as continuation of the stream, to
work around BH. This seems to have worked so far and is trivial to do,
somebody submitted a patch earlier this year.

> We can add empty list check as well in some places.
> For example xhci_isoc_tx_prepare() could benefit from having both
> empty list and hw endpoint state check when setting next_uframe = -1;

The HW state check is bogus. Before removing it I patched to log when
URBs are pending but HW state is still Stopped. It happens sometimes.

The only robust solution is to completely disregard EP Context state.
xHCI 4.8.3 doesn't promise much and outright advises SW to track actual
HW state itself, based on issued commands etc.

The Stopped => Running transition is only guaranteed to become visible
to SW when the first service interval passes and an event is posted.

> This patch is tested, solves an existing issue, and moves the
> frame_id code in the right direction.

To be fair, it may be that in practice it fixes more than it breaks,
but it also strays away from documented USB subsystem rules and looks
half-baked, so I was surprised to see it queued in such state.

> Any issues we discover later can be fixed when discovered.
> We can't keep finetuning this forever to cover potential issues by
> broken hardware

Well, that's Intel (reportedly) and ASMedia, hence AMD. And they don't
even need to violate xHCI 4.8.3 to break this code.

Regards,
Michal
