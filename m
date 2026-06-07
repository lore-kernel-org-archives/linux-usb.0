Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC021333440
	for <linux-usb@vger.kernel.org>; Sun,  7 Jun 2026 21:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780867546; cv=none; b=phsOHWgL3ZnEL/iO0iBYQS/GBnUTUKYQhK0LEcBzO7KjfbNNZtHpaQF9wyMMDjX9NaAe/0gxjW2UYvzF24XUDwHtAYgwDppnlzVmmTSajDjQIG6GRu9XrIfGI3HhjGddkiimyDdVgKc2cpKmeb+sg1A5c46AjLiFZHtFuRCToAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780867546; c=relaxed/simple;
	bh=lchto+4gqBceJNY8FM/WtVWfY3bYn8ZG/XdG2pcmn40=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CeNo5q7+z+ekqNCg8/eZAEwUh9dXIcEXE0kLEMgvSlqDvll0pondwMkNCmdos2SUVQ6oi+gAqEDmXZpjxlq5asfTKhCStM6rmDMRvvVZLqdDeZu1aio/9oRvxPE7oD1ZAf84inLx+Cb/Q42Wo/QqJRNHke8p33PNxaUerMSsolw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBmOqvCs; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBmOqvCs"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa68cfc182so3033780e87.0
        for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 14:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780867542; x=1781472342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLechR6MtiLxhXvRA3P5DCIDwtUpI6yw8jTZaq+/SsQ=;
        b=WBmOqvCsWOTjjXoxhdoMVUBdSQhPRdJA3GzIfSHU867+N4o/Vu0dzUMW+eFv3rO5kM
         FtyaddSMM4N4DBm9wDkduwsgdct7fZDu9i2ICklwdc72zqInbR5yKPYgJnlgi9WsRrKJ
         AC/ayLJrApAi9vNv/HF50MgqQOUWKKC5+/2IXxJVF0bnBuKKh9fz2H53tR0jZBdCHDjr
         mSB+2LUR73BaNjX1rx+5l2/7VxuVljguRp107uI8iFt+SKXzbqloAsnkbCnd3VBU9ylc
         SCdtENc/V3HJ1JJ0HbdhwGwiYJXP3L1Kqp/Jx85nfO213eR3MNw4SN/dUYyLjdTSuISK
         iWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780867542; x=1781472342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kLechR6MtiLxhXvRA3P5DCIDwtUpI6yw8jTZaq+/SsQ=;
        b=Uaeee7ioFSP+XWuNIdQAukK6JcDpIY+Bp2GxfGVYENQGFbyhXwqnbYMvpwIIAvVXw+
         3t/NWD3J52GNrR4FEJGuMgJZWhKF4DtzA6z+X7bjs5tpkGMXtT/YPAOFI2PsmISEixNg
         EBGXBosv64jDTlijNEnXlO+6eWpJq0KrZKFk6NoSC1VaitqoGzcOUHCjd8Iu9FoVSYB4
         YAfSzcE/q6eLv3HuA+8x1mduz0b7+/tBh5STsLgjiBSQ16CsEwtFPLO6d2RiyjSTBXTt
         M76+HaM8RxyqnMy3c5S+09n9QagLzpnD/5ISL4ODpJCJFqT2RMpmE/UXanZTn2bgWfiH
         kC2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8fZqB6zWsoiYjqd6QHEk5PfRvIfHQxvvqMBj0Y0+GGcTQc0v9I3J8Z3JDiZw+7jdgPPrNklakf9b0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlw6Z71uEeDqGLpienJZtbn5JDYsqDXXJRCSG7CabNmqTn5uBe
	7vNJFBsDDObPcesNuA4SkrN+X5M3gLIeMGYtcpwRRjD11f4Ckb/0wHO1
X-Gm-Gg: Acq92OH3JWJEO+o/OooEyFkyHLm9KhiTqcNTBzAzdegI/7jvCuZ5Ivv0DacRQfcWsFv
	qa5+Ot1rcQa+fXKS2p25XoLaaNJvUhHHuCyHX7FYpJ/XO54NCCYj0e5wXPtGl8UoXhFqrFJS1Ax
	XWgrzJnYZ+01PPypCJXD6uY4MCma8orUawr/ZtV8CVAyPQPz+Vso7D+V16XdL1sfjRZ1FnbLF4j
	WGvWK2cfHlNofrLttBLW383V72oTp52znRlzCQUdNwLzfRgo2gIARxY3/vl3nLUYNYT2A462AKD
	KGlBRcloTrDDCTSWUXuzNJTP28nNB7mds6K1dzRjRWyI6JZxEJV/KX1HV28SDag3NRCijlOnWAU
	+K1BGr60DBZTrCBRTX6kRQe3+PqZjqovIPBlEHdTy0of17NImB2DLePlLByEiYjlTzPW/iOJwma
	6TEfsPDm5W8iQzx6hQ4irGjelg09gQoM+zeEiIYoW4Z3o=
