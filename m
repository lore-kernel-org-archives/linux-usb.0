Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D58730F815
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 23:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762613; cv=none; b=ShpQ5ev+OQ3QdW5QJfi9E6XqgWUVZwlTgpJWXHRvRt4fYlBFx1XG9goCfiKR9im48TBmiv3C4Rz5L/17AGK9EIiLsWgJjErmYDDs89IoxAHPAG+P9JbdWOOTY8F68DHWk2iOc3BCRPljDQVjgnbRlndy/X0W0O3mcy2Wqwa+Xaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762613; c=relaxed/simple;
	bh=0LDQr4s9Yh9WkwSTTKLTTN1B6KROkeM0oeN+m6trejs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acWCAi0VSwJas3pBeI4ukrCrSURUW0qsU2zLe23BPIz7UJJjqm4rhsRLuC+md1MTpuLA3nIBGaD2Z+0xsptMkqvQeGm0xsi9QwenqILE6qfFS/KieNdVr9MqotMeRjyciOjmyqwEc0mOtWLIr44mUZ4qxFD7+haPmfv4d0/dNW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net; spf=pass smtp.mailfrom=tremby.net; dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b=Pskc2h79; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tremby.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b="Pskc2h79"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cab973140bso559545ad.3
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 16:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tremby-net.20251104.gappssmtp.com; s=20251104; t=1784762611; x=1785367411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mtluN33dXQdOcmbj0guCvITTXOP2nvhXVvb2P/z043I=;
        b=Pskc2h79Yov+FcQT3YZiRMylgCelqDpR11N5SWTuDsHJoOnUoX5Jedoh+p8RiTd82Q
         Y01rmQB6nhi8p3NOi3/oFlj75Oozu3DUX3D1UpIQ/GdxGc7OeFGdA3yk/OTEDTdt6tuf
         WFVeQM/ftFb8qAaUrnYqQvGeEK4FhMkBlIwB4fy/vj1ERHzVSN8bqnqB4unoZML3S2yC
         74mtDGBFGtcwBEvTSa3Iw4uq2Ny7gkJRHK27rByT2cLNcIPsy9tHklzjcEIKG42yxdwP
         WC+1bSqIhwjG9oBQtIOxCGQfczk7/FkXudJ5ns50F+qHqTRiEOX/Q8+H3COjBOMex+BO
         ptyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762611; x=1785367411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mtluN33dXQdOcmbj0guCvITTXOP2nvhXVvb2P/z043I=;
        b=jYxT3bAK77/qitUvmM80DACahTX5akPCOl22sbl2ZoHETihfKMcZGkJapuM6aB9du9
         rTR8uBfG6XlnbwebiVFOJ32Xen8cOIXnDlqp1hhsSMT6nS+mmlJk6Bnw8FN99VqDWVVk
         ameaYn3yQ7OBEaYKryiFaJE9YbLmxrpE3fQYaQVRrD8jUnVDiscO8M7SmWIpV93N6wYK
         pXv3MOkCcZg/2gI2rSAyT8Icl906MCI1gA7W9X6xCbR0r+fxEx683NUq1IwQXVDP8ROB
         RqVAfbrdJYJXGuw8ubpSGg1BpLknO7vtqjbrzmRUJT/tYTHSucS6xmaxt+9KjdjeFE5H
         IM5w==
X-Gm-Message-State: AOJu0Yzw5QhknZHS8V6Am3sugvbFXBYu2tzDevM3D6uFyPGeTNM1hSpJ
	VboD/mlAj26w85o54K5VUhSv0H/4r7g5gW3NRLfacE1GXoYFN2IfS/u7gyFdo0wH/JDPncLEREh
	kyZW+kto=
