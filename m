Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098694;
	b=eZ3b94ojnwTcA9J323Kk8wIYVGrpa17I0YnrgMPf2c+OcOQ2zfTqGwN0iVCEEZrkLQla
	 MqAshYDuJcOSVGyXxzWK9pWEP2J0aRNRYQRXOl5jVHUjT2ApoyJJ7NvQZjYpQW54wdoik
	 WggBKM7GYafP1qp8DT6wB1Ts0iT1suT+4lIDofKR2eLPw/e1DlcOhW754HOuktfqE2GvG
	 4iVOihQgagUUf9dsGDi8+/F3Lu3ap9+5x3hgoarIvQv830THEVZSenhXjnfm2nHc8a2G2
	 wQ4ECj/gjU6HtYCV7YCXA+ZmtGJSEXw18zv+R4cbduztkq7JVR2xSsq+J90IkdW2W/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=A5wOXtIRkfcw6WAjlO67kGDoPQ+OzuXD12/R1w4bdIg=;
	b=XYt/OSRja5iZEyEqZ9G5xbNfQr1hpaXDXROgMpOcOgA8CWf5WlG78nrNf9eXNN3HYcIC
	 9XV35kXDp08sLt7GAVuIvHJ90K01UjejTAnVzhT6Jt9IwiI8pDwyOwHNXBWBx8ysQV2Tx
	 hOCOCXUlkJocdSf6MlBq94NOiP1IQL9fhA7e9+d/qpwb3U/iJ5MbpxyQPTlWIzHhGAxGE
	 8SeXC+zdWcTqAqG24ghLHJTZasEjSn/DImXzVYoz2gTDyFHP1JtsiWZfyDZKzXi2RHCZw
	 wwECZuoeD+fvcJJddnes/KI+nNRs6KKeuA3XKTSu1q/+py/zVO1FdMritexfrY2/YjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TYPmMtpa;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F000606A31B
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 10:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F000606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TYPmMtpa
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso34883055e9.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 03:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793098692; x=1793703492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5wOXtIRkfcw6WAjlO67kGDoPQ+OzuXD12/R1w4bdIg=;
        b=TYPmMtpaDayLV5WfgDnUPxMVl5xOsQ+StwOmj+frSDIeVh1MERdZPA7UHt6BqwoqgN
         X4qnruca0Tkpe7/OaJigYL/mgW6M1mJU3pfHt58/WF+HfBn84KlMOEPnL0PvJ5aO2Ipr
         Euf2J2aeZZ2V84W37wYDJ1yqPd34xvA1bRiVDlYJgVpUiVWDovmfFFijBZW4wAKPs8Nc
         HeFmi4s4GsrncBKYje2G1kigZ1ElILdG80bv04dr5Gm0LLL+/1wzFNl7iJmIdjVurDx8
         hlO6XujU/2k7JYxcFoojNzaKM20u9kEJP4FBBzMm46L1sRwTjOUTcYh+xH9/B5rlpT/u
         LFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098692; x=1793703492;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5wOXtIRkfcw6WAjlO67kGDoPQ+OzuXD12/R1w4bdIg=;
        b=XFeQfL2I2Tzws/vHbtr/17UnsMP3IXrMj8xSwVFjRRSsIhTT+KY1a6LHkFqP1iN2Dr
         xuFFAnSVHfgC8Ke3HsDwjCDlG2ra0kCIAtvzHSZ+pdK48OeKu1RC1/NjlgVdgHY663kG
         m2x2NwDtUY2WFz/xkCXPtcYk0/eEKSzNKUm0MUOdi5Tz0q9Q4iM4Ti4+af/5MCQrR+PF
         hwdLefvwCOSP9YfzdCgpmC7QtwuiJJ488ynkBeKgCoMF276av44jiGpNACn+u15XRTPb
         k7HrysdrEwP4QmspVQOl4qmKU6w2K85mWlIc9x/q9coOYho+SO2uqun+yKDNG8zNMtfB
         zQyg==
X-Forwarded-Encrypted: i=1; AKwUvBzw3TDuaQPUUKj/9SPS0ZXt7awKTr6/+NfKR4HTjVUfP3/mxMzCS6yJfIIyeMTsA/8KVRSeqmdGtFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBqAKuAlPe8JCbguAaAnTysK6GXhXm8kNz42zAXyruUMpW9uG7
	Mx/CcVE9S6uIvDR3dM8+ox7FydocRsDzNym7x61PvgKgvzciwVB2kRe1L4TuUA==
X-Gm-Gg: AYBFou1AJxcThRGWd8dOaXSReAX9LCzba8ogS/SUfPAN8Lwjov394IcanwOffPnTN/j
	RoBz0zXUi6Qok46HJXBGpBBV7oDIAr3r36O/sSQcdoeYIVmkOjR/mSwz4wrwTu3tliIehMmqt9n
	mWgn4kHaj7uw2yR024IAnHV0F/ewlwvtmEh0LcTLvgCUffdMCYFEEweT+onqdPPdumPXddJitz9
	Tl+4uNaFmT7HAMGIHiGUyuV/Awnr+EbjoxhMG7rc5WSzHtY5RI/uAABr4kdfisSiQsws50oVH1z
	ECJLwm2LuDWo7SNNROFmBRSt81PF5fzDs83NIqq3y/2s2EjzzGkuPPRv5lNER3Jd4ZFB3K9K6hr
	+R8g4rKrAYCeZhz6ASzGz6rBdgVIMyhytjM/CkHBzkls9ruU46OhJCeYDZxjee+H3aqEgtLTZaU
	gOioqI7mYSZfuCJP/NHdGDrbyJ+cxLzwcug0JRNO7zvpEMML5J21fjGFj/EyMUtw3DveekBAUDO
	J/ZGQPWEFMYRI5j5qx/U7bxZjo7K7TBm35dyYhpef4XgEpkOE2Nd6iY/CcQpLKN
