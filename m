Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F9848095A
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 21:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785964305; cv=none; b=JzPmjWlIvSIBiZf52mCIH8y1hbjWpP1kOJgLMV7ygslNxGHfoehKgxTnkFTF8/FpPGbaZZr3AgQ301Ci/YxpYWrJURcP+obP3JiIpiltZ5MSjJUaWXPt9THjYwAoU/ACjwRr/v9hb1PqzzMd6QjUrLkj3HwEz35TMC8R9C3nPIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785964305; c=relaxed/simple;
	bh=V0tGjqOm15TTUbwa6L7pK1FPJiEcliVYKklNq6xUqnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g03ibfnOq0WvyrHsH+fVw+HaF6RVrLfI6xz7rCgun5XO7eTZoLQsfxLLwLvJkAS5VFRwYVLMGlamoJDj6eg9pDX9v59M6FUPglfAMQINhjnLk/DU7vtBuiCRXxpe9zjtD4L+JqyHhiMU44HHH0vV3Y6OJ/47sw5fwHxK3Saf9kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net; spf=pass smtp.mailfrom=tremby.net; dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b=H23g00Us; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tremby.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b="H23g00Us"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d032846c95so20248785ad.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 14:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tremby-net.20251104.gappssmtp.com; s=20251104; t=1785964283; x=1786569083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L4tdiyJEjA5XFVdDway5WOcupdWty9/wTH10Qt9Zk+U=;
        b=H23g00Usg4EPEq+m4np6Auriw7g9SUpG3PgV+IKydjRW1h0BqqA3nzBYCJCSTH1irk
         7VYUzDRkfLmZaxxWwxoBcFAL7iAAOEVV2wZWSRuNz6ONWfY433th/9Zi8vRc7/Isfvyf
         1YhmvjHdCkEfbt/BmjxMnDhH1HGUsbTXzlNBqirboSgJK5l0m0fns03CUoaLzd3uyD2V
         A43Cokoi7BM7fZ1rcCl/q/OGogmYiCBF3vfO9y7sryzFsl9jd3FgPlQ9/kbZg/d16ODx
         4ynxCxSuLMQUwsx9x8S1nOCYJ8GqiTY2KGgEpKY9Sdria8TdJfMCiMpjPLzRRv149o4W
         YzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785964283; x=1786569083;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L4tdiyJEjA5XFVdDway5WOcupdWty9/wTH10Qt9Zk+U=;
        b=YXXRElCjym574RiLc+zXOl/dWY5qMj+P+g4BRv+qGkb/+xcqvgsjPsGYp1TbmSfdJk
         jwfnTPPk6ashABz+vYDuZeDzY+bgzONJE4xhYwP8pnIy4tUNK6H/64AdZwLhJR3e3QPB
         D1j8EdobomND007VBazwfHr/tlU5RTqFwrkdFVyMzT9d7RggjlsEoJH/PvEdwLu1XaVR
         OCrF5PwnppXRBJzmFNEziZLFQd7vcySfhJ41vURgfLJ2iRIwfG/IorGTUOWUp6NXqEL+
         FsVpGKjEbC+2pk95jG5oKcGD7PZpF/anawTI3LPh3Lf1n3V701WaN3dG0a+VELYKNfZY
         2Pqw==
X-Gm-Message-State: AOJu0YwQia1AWhat5UNoQhoU5BQrNMTGtBPWNlh6UT61BmNIwR9lMt75
	X3DtQrHoPGwljcgfqCK9C5eYo6nO9QQtqByw7QUT8/LrLbyLwolFc6otza/9nLRtQT8=
X-Gm-Gg: AR+sD10xKHDAvhydj5T30KmFBzPwpW54m4AOs6eEo3IUClYJd1X8V8Uvp/7TzHkdLGP
	Eub9TmRyhViXgvOswvIc/2Awzkr/x/Y+WSn8uuXxYl3ci49C4Ecy1sPDt7HGDaKIMcmh8/oKukL
	yr9vLM0iSHOgdpiaE8+UuygSN+zmsQRqrlqAitIQRxwzXfyQVFSZn59g8824tgLh4u5btemXjhd
	Bhylwqw8or5m/bVVJ4jofDsnGs6aI+q4ZCyQnreX4N5oFxxRzFXHGaV0Nm3putEFQ3+XS4o8pmP
	8+34QxyMOA25aHu4hX4EgaUHtkascAoCFKZzGhIuKxGpWeXSK3ps8cpmzOIZUdF9DpafuAHIsGz
	z/XXzkUIfQjBy4YhNT+8MHrARZYoeTd0XepN4J9IqIvdjRc4SvTk+GIuI+DG335YgKZAZwHXNSb
	GCg3uEXB7XlmWCh24IkWmhJwwB+FroZgO0D82wPR9sG6bGnzk4pvMfsi+IIkBTuGXG4WFFf0wGj
	8A1eVNElCNaxN8xfo3RlqfJPFDwT+wAKdmN1v/J+Jtq/u/59S0Z+uh3vQ==
X-Received: by 2002:a17:903:4588:b0:2cf:477f:57c5 with SMTP id d9443c01a7336-2d0ca71b42bmr111071825ad.1.1785964283401;
        Wed, 05 Aug 2026 14:11:23 -0700 (PDT)
