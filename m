Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C51D1632E7
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 06:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785910496; cv=none; b=P5CqjxQSQA6hzo4GDaIbC6rpO6kfKnIxSLNZaIwDPVhx8XLd8cQkJG6a7naX6yUsqGyOQzMCziByIH8wlnrzZjhMd5pILfU6R3IOvi625Dojy4WerfZDBPKVY0VGrGWi5r3CCI94heQFwFGGoiC3WrHuJNYow/gMr6RQSfgJ4Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785910496; c=relaxed/simple;
	bh=vJ5MxHYi3r5+ShST2+5AL6VgT6RsJZyduj1Vc94PXwg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oFZuKjcmVNikMs5yPMD2vNiKWiira8tWKMMv6CM0p0uMyOub9OvLyNPNrIEULMbXuzmzrHi926tXsUtYiTR/gix9DxAMfI3B8PCz1skvpek/u9qyY0dVRyWMGp72Y7Kg08cKyE3sBqI1sSW7WRbSlaRo7O5kE33ebSYEavVcqMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHAfo8sm; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHAfo8sm"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f7872abb6so261498f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 23:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785910493; x=1786515293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pWtI7Eo8kslq6oPjBinD1vpUNGlOV9tEDrUNukpkSaY=;
        b=VHAfo8smDmsnCypNB90l1dBpFQqdRwINpo81yZtSSfxvSnORyD2PfG5Y7zs1nstZCE
         WGUp2qU5vS8dkKlIyg4lvqIu0vVg3DpD8xeC0y75LIZbQgeNxePMbac6lvRryr+ZbLn+
         hIRDRO1GnuMSY4vtv57fcZx9pl2w9PIy4dq6avVX4BVQ9f4cNHZ0AUIcnKtf53yXth2j
         R70ICLt7N1S9zYqOPuDYfo54L2NMRpywa6TrBd30a5LsA7GmdXSCYz/0wA9fTLtzU0of
         5VQOHM7M/CABnYTs6du5XSqZd9i3hvohJ0CtV8tti1ob3hYHfxXY3wFWkTXdWFGGbKY7
         pRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785910493; x=1786515293;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWtI7Eo8kslq6oPjBinD1vpUNGlOV9tEDrUNukpkSaY=;
        b=OOpMLJ5l6aQcpc9w7t/EC0OtbagHwCxdQnuKy7dQmHKuXGSViFE0VhgjkZfW0iU3yQ
         RCrxVKQ39bBIR4CA0cFOBq74ZAhKkCboYgcRgpkDBQHG7gGhaXSxn1jQoh8i9AnfqqQY
         zrjaSucHlcVd6xoTiC3Gfy7x70izZXb+pFH5qXC+0hPL/r4/r8NOk5YoV7Kn73sJjDn4
         X1qzfGBYJmA/d/9VueZZH6TE2WP99FFfszrPmHgYTGGa2IgLFqyQtzq5zuNB+L51k2xS
         OfwAChk089TVZvMGGTdDLiK/FPhHD/CBxQRHlkY7UmE6cxysrUt3iZHH6TsN7JyM8Gsk
         z4QA==
X-Forwarded-Encrypted: i=1; AHgh+RpdIvWP4RKnk9puj2VD+iPUAFIklQCPiqTANNwpciF6l9hpqGAhUaMUpLbArtKW6LsHGGe5as9sII4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTqnA2kbzkRh0LZcP6h9LRNpGk1gOn5+x6QJ1SmYM4sTiziFCr
	LWthdgqmuZBVRZeklvSoA/1XH9i44/er7E8GTkFHy466U5ieUeph0QWk
X-Gm-Gg: AR+sD11oaWph7mtaeTL7Xf1Oaoe62vBVpdD5XwsG/QE+51ZU9rqP541mslSmoF4kDNs
	SQxrV6L9+0dViuQSsl98U7NU6Et7S6IUdRVbqDpJy6yvezcX2EC5/AkcaIGpG2F5Rls7PHjAcYk
	8G186em4nckZ1NfotINDiI0bTKueVNPIto7CvrBwl7IPSDYNMNe3Gb1/VfsRsw4pwJm8URvLlJt
	c3XEzE9D4fC42KCqI73A7a1BlY55YI8Sf6BYwLYSuGADY25HqWiTs0rgTpVBIych/dkJn5gkMOD
	jFcLLBt2DsaT7cao4eoSJ+8ab/ed2vgNMoK/U8ukNmHcqPFfUE4nDnG5QvbJo2rbNzcNmJ20Ohk
	4NtaT3nPFHwlo5EjMED7GumSdy1Bm9F79LJBa12HI59WEIJ2O9k4YW9ElBDMSl+/t+AGNKZVgUg
	bytMBdpDDf4ou0IiPAjqE0TTFDwA2ckfvCoQ2nJkSDA7A5Ivm8srdUiaKvfcCuKT4gaoXqIG3A
