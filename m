Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540980;
	b=JVyGN05kwRnvx6395C6QqQfqb3OdkQMrEk5UHtpyHHnZqJUI6JMMCY2Las3Xvn38hyZG
	 LFzcsgvXMc64AEp0ACXJGsIrQVlPWqzcn0v6FaO5kzl9Mdt2XP+ZwsGjdPt6YSIVRzsvg
	 rWjvSi67NE7vLv7CxORHKyMkIRMsGDoqA4nKF/BviUGStfR7agVGhVW0komSrXEQ+Uf8c
	 oucaL4Nd0edOgCo2XRe+mNWFymE4WJZNnV23UWUH+KZCacDLUPkkLZ0apcTuMsbSDEMdK
	 MGEZ9p3B+H+QEEel/fZhjLxFRMRMe8YHf4S35G89HAwItLPg7+Ir0PiZ9gI36+31CDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Ror5uzNBAPnTGREKcaynZwXoTgt7o7ZJkOe7lTAegcE=;
	b=XvX7Sm/56dJ7iq4MnOGazJ3Y+Gai/7le8l44dn9Wax56+cP5blqKhFRFQMq7tRIbCC7D
	 c9iTPdxkuvOPPflaSFPVhPria5uWc7iw530Hi+Q2Qw8bbMespU/IuPV3mjfppZEXRsX5/
	 hG+I/Q+KIbHpucnQHrIasggg1kRe4XPKZlOHYO9DjyP630YdXl6zSN1pl7x2PACkEFmA8
	 gM/veLD2xwvoptLWFrkzlsI2qiepilolKnOViczasY3r+KknlT/73XNA6PXly8+fCszG6
	 ooE5y+u9uXZ449lS8XD7CE4CS1GU19Ie1xkGTsFcxdDalsP6EGeUqMruix40EJF1KlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=O91wHUCq;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91CC606A8B4
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 03:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B91CC606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=O91wHUCq
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5365f9a04c5so13116441cf.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 19:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794540979; x=1795145779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ror5uzNBAPnTGREKcaynZwXoTgt7o7ZJkOe7lTAegcE=;
        b=O91wHUCqAA7nZAzd27eMZrns//8GWtYMGeYNuk8zDJwaZxqGyNARnM7wmkNv0OaWZ5
         lb0epVfXxoUsEZv/xpFinX7WcLcocbUitmfC7A8HIRTlp1HPEodOn6sqv4UE/+Fy3hbf
         TkUUveGCG1L+0fPirxN05gnlc9i+I8Qblb6kTl0jJCRn0YUm315Ctm9OmLGk8OQDFYgc
         SUg7GrWwDPaH3A8rP0a2dRPAByRUfMulMnGM35uKVkOtPMIm/Rs656bCFzKo+ldGwHZ7
         CJav0jPF/AVtRW+P3RuVHzX8p3pwwLRw/f8URL05cgY2jQSE4RZRli2gazkHBn8ff4dP
         ZhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540979; x=1795145779;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ror5uzNBAPnTGREKcaynZwXoTgt7o7ZJkOe7lTAegcE=;
        b=NtjPgr/W4Odj41Cuce18+dUaYA5SIWanjK+cu2hbJGuBdFynuRxgPHi0ZAKBrF308p
         XKf7nQ51VKD48cKDsOTFUDN8tgRtKvEIBie5zBs5MVSMMexnwJxZNx/3nHHAfYNZ0od+
         qCd/zatIESg6Z6iBXRTmAxFQmIapQMLHB+sHNlboB5+T71FYreEYPywRbfpovRmTr0RF
         wfi+Hz51o9t0RIuPIIRSVnwRkIbQ/VTviI4SQNzZkxWLsFdDuffsy2kl5+pxgrN2O2I3
         Pg9mm+Sgj1rBOjTQLXALjYpIR9gecMAot2T6HDHMT8o+xuuKlWszZ3R+I/BizeAZIoqN
         CKEg==
X-Forwarded-Encrypted: i=1; AL+hErGu0+ixKZxMUsJdVdyaYZdDO6//JI421DKMb1Ok4zfxqicl6e+6X1ZJGTOPwJ6MaXrHC9DZfz/r2Ww=@vger.kernel.org
X-Gm-Message-State: APuU4Z+G0uTw6LOaIDdbvkgAdA6T9ORz5Ink88GYh7EhG2hXzlqafkl+
	L9JLkJzaPcFJayhYEKCDLnTH91Fea7siL0SmSPEnNDcoXGX02O9ChkimyG/T+rzOlQ==