Received: from localhost ([2605:1700:2080:8400:6387:b412:85a5:8bb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa0268b3sm20999505ad.37.2026.08.05.14.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 14:11:22 -0700 (PDT)
Date: Wed, 5 Aug 2026 14:11:20 -0700
From: Bart Nagel <bart@tremby.net>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <anOiUYwnfuXC0lSY@spiral>
Mail-Followup-To: Michal Pecio <michal.pecio@gmail.com>, 
	linux-usb@vger.kernel.org, mathias.nyman@intel.com
References: <amKUdIRBrsFiDTiV@spiral>
 <20260725115956.321185a1.michal.pecio@gmail.com>
 <ame6T_LjiJBeJ2W3@spiral>
 <20260728003131.085171ee.michal.pecio@gmail.com>
 <ampPGn-3C9PSEZQz@spiral>
 <20260730130814.65f7891c.michal.pecio@gmail.com>
 <amuTKengDzr0IL6b@spiral>
 <20260730235953.2d51e0cc.michal.pecio@gmail.com>
 <anOHQ4yEdhYvrXOo@spiral>
 <20260805223604.21acaf9b.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="dwudcwu6yddtx5vr"
Content-Disposition: inline
In-Reply-To: <20260805223604.21acaf9b.michal.pecio@gmail.com>


--dwudcwu6yddtx5vr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

At 2026-08-05 22:36:04 +0200, Michal Pecio wrote:
> On Wed, 5 Aug 2026 12:01:47 -0700, Bart Nagel wrote:
> > At 2026-07-30 23:59:53 +0200, Michal Pecio wrote:
> > > On Thu, 30 Jul 2026 11:13:59 -0700, Bart Nagel wrote:  
> > > > At 2026-07-30 13:08:14 +0200, Michal Pecio wrote:  
> > > > > I'm slightly curious what exactly happens there (probably MSE after
> > > > > Short Packet on a single-TRB TD), and whether Missed Service Error
> > > > > may point at a Link TRB, because the current fix wouldn't handle
> > > > > that and the stream could still hang. So your failure rate may
> > > > > actually be reduced to 1/255 of what it was, but still not zero.
> > > > > 
> > > > > If possible, please boot the patched kernel again and run it for
> > > > > a little longer. If it fails, post dmesg starting from the "Miss
> > > > > service interval error" line which is followed by "All TDs skipped".
> > > > > 
> > > > > And while that is running, also collect another log:
> > > > > 
> > > > > cd /sys/kernel/tracing/
> > > > > echo 1 > events/xhci-hcd/xhci_handle_event/enable
> > > > > echo 1 > tracing_on
> > > > > grep -B5 Missed trace_pipe | tee /tmp/trace
> > > > > 
> > > > > This is supposed to log 6 lines for every Missed Service Error, so
> > > > > it will grow, but not terribly fast.    
> > > > 
> > > > Before I make a bad assumption and collect a useless log, please
> > > > confirm for me exactly which debugging I should enable. Just the two
> > > > you gave above, or also one or both of the ones I was using before:
> > > > 
> > > >     echo "func handle_tx_event +p" >/proc/dynamic_debug/control
> > > >     echo 0xff >/sys/module/uvcvideo/parameters/trace  
> > > 
> > > Yes, please keep handle_tx_event, otherwise xhci_hcd debug messages
> > > won't show up. UVC trace is not that important.  
> > 
> > OK. I ran it with your temporary patch for around 24 hours with heavy
> > system load and didn't get any freezes. The logs are large; please let
> > me know if there's anything I can grep for which might tell us that
> > the potential 1/255 chance of a freeze still being possible is ruled
> > out.
> 
> Maybe stat with a sample of 100 events (thats 700 lines including ---
> separators added by grep) from "grep -B5 Missed trace_pipe".
> 
> I mainly wanted to see if it's a reliable pattern that the suspicious
> pointers are always 0x10 past the previous event's pointer.
> 
> And what happens when the previous event is at the end of a segment
> (TRB pointer ends with 0xfe0), can we get Missed Service ending with
> 0xff0? The old patch wouldn't handle it, though the new one will.

OK. Attached are the first ~700 lines of the trace file.

That whole thing is 17M, and is here for 48 hours from now in case it
is more illuminating: https://tmpfiles.org/wAwAIQxuuahs/trace.txt

In the dmesg log (2.4G) I grepped for anything looking like an address
ending fe0 or ff0. No ff0 in it. Lots of fe0. Mostly lines like

    [35493.248486] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea6fe0, comp_code 13 after 13
    [35493.482230] xhci_hcd 0000:00:14.0: Spurious event dma 0x000000010aea7fe0, comp_code 13 after 13

And also some of these:

    [83974.976001] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 10aea7fe0 td_dma 10aea7fd0, set skip flag
    [94458.133128] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 10aea6fe0 td_dma 10aea6fd0, set skip flag

Though I suppose those are probably also covered by the other log.

Let me know if I can help further.

--dwudcwu6yddtx5vr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="trace-700.txt"

          stress-62731   [000] d.h1. 27849.945079: xhci_handle_event: EVENT: @0x000000010fb9c990 TRB 000000010aea7180 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27849.945080: xhci_handle_event: EVENT: @0x000000010fb9c9a0 TRB 000000010aea71a0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27849.945080: xhci_handle_event: EVENT: @0x000000010fb9c9b0 TRB 000000010aea71b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27849.945080: xhci_handle_event: EVENT: @0x000000010fb9c9c0 TRB 000000010aea71d0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27849.945080: xhci_handle_event: EVENT: @0x000000010fb9c9d0 TRB 000000010aea71e0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27849.945080: xhci_handle_event: EVENT: @0x000000010fb9c9e0 TRB 000000010aea7200 status 'Missed Service Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:c
            grep-62688   [000] d.h1. 27849.945197: xhci_handle_event: EVENT: @0x000000010fb9c9f0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
            grep-62688   [000] d.h1. 27849.945200: xhci_handle_event: EVENT: @0x000000010fb9ca00 TRB 0000000000000000 status 'Missed Service Error' len 24576 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62732   [000] dlh1. 27856.374291: xhci_handle_event: EVENT: @0x000000010fb9cc30 TRB 000000010aea7ad0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62732   [000] d.h1. 27856.374948: xhci_handle_event: EVENT: @0x000000010fb9cc40 TRB 000000010aea7ae0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62732   [000] d.h1. 27856.374948: xhci_handle_event: EVENT: @0x000000010fb9cc50 TRB 000000010aea7b00 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62732   [000] d.h1. 27856.374948: xhci_handle_event: EVENT: @0x000000010fb9cc60 TRB 000000010aea7b10 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62732   [000] d.h1. 27856.374949: xhci_handle_event: EVENT: @0x000000010fb9cc70 TRB 000000010aea7b30 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62732   [000] d.h1. 27856.374949: xhci_handle_event: EVENT: @0x000000010fb9cc80 TRB 000000010aea7b40 status 'Missed Service Error' len 4096 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h2. 27856.375074: xhci_handle_event: EVENT: @0x000000010fb9cc90 TRB 0000000000000000 status 'Missed Service Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h2. 27856.375078: xhci_handle_event: EVENT: @0x000000010fb9cca0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62735   [000] d.h1. 27859.562084: xhci_handle_event: EVENT: @0x000000010fb9dfb0 TRB 000000010aea7a80 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62735   [000] d.h1. 27859.562085: xhci_handle_event: EVENT: @0x000000010fb9dfc0 TRB 000000010aea7aa0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62735   [000] d.h1. 27859.562085: xhci_handle_event: EVENT: @0x000000010fb9dfd0 TRB 000000010aea7ab0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62735   [000] d.h1. 27859.562085: xhci_handle_event: EVENT: @0x000000010fb9dfe0 TRB 000000010aea7ad0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62735   [000] d.h1. 27859.562086: xhci_handle_event: EVENT: @0x000000010fb9dff0 TRB 000000010aea7ae0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62735   [000] d.h1. 27859.562086: xhci_handle_event: EVENT: @0x000000010fb9c000 TRB 000000010aea7b00 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:c
            grep-62688   [000] d.h1. 27859.562200: xhci_handle_event: EVENT: @0x000000010fb9c010 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
            grep-62688   [000] d.h1. 27859.562203: xhci_handle_event: EVENT: @0x000000010fb9c020 TRB 0000000000000000 status 'Missed Service Error' len 32768 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62731   [000] d.h1. 27863.998453: xhci_handle_event: EVENT: @0x000000010fb9c6d0 TRB 000000010aea6470 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998453: xhci_handle_event: EVENT: @0x000000010fb9c6e0 TRB 000000010aea6480 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998453: xhci_handle_event: EVENT: @0x000000010fb9c6f0 TRB 000000010aea64a0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998453: xhci_handle_event: EVENT: @0x000000010fb9c700 TRB 000000010aea64b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998454: xhci_handle_event: EVENT: @0x000000010fb9c710 TRB 000000010aea64d0 status 'USB Transaction Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998575: xhci_handle_event: EVENT: @0x000000010fb9c720 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998579: xhci_handle_event: EVENT: @0x000000010fb9c730 TRB 0000000000000000 status 'Missed Service Error' len 8192 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998581: xhci_handle_event: EVENT: @0x000000010fb9c740 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998584: xhci_handle_event: EVENT: @0x000000010fb9c750 TRB 0000000000000000 status 'Missed Service Error' len 10240 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998586: xhci_handle_event: EVENT: @0x000000010fb9c760 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998588: xhci_handle_event: EVENT: @0x000000010fb9c770 TRB 0000000000000000 status 'Missed Service Error' len 12288 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998590: xhci_handle_event: EVENT: @0x000000010fb9c780 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998592: xhci_handle_event: EVENT: @0x000000010fb9c790 TRB 0000000000000000 status 'Missed Service Error' len 14336 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998593: xhci_handle_event: EVENT: @0x000000010fb9c7a0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998595: xhci_handle_event: EVENT: @0x000000010fb9c7b0 TRB 0000000000000000 status 'Missed Service Error' len 16384 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998597: xhci_handle_event: EVENT: @0x000000010fb9c7c0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998599: xhci_handle_event: EVENT: @0x000000010fb9c7d0 TRB 0000000000000000 status 'Missed Service Error' len 18432 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998601: xhci_handle_event: EVENT: @0x000000010fb9c7e0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998603: xhci_handle_event: EVENT: @0x000000010fb9c7f0 TRB 0000000000000000 status 'Missed Service Error' len 20480 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998605: xhci_handle_event: EVENT: @0x000000010fb9c800 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998607: xhci_handle_event: EVENT: @0x000000010fb9c810 TRB 0000000000000000 status 'Missed Service Error' len 22528 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998609: xhci_handle_event: EVENT: @0x000000010fb9c820 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998611: xhci_handle_event: EVENT: @0x000000010fb9c830 TRB 0000000000000000 status 'Missed Service Error' len 24576 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998613: xhci_handle_event: EVENT: @0x000000010fb9c840 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998615: xhci_handle_event: EVENT: @0x000000010fb9c850 TRB 0000000000000000 status 'Missed Service Error' len 26624 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998617: xhci_handle_event: EVENT: @0x000000010fb9c860 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998618: xhci_handle_event: EVENT: @0x000000010fb9c870 TRB 0000000000000000 status 'Missed Service Error' len 28672 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998620: xhci_handle_event: EVENT: @0x000000010fb9c880 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998622: xhci_handle_event: EVENT: @0x000000010fb9c890 TRB 0000000000000000 status 'Missed Service Error' len 30720 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998624: xhci_handle_event: EVENT: @0x000000010fb9c8a0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998626: xhci_handle_event: EVENT: @0x000000010fb9c8b0 TRB 0000000000000000 status 'Missed Service Error' len 32768 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998628: xhci_handle_event: EVENT: @0x000000010fb9c8c0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998630: xhci_handle_event: EVENT: @0x000000010fb9c8d0 TRB 0000000000000000 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27863.998632: xhci_handle_event: EVENT: @0x000000010fb9c8e0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62733   [000] dlh1. 27870.729335: xhci_handle_event: EVENT: @0x000000010fb9c8b0 TRB 000000010aea72d0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] dlh1. 27870.729335: xhci_handle_event: EVENT: @0x000000010fb9c8c0 TRB 000000010aea72f0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] dlh1. 27870.729335: xhci_handle_event: EVENT: @0x000000010fb9c8d0 TRB 000000010aea7300 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] dlh1. 27870.729335: xhci_handle_event: EVENT: @0x000000010fb9c8e0 TRB 000000010aea7320 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] dlh1. 27870.729336: xhci_handle_event: EVENT: @0x000000010fb9c8f0 TRB 000000010aea7330 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] dlh1. 27870.729336: xhci_handle_event: EVENT: @0x000000010fb9c900 TRB 000000010aea7350 status 'Missed Service Error' len 4096 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27870.729452: xhci_handle_event: EVENT: @0x000000010fb9c910 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27870.729455: xhci_handle_event: EVENT: @0x000000010fb9c920 TRB 0000000000000000 status 'Missed Service Error' len 26624 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62736   [000] dlh1. 27877.245332: xhci_handle_event: EVENT: @0x000000010fb9dba0 TRB 000000010aea7cf0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] dlh1. 27877.245332: xhci_handle_event: EVENT: @0x000000010fb9dbb0 TRB 000000010aea7d10 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] dlh1. 27877.245332: xhci_handle_event: EVENT: @0x000000010fb9dbc0 TRB 000000010aea7d20 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] dlh1. 27877.245332: xhci_handle_event: EVENT: @0x000000010fb9dbd0 TRB 000000010aea7d40 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] dlh1. 27877.245333: xhci_handle_event: EVENT: @0x000000010fb9dbe0 TRB 000000010aea7d50 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] dlh1. 27877.245333: xhci_handle_event: EVENT: @0x000000010fb9dbf0 TRB 000000010aea7d70 status 'Missed Service Error' len 9216 slot 7 ep 3 type 'Transfer Event' flags e:c
 WaylandEventThr-62919   [000] d.h1. 27877.245454: xhci_handle_event: EVENT: @0x000000010fb9dc00 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
 WaylandEventThr-62919   [000] d.h1. 27877.245457: xhci_handle_event: EVENT: @0x000000010fb9dc10 TRB 0000000000000000 status 'Missed Service Error' len 26624 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62735   [000] dlh1. 27881.335330: xhci_handle_event: EVENT: @0x000000010fb9c3e0 TRB 000000010aea6480 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62735   [000] dlh1. 27881.335330: xhci_handle_event: EVENT: @0x000000010fb9c3f0 TRB 000000010aea64a0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62735   [000] dlh1. 27881.335331: xhci_handle_event: EVENT: @0x000000010fb9c400 TRB 000000010aea64b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62735   [000] dlh1. 27881.335331: xhci_handle_event: EVENT: @0x000000010fb9c410 TRB 000000010aea64d0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62735   [000] dlh1. 27881.335331: xhci_handle_event: EVENT: @0x000000010fb9c420 TRB 000000010aea64e0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62735   [000] dlh1. 27881.335331: xhci_handle_event: EVENT: @0x000000010fb9c430 TRB 000000010aea6500 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:C
           dmesg-62709   [000] d.h1. 27881.335454: xhci_handle_event: EVENT: @0x000000010fb9c440 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
           dmesg-62709   [000] d.h1. 27881.335458: xhci_handle_event: EVENT: @0x000000010fb9c450 TRB 0000000000000000 status 'Missed Service Error' len 10240 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62735   [000] d.h1. 27887.181590: xhci_handle_event: EVENT: @0x000000010fb9da60 TRB 000000010aea7660 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62735   [000] d.h1. 27887.181590: xhci_handle_event: EVENT: @0x000000010fb9da70 TRB 000000010aea7680 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62735   [000] d.h1. 27887.181590: xhci_handle_event: EVENT: @0x000000010fb9da80 TRB 000000010aea7690 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62735   [000] d.h1. 27887.181591: xhci_handle_event: EVENT: @0x000000010fb9da90 TRB 000000010aea76b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62735   [000] d.h1. 27887.181591: xhci_handle_event: EVENT: @0x000000010fb9daa0 TRB 000000010aea76c0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62735   [000] d.h1. 27887.181591: xhci_handle_event: EVENT: @0x000000010fb9dab0 TRB 000000010aea76e0 status 'Missed Service Error' len 10240 slot 7 ep 3 type 'Transfer Event' flags e:C
            grep-62688   [000] d.h1. 27887.181705: xhci_handle_event: EVENT: @0x000000010fb9dac0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
            grep-62688   [000] d.h1. 27887.181709: xhci_handle_event: EVENT: @0x000000010fb9dad0 TRB 0000000000000000 status 'Missed Service Error' len 28672 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62730   [000] dlh1. 27890.162295: xhci_handle_event: EVENT: @0x000000010fb9cc80 TRB 000000010aea7b30 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166206: xhci_handle_event: EVENT: @0x000000010fb9cc90 TRB 000000010aea7b40 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166207: xhci_handle_event: EVENT: @0x000000010fb9cca0 TRB 000000010aea7b60 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166207: xhci_handle_event: EVENT: @0x000000010fb9ccb0 TRB 000000010aea7b70 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166207: xhci_handle_event: EVENT: @0x000000010fb9ccc0 TRB 000000010aea7b90 status 'USB Transaction Error' len 4096 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166331: xhci_handle_event: EVENT: @0x000000010fb9ccd0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166335: xhci_handle_event: EVENT: @0x000000010fb9cce0 TRB 0000000000000000 status 'Missed Service Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166337: xhci_handle_event: EVENT: @0x000000010fb9ccf0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166339: xhci_handle_event: EVENT: @0x000000010fb9cd00 TRB 0000000000000000 status 'Missed Service Error' len 8192 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166341: xhci_handle_event: EVENT: @0x000000010fb9cd10 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166343: xhci_handle_event: EVENT: @0x000000010fb9cd20 TRB 0000000000000000 status 'Missed Service Error' len 10240 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166345: xhci_handle_event: EVENT: @0x000000010fb9cd30 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166347: xhci_handle_event: EVENT: @0x000000010fb9cd40 TRB 0000000000000000 status 'Missed Service Error' len 12288 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166349: xhci_handle_event: EVENT: @0x000000010fb9cd50 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166351: xhci_handle_event: EVENT: @0x000000010fb9cd60 TRB 0000000000000000 status 'Missed Service Error' len 14336 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166353: xhci_handle_event: EVENT: @0x000000010fb9cd70 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166355: xhci_handle_event: EVENT: @0x000000010fb9cd80 TRB 0000000000000000 status 'Missed Service Error' len 16384 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166357: xhci_handle_event: EVENT: @0x000000010fb9cd90 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166359: xhci_handle_event: EVENT: @0x000000010fb9cda0 TRB 0000000000000000 status 'Missed Service Error' len 18432 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166360: xhci_handle_event: EVENT: @0x000000010fb9cdb0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166363: xhci_handle_event: EVENT: @0x000000010fb9cdc0 TRB 0000000000000000 status 'Missed Service Error' len 20480 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166365: xhci_handle_event: EVENT: @0x000000010fb9cdd0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166366: xhci_handle_event: EVENT: @0x000000010fb9cde0 TRB 0000000000000000 status 'Missed Service Error' len 22528 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166369: xhci_handle_event: EVENT: @0x000000010fb9cdf0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166370: xhci_handle_event: EVENT: @0x000000010fb9ce00 TRB 0000000000000000 status 'Missed Service Error' len 24576 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166372: xhci_handle_event: EVENT: @0x000000010fb9ce10 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166374: xhci_handle_event: EVENT: @0x000000010fb9ce20 TRB 0000000000000000 status 'Missed Service Error' len 26624 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166376: xhci_handle_event: EVENT: @0x000000010fb9ce30 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166378: xhci_handle_event: EVENT: @0x000000010fb9ce40 TRB 0000000000000000 status 'Missed Service Error' len 28672 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166380: xhci_handle_event: EVENT: @0x000000010fb9ce50 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166382: xhci_handle_event: EVENT: @0x000000010fb9ce60 TRB 0000000000000000 status 'Missed Service Error' len 30720 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166384: xhci_handle_event: EVENT: @0x000000010fb9ce70 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166386: xhci_handle_event: EVENT: @0x000000010fb9ce80 TRB 0000000000000000 status 'Missed Service Error' len 32768 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27890.166388: xhci_handle_event: EVENT: @0x000000010fb9ce90 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62730   [000] d.h1. 27896.212715: xhci_handle_event: EVENT: @0x000000010fb9c9e0 TRB 000000010aea6650 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27896.212715: xhci_handle_event: EVENT: @0x000000010fb9c9f0 TRB 000000010aea6660 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27896.212715: xhci_handle_event: EVENT: @0x000000010fb9ca00 TRB 000000010aea6680 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27896.212716: xhci_handle_event: EVENT: @0x000000010fb9ca10 TRB 000000010aea6690 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27896.212716: xhci_handle_event: EVENT: @0x000000010fb9ca20 TRB 000000010aea66b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27896.212716: xhci_handle_event: EVENT: @0x000000010fb9ca30 TRB 000000010aea66c0 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:c
            grep-62688   [000] d.h1. 27896.212833: xhci_handle_event: EVENT: @0x000000010fb9ca40 TRB 0000000000000000 status 'Missed Service Error' len 20480 slot 7 ep 3 type 'Transfer Event' flags e:c
            grep-62688   [000] d.h1. 27896.212837: xhci_handle_event: EVENT: @0x000000010fb9ca50 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62737   [000] d.h1. 27903.112715: xhci_handle_event: EVENT: @0x000000010fb9d6d0 TRB 000000010aea71a0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27903.112715: xhci_handle_event: EVENT: @0x000000010fb9d6e0 TRB 000000010aea71b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27903.112716: xhci_handle_event: EVENT: @0x000000010fb9d6f0 TRB 000000010aea71d0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27903.112716: xhci_handle_event: EVENT: @0x000000010fb9d700 TRB 000000010aea71e0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27903.112716: xhci_handle_event: EVENT: @0x000000010fb9d710 TRB 000000010aea7200 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27903.112716: xhci_handle_event: EVENT: @0x000000010fb9d720 TRB 000000010aea7210 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h2. 27903.112838: xhci_handle_event: EVENT: @0x000000010fb9d730 TRB 0000000000000000 status 'Missed Service Error' len 20480 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h2. 27903.112842: xhci_handle_event: EVENT: @0x000000010fb9d740 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62737   [000] d.h1. 27904.374301: xhci_handle_event: EVENT: @0x000000010fb9c890 TRB 000000010aea67d0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62737   [000] d.h1. 27904.374302: xhci_handle_event: EVENT: @0x000000010fb9c8a0 TRB 000000010aea67e0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62737   [000] d.h1. 27904.374302: xhci_handle_event: EVENT: @0x000000010fb9c8b0 TRB 000000010aea6800 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62737   [000] d.h1. 27904.374710: xhci_handle_event: EVENT: @0x000000010fb9c8c0 TRB 000000010aea6810 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62737   [000] d.h1. 27904.374710: xhci_handle_event: EVENT: @0x000000010fb9c8d0 TRB 000000010aea6830 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62737   [000] d.h1. 27904.374711: xhci_handle_event: EVENT: @0x000000010fb9c8e0 TRB 000000010aea6840 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27904.374836: xhci_handle_event: EVENT: @0x000000010fb9c8f0 TRB 0000000000000000 status 'Missed Service Error' len 4096 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27904.374840: xhci_handle_event: EVENT: @0x000000010fb9c900 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62737   [000] d.h1. 27914.966306: xhci_handle_event: EVENT: @0x000000010fb9da20 TRB 000000010aea6ec0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62737   [000] d.h1. 27914.966306: xhci_handle_event: EVENT: @0x000000010fb9da30 TRB 000000010aea6ed0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62737   [000] d.h1. 27914.966306: xhci_handle_event: EVENT: @0x000000010fb9da40 TRB 000000010aea6ef0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62737   [000] d.h1. 27914.966307: xhci_handle_event: EVENT: @0x000000010fb9da50 TRB 000000010aea6f00 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62737   [000] d.h1. 27914.966307: xhci_handle_event: EVENT: @0x000000010fb9da60 TRB 000000010aea6f20 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
   kworker/u33:4-62802   [000] d.h1. 27914.966463: xhci_handle_event: EVENT: @0x000000010fb9da70 TRB 000000010aea6f30 status 'Missed Service Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62737   [000] d.h1. 27914.966588: xhci_handle_event: EVENT: @0x000000010fb9da80 TRB 0000000000000000 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62737   [000] d.h1. 27914.966591: xhci_handle_event: EVENT: @0x000000010fb9da90 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62730   [000] d.h1. 27926.329718: xhci_handle_event: EVENT: @0x000000010fb9dc80 TRB 000000010aea7aa0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27926.329718: xhci_handle_event: EVENT: @0x000000010fb9dc90 TRB 000000010aea7ab0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27926.329718: xhci_handle_event: EVENT: @0x000000010fb9dca0 TRB 000000010aea7ad0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27926.329718: xhci_handle_event: EVENT: @0x000000010fb9dcb0 TRB 000000010aea7ae0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27926.329719: xhci_handle_event: EVENT: @0x000000010fb9dcc0 TRB 000000010aea7b00 status 'Short Packet' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27926.329719: xhci_handle_event: EVENT: @0x000000010fb9dcd0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27926.329724: xhci_handle_event: EVENT: @0x000000010fb9dce0 TRB 0000000000000000 status 'Missed Service Error' len 28672 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27926.329727: xhci_handle_event: EVENT: @0x000000010fb9dcf0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62730   [000] d.h1. 27932.196972: xhci_handle_event: EVENT: @0x000000010fb9dbd0 TRB 000000010aea7c60 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27932.196972: xhci_handle_event: EVENT: @0x000000010fb9dbe0 TRB 000000010aea7c80 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27932.196972: xhci_handle_event: EVENT: @0x000000010fb9dbf0 TRB 000000010aea7c90 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27932.196972: xhci_handle_event: EVENT: @0x000000010fb9dc00 TRB 000000010aea7cb0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27932.196972: xhci_handle_event: EVENT: @0x000000010fb9dc10 TRB 000000010aea7cc0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27932.196973: xhci_handle_event: EVENT: @0x000000010fb9dc20 TRB 000000010aea7ce0 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h1. 27932.197091: xhci_handle_event: EVENT: @0x000000010fb9dc30 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h1. 27932.197095: xhci_handle_event: EVENT: @0x000000010fb9dc40 TRB 0000000000000000 status 'Missed Service Error' len 24576 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62730   [000] dlh1. 27937.180368: xhci_handle_event: EVENT: @0x000000010fb9d0b0 TRB 000000010aea64a0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] dlh1. 27937.180368: xhci_handle_event: EVENT: @0x000000010fb9d0c0 TRB 000000010aea64b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] dlh1. 27937.180369: xhci_handle_event: EVENT: @0x000000010fb9d0d0 TRB 000000010aea64d0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] dlh1. 27937.180369: xhci_handle_event: EVENT: @0x000000010fb9d0e0 TRB 000000010aea64e0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] dlh1. 27937.180370: xhci_handle_event: EVENT: @0x000000010fb9d0f0 TRB 000000010aea6500 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] dlh1. 27937.180370: xhci_handle_event: EVENT: @0x000000010fb9d100 TRB 000000010aea6510 status 'Missed Service Error' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27937.180469: xhci_handle_event: EVENT: @0x000000010fb9d110 TRB 0000000000000000 status 'Missed Service Error' len 18432 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27937.180473: xhci_handle_event: EVENT: @0x000000010fb9d120 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62732   [000] d.h1. 27941.480497: xhci_handle_event: EVENT: @0x000000010fb9c4c0 TRB 000000010aea6a50 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62732   [000] d.h1. 27941.480497: xhci_handle_event: EVENT: @0x000000010fb9c4d0 TRB 000000010aea6a70 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62732   [000] d.h1. 27941.480497: xhci_handle_event: EVENT: @0x000000010fb9c4e0 TRB 000000010aea6a80 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62732   [000] d.h1. 27941.480498: xhci_handle_event: EVENT: @0x000000010fb9c4f0 TRB 000000010aea6aa0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62732   [000] d.h1. 27941.480498: xhci_handle_event: EVENT: @0x000000010fb9c500 TRB 000000010aea6ab0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62732   [000] d.h1. 27941.480498: xhci_handle_event: EVENT: @0x000000010fb9c510 TRB 000000010aea6ad0 status 'Missed Service Error' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27941.480594: xhci_handle_event: EVENT: @0x000000010fb9c520 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27941.480597: xhci_handle_event: EVENT: @0x000000010fb9c530 TRB 0000000000000000 status 'Missed Service Error' len 20480 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62733   [000] d.h1. 27945.032497: xhci_handle_event: EVENT: @0x000000010fb9d510 TRB 000000010aea7cc0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62733   [000] d.h1. 27945.032497: xhci_handle_event: EVENT: @0x000000010fb9d520 TRB 000000010aea7ce0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62733   [000] d.h1. 27945.032498: xhci_handle_event: EVENT: @0x000000010fb9d530 TRB 000000010aea7cf0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62733   [000] d.h1. 27945.032498: xhci_handle_event: EVENT: @0x000000010fb9d540 TRB 000000010aea7d10 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62733   [000] d.h1. 27945.032498: xhci_handle_event: EVENT: @0x000000010fb9d550 TRB 000000010aea7d20 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62733   [000] d.h1. 27945.032498: xhci_handle_event: EVENT: @0x000000010fb9d560 TRB 000000010aea7d40 status 'Missed Service Error' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
             tee-62705   [000] d.h1. 27945.032594: xhci_handle_event: EVENT: @0x000000010fb9d570 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
             tee-62705   [000] d.h1. 27945.032598: xhci_handle_event: EVENT: @0x000000010fb9d580 TRB 0000000000000000 status 'Missed Service Error' len 20480 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62733   [000] dlh1. 27945.462597: xhci_handle_event: EVENT: @0x000000010fb9d470 TRB 000000010aea6140 status 'Short Packet' len 4096 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] dlh1. 27945.463345: xhci_handle_event: EVENT: @0x000000010fb9d480 TRB 000000010aea6150 status 'Short Packet' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] dlh1. 27945.463346: xhci_handle_event: EVENT: @0x000000010fb9d490 TRB 000000010aea6170 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] dlh1. 27945.463346: xhci_handle_event: EVENT: @0x000000010fb9d4a0 TRB 000000010aea6180 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] dlh1. 27945.463347: xhci_handle_event: EVENT: @0x000000010fb9d4b0 TRB 000000010aea61a0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] dlh1. 27945.463347: xhci_handle_event: EVENT: @0x000000010fb9d4c0 TRB 000000010aea61b0 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:C
            grep-62688   [000] d.h1. 27945.463470: xhci_handle_event: EVENT: @0x000000010fb9d4d0 TRB 0000000000000000 status 'Missed Service Error' len 10240 slot 7 ep 3 type 'Transfer Event' flags e:C
            grep-62688   [000] d.h1. 27945.463474: xhci_handle_event: EVENT: @0x000000010fb9d4e0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62736   [000] d.h1. 27947.606189: xhci_handle_event: EVENT: @0x000000010fb9cbd0 TRB 000000010aea6ef0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] d.h1. 27947.606189: xhci_handle_event: EVENT: @0x000000010fb9cbe0 TRB 000000010aea6f00 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] d.h1. 27947.606190: xhci_handle_event: EVENT: @0x000000010fb9cbf0 TRB 000000010aea6f20 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] dlh1. 27947.606470: xhci_handle_event: EVENT: @0x000000010fb9cc00 TRB 000000010aea6f30 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] dlh1. 27947.606470: xhci_handle_event: EVENT: @0x000000010fb9cc10 TRB 000000010aea6f40 status 'Short Packet' len 5120 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] d.h1. 27947.606595: xhci_handle_event: EVENT: @0x000000010fb9cc20 TRB 0000000000000000 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] d.h1. 27947.606600: xhci_handle_event: EVENT: @0x000000010fb9cc30 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] d.h1. 27947.606603: xhci_handle_event: EVENT: @0x000000010fb9cc40 TRB 0000000000000000 status 'Missed Service Error' len 4096 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62737   [000] d.h1. 27954.234974: xhci_handle_event: EVENT: @0x000000010fb9c990 TRB 000000010aea6b40 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.234975: xhci_handle_event: EVENT: @0x000000010fb9c9a0 TRB 000000010aea6b60 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.234975: xhci_handle_event: EVENT: @0x000000010fb9c9b0 TRB 000000010aea6b70 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.234975: xhci_handle_event: EVENT: @0x000000010fb9c9c0 TRB 000000010aea6b90 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.234975: xhci_handle_event: EVENT: @0x000000010fb9c9d0 TRB 000000010aea6ba0 status 'USB Transaction Error' len 8192 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235097: xhci_handle_event: EVENT: @0x000000010fb9c9e0 TRB 0000000000000000 status 'Missed Service Error' len 12288 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235100: xhci_handle_event: EVENT: @0x000000010fb9c9f0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235102: xhci_handle_event: EVENT: @0x000000010fb9ca00 TRB 0000000000000000 status 'Missed Service Error' len 14336 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235104: xhci_handle_event: EVENT: @0x000000010fb9ca10 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235106: xhci_handle_event: EVENT: @0x000000010fb9ca20 TRB 0000000000000000 status 'Missed Service Error' len 16384 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235108: xhci_handle_event: EVENT: @0x000000010fb9ca30 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235110: xhci_handle_event: EVENT: @0x000000010fb9ca40 TRB 0000000000000000 status 'Missed Service Error' len 18432 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235112: xhci_handle_event: EVENT: @0x000000010fb9ca50 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235114: xhci_handle_event: EVENT: @0x000000010fb9ca60 TRB 0000000000000000 status 'Missed Service Error' len 20480 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235116: xhci_handle_event: EVENT: @0x000000010fb9ca70 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235118: xhci_handle_event: EVENT: @0x000000010fb9ca80 TRB 0000000000000000 status 'Missed Service Error' len 22528 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235120: xhci_handle_event: EVENT: @0x000000010fb9ca90 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235122: xhci_handle_event: EVENT: @0x000000010fb9caa0 TRB 0000000000000000 status 'Missed Service Error' len 24576 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235123: xhci_handle_event: EVENT: @0x000000010fb9cab0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235125: xhci_handle_event: EVENT: @0x000000010fb9cac0 TRB 0000000000000000 status 'Missed Service Error' len 26624 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235127: xhci_handle_event: EVENT: @0x000000010fb9cad0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235129: xhci_handle_event: EVENT: @0x000000010fb9cae0 TRB 0000000000000000 status 'Missed Service Error' len 28672 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235131: xhci_handle_event: EVENT: @0x000000010fb9caf0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235133: xhci_handle_event: EVENT: @0x000000010fb9cb00 TRB 0000000000000000 status 'Missed Service Error' len 30720 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235135: xhci_handle_event: EVENT: @0x000000010fb9cb10 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235137: xhci_handle_event: EVENT: @0x000000010fb9cb20 TRB 0000000000000000 status 'Missed Service Error' len 32768 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235139: xhci_handle_event: EVENT: @0x000000010fb9cb30 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235140: xhci_handle_event: EVENT: @0x000000010fb9cb40 TRB 0000000000000000 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235142: xhci_handle_event: EVENT: @0x000000010fb9cb50 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235144: xhci_handle_event: EVENT: @0x000000010fb9cb60 TRB 0000000000000000 status 'Missed Service Error' len 4096 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235146: xhci_handle_event: EVENT: @0x000000010fb9cb70 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235148: xhci_handle_event: EVENT: @0x000000010fb9cb80 TRB 0000000000000000 status 'Missed Service Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235150: xhci_handle_event: EVENT: @0x000000010fb9cb90 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27954.235152: xhci_handle_event: EVENT: @0x000000010fb9cba0 TRB 0000000000000000 status 'Missed Service Error' len 8192 slot 7 ep 3 type 'Transfer Event' flags e:c