X-Received: by 2002:a05:6512:318e:b0:5aa:6a8b:43af with SMTP id 2adb3069b0e04-5aa87b404efmr4147010e87.1.1780867541681;
        Sun, 07 Jun 2026 14:25:41 -0700 (PDT)
Received: from foxbook (bgt94.neoplus.adsl.tpnet.pl. [83.28.83.94])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf66d87sm40582121fa.1.2026.06.07.14.25.39
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 07 Jun 2026 14:25:41 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:25:35 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Nikhil Solanke <nikhilsolanke5@gmail.com>, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
 sakari.ailus@linux.intel.com, katieeliu@tencent.com,
 johannes.bruederl@gmail.com, kees@kernel.org, dengjie03@kylinos.cn,
 limiao@kylinos.cn, wse@tuxedocomputers.com, dev@a1rm4x.com,
 vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn, oneukum@suse.com,
 bence98@sch.bme.hu, eeodqql09@gmail.com
Subject: Re: USB: Request for guidance investigating configuration
 descriptor enumeration failure
Message-ID: <20260607232535.74b935a2.michal.pecio@gmail.com>
In-Reply-To: <1996a7ac-2670-4124-b855-6fdf0c9999ad@rowland.harvard.edu>
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
	<20260531101612.332151d8.michal.pecio@gmail.com>
	<CAFgddhLGHvTmRxWtguXTpgZV_Mq5ZW=CVK_ZkqbOgUF9Y5bCsA@mail.gmail.com>
	<20260531123843.736bd69a.michal.pecio@gmail.com>
	<3b79ba92-1c51-420b-a5d2-8a358cafdbf6@rowland.harvard.edu>
	<20260601084846.433bfc51.michal.pecio@gmail.com>
	<CAFgddh+dLnR=AuAU65sxqsxAgqLYX9i0OiX3Ys_sPH+YeZuHVw@mail.gmail.com>
	<20260602193047.5fe03b8d.michal.pecio@gmail.com>
	<49acc9dd-9d2e-4a37-9b41-de5e16445461@rowland.harvard.edu>
	<20260604125323.1bcb40d7.michal.pecio@gmail.com>
	<1996a7ac-2670-4124-b855-6fdf0c9999ad@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 6 Jun 2026 22:17:20 -0400, Alan Stern wrote:
> On Thu, Jun 04, 2026 at 12:53:23PM +0200, Michal Pecio wrote:
> > On Wed, 3 Jun 2026 22:02:44 -0400, Alan Stern wrote:  
> > > I used a bus analyzer to capture what happens when Windows 11 
> > > initializes and enumerates a USB-2 flash drive.  The short answer
> > > is that yes, the initial Get-Configuration-Descriptor request is
> > > for 255 bytes.  
> > 
> > Could you also try a few BIOSes, UEFIs and such?
> > Or anything from Apple?  
> 
> Here's the information.  It may not clear things up as much as you
> would like.
> 
> Samsung UEFI BIOS:
> 	Get Device Desc		8
> 	Set Address
> 	Get Device Desc		18
> 	Get Config Desc		255
> 	Set Config
> 
> Lenovo UEFI BIOS:
> 	Set Address
> 	Get Device Desc		8
> 	Get Device Desc		8
> 	Get Device Desc		18
> 	Get Config Desc		8
> 	Get Config Desc		32
> 	Get String Desc 0	2
> 	Get String Desc 0	4
> 	Set Config
> 
> IpadOS 26.5:
> 	Set Address
> 	Get Device Desc		18
> 	Get String Desc 2	2
> 	Get String Desc 2	34
> 	Get String Desc 1	2
> 	Get String Desc 1	18
> 	Get String Desc 3	2
> 	Get String Desc 3	50
> 	Get Config Desc		9
> 	Get Config Desc		32
> 	Set Config
> 
> OSX 10.5:
> 	Get Device Desc		18
> 	Set Address
> 	Get Device Desc		18
> 	Get String Desc 2	2
> 	Get String Desc 2	34
> 	Get String Desc 1	2
> 	Get String Desc 1	18
> 	Get String Desc 3	2
> 	Get String Desc 3	50
> 	Get Config Desc		8
> 	Get Config Desc		32
> 	Set Config

Quite a variation.

Ipad is interesting because the single Device request must be a
high-speed optimization, or they hacked their xHC to ignore short
packets and keep reissuing IN tokens until the URB is filled.

Linux has been doing the initial 8 or 64 byte read at LS and HS since
forever and I found no explanation besides nobody daring to touch it.

Though I wonder if it wouldn't make sense to skip this at SS, because
Windows does (in my QEMU tests) and very likely Apple too.

> I suspect that non-storage devices (such as an Xbox clone) might have 
> more stringent requirements, because they don't need to be visible to
> a BIOS.  In general, imitating Windows is almost certainly the best 
> approach -- except perhaps for a few devices which are meant to be
> used exclusively with Macs.

Are you suggesting to make the 255 byte configuration the new default,
or are we still talking about a quirk exclusive to one device so far?

Regards,
Michal