X-Gm-Gg: AR+sD10bcG3BTzhfhNfFWdwWkLYkW5kag1gErN+sSFa0QhsJwTTzWBdRS3Q+7gCf/Ww
	suLBpsZj9XEjImfAkP+V6kk9+G9Xe2GF7HnlIQ5p+9YzTQTl7H9mJhrwBgCfUeFwsuWGX0+4jxk
	2yMGdCrHENCwwaiVYazMYBNQMW4mjiL65CWTQCuk+I3xe11jAiQindyLgwwNYAecUpVWj256iW1
	DUgEK4pSPKWxZG+AfFye2a/ZC19aSgKP9UE0mQISQZMHyeB1NElDgbPVlQPJMxHTnyuivPLcbXD
	WHvo4DBEpqGjiY2N3IlEA8I9NwQ/5C8R7Umoiq87khIXwiCU7Ac2esqgFQpV0i0ozTUnnp/6zl9
	4I0JCo1StE5wwiXGvhUH9WsQMMPEG9x9o3+L6rOvUmN5OSe1BCP7d4mdByS7NLd15H4pZ2x9i7c
	auTzHp1gxMJlkJPv1FC+7+yfEY6W92pXMBBas7SpC3AZ3DFue/zXQh15Ra/IT8iSuRf1GF
X-Received: by 2002:a17:903:9cf:b0:2cf:7f6b:8c8a with SMTP id d9443c01a7336-2cfa6c5e336mr9764165ad.30.1784762610792;
        Wed, 22 Jul 2026 16:23:30 -0700 (PDT)