--
       alacritty-3487    [000] d.h1. 27955.801730: xhci_handle_event: EVENT: @0x000000010fb9db30 TRB 000000010aea6960 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
       alacritty-3487    [000] d.h1. 27955.801731: xhci_handle_event: EVENT: @0x000000010fb9db40 TRB 000000010aea6980 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
       alacritty-3487    [000] d.h1. 27955.801731: xhci_handle_event: EVENT: @0x000000010fb9db50 TRB 000000010aea6990 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
       alacritty-3487    [000] d.h1. 27955.801731: xhci_handle_event: EVENT: @0x000000010fb9db60 TRB 000000010aea69b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
       alacritty-3487    [000] d.h1. 27955.801731: xhci_handle_event: EVENT: @0x000000010fb9db70 TRB 000000010aea69c0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
       alacritty-3487    [000] d.h1. 27955.801731: xhci_handle_event: EVENT: @0x000000010fb9db80 TRB 000000010aea69e0 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:C
       alacritty-3487    [000] d.h1. 27955.801848: xhci_handle_event: EVENT: @0x000000010fb9db90 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
       alacritty-3487    [000] d.h1. 27955.801851: xhci_handle_event: EVENT: @0x000000010fb9dba0 TRB 0000000000000000 status 'Missed Service Error' len 30720 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62730   [000] d.h1. 27958.051848: xhci_handle_event: EVENT: @0x000000010fb9cfe0 TRB 000000010aea6780 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27958.051849: xhci_handle_event: EVENT: @0x000000010fb9cff0 TRB 000000010aea67a0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27958.051849: xhci_handle_event: EVENT: @0x000000010fb9d000 TRB 000000010aea67b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27958.051849: xhci_handle_event: EVENT: @0x000000010fb9d010 TRB 000000010aea67d0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27958.051849: xhci_handle_event: EVENT: @0x000000010fb9d020 TRB 000000010aea67e0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27958.051850: xhci_handle_event: EVENT: @0x000000010fb9d030 TRB 0000000000000000 status 'Missed Service Error' len 12288 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27958.051856: xhci_handle_event: EVENT: @0x000000010fb9d040 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27958.051858: xhci_handle_event: EVENT: @0x000000010fb9d050 TRB 0000000000000000 status 'Missed Service Error' len 14336 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27958.051860: xhci_handle_event: EVENT: @0x000000010fb9d060 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62730   [000] d.h1. 27964.382065: xhci_handle_event: EVENT: @0x000000010fb9d410 TRB 000000010aea6630 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.382065: xhci_handle_event: EVENT: @0x000000010fb9d420 TRB 000000010aea6650 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.382065: xhci_handle_event: EVENT: @0x000000010fb9d430 TRB 000000010aea6660 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.382066: xhci_handle_event: EVENT: @0x000000010fb9d440 TRB 000000010aea6680 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385723: xhci_handle_event: EVENT: @0x000000010fb9d450 TRB 000000010aea6690 status 'USB Transaction Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385849: xhci_handle_event: EVENT: @0x000000010fb9d460 TRB 0000000000000000 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385852: xhci_handle_event: EVENT: @0x000000010fb9d470 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385855: xhci_handle_event: EVENT: @0x000000010fb9d480 TRB 0000000000000000 status 'Missed Service Error' len 4096 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385857: xhci_handle_event: EVENT: @0x000000010fb9d490 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385859: xhci_handle_event: EVENT: @0x000000010fb9d4a0 TRB 0000000000000000 status 'Missed Service Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385861: xhci_handle_event: EVENT: @0x000000010fb9d4b0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385863: xhci_handle_event: EVENT: @0x000000010fb9d4c0 TRB 0000000000000000 status 'Missed Service Error' len 8192 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385865: xhci_handle_event: EVENT: @0x000000010fb9d4d0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385867: xhci_handle_event: EVENT: @0x000000010fb9d4e0 TRB 0000000000000000 status 'Missed Service Error' len 10240 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385869: xhci_handle_event: EVENT: @0x000000010fb9d4f0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385870: xhci_handle_event: EVENT: @0x000000010fb9d500 TRB 0000000000000000 status 'Missed Service Error' len 12288 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385872: xhci_handle_event: EVENT: @0x000000010fb9d510 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385874: xhci_handle_event: EVENT: @0x000000010fb9d520 TRB 0000000000000000 status 'Missed Service Error' len 14336 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385876: xhci_handle_event: EVENT: @0x000000010fb9d530 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385878: xhci_handle_event: EVENT: @0x000000010fb9d540 TRB 0000000000000000 status 'Missed Service Error' len 16384 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385880: xhci_handle_event: EVENT: @0x000000010fb9d550 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385882: xhci_handle_event: EVENT: @0x000000010fb9d560 TRB 0000000000000000 status 'Missed Service Error' len 18432 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385884: xhci_handle_event: EVENT: @0x000000010fb9d570 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385886: xhci_handle_event: EVENT: @0x000000010fb9d580 TRB 0000000000000000 status 'Missed Service Error' len 20480 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385888: xhci_handle_event: EVENT: @0x000000010fb9d590 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385890: xhci_handle_event: EVENT: @0x000000010fb9d5a0 TRB 0000000000000000 status 'Missed Service Error' len 22528 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385892: xhci_handle_event: EVENT: @0x000000010fb9d5b0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385894: xhci_handle_event: EVENT: @0x000000010fb9d5c0 TRB 0000000000000000 status 'Missed Service Error' len 24576 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385896: xhci_handle_event: EVENT: @0x000000010fb9d5d0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385898: xhci_handle_event: EVENT: @0x000000010fb9d5e0 TRB 0000000000000000 status 'Missed Service Error' len 26624 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385900: xhci_handle_event: EVENT: @0x000000010fb9d5f0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385902: xhci_handle_event: EVENT: @0x000000010fb9d600 TRB 0000000000000000 status 'Missed Service Error' len 28672 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385903: xhci_handle_event: EVENT: @0x000000010fb9d610 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385905: xhci_handle_event: EVENT: @0x000000010fb9d620 TRB 0000000000000000 status 'Missed Service Error' len 30720 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 27964.385907: xhci_handle_event: EVENT: @0x000000010fb9d630 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62730   [000] d.h1. 27966.416749: xhci_handle_event: EVENT: @0x000000010fb9d1c0 TRB 000000010aea6200 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27966.416750: xhci_handle_event: EVENT: @0x000000010fb9d1d0 TRB 000000010aea6210 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27966.416750: xhci_handle_event: EVENT: @0x000000010fb9d1e0 TRB 000000010aea6230 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27966.416750: xhci_handle_event: EVENT: @0x000000010fb9d1f0 TRB 000000010aea6240 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27966.416750: xhci_handle_event: EVENT: @0x000000010fb9d200 TRB 000000010aea6260 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27966.416751: xhci_handle_event: EVENT: @0x000000010fb9d210 TRB 000000010aea6270 status 'Missed Service Error' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27966.416850: xhci_handle_event: EVENT: @0x000000010fb9d220 TRB 0000000000000000 status 'Missed Service Error' len 22528 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27966.416853: xhci_handle_event: EVENT: @0x000000010fb9d230 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62731   [000] d.h1. 27969.380228: xhci_handle_event: EVENT: @0x000000010fb9d2c0 TRB 000000010aea79e0 status 'Short Packet' len 18432 slot 7 ep 3 type 'Transfer Event' flags e:c
 .Hyprland-wrapp-2343    [000] d.h1. 27969.380975: xhci_handle_event: EVENT: @0x000000010fb9d2d0 TRB 000000010aea79f0 status 'Short Packet' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
 .Hyprland-wrapp-2343    [000] d.h1. 27969.380976: xhci_handle_event: EVENT: @0x000000010fb9d2e0 TRB 000000010aea7a10 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 .Hyprland-wrapp-2343    [000] d.h1. 27969.380976: xhci_handle_event: EVENT: @0x000000010fb9d2f0 TRB 000000010aea7a20 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 .Hyprland-wrapp-2343    [000] d.h1. 27969.380977: xhci_handle_event: EVENT: @0x000000010fb9d300 TRB 000000010aea7a40 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 .Hyprland-wrapp-2343    [000] d.h1. 27969.380977: xhci_handle_event: EVENT: @0x000000010fb9d310 TRB 000000010aea7a50 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:c
 .Hyprland-wrapp-2343    [000] d.h1. 27969.381101: xhci_handle_event: EVENT: @0x000000010fb9d320 TRB 0000000000000000 status 'Missed Service Error' len 24576 slot 7 ep 3 type 'Transfer Event' flags e:c
 .Hyprland-wrapp-2343    [000] d.h1. 27969.381105: xhci_handle_event: EVENT: @0x000000010fb9d330 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62734   [000] d.h1. 27971.863604: xhci_handle_event: EVENT: @0x000000010fb9d820 TRB 000000010aea6720 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 27971.863604: xhci_handle_event: EVENT: @0x000000010fb9d830 TRB 000000010aea6740 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 27971.863605: xhci_handle_event: EVENT: @0x000000010fb9d840 TRB 000000010aea6750 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 27971.863605: xhci_handle_event: EVENT: @0x000000010fb9d850 TRB 000000010aea6770 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 27971.863605: xhci_handle_event: EVENT: @0x000000010fb9d860 TRB 000000010aea6780 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 27971.863606: xhci_handle_event: EVENT: @0x000000010fb9d870 TRB 000000010aea67a0 status 'Missed Service Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 27971.863726: xhci_handle_event: EVENT: @0x000000010fb9d880 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 27971.863729: xhci_handle_event: EVENT: @0x000000010fb9d890 TRB 0000000000000000 status 'Missed Service Error' len 14336 slot 7 ep 3 type 'Transfer Event' flags e:c
