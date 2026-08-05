Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AFA3D7D6A
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 20:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785962173; cv=none; b=bnmJsJTvL2N+U7jI2RPkPnBxz/wDp1PN7TxYEz4YWMUb38wDy6BN8R5bzTtmGrvhYruOBxY2P4VadTS9XVkPHutA+rSQUI2C/Xlkrrcgn8jdfo3V9bwOK0Tt9wBBGICkI+haR+8LT30YiA41SiPVMPJtOrftStgwSNGfmuS9yjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785962173; c=relaxed/simple;
	bh=BALHKmTQywEqbYJoE5ZXmLIVP2E7V5o4sK+NVOH0VOE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oXWWwpWBbQaZvNmWejEKWjsEiAY/LkVHzh+bhyTFp0sS++2Q+1RUqTclqiw0xGWJs2FFmCXq5HAGm4e1h0oSixqvYmzxSauVE/7QCvKoqXpmDYp8mrTC5VU2roWp3HjEywXGCZQbao921ROPMvAhbfadfjqF1rdpXi7ZaZX1Oww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FS/urOM+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FS/urOM+"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so15285995e9.2
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 13:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785962170; x=1786566970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RR3B3W9tkzZof39RGVl4Y7VIfWiOzO+xJeFKw7Cspgc=;
        b=FS/urOM+zzGuzP91la1Pm7ci0lyhGS/0H6B3Px5+tA5zNEhGiHwh76T5frfRPxqbYl
         I/hbuNSoNy3l57AbSHd+z6obiaeul0hOT6O9nBPe39XUq4tHdaxq3QHU7V/6ssMCuNj7
         e68557PsyE0areFFrJyWexvKIp2eaNNtPpsL9N1CLzcZQar8m2Mm4qn+8C1pCPLUhkjs
         iPl8Op3TxcuE5UZyNDLQnbxKVMrLMCqZ8Mqj9lK5doOHO43gW5cc8WbiFEbWMo3EEgcP
         +ImTiGS2WmcDAF/xNlQS0veQzfPP5PmgZHVdz86sNAztR0qg1Evei3aQkMygQFl1rnz5
         0gwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785962170; x=1786566970;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RR3B3W9tkzZof39RGVl4Y7VIfWiOzO+xJeFKw7Cspgc=;
        b=YJhfreBO2IhqUCdu47BY6JUsWI7aUXTNYi99bjutg45FcnO3w+CaELNnDOpfgrbir1
         hqoltNiQFcUE87d8zgl4Fw9SoCHKbEM9W6aFbA65oECMSN7KeMW8yZcQhMBY4XcOlQE4
         kfD1564RIiM1BNC797D5mz7cwTahv3pi2q9Pfvwrxyzdy2DdxVqDLjzePHqdd/wNeIZI
         S8h0natMEbnUa3khNLpqBVmaEOjKuFWoMV7/nDnxXa2ea6sNLzzPqG5G46XXrj8lnE1r
         Bj4d4pDPl+T4sU7uqoLaiV3emyJENzm4kRPed9Cq9NhKLoYecksisAGMW8FTGHo6kNTl
         RouQ==
X-Gm-Message-State: AOJu0YxXS9Xj8rETsSqKSTNo/NoUcdw7iJIQbkAJYeLRQT7mNeDQdSMt
	5aBJ6m0diO+Ut6xYiPhgCpxnylO0N0tpFdYTq+OqkdUPaUDzaI2F/O2+