X-Received: by 2002:a05:6000:41dd:b0:47f:8183:e9b8 with SMTP id ffacd0b85a97d-47fec53093cmr6285176f8f.22.1785910493066;
        Tue, 04 Aug 2026 23:14:53 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec24a23asm6235292f8f.37.2026.08.04.23.14.52
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 04 Aug 2026 23:14:52 -0700 (PDT)
Date: Wed, 5 Aug 2026 08:14:49 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Anon <myaltforstuff1234@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [BUG] usbcore: EPROTO on first-stage Config Descriptor read
 (ShanWan clone, 2563:028e)
Message-ID: <20260805081449.7199fe16.michal.pecio@gmail.com>
In-Reply-To: <34fd1f17-6e84-4d5c-bbc0-e1cb990d2017@rowland.harvard.edu>
References: <CAJ5U=Uw2R7xVEY3ugZ_gRsi+yC9WviMbFEO9RbR6A3ue-G=adg@mail.gmail.com>
	<34fd1f17-6e84-4d5c-bbc0-e1cb990d2017@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Jul 2026 09:46:57 -0400, Alan Stern wrote:
> On Mon, Jul 20, 2026 at 08:50:49AM +0300, Anon wrote:
> > Rapoo V600SE / ShanWan-family chipset -- X-input persona (2563:028E)
> > fails USB enumeration one stage earlier than the known Switch Pro
> > fallback bug
> > 
> > Hardware
> > --------
> > Product: Rapoo V600SE Dual-Mode Vibration Gamepad (marketed with
> > Hall-effect sticks/triggers, X/D/A mode switching)
> > Underlying chipset family: ShenZhen ShanWan Technology Co., Ltd.
> > (confirmed via multiple vendor IDs observed from the same physical
> > unit: 0x2563, 0x20BC)
> > System: CachyOS (Arch-based), systemd-boot bootloader, kernel 7.1.3-2-cachyos
> > USB controller: xHCI (xhci_hcd)
> > 
> > Summary
> > -------
> > This controller presents at least four distinct USB identities from
> > the same physical hardware, depending on mode-button state and
> > connection type. Three of these are already individually documented in
> > various places (ArchWiki, xpad issue tracker, hid-shanwan project) as
> > instances of a known ShanWan firmware bug: a malformed response to the
> > two-stage USB Configuration Descriptor read causing -71 EPROTO
> > (sometimes -32 EPIPE), leading to enumeration failure and a silent
> > firmware-side fallback to a lower-capability "Android" persona.  
> 
> > Root cause (confirmed at byte level via raw usbmon)
> > -----------------------------------------------------
> > This matches the general failure mode already described on the
> > ArchWiki Gamepad page (https://wiki.archlinux.org/title/Gamepad) for
> > ShanWan-family devices: during enumeration, the host requests the
> > Configuration Descriptor in two stages -- a 9-byte header first (to
> > learn wTotalLength), then the full descriptor. Some ShanWan firmware
> > responds to the first request by sending the full descriptor anyway,
> > which is a USB spec violation, and strict host controllers reject it
> > with EPROTO/EPIPE. Windows tolerates this; Linux (by default) does
> > not, and the device firmware silently re-enumerates into a
> > lower-capability fallback persona after the failure.

That's speculation by somebody on Arch Linux wiki, we were under
impression that the mechanism (at least in other similar case) is
different. Also, device sending more than requested is expected to
yield -EOVERFLOW, not -EPROTO.

Curiously, wiki claims that some existing quirks solve this issue.
Did you try them?

> 
> > What I'm hoping for
> > --------------------
> > - Has anyone seen this specific earlier-stage (first 9-byte header)
> > EPROTO failure on a ShanWan-family device, as opposed to the more
> > commonly documented second-stage failure? Is there a known fix?
> > - Would a patch that increases retry attempts specifically around
> > EPROTO on the Configuration Descriptor's first stage (perhaps gated to
> > known-bad VID:PID ranges, similar to how hid-shanwan and hid-sony's
> > existing ShanWan quirks are scoped) be a reasonable ask, or is this
> > considered out of scope for mainline given it's cloned/unofficial
> > hardware?
> > - I'm not a kernel developer, but I'm willing to test patches, provide
> > more capture data, or run a device on a spare machine if that's useful
> > to anyone actively working on hid-shanwan or xpad.  
> 
> This message might be relevant:
> 
> https://lore.kernel.org/linux-usb/20260717195336.98500-2-nikhilsolanke5@gmail.com/
> 
> You would have to add a quirk entry for your particular device, for 
> example (added to the boot command line):
> 
> 	usbcore.quirks=2563:028e:r

This new quirk is now on the way to mainline:
https://patch.msgid.link/20260728195158.65162-2-nikhilsolanke5@gmail.com

As is the first patch to enable it on some device ID:
https://patch.msgid.link/20260802120128.38302-1-ishaan.dandekar@gmail.com

You could send a similar patch if the quirk works for you.

Regards,
Michal