--
 systemd-journal-866     [000] d.h1. 27973.963228: xhci_handle_event: EVENT: @0x000000010fb9df20 TRB 000000010aea7490 status 'Short Packet' len 23552 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h1. 27973.963229: xhci_handle_event: EVENT: @0x000000010fb9df30 TRB 000000010aea74a0 status 'Short Packet' len 10240 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h11 27973.963851: xhci_handle_event: EVENT: @0x000000010fb9df40 TRB 000000010aea74b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h11 27973.963852: xhci_handle_event: EVENT: @0x000000010fb9df50 TRB 000000010aea74d0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h11 27973.963852: xhci_handle_event: EVENT: @0x000000010fb9df60 TRB 000000010aea74e0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h11 27973.963852: xhci_handle_event: EVENT: @0x000000010fb9df70 TRB 000000010aea7500 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h2. 27973.963976: xhci_handle_event: EVENT: @0x000000010fb9df80 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h2. 27973.963980: xhci_handle_event: EVENT: @0x000000010fb9df90 TRB 0000000000000000 status 'Missed Service Error' len 16384 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62736   [000] d.h1. 27974.113853: xhci_handle_event: EVENT: @0x000000010fb9cd30 TRB 000000010aea6570 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 27974.113854: xhci_handle_event: EVENT: @0x000000010fb9cd40 TRB 000000010aea6590 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 27974.113854: xhci_handle_event: EVENT: @0x000000010fb9cd50 TRB 000000010aea65a0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 27974.113854: xhci_handle_event: EVENT: @0x000000010fb9cd60 TRB 000000010aea65c0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 27974.113855: xhci_handle_event: EVENT: @0x000000010fb9cd70 TRB 000000010aea65d0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 27974.113855: xhci_handle_event: EVENT: @0x000000010fb9cd80 TRB 000000010aea65f0 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27974.113976: xhci_handle_event: EVENT: @0x000000010fb9cd90 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27974.113980: xhci_handle_event: EVENT: @0x000000010fb9cda0 TRB 0000000000000000 status 'Missed Service Error' len 32768 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62734   [000] d.h1. 27975.213977: xhci_handle_event: EVENT: @0x000000010fb9c710 TRB 000000010aea61d0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27975.213977: xhci_handle_event: EVENT: @0x000000010fb9c720 TRB 000000010aea61e0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27975.213978: xhci_handle_event: EVENT: @0x000000010fb9c730 TRB 000000010aea6200 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27975.213978: xhci_handle_event: EVENT: @0x000000010fb9c740 TRB 000000010aea6210 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27975.213978: xhci_handle_event: EVENT: @0x000000010fb9c750 TRB 000000010aea6230 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27975.213979: xhci_handle_event: EVENT: @0x000000010fb9c760 TRB 000000010aea6240 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27975.214102: xhci_handle_event: EVENT: @0x000000010fb9c770 TRB 0000000000000000 status 'Missed Service Error' len 32768 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27975.214106: xhci_handle_event: EVENT: @0x000000010fb9c780 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62731   [000] d.h1. 27978.266977: xhci_handle_event: EVENT: @0x000000010fb9de70 TRB 000000010aea7c80 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27978.266977: xhci_handle_event: EVENT: @0x000000010fb9de80 TRB 000000010aea7c90 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27978.266978: xhci_handle_event: EVENT: @0x000000010fb9de90 TRB 000000010aea7cb0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27978.266978: xhci_handle_event: EVENT: @0x000000010fb9dea0 TRB 000000010aea7cc0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27978.266978: xhci_handle_event: EVENT: @0x000000010fb9deb0 TRB 000000010aea7ce0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 27978.266978: xhci_handle_event: EVENT: @0x000000010fb9dec0 TRB 000000010aea7cf0 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h1. 27978.267103: xhci_handle_event: EVENT: @0x000000010fb9ded0 TRB 0000000000000000 status 'Missed Service Error' len 8192 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h1. 27978.267107: xhci_handle_event: EVENT: @0x000000010fb9dee0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62731   [000] d.h1. 27978.414064: xhci_handle_event: EVENT: @0x000000010fb9cb70 TRB 000000010aea6b60 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62731   [000] d.h1. 27978.414064: xhci_handle_event: EVENT: @0x000000010fb9cb80 TRB 000000010aea6b70 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62731   [000] d.h1. 27978.414064: xhci_handle_event: EVENT: @0x000000010fb9cb90 TRB 000000010aea6b90 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62731   [000] d.h1. 27978.414064: xhci_handle_event: EVENT: @0x000000010fb9cba0 TRB 000000010aea6ba0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62731   [000] d.h1. 27978.414065: xhci_handle_event: EVENT: @0x000000010fb9cbb0 TRB 000000010aea6bc0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62731   [000] d.h1. 27978.414228: xhci_handle_event: EVENT: @0x000000010fb9cbc0 TRB 000000010aea6bd0 status 'Missed Service Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62731   [000] d.h1. 27978.414353: xhci_handle_event: EVENT: @0x000000010fb9cbd0 TRB 0000000000000000 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62731   [000] d.h1. 27978.414355: xhci_handle_event: EVENT: @0x000000010fb9cbe0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62730   [000] d.h1. 27978.714063: xhci_handle_event: EVENT: @0x000000010fb9c720 TRB 000000010aea6d40 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27978.714063: xhci_handle_event: EVENT: @0x000000010fb9c730 TRB 000000010aea6d50 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27978.714063: xhci_handle_event: EVENT: @0x000000010fb9c740 TRB 000000010aea6d70 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27978.714064: xhci_handle_event: EVENT: @0x000000010fb9c750 TRB 000000010aea6d80 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27978.714064: xhci_handle_event: EVENT: @0x000000010fb9c760 TRB 000000010aea6da0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27978.714227: xhci_handle_event: EVENT: @0x000000010fb9c770 TRB 000000010aea6db0 status 'Missed Service Error' len 1024 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27978.714353: xhci_handle_event: EVENT: @0x000000010fb9c780 TRB 0000000000000000 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 27978.714356: xhci_handle_event: EVENT: @0x000000010fb9c790 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
 systemd-journal-866     [000] d.h1. 27980.864481: xhci_handle_event: EVENT: @0x000000010fb9c820 TRB 000000010aea6050 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27980.864481: xhci_handle_event: EVENT: @0x000000010fb9c830 TRB 000000010aea6060 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27980.864482: xhci_handle_event: EVENT: @0x000000010fb9c840 TRB 000000010aea6080 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27980.864482: xhci_handle_event: EVENT: @0x000000010fb9c850 TRB 000000010aea6090 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27980.864482: xhci_handle_event: EVENT: @0x000000010fb9c860 TRB 000000010aea60b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27980.864482: xhci_handle_event: EVENT: @0x000000010fb9c870 TRB 000000010aea60c0 status 'Missed Service Error' len 8192 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27980.864603: xhci_handle_event: EVENT: @0x000000010fb9c880 TRB 0000000000000000 status 'Missed Service Error' len 20480 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 27980.864607: xhci_handle_event: EVENT: @0x000000010fb9c890 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