Received: from localhost ([2605:1700:2080:8400:818f:103b:babf:c4b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e65e6sm22014445ad.38.2026.07.22.16.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:23:29 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:23:28 -0700
From: Bart Nagel <bart@tremby.net>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <amFNBLzwUdZhqpup@spiral>
Mail-Followup-To: Michal Pecio <michal.pecio@gmail.com>, 
	linux-usb@vger.kernel.org
References: <al_hchyOdPoPWKEo@spiral>
 <20260723002256.44aa664f.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723002256.44aa664f.michal.pecio@gmail.com>

At 2026-07-23 00:22:56 +0200, Michal Pecio wrote:
> On Tue, 21 Jul 2026 15:10:22 -0700, Bart Nagel wrote:
> > I regularly capture from screen and webcam while gaming. Usually it is
> > rock solid, and can capture for hours and hours with no problems, and
> > have done for hundreds of hours in total.
> > 
> > After a kernel update from 6.12.83 to 6.18.28 I started getting webcam
> > freezes. The symptom is that the picture from the camera suddenly
> > stops changing and will stay as a freeze frame. The camera still
> > claims to be active, and the capture software (tried with OBS and
> > ffplay) seems to have no idea anything is wrong.
> > 
> > I have found no reliable way to reproduce the problem other than
> > running the system at high load (in particular running a game;
> > problem occurs across multiple games) while capturing from webcam. In
> > my tests so far it has taken anywhere between 8 minutes and a couple
> > of hours to fail in these conditions. Freezes seem to be less common
> > when the system is under less load -- for example I have tried
> > leaving it running overnight when the system is under low load and
> > seen no freeze, then I have started a game and seen a freeze within
> > the next hour. I have no way of knowing whether no freeze is a pass
> > or it's just that a failure didn't quite happen yet so I have been
> > testing for many hours while bisecting, often over the course of a
> > whole week or more.
> > 
> > My bisection took me to a USB branch leading up to the release of
> > 6.15. Specifically:
> > 
> > ddd0172f182e pass (branch point of USB branch, "Merge tag 'tty-6.15-rc1'
> >              of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty")
> > a1b5bd45d4ee fail (merge of USB branch, "Merge tag 'usb-6.15-rc1' of
> >              git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb")
> > 
> > Digging deeper in that branch, these are my results during bisecting
> > (sorted into graph order):
> > 
> > 6623c40bed7a pass (usb: storage: datafab: Use const for constant arrays)
> > bfa845994282 pass (usb: xhci: Complete 'error mid TD' transfers when
> >              handling Missed Service)
> > 906dec15b9b3 pass* (usb: xhci: Fix isochronous Ring Underrun/Overrun event
> >              handling)
> > d0b619599e52 fail (usb: xhci: Expedite skipping missed isoch TDs on modern
> >              HCs)
> > fe1ccba52a8d fail (usb: xhci: Skip only one TD on Ring Underrun/Overrun)
> > d71cb7d6e1a2 fail (usb: xhci: refactor trb_in_td() to be static)
> > 525b139fb403 fail (Merge v6.14-rc6 into usb-next)
> > 
> > The asterisk with 906dec15b9b3 is because it has survived 12+ hours of
> > recording while gaming so far but I did see the webcam freeze once at
> > the precise moment I made some changes in OBS. After resetting it I
> > recorded for another 6+ hours with no issues. The other failures have
> > been much faster and occurred at seemingly random times, so I'm not
> > 100% sure here.
> 
> It might be that you have two different problems. Another user of Razer
> Kiyo Pro reported that tweaking camera settings causes some failures,
> so this may be unrelated to your main issue.
> 
> > If I take that one as a pass, the bisection points to commit
> > d0b619599e52fe3e1454f7d151dedf2b194f61d8 as the first failing: "usb: xhci:
> > Expedite skipping missed isoch TDs on modern HCs"
> 
> That's what it seems and it's weird.
> 
> > At the moment of failure I have seen a huge flood of duplicates of this
> > message in dmesg:
> > 
> >     uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
> > 
> > This happened during some bisection steps but not all. Regrettably I did
> > not record which steps produced the error and which did not. In fact, I
> > think during the weeks of bisecting I remember at same point following
> > some advice from an LLM, and it could be that in those cases where I saw
> > those messages I'd enabled some extra debugging of some kind, possibly via
> > `echo 0xff > sys/module/uvcvideo/parameters/trace`.
> 
> Yes, these are debug messages from uvcvideo. They indicate that isoc
> transfers completed with -EXDEV status, which is due to Missed Service
> Error events from the HW or due to being "skipped".
> 
> I don't see any way xhci-hcd could end up skipping forever and never
> clearing the skip flag. And it's equally unclear why the HW would begin
> generating MSEs forever because we handle them faster than in the past.
> 
> What's the affected xHCI controller? You can find its PCI address with
> cat /sys/bus/usb/devices/usb2/serial
> and then use lspci. Make sure that the camera is stil on bus 2 - these
> numbers sometimes change after reboot.

Confirmed still on bus 2. That command gives

    0000:00:14.0

> I wonder what happens when you enable some xhci-hcd debugging too?
> 
> echo 'func handle_tx_event +p' >/proc/dynamic_debug/control
> 
> You will probably see Missed Service Errors being logged occasionally,
> likely both on "good" and "bad" kernels. And it seems that good ones
> will recover every time, but not sure about bad ones. Does the first
> MSE break things forever? Or does it take a few? Could you post a log
> when it breaks? Caution: you may see thousands of lines per second.

I'm still on the asterisked kernel from the list above at the moment
(appears to be "good"). I tried enabling this and I do indeed get a
few of those errors and they seem to recover. This is what I have so
far after having set it about 5 minutes ago:

    Jul 22 16:14:07 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
    Jul 22 16:14:07 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
    Jul 22 16:14:07 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
    Jul 22 16:14:07 spiral kernel: xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 18 ep 2.
    Jul 22 16:14:52 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
    Jul 22 16:14:53 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
    Jul 22 16:14:53 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
    Jul 22 16:14:53 spiral kernel: xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 18 ep 2.
    Jul 22 16:16:06 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
    Jul 22 16:16:06 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
    Jul 22 16:16:06 spiral kernel: xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 18 ep 2.
    Jul 22 16:17:33 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
    Jul 22 16:17:33 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
    Jul 22 16:17:33 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
    Jul 22 16:17:33 spiral kernel: xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 18 ep 2.

> > The most recent kernel I have tested on is 6.18.28, and the failure
> > happens there too.
> 
> Some recent 7.x may be worth trying too, if possible, though I won't be
> surprised if it's the same as 6.18.

I will see if I can get a 7.x kernel installed and hopefully it's not
beyond me. At the very least, I'll get back to the latest kernel in
nixos-unstable (which perhaps is 7.x by now anyway). Then I'll enable
the extra debugging as you directed and see what I get in the logs
when it fails. Would the uvcvideo logging be useful or should I skip
that part?

Thank you.