X-Gm-Gg: AR+sD110e2CTTN16xKbLQiawfXnfsDiFIqO0D7GbvNxNKPErct5r0wWcHtkj5s582rp
	VFiAwBAkSQLDY5E1ZP3z02oViKnOIPkal7HqrfrKs3jPFDPfr1BDOr/q2opYzXRckwZOFUvK/aO
	+onR03szPUmtguaSlYbbghSwlj1P8ZiWl9HQJggp8vt7XbreZ9Xi9Hm32duaAACW90AWs3EmpCN
	5OaMlvAnAsc2HM7+zZuYt8zwrVK7jwcbu6uFKVeFFcx4+cOp2SQ5KSP/ziX22RWP1jFPBQ3pYiS
	jVXDH+nKn5fyQ8byLxrwHrT+uUhnhjGib1OtntJJOoV3JA/UOo9nxaoKE4RIGaAp4dxXNu87pHc
	nW12OuGu+7bmpw2GmZHldRqYngVSOycINnJ4ADipcEi6fhoF6nMum+rZwCuR7lgkTcSFOtsASId
	n0GX5mLEd8KabvAEGpAjTeg9N4FxweiK8a/agDle10OBFzI9LTncS4ZqzOF/ivmm83iDLlkAAgl
	pIELpPtq7A=
X-Received: by 2002:a7b:c7d7:0:b0:495:4811:d71c with SMTP id 5b1f17b1804b1-4994e7c55bcmr105179835e9.13.1785962170580;
        Wed, 05 Aug 2026 13:36:10 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e4bf820sm62897645e9.0.2026.08.05.13.36.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 05 Aug 2026 13:36:10 -0700 (PDT)
Date: Wed, 5 Aug 2026 22:36:04 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Bart Nagel <bart@tremby.net>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <20260805223604.21acaf9b.michal.pecio@gmail.com>
In-Reply-To: <anOHQ4yEdhYvrXOo@spiral>
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
	<anOHQ4yEdhYvrXOo@spiral>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 5 Aug 2026 12:01:47 -0700, Bart Nagel wrote:
> At 2026-07-30 23:59:53 +0200, Michal Pecio wrote:
> > On Thu, 30 Jul 2026 11:13:59 -0700, Bart Nagel wrote:  
> > > At 2026-07-30 13:08:14 +0200, Michal Pecio wrote:  
> > > > I'm slightly curious what exactly happens there (probably MSE after
> > > > Short Packet on a single-TRB TD), and whether Missed Service Error
> > > > may point at a Link TRB, because the current fix wouldn't handle
> > > > that and the stream could still hang. So your failure rate may
> > > > actually be reduced to 1/255 of what it was, but still not zero.
> > > > 
> > > > If possible, please boot the patched kernel again and run it for
> > > > a little longer. If it fails, post dmesg starting from the "Miss
> > > > service interval error" line which is followed by "All TDs skipped".
> > > > 
> > > > And while that is running, also collect another log:
> > > > 
> > > > cd /sys/kernel/tracing/
> > > > echo 1 > events/xhci-hcd/xhci_handle_event/enable
> > > > echo 1 > tracing_on
> > > > grep -B5 Missed trace_pipe | tee /tmp/trace
> > > > 
> > > > This is supposed to log 6 lines for every Missed Service Error, so
> > > > it will grow, but not terribly fast.    
> > > 
> > > Before I make a bad assumption and collect a useless log, please
> > > confirm for me exactly which debugging I should enable. Just the two
> > > you gave above, or also one or both of the ones I was using before:
> > > 
> > >     echo "func handle_tx_event +p" >/proc/dynamic_debug/control
> > >     echo 0xff >/sys/module/uvcvideo/parameters/trace  
> > 
> > Yes, please keep handle_tx_event, otherwise xhci_hcd debug messages
> > won't show up. UVC trace is not that important.  
> 
> OK. I ran it with your temporary patch for around 24 hours with heavy
> system load and didn't get any freezes. The logs are large; please let
> me know if there's anything I can grep for which might tell us that
> the potential 1/255 chance of a freeze still being possible is ruled
> out.

Maybe stat with a sample of 100 events (thats 700 lines including ---
separators added by grep) from "grep -B5 Missed trace_pipe".

I mainly wanted to see if it's a reliable pattern that the suspicious
pointers are always 0x10 past the previous event's pointer.

And what happens when the previous event is at the end of a segment
(TRB pointer ends with 0xfe0), can we get Missed Service ending with
0xff0? The old patch wouldn't handle it, though the new one will.