--
            tail-63116   [000] dlh1. 27980.914073: xhci_handle_event: EVENT: @0x000000010fb9c220 TRB 000000010aea65f0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
            tail-63116   [000] dlh1. 27980.914073: xhci_handle_event: EVENT: @0x000000010fb9c230 TRB 000000010aea6600 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
            tail-63116   [000] dlh1. 27980.914073: xhci_handle_event: EVENT: @0x000000010fb9c240 TRB 000000010aea6620 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 27980.914479: xhci_handle_event: EVENT: @0x000000010fb9c250 TRB 000000010aea6630 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 27980.914479: xhci_handle_event: EVENT: @0x000000010fb9c260 TRB 000000010aea6650 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 27980.914480: xhci_handle_event: EVENT: @0x000000010fb9c270 TRB 000000010aea6660 status 'Missed Service Error' len 9216 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 27980.914603: xhci_handle_event: EVENT: @0x000000010fb9c280 TRB 0000000000000000 status 'Missed Service Error' len 4096 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 27980.914606: xhci_handle_event: EVENT: @0x000000010fb9c290 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62735   [000] d.h1. 27984.031479: xhci_handle_event: EVENT: @0x000000010fb9dc80 TRB 000000010aea70c0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 27984.031480: xhci_handle_event: EVENT: @0x000000010fb9dc90 TRB 000000010aea70e0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 27984.031480: xhci_handle_event: EVENT: @0x000000010fb9dca0 TRB 000000010aea70f0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 27984.031480: xhci_handle_event: EVENT: @0x000000010fb9dcb0 TRB 000000010aea7110 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 27984.031480: xhci_handle_event: EVENT: @0x000000010fb9dcc0 TRB 000000010aea7120 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 27984.031481: xhci_handle_event: EVENT: @0x000000010fb9dcd0 TRB 0000000000000000 status 'Missed Service Error' len 10240 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 27984.031488: xhci_handle_event: EVENT: @0x000000010fb9dce0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 27984.031490: xhci_handle_event: EVENT: @0x000000010fb9dcf0 TRB 0000000000000000 status 'Missed Service Error' len 12288 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 27984.031493: xhci_handle_event: EVENT: @0x000000010fb9dd00 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62737   [000] d.h1. 27986.081608: xhci_handle_event: EVENT: @0x000000010fb9c0e0 TRB 000000010aea7890 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27986.081608: xhci_handle_event: EVENT: @0x000000010fb9c0f0 TRB 000000010aea78a0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27986.081608: xhci_handle_event: EVENT: @0x000000010fb9c100 TRB 000000010aea78c0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27986.081609: xhci_handle_event: EVENT: @0x000000010fb9c110 TRB 000000010aea78d0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27986.081609: xhci_handle_event: EVENT: @0x000000010fb9c120 TRB 000000010aea78f0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27986.081609: xhci_handle_event: EVENT: @0x000000010fb9c130 TRB 000000010aea7900 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27986.081730: xhci_handle_event: EVENT: @0x000000010fb9c140 TRB 0000000000000000 status 'Missed Service Error' len 30720 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62737   [000] d.h1. 27986.081732: xhci_handle_event: EVENT: @0x000000010fb9c150 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62733   [000] d.h1. 27989.867483: xhci_handle_event: EVENT: @0x000000010fb9ccb0 TRB 000000010aea7b10 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 27989.867484: xhci_handle_event: EVENT: @0x000000010fb9ccc0 TRB 000000010aea7b30 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 27989.867484: xhci_handle_event: EVENT: @0x000000010fb9ccd0 TRB 000000010aea7b40 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 27989.867484: xhci_handle_event: EVENT: @0x000000010fb9cce0 TRB 000000010aea7b60 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 27989.867484: xhci_handle_event: EVENT: @0x000000010fb9ccf0 TRB 000000010aea7b70 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 27989.867485: xhci_handle_event: EVENT: @0x000000010fb9cd00 TRB 000000010aea7b90 status 'Missed Service Error' len 3072 slot 7 ep 3 type 'Transfer Event' flags e:C
            grep-63117   [000] d.h1. 27989.867605: xhci_handle_event: EVENT: @0x000000010fb9cd10 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
            grep-63117   [000] d.h1. 27989.867609: xhci_handle_event: EVENT: @0x000000010fb9cd20 TRB 0000000000000000 status 'Missed Service Error' len 14336 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62737   [000] d.h1. 27990.125947: xhci_handle_event: EVENT: @0x000000010fb9d280 TRB 000000010aea7e00 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62737   [000] d.h1. 27990.125947: xhci_handle_event: EVENT: @0x000000010fb9d290 TRB 000000010aea7e10 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62737   [000] d.h1. 27990.125947: xhci_handle_event: EVENT: @0x000000010fb9d2a0 TRB 000000010aea7e30 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62737   [000] d.h1. 27990.126230: xhci_handle_event: EVENT: @0x000000010fb9d2b0 TRB 000000010aea7e40 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62737   [000] d.h1. 27990.126231: xhci_handle_event: EVENT: @0x000000010fb9d2c0 TRB 000000010aea7e50 status 'Short Packet' len 1024 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62737   [000] d.h1. 27990.126232: xhci_handle_event: EVENT: @0x000000010fb9d2d0 TRB 000000010aea7e60 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:C
            tail-63116   [000] dlh2. 27990.126357: xhci_handle_event: EVENT: @0x000000010fb9d2e0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
            tail-63116   [000] dlh2. 27990.126360: xhci_handle_event: EVENT: @0x000000010fb9d2f0 TRB 0000000000000000 status 'Missed Service Error' len 4096 slot 7 ep 3 type 'Transfer Event' flags e:C