X-Gm-Gg: AYBFou098EiD8eA9gvD4CrWKwaXO1T6l06x8mcpqxtVZE+ww8jzprtDdr+9ZtjtptS5
	So/CZD9su/qXfs1vbn5KWo+syDix5oV6XBSAorxYMWyGD0xTTe7gWAmzFjAcZHcZjgxcnrbNOoQ
	dcBu+FW/mwSYX+DgYtAl/WGOQY+sVuiM4ESssqay7T/UpH3GALaqL749lofDoRBTI+pkYhQHkEM
	q++lWad7TnaLrLbiSXlxIqN2bPHly1omvzBPIGEb9aF4582mH0IwbtCTr2tdRbae2Ql+eSwZWIS
	CPAo+5EbHdcs9x8putR0ng8YEzj4YIQMEjjN7eb21RBnOww8pkTb9xIqcy+4IyomBv8nVUgJayv
	kYMvNFWBxMWay3Zw6DLaT57LV1UflYIcfi38I2h3MR4J534As7IsbKx5c4q/r0GAwSwfl9djfoM
	lKuR/3eT1zm7MTZrdRpeKGtkFTgoIBofpbJer9WOKIr3/6yIRQTMImz96UB6EwD0nvintgWaExx
	vyPYCmQbDuSY7Zcjnn9TVFIuZ8s2FrH3eWfoABvPOn6PY2dj/ILvHcXWjQb2FYwoMfj8DAY/fXX
	im/vB+qMF7cvMjlIqxiQepTd14Oiew==
X-Received: by 2002:a05:622a:4cc6:b0:54a:9f87:4a57 with SMTP id d75a77b69052e-55ac4796854mr24162471cf.3.1794540978495;
        Thu, 12 Nov 2026 19:36:18 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::d355])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d954e1sm10781096d6.33.2026.11.12.19.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:36:17 -0800 (PST)
Date: Thu, 12 Nov 2026 22:36:14 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Alexey Charkov <alchark@flipper.net>
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: udc: Clear a pending connection when
 starting the UDC
Message-ID: <57e83596-03c7-4406-b01c-db2ad2298413@rowland.harvard.edu>
References: <20261112-udc-connect-v1-1-03c73259642b@flipper.net>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-udc-connect-v1-1-03c73259642b@flipper.net>

On Thu, Nov 12, 2026 at 06:31:35PM +0400, Alexey Charkov wrote:
> Since commit 62911bc82b03 ("usb: gadget: udc: skip pullup() if already
> connected"), usb_gadget_connect_locked() returns early when
> gadget->connected is set. A connection requested while the UDC is
> stopped sets that flag too, without enabling the pullup. A later
> gadget_bind_driver() or soft_connect "connect" then finds it set and
> never enables the pullup, so the host doesn't see the gadget until it is
> unbound and bound again.
> 
> This happens whenever a UDC driver reports VBUS through
> usb_udc_vbus_handler() while no gadget driver is bound, e.g. when a
> Type-C port controller switches the controller to the device role at
> boot, seconds before userspace binds a configfs gadget.
> 
> The pullup is never enabled while the UDC is stopped, so clear
> gadget->connected once it starts. The bind connects according to the
> VBUS state that the core tracks anyway, and a function that deactivates
> the gadget during bind still has the connection recorded for
> usb_gadget_activate().

This is good but it doesn't go far enough.

The UDC core has gone a little overboard in the ways it allows gadgets 
to connect to or disconnect from the host.  Along with the automatic 
actions associated with bind and unbind, there's vbus_event_work(), 
usb_gadget_{de}activate(), and soft_connect_store().  In some respects 
these interfaces act at cross purposes.

(There's also usb_gadget_{dis}connect().  Those two routines seem to be 
EXPORTed solely for the benefit of 
drivers/power/supply/isp1704_charger.c -- is this really a good idea?)

In addition, there's a good case to be made that soft_connect_store() 
should rely entirely on udc->connect_lock, not on 
device_lock(&udc->gadget->dev), and it should check 
udc->allow_connect instead of udc->driver, and it should not 
call usb_gadget_udc_start_locked() or usb_gadget_udc_stop_locked().

And of course, as you implied but didn't state explicitly, 
gadget->connected is being used for two different purposes: to indicate 
the current connection state, and to indicate whether a connection 
should be started when it becomes possible to do so.  There should be a 
separate variable -- or none at all -- to handle this secondary purpose.

The whole situation needs to be straightened out.  I think the following 
approach makes sense:

    1.	Connecting is never allowed if no driver is bound, because 
	in that condition the gadget can't do anything.

    2.  Connecting is not allowed if Vbus power isn't present, because 
	it would violate the USB spec.

    3.	Connecting is not allowed if the gadget driver has
	deactivated the gadget.  Note that the activation setting has 
	to be forgotten when the gadget driver unbinds, since it is
	driver-specific.

    4.	soft_connect_store() should be able to force a disconnect, 
	but it shouldn't be able to override 1 - 3 by forcing a
	connect.

    5.	Whenever the state changes, the gadget should try to connect 
	if not prevented from doing so by 1 - 4.

In addition, the gadget should be started when it binds to a driver and 
stopped when it unbinds, with no changes at any other times.  (Read the 
kerneldoc for usb_gadget_udc_stop_locked() to see why.)

And the proper way to test whether none of conditions 1 - 3 apply should 
be to check udc->allow_connect while holding udc->connect_lock.  All the 
relevant routines should maintain this invariant, perhaps by calling a 
subroutine to set udc->allow_connect whenever the state changes.

Have I left anything out?

We do a lot of this already, but not all of it.  How would you like to 
implement this scheme fully?

Alan Stern