X-Received: by 2002:a05:600c:3b11:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4a35acbd3b3mr186210615e9.15.1793098692212;
        Tue, 27 Oct 2026 03:58:12 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm273903535e9.15.2026.10.27.03.58.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 27 Oct 2026 03:58:11 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:58:05 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Yiyu Zhou <yiyu@yiyuzhou.io>
Cc: Dennis Wissel <dennis@dsine.de>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, Alan Stern <stern@rowland.harvard.edu>,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron
 M5 (3434:d068) at boot since v7.3
Message-ID: <20261027115805.4d875431.michal.pecio@gmail.com>
In-Reply-To: <20261026203944.2235991-1-yiyu@yiyuzhou.io>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
	<SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
	<20261025111410.2c14fcef.michal.pecio@gmail.com>
	<ZxkLPfjZS8ibGyR_gfGYKg@dsine.de>
	<20261026121544.41fbb71a.michal.pecio@gmail.com>
	<20261026203944.2235991-1-yiyu@yiyuzhou.io>
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

On Mon, 26 Oct 2026 13:39:42 -0700, Yiyu Zhou wrote:
> On Mon, 26 Oct 2026 12:15:44 +0100, Michal Pecio wrote:
> > I wonder if it's possible that usbhid driver requests a reset to
> > recover from errors and usbcore performs it blindly without paying
> > attention to connect status?  
> 
> I think that is what happens, and that 1f36cc9fa949 is what makes it
> reachable here.
> 
> Interfaces 0 and 1 bind before the device drops off, and the VT
> keyboard handler opens the keyboard interface right away, so its
> interrupt-in URB is running.  With 1f36cc9fa949 that URB is given back
> with -EPROTO and the resubmits fail with -ENODEV, so hid_io_error()
> keeps retrying and after 1 s schedules hid_reset(), which calls
> usb_queue_reset_device().  usb_reset_device() only checks for
> USB_STATE_NOTATTACHED, and the udev stays configured until hub_wq
> handles the connect change.  At boot hub_wq only gets back to port 1
> after the other ports (about 1.5 s after the disconnect in Dennis's
> dyndbg log), so the reset gets there first.  The device is back by
> then, so the port reset succeeds and the reset reuses the udev and the
> slot, ep0 ring included.

Yes, this seems plausible based on the input from Alan Stern. If reset
is requested before a USB2 reconnection but executed after it, then
hub_port_connect_change() sees (connect-change && enabled) port state
and it attempts to reuse ("resuscitate") the existing udev.

> On plain 7.3 the halted interrupt TD isn't given back until hub_wq
> handles the disconnect, so usbhid sees no error and never asks for a
> reset.  The device only comes back through the full disconnect at 56 s
> in Dennis's first log, which frees the slot and its ring.

Plausible too. But while the bug isn't triggered, it's still there.

Even on 7.3 without 1f36cc9fa949, when the failed URB is unlinked, it
seems that xhci_invalidate_cancelled_tds() marks its TDs as ready for
giveback without doing anything to prevent their execution. The EP is
expected never to run again and we are just lucky that nobody resets
the device before it's freed.

> Instead of repairing ep0 in place, could it stay blocked until Address
> Device has reloaded its context?

Not really, because EP0 must be ready for URBs before the device is
addressed, and the "BSR" flag is only legal on freshly enabled slots.

> If EP_DROP_PENDING stays set on ep0 until then, the new-scheme
> GET_DESCRIPTOR fails at once with -ENODEV, and
> usb_reset_and_verify_device() re-enumerates the device on a new slot,
> as after a real disconnect.

You seem to suggest that xhci-hcd should trick usbcore into abandoning
"resuscitation", right? I think that's a sort of complexity that the
world would be better off without, and it changes an intentional policy
of usbcore, so it's not suitable for an urgent stable fix.

The "right" thing to do here is to use Stop Endpoint and Set TR Dequeue
after Reset Device or Reset Endpoint (if applicable) and Set TR Dequeue
before Reset device, i.e. exclude EP0 from EP_DROP_PENDING logic.


Possibly the simplest way out, at least for the already released 7.3,
might be partly reverting the offending commits so as not to affect
USB2. The original VDEV_PORT_ERROR logic was exclusive to USB3 and the
problems which 7.3 was supposed to solve are also exclusive to USB3.

Is there any need for this to affect USB2, other than "just in case"?

Then there will be a few weeks to sort out remaining USB3 issues, which
mostly existed for a while and haven't bothered anybody.

Regards,
Michal