--
 .Hyprland-wrapp-2343    [000] d.h1. 27992.649489: xhci_handle_event: EVENT: @0x000000010fb9d630 TRB 000000010aea69c0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 .Hyprland-wrapp-2343    [000] d.h1. 27992.649489: xhci_handle_event: EVENT: @0x000000010fb9d640 TRB 000000010aea69e0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 .Hyprland-wrapp-2343    [000] d.h1. 27992.649489: xhci_handle_event: EVENT: @0x000000010fb9d650 TRB 000000010aea69f0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 .Hyprland-wrapp-2343    [000] d.h1. 27992.649490: xhci_handle_event: EVENT: @0x000000010fb9d660 TRB 000000010aea6a10 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 .Hyprland-wrapp-2343    [000] d.h1. 27992.649490: xhci_handle_event: EVENT: @0x000000010fb9d670 TRB 000000010aea6a20 status 'Short Packet' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:c
 .Hyprland-wrapp-2343    [000] d.h1. 27992.649490: xhci_handle_event: EVENT: @0x000000010fb9d680 TRB 0000000000000000 status 'Missed Service Error' len 28672 slot 7 ep 3 type 'Transfer Event' flags e:c
 .Hyprland-wrapp-2343    [000] d.h1. 27992.649497: xhci_handle_event: EVENT: @0x000000010fb9d690 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
 .Hyprland-wrapp-2343    [000] d.h1. 27992.649500: xhci_handle_event: EVENT: @0x000000010fb9d6a0 TRB 0000000000000000 status 'Missed Service Error' len 30720 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62735   [000] d.h1. 27994.616483: xhci_handle_event: EVENT: @0x000000010fb9d7f0 TRB 000000010aea72d0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 27994.616483: xhci_handle_event: EVENT: @0x000000010fb9d800 TRB 000000010aea72f0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 27994.616483: xhci_handle_event: EVENT: @0x000000010fb9d810 TRB 000000010aea7300 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 27994.616484: xhci_handle_event: EVENT: @0x000000010fb9d820 TRB 000000010aea7320 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 27994.616484: xhci_handle_event: EVENT: @0x000000010fb9d830 TRB 000000010aea7330 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 27994.616484: xhci_handle_event: EVENT: @0x000000010fb9d840 TRB 0000000000000000 status 'Missed Service Error' len 20480 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 27994.616489: xhci_handle_event: EVENT: @0x000000010fb9d850 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 27994.616491: xhci_handle_event: EVENT: @0x000000010fb9d860 TRB 0000000000000000 status 'Missed Service Error' len 22528 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 27994.616493: xhci_handle_event: EVENT: @0x000000010fb9d870 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62734   [000] d.h1. 27997.234481: xhci_handle_event: EVENT: @0x000000010fb9ccc0 TRB 000000010aea6650 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27997.234481: xhci_handle_event: EVENT: @0x000000010fb9ccd0 TRB 000000010aea6660 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27997.234482: xhci_handle_event: EVENT: @0x000000010fb9cce0 TRB 000000010aea6680 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27997.234482: xhci_handle_event: EVENT: @0x000000010fb9ccf0 TRB 000000010aea6690 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27997.234482: xhci_handle_event: EVENT: @0x000000010fb9cd00 TRB 000000010aea66a0 status 'Short Packet' len 1024 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27997.234482: xhci_handle_event: EVENT: @0x000000010fb9cd10 TRB 000000010aea66b0 status 'Missed Service Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27997.234607: xhci_handle_event: EVENT: @0x000000010fb9cd20 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27997.234609: xhci_handle_event: EVENT: @0x000000010fb9cd30 TRB 0000000000000000 status 'Missed Service Error' len 8192 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62734   [000] d.h1. 27997.731486: xhci_handle_event: EVENT: @0x000000010fb9ce20 TRB 000000010aea7c60 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27997.731486: xhci_handle_event: EVENT: @0x000000010fb9ce30 TRB 000000010aea7c80 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27997.731487: xhci_handle_event: EVENT: @0x000000010fb9ce40 TRB 000000010aea7c90 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27997.731487: xhci_handle_event: EVENT: @0x000000010fb9ce50 TRB 000000010aea7cb0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27997.731487: xhci_handle_event: EVENT: @0x000000010fb9ce60 TRB 000000010aea7cc0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27997.731487: xhci_handle_event: EVENT: @0x000000010fb9ce70 TRB 000000010aea7ce0 status 'Missed Service Error' len 8192 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27997.731607: xhci_handle_event: EVENT: @0x000000010fb9ce80 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 27997.731609: xhci_handle_event: EVENT: @0x000000010fb9ce90 TRB 0000000000000000 status 'Missed Service Error' len 16384 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62734   [000] d.h1. 28000.481485: xhci_handle_event: EVENT: @0x000000010fb9dee0 TRB 000000010aea7300 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 28000.481485: xhci_handle_event: EVENT: @0x000000010fb9def0 TRB 000000010aea7320 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 28000.481485: xhci_handle_event: EVENT: @0x000000010fb9df00 TRB 000000010aea7330 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 28000.481486: xhci_handle_event: EVENT: @0x000000010fb9df10 TRB 000000010aea7350 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 28000.481486: xhci_handle_event: EVENT: @0x000000010fb9df20 TRB 000000010aea7360 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 28000.481486: xhci_handle_event: EVENT: @0x000000010fb9df30 TRB 000000010aea7380 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28000.481607: xhci_handle_event: EVENT: @0x000000010fb9df40 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28000.481611: xhci_handle_event: EVENT: @0x000000010fb9df50 TRB 0000000000000000 status 'Missed Service Error' len 32768 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62734   [000] dlh1. 28001.565695: xhci_handle_event: EVENT: @0x000000010fb9d0e0 TRB 000000010aea63b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] dlh1. 28001.565696: xhci_handle_event: EVENT: @0x000000010fb9d0f0 TRB 000000010aea63c0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] dlh1. 28001.565696: xhci_handle_event: EVENT: @0x000000010fb9d100 TRB 000000010aea63e0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 28001.566109: xhci_handle_event: EVENT: @0x000000010fb9d110 TRB 000000010aea63f0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 28001.566110: xhci_handle_event: EVENT: @0x000000010fb9d120 TRB 000000010aea6410 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 28001.566110: xhci_handle_event: EVENT: @0x000000010fb9d130 TRB 000000010aea6420 status 'Missed Service Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28001.566234: xhci_handle_event: EVENT: @0x000000010fb9d140 TRB 0000000000000000 status 'Missed Service Error' len 4096 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28001.566237: xhci_handle_event: EVENT: @0x000000010fb9d150 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62730   [000] d.h1. 28004.049862: xhci_handle_event: EVENT: @0x000000010fb9df90 TRB 000000010aea71b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 28004.049862: xhci_handle_event: EVENT: @0x000000010fb9dfa0 TRB 000000010aea71d0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 28004.049862: xhci_handle_event: EVENT: @0x000000010fb9dfb0 TRB 000000010aea71e0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 28004.049862: xhci_handle_event: EVENT: @0x000000010fb9dfc0 TRB 000000010aea7200 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 28004.049863: xhci_handle_event: EVENT: @0x000000010fb9dfd0 TRB 000000010aea7210 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 28004.049863: xhci_handle_event: EVENT: @0x000000010fb9dfe0 TRB 0000000000000000 status 'Missed Service Error' len 32768 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 28004.049868: xhci_handle_event: EVENT: @0x000000010fb9dff0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62730   [000] d.h1. 28004.049870: xhci_handle_event: EVENT: @0x000000010fb9c000 TRB 0000000000000000 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 28004.049873: xhci_handle_event: EVENT: @0x000000010fb9c010 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
 systemd-journal-866     [000] d.h1. 28011.266736: xhci_handle_event: EVENT: @0x000000010fb9d1c0 TRB 000000010aea6bc0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28011.266736: xhci_handle_event: EVENT: @0x000000010fb9d1d0 TRB 000000010aea6bd0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28011.266737: xhci_handle_event: EVENT: @0x000000010fb9d1e0 TRB 000000010aea6bf0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28011.266737: xhci_handle_event: EVENT: @0x000000010fb9d1f0 TRB 000000010aea6c00 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28011.266737: xhci_handle_event: EVENT: @0x000000010fb9d200 TRB 000000010aea6c20 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28011.266737: xhci_handle_event: EVENT: @0x000000010fb9d210 TRB 000000010aea6c30 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28011.266861: xhci_handle_event: EVENT: @0x000000010fb9d220 TRB 0000000000000000 status 'Missed Service Error' len 10240 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28011.266865: xhci_handle_event: EVENT: @0x000000010fb9d230 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
--
    .obs-wrapped-62913   [000] d.h1. 28012.198864: xhci_handle_event: EVENT: @0x000000010fb9d7a0 TRB 000000010aea6990 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
    .obs-wrapped-62913   [000] d.h1. 28012.198864: xhci_handle_event: EVENT: @0x000000010fb9d7b0 TRB 000000010aea69b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
    .obs-wrapped-62913   [000] d.h1. 28012.198865: xhci_handle_event: EVENT: @0x000000010fb9d7c0 TRB 000000010aea69c0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
    .obs-wrapped-62913   [000] d.h1. 28012.198865: xhci_handle_event: EVENT: @0x000000010fb9d7d0 TRB 000000010aea69e0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
    .obs-wrapped-62913   [000] d.h1. 28012.198865: xhci_handle_event: EVENT: @0x000000010fb9d7e0 TRB 000000010aea69f0 status 'Short Packet' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:c
    .obs-wrapped-62913   [000] d.h1. 28012.198865: xhci_handle_event: EVENT: @0x000000010fb9d7f0 TRB 0000000000000000 status 'Missed Service Error' len 10240 slot 7 ep 3 type 'Transfer Event' flags e:c
    .obs-wrapped-62913   [000] d.h1. 28012.198871: xhci_handle_event: EVENT: @0x000000010fb9d800 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
    .obs-wrapped-62913   [000] d.h1. 28012.198874: xhci_handle_event: EVENT: @0x000000010fb9d810 TRB 0000000000000000 status 'Missed Service Error' len 12288 slot 7 ep 3 type 'Transfer Event' flags e:c
--
 libobs: graphic-62940   [000] d.h2. 28013.781448: xhci_handle_event: EVENT: @0x000000010fb9cbd0 TRB 000000010aea71a0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 libobs: graphic-62940   [000] d.h2. 28013.781448: xhci_handle_event: EVENT: @0x000000010fb9cbe0 TRB 000000010aea71b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 libobs: graphic-62940   [000] d.h2. 28013.781448: xhci_handle_event: EVENT: @0x000000010fb9cbf0 TRB 000000010aea71d0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h1. 28013.781736: xhci_handle_event: EVENT: @0x000000010fb9cc00 TRB 000000010aea71e0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h1. 28013.781737: xhci_handle_event: EVENT: @0x000000010fb9cc10 TRB 000000010aea71f0 status 'Short Packet' len 5120 slot 7 ep 3 type 'Transfer Event' flags e:c
            grep-62688   [000] d.h1. 28013.781861: xhci_handle_event: EVENT: @0x000000010fb9cc20 TRB 0000000000000000 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:c
            grep-62688   [000] d.h1. 28013.781866: xhci_handle_event: EVENT: @0x000000010fb9cc30 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
            grep-62688   [000] d.h1. 28013.781869: xhci_handle_event: EVENT: @0x000000010fb9cc40 TRB 0000000000000000 status 'Missed Service Error' len 4096 slot 7 ep 3 type 'Transfer Event' flags e:c
--
 systemd-journal-866     [000] d.h1. 28014.847863: xhci_handle_event: EVENT: @0x000000010fb9d440 TRB 000000010aea7440 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28014.847863: xhci_handle_event: EVENT: @0x000000010fb9d450 TRB 000000010aea7450 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28014.847863: xhci_handle_event: EVENT: @0x000000010fb9d460 TRB 000000010aea7470 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28014.847864: xhci_handle_event: EVENT: @0x000000010fb9d470 TRB 000000010aea7480 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28014.847864: xhci_handle_event: EVENT: @0x000000010fb9d480 TRB 000000010aea74a0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28014.847864: xhci_handle_event: EVENT: @0x000000010fb9d490 TRB 000000010aea74b0 status 'Missed Service Error' len 9216 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28014.847987: xhci_handle_event: EVENT: @0x000000010fb9d4a0 TRB 0000000000000000 status 'Missed Service Error' len 20480 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28014.847990: xhci_handle_event: EVENT: @0x000000010fb9d4b0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62731   [000] d.h1. 28015.753454: xhci_handle_event: EVENT: @0x000000010fb9cc90 TRB 000000010aea7e30 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 28015.753454: xhci_handle_event: EVENT: @0x000000010fb9cca0 TRB 000000010aea7e40 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 28015.753454: xhci_handle_event: EVENT: @0x000000010fb9ccb0 TRB 000000010aea7e60 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 28015.753455: xhci_handle_event: EVENT: @0x000000010fb9ccc0 TRB 000000010aea7e70 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62731   [000] d.h1. 28015.753455: xhci_handle_event: EVENT: @0x000000010fb9ccd0 TRB 000000010aea7e90 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] d.h1. 28015.753612: xhci_handle_event: EVENT: @0x000000010fb9cce0 TRB 000000010aea7ea0 status 'Missed Service Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h21 28015.753737: xhci_handle_event: EVENT: @0x000000010fb9ccf0 TRB 0000000000000000 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h21 28015.753740: xhci_handle_event: EVENT: @0x000000010fb9cd00 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62733   [000] d.h1. 28022.929454: xhci_handle_event: EVENT: @0x000000010fb9d590 TRB 000000010aea7950 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62733   [000] d.h1. 28022.929454: xhci_handle_event: EVENT: @0x000000010fb9d5a0 TRB 000000010aea7960 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62733   [000] d.h1. 28022.929454: xhci_handle_event: EVENT: @0x000000010fb9d5b0 TRB 000000010aea7980 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62733   [000] d.h1. 28022.929455: xhci_handle_event: EVENT: @0x000000010fb9d5c0 TRB 000000010aea7990 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62733   [000] d.h1. 28022.929455: xhci_handle_event: EVENT: @0x000000010fb9d5d0 TRB 000000010aea79b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
   kworker/u33:3-62799   [000] d.h2. 28022.929617: xhci_handle_event: EVENT: @0x000000010fb9d5e0 TRB 000000010aea79c0 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62733   [000] d.h1. 28022.929738: xhci_handle_event: EVENT: @0x000000010fb9d5f0 TRB 0000000000000000 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62733   [000] d.h1. 28022.929741: xhci_handle_event: EVENT: @0x000000010fb9d600 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62733   [000] d.h1. 28023.817454: xhci_handle_event: EVENT: @0x000000010fb9c4f0 TRB 000000010aea7650 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 28023.818114: xhci_handle_event: EVENT: @0x000000010fb9c500 TRB 000000010aea7660 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 28023.818115: xhci_handle_event: EVENT: @0x000000010fb9c510 TRB 000000010aea7680 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 28023.818115: xhci_handle_event: EVENT: @0x000000010fb9c520 TRB 000000010aea7690 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 28023.818115: xhci_handle_event: EVENT: @0x000000010fb9c530 TRB 000000010aea76b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 28023.818115: xhci_handle_event: EVENT: @0x000000010fb9c540 TRB 000000010aea76c0 status 'Missed Service Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 28023.818239: xhci_handle_event: EVENT: @0x000000010fb9c550 TRB 0000000000000000 status 'Missed Service Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 28023.818241: xhci_handle_event: EVENT: @0x000000010fb9c560 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62733   [000] d.h1. 28026.431990: xhci_handle_event: EVENT: @0x000000010fb9d7a0 TRB 000000010aea6660 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 28026.431990: xhci_handle_event: EVENT: @0x000000010fb9d7b0 TRB 000000010aea6680 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 28026.431990: xhci_handle_event: EVENT: @0x000000010fb9d7c0 TRB 000000010aea6690 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 28026.431990: xhci_handle_event: EVENT: @0x000000010fb9d7d0 TRB 000000010aea66b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 28026.431991: xhci_handle_event: EVENT: @0x000000010fb9d7e0 TRB 000000010aea66c0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 28026.431991: xhci_handle_event: EVENT: @0x000000010fb9d7f0 TRB 000000010aea66e0 status 'Missed Service Error' len 5120 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 28026.432113: xhci_handle_event: EVENT: @0x000000010fb9d800 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62733   [000] d.h1. 28026.432116: xhci_handle_event: EVENT: @0x000000010fb9d810 TRB 0000000000000000 status 'Missed Service Error' len 22528 slot 7 ep 3 type 'Transfer Event' flags e:C
--
 systemd-journal-866     [000] d.h1. 28031.414118: xhci_handle_event: EVENT: @0x000000010fb9dd00 TRB 000000010aea6e30 status 'Short Packet' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h1. 28031.414865: xhci_handle_event: EVENT: @0x000000010fb9dd10 TRB 000000010aea6e40 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h1. 28031.414866: xhci_handle_event: EVENT: @0x000000010fb9dd20 TRB 000000010aea6e60 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h1. 28031.414866: xhci_handle_event: EVENT: @0x000000010fb9dd30 TRB 000000010aea6e70 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h1. 28031.414866: xhci_handle_event: EVENT: @0x000000010fb9dd40 TRB 000000010aea6e90 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h1. 28031.414866: xhci_handle_event: EVENT: @0x000000010fb9dd50 TRB 000000010aea6ea0 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h1. 28031.414991: xhci_handle_event: EVENT: @0x000000010fb9dd60 TRB 0000000000000000 status 'Missed Service Error' len 12288 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h1. 28031.414994: xhci_handle_event: EVENT: @0x000000010fb9dd70 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
 systemd-journal-866     [000] d.h1. 28037.164619: xhci_handle_event: EVENT: @0x000000010fb9d2b0 TRB 000000010aea77f0 status 'Short Packet' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:c
 systemd-journal-866     [000] d.h1. 28037.164619: xhci_handle_event: EVENT: @0x000000010fb9d2c0 TRB 000000010aea7800 status 'Short Packet' len 26624 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 28037.165242: xhci_handle_event: EVENT: @0x000000010fb9d2d0 TRB 000000010aea7810 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 28037.165243: xhci_handle_event: EVENT: @0x000000010fb9d2e0 TRB 000000010aea7830 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 28037.165243: xhci_handle_event: EVENT: @0x000000010fb9d2f0 TRB 000000010aea7840 status 'Short Packet' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 28037.165244: xhci_handle_event: EVENT: @0x000000010fb9d300 TRB 0000000000000000 status 'Missed Service Error' len 30720 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 28037.165248: xhci_handle_event: EVENT: @0x000000010fb9d310 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 28037.165251: xhci_handle_event: EVENT: @0x000000010fb9d320 TRB 0000000000000000 status 'Missed Service Error' len 32768 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62734   [000] d.h1. 28042.033119: xhci_handle_event: EVENT: @0x000000010fb9dc30 TRB 000000010aea6930 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 28042.033120: xhci_handle_event: EVENT: @0x000000010fb9dc40 TRB 000000010aea6950 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 28042.033120: xhci_handle_event: EVENT: @0x000000010fb9dc50 TRB 000000010aea6960 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 28042.033120: xhci_handle_event: EVENT: @0x000000010fb9dc60 TRB 000000010aea6980 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 28042.033120: xhci_handle_event: EVENT: @0x000000010fb9dc70 TRB 000000010aea6990 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62734   [000] d.h1. 28042.033121: xhci_handle_event: EVENT: @0x000000010fb9dc80 TRB 000000010aea69b0 status 'Missed Service Error' len 5120 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28042.033242: xhci_handle_event: EVENT: @0x000000010fb9dc90 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
 systemd-journal-866     [000] d.h1. 28042.033246: xhci_handle_event: EVENT: @0x000000010fb9dca0 TRB 0000000000000000 status 'Missed Service Error' len 32768 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62734   [000] d.h1. 28042.436499: xhci_handle_event: EVENT: @0x000000010fb9cd70 TRB 000000010aea78d0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 28042.436499: xhci_handle_event: EVENT: @0x000000010fb9cd80 TRB 000000010aea78f0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 28042.436499: xhci_handle_event: EVENT: @0x000000010fb9cd90 TRB 000000010aea7900 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 28042.436500: xhci_handle_event: EVENT: @0x000000010fb9cda0 TRB 000000010aea7920 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 28042.436500: xhci_handle_event: EVENT: @0x000000010fb9cdb0 TRB 000000010aea7930 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 28042.436500: xhci_handle_event: EVENT: @0x000000010fb9cdc0 TRB 0000000000000000 status 'Missed Service Error' len 24576 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 28042.436508: xhci_handle_event: EVENT: @0x000000010fb9cdd0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 28042.436511: xhci_handle_event: EVENT: @0x000000010fb9cde0 TRB 0000000000000000 status 'Missed Service Error' len 26624 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62734   [000] d.h1. 28042.436513: xhci_handle_event: EVENT: @0x000000010fb9cdf0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62735   [000] d.h1. 28046.749204: xhci_handle_event: EVENT: @0x000000010fb9c910 TRB 000000010aea6860 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 28046.749205: xhci_handle_event: EVENT: @0x000000010fb9c920 TRB 000000010aea6870 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 28046.749205: xhci_handle_event: EVENT: @0x000000010fb9c930 TRB 000000010aea6890 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 28046.749205: xhci_handle_event: EVENT: @0x000000010fb9c940 TRB 000000010aea68a0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 28046.749205: xhci_handle_event: EVENT: @0x000000010fb9c950 TRB 000000010aea68c0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
   kworker/u33:3-62799   [000] d.h1. 28046.749368: xhci_handle_event: EVENT: @0x000000010fb9c960 TRB 000000010aea68d0 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 28046.749494: xhci_handle_event: EVENT: @0x000000010fb9c970 TRB 0000000000000000 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 28046.749497: xhci_handle_event: EVENT: @0x000000010fb9c980 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62735   [000] d.h1. 28049.481871: xhci_handle_event: EVENT: @0x000000010fb9da00 TRB 000000010aea7250 status 'Short Packet' len 27648 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 28049.481871: xhci_handle_event: EVENT: @0x000000010fb9da10 TRB 000000010aea7260 status 'Short Packet' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 28049.482120: xhci_handle_event: EVENT: @0x000000010fb9da20 TRB 000000010aea7270 status 'Short Packet' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 28049.482121: xhci_handle_event: EVENT: @0x000000010fb9da30 TRB 000000010aea7280 status 'Short Packet' len 25600 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 28049.482121: xhci_handle_event: EVENT: @0x000000010fb9da40 TRB 000000010aea7290 status 'Short Packet' len 8192 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 28049.482369: xhci_handle_event: EVENT: @0x000000010fb9da50 TRB 000000010aea72a0 status 'Missed Service Error' len 11264 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 28049.482495: xhci_handle_event: EVENT: @0x000000010fb9da60 TRB 0000000000000000 status 'Missed Service Error' len 10240 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62735   [000] d.h1. 28049.482497: xhci_handle_event: EVENT: @0x000000010fb9da70 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62730   [000] d.h1. 28053.517209: xhci_handle_event: EVENT: @0x000000010fb9d190 TRB 000000010aea70b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] dlh1. 28053.517745: xhci_handle_event: EVENT: @0x000000010fb9d1a0 TRB 000000010aea70c0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] dlh1. 28053.517745: xhci_handle_event: EVENT: @0x000000010fb9d1b0 TRB 000000010aea70e0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] dlh1. 28053.517746: xhci_handle_event: EVENT: @0x000000010fb9d1c0 TRB 000000010aea70f0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62730   [000] dlh1. 28053.517746: xhci_handle_event: EVENT: @0x000000010fb9d1d0 TRB 000000010aea7100 status 'Short Packet' len 3072 slot 7 ep 3 type 'Transfer Event' flags e:c
      PTY reader-3507    [000] d.h1. 28053.517870: xhci_handle_event: EVENT: @0x000000010fb9d1e0 TRB 0000000000000000 status 'Missed Service Error' len 4096 slot 7 ep 3 type 'Transfer Event' flags e:c
      PTY reader-3507    [000] d.h1. 28053.517875: xhci_handle_event: EVENT: @0x000000010fb9d1f0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
      PTY reader-3507    [000] d.h1. 28053.517877: xhci_handle_event: EVENT: @0x000000010fb9d200 TRB 0000000000000000 status 'Missed Service Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:c
--
   v4l2: capture-62988   [000] dlh1. 28056.781874: xhci_handle_event: EVENT: @0x000000010fb9d770 TRB 000000010aea6ac0 status 'Short Packet' len 27648 slot 7 ep 3 type 'Transfer Event' flags e:C
   v4l2: capture-62988   [000] dlh1. 28056.781874: xhci_handle_event: EVENT: @0x000000010fb9d780 TRB 000000010aea6ad0 status 'Short Packet' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62731   [000] d.h1. 28056.782497: xhci_handle_event: EVENT: @0x000000010fb9d790 TRB 000000010aea6ae0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62731   [000] d.h1. 28056.782498: xhci_handle_event: EVENT: @0x000000010fb9d7a0 TRB 000000010aea6b00 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62731   [000] d.h1. 28056.782498: xhci_handle_event: EVENT: @0x000000010fb9d7b0 TRB 000000010aea6b10 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62731   [000] d.h1. 28056.782499: xhci_handle_event: EVENT: @0x000000010fb9d7c0 TRB 000000010aea6b30 status 'Missed Service Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62731   [000] d.h1. 28056.782621: xhci_handle_event: EVENT: @0x000000010fb9d7d0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62731   [000] d.h1. 28056.782625: xhci_handle_event: EVENT: @0x000000010fb9d7e0 TRB 0000000000000000 status 'Missed Service Error' len 12288 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62736   [000] d.h1. 28063.657214: xhci_handle_event: EVENT: @0x000000010fb9d720 TRB 000000010aea6350 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28063.657214: xhci_handle_event: EVENT: @0x000000010fb9d730 TRB 000000010aea6360 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28063.657215: xhci_handle_event: EVENT: @0x000000010fb9d740 TRB 000000010aea6380 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28063.657497: xhci_handle_event: EVENT: @0x000000010fb9d750 TRB 000000010aea6390 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28063.657498: xhci_handle_event: EVENT: @0x000000010fb9d760 TRB 000000010aea63a0 status 'Short Packet' len 4096 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28063.657622: xhci_handle_event: EVENT: @0x000000010fb9d770 TRB 0000000000000000 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28063.657629: xhci_handle_event: EVENT: @0x000000010fb9d780 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28063.657631: xhci_handle_event: EVENT: @0x000000010fb9d790 TRB 0000000000000000 status 'Missed Service Error' len 4096 slot 7 ep 3 type 'Transfer Event' flags e:C
--
          stress-62736   [000] d.h1. 28072.132751: xhci_handle_event: EVENT: @0x000000010fb9dd50 TRB 000000010aea7090 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] d.h1. 28072.132752: xhci_handle_event: EVENT: @0x000000010fb9dd60 TRB 000000010aea70b0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] d.h1. 28072.132752: xhci_handle_event: EVENT: @0x000000010fb9dd70 TRB 000000010aea70c0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] d.h1. 28072.132752: xhci_handle_event: EVENT: @0x000000010fb9dd80 TRB 000000010aea70e0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] d.h1. 28072.132752: xhci_handle_event: EVENT: @0x000000010fb9dd90 TRB 000000010aea70f0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] d.h1. 28072.132753: xhci_handle_event: EVENT: @0x000000010fb9dda0 TRB 000000010aea7110 status 'Missed Service Error' len 6144 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] d.h1. 28072.132874: xhci_handle_event: EVENT: @0x000000010fb9ddb0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:c
          stress-62736   [000] d.h1. 28072.132877: xhci_handle_event: EVENT: @0x000000010fb9ddc0 TRB 0000000000000000 status 'Missed Service Error' len 30720 slot 7 ep 3 type 'Transfer Event' flags e:c
--
          stress-62736   [000] d.h1. 28075.853500: xhci_handle_event: EVENT: @0x000000010fb9cf60 TRB 000000010aea7f90 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853501: xhci_handle_event: EVENT: @0x000000010fb9cf70 TRB 000000010aea7fb0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853501: xhci_handle_event: EVENT: @0x000000010fb9cf80 TRB 000000010aea7fc0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853501: xhci_handle_event: EVENT: @0x000000010fb9cf90 TRB 000000010aea7fe0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853502: xhci_handle_event: EVENT: @0x000000010fb9cfa0 TRB 000000010aea6000 status 'USB Transaction Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853626: xhci_handle_event: EVENT: @0x000000010fb9cfb0 TRB 0000000000000000 status 'Missed Service Error' len 8192 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853629: xhci_handle_event: EVENT: @0x000000010fb9cfc0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853632: xhci_handle_event: EVENT: @0x000000010fb9cfd0 TRB 0000000000000000 status 'Missed Service Error' len 10240 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853634: xhci_handle_event: EVENT: @0x000000010fb9cfe0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853636: xhci_handle_event: EVENT: @0x000000010fb9cff0 TRB 0000000000000000 status 'Missed Service Error' len 12288 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853638: xhci_handle_event: EVENT: @0x000000010fb9d000 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853640: xhci_handle_event: EVENT: @0x000000010fb9d010 TRB 0000000000000000 status 'Missed Service Error' len 14336 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853642: xhci_handle_event: EVENT: @0x000000010fb9d020 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853644: xhci_handle_event: EVENT: @0x000000010fb9d030 TRB 0000000000000000 status 'Missed Service Error' len 16384 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853646: xhci_handle_event: EVENT: @0x000000010fb9d040 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853647: xhci_handle_event: EVENT: @0x000000010fb9d050 TRB 0000000000000000 status 'Missed Service Error' len 18432 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853649: xhci_handle_event: EVENT: @0x000000010fb9d060 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853651: xhci_handle_event: EVENT: @0x000000010fb9d070 TRB 0000000000000000 status 'Missed Service Error' len 20480 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853653: xhci_handle_event: EVENT: @0x000000010fb9d080 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853655: xhci_handle_event: EVENT: @0x000000010fb9d090 TRB 0000000000000000 status 'Missed Service Error' len 22528 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853657: xhci_handle_event: EVENT: @0x000000010fb9d0a0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853659: xhci_handle_event: EVENT: @0x000000010fb9d0b0 TRB 0000000000000000 status 'Missed Service Error' len 24576 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853661: xhci_handle_event: EVENT: @0x000000010fb9d0c0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853662: xhci_handle_event: EVENT: @0x000000010fb9d0d0 TRB 0000000000000000 status 'Missed Service Error' len 26624 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853664: xhci_handle_event: EVENT: @0x000000010fb9d0e0 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853666: xhci_handle_event: EVENT: @0x000000010fb9d0f0 TRB 0000000000000000 status 'Missed Service Error' len 28672 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853668: xhci_handle_event: EVENT: @0x000000010fb9d100 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853670: xhci_handle_event: EVENT: @0x000000010fb9d110 TRB 0000000000000000 status 'Missed Service Error' len 30720 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853672: xhci_handle_event: EVENT: @0x000000010fb9d120 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853674: xhci_handle_event: EVENT: @0x000000010fb9d130 TRB 0000000000000000 status 'Missed Service Error' len 32768 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853675: xhci_handle_event: EVENT: @0x000000010fb9d140 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853677: xhci_handle_event: EVENT: @0x000000010fb9d150 TRB 0000000000000000 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853679: xhci_handle_event: EVENT: @0x000000010fb9d160 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C
          stress-62736   [000] d.h1. 28075.853681: xhci_handle_event: EVENT: @0x000000010fb9d170 TRB 0000000000000000 status 'Missed Service Error' len 4096 slot 7 ep 3 type 'Transfer Event' flags e:C
--

--dwudcwu6yddtx5vr--
