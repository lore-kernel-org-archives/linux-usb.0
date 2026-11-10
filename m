Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.210.214.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317941;
	b=enYBBbNeJ9FhmSjEbnONMBUtvIwtfSOwdT970oy8MJOnl6aPeTrHRq71/ca0Ya1YBCnG
	 3aaKqji3dCC8Qe3WIS+Y1mPqHxPK3RhVr3it939I37JRUT196fuKWQ+7M+sHvpfhMMINV
	 bDBzufAxLrS9ykIs6ipE+Jh1u4cTTpBB5nD1N8uDSmFFyU8tb6V89HMJVHQcK0BxG2CG0
	 9vJ4t09HQhbYwxoLogQCeoOvCLMVopK1ts25KEauqTNqe/SEaXMbLPL9N9MYlEZ/xsaeJ
	 aBsGAMf2aUiZVLi8e0wQZx8zjvCZ7cPQG1pqDanfNl4o2N58r3et7Hptr84k1HeJnQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317941;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=uJAyGgp0q306lE3dBNgeZglrmKITpnYBT4hRyV1iCu8=;
	b=XDYBKaE2LhFzdX1MyCT1D1X9ROAb9Uz/iJYtn0CZEQkCswLBj89WXSV114J0F25aV55r
	 +OBZQjPkPOAw7IFa2me7VHSF2Bh1vBwM2YRLSsp19drMHj+TnS+4DcVs5yMVAywELJ2r8
	 yuqxH9Mtwe7sIzBSJjH2+ohm2/KmHK+5X6Wg766VjamAqJaKiTX2ScblXb8uNwG9pAo2f
	 NKb4MvPdOCnNHEUxBbbKJKyCgfxKuVLmGI4jroiZ51NLyd8oocv2QRnLEZEuWR0oxmWhR
	 MQusEva0OiNVXlGG9hqEmtBOdUzJN4nPcTuorWNBsjqLy8XITgWpEn6MSstjCydAMMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codewreck.org;
	spf=pass smtp.mailfrom=codewreck.org;
	dkim=pass header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b="g8q/bMdw";
	arc=none smtp.remote-ip=62.210.214.84
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F7C606A334;
	Tue, 10 Nov 2026 13:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01F7C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=g8q/bMdw
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id 46BD814C2D6;
	Tue, 10 Nov 2026 14:38:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1794317929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uJAyGgp0q306lE3dBNgeZglrmKITpnYBT4hRyV1iCu8=;
	b=g8q/bMdw5r1gr7kWrexHMdvv1TeWb2K1Sk4CfjgtzUiIKlgy94Kkk8GF5vojcn9AYbEWyx
	95aZbLEkawG/3MejkHpHugF4dCxEOLne0EbAt1HdSoHRukleBg4rwahmfSv0gupFXPFRay
	MjPGDDvqodOOdbHvKYzlhluLNPF7uYY76grbZuK8bDhcxjKBVa6pXEVFn0ltZX43VnO2jy
	wU+xx27gBo+J8f2LsPWE1RcZGHPPTlYwlnYBiW4PhFjvdx5ajNloQMa8gm3C4qf7cHAatv
	9Oh6n+gcuruaYCnCazma9ZNCQgqCTF2N4l6QnwZlI37aDyX+tRJMMBlOy8t8vA==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id c25126cb;
	Tue, 10 Nov 2026 13:38:44 +0000 (UTC)
Date: Tue, 10 Nov 2026 22:38:29 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	ericvh@kernel.org, lucho@ionkov.net, andreas.noever@gmail.com,
	YehezkelShB@gmail.com, corbet@lwn.net, linux-usb@vger.kernel.org,
	v9fs@lists.linux.dev, linux-doc@vger.kernel.org,
	linux_oss@crudebyte.com
Subject: Re: [PATCH 0/3] net/9p: Add 9P transport over USB4STREAM
Message-ID: <avMeVSDYT9p9PHz4@codewreck.org>
References: <20260924162333.147033-1-alan.borzeszkowski@linux.intel.com>
 <auKzZIyFW2CTci1b@codewreck.org>
 <bc1ec916278d94116bd9b60e40b549612e3ff3a4.camel@linux.intel.com>
 <20261109165236.GW176724@black.igk.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261109165236.GW176724@black.igk.intel.com>

Mika Westerberg wrote on Mon, Nov 09, 2026 at 05:52:36PM +0100:
> > In case of one-shot backup, I think my drag&drop scenario from cover-
> > letter fits it well. Assuming single thread copy, both transports
> > achieve similar results, but with busy-poll enabled, trans=thunderbolt
> > cuts about 1/3rd of copy time:
> > Copy from 9P client to a server, using trans=fd, takes 22m29s while
> > trans=thunderbolt + busy-poll takes 14m50s (~1.5x faster).
> > Reverse direction, same improvement: reducing copy time from 41m07s to
> > 26m56s. All done on default msize.
> 
> That sounds like a good reason to include it IMHO. Also I like the
> simplicity - no need to run a separate descriptor feeding process :)

I'm sorry but I'm just not convinced it's useful enough to warrant the
effort to review this from my point of view given my lack of time for
linux work:
- most of the speed benefit comes from busy-poll, can't this be made to
work for all fd consumers somehow? (it could be an ioctl before passing
the fd to the mount call, or it could reuse e.g. the existing NAPI
config with network over usb4stream if that's more practical; in
particular I recall some drivers supporting a hybrid mode that'd
busy-poll for x ns/ms then fall back to waiting for the irq, that'd get
you the best of both worlds as a sane default)
- for simplicity it looks like mounting from boot without initrd isn't a
goal, so this can all be hidden in a userspace wrapper. 9p has
historically always been pretty bare, we're not even doing dns
resolution that has been a basic feature available for nfs since
forever.
You can look at this mount.9P helper for inspiration:
https://github.com/nfs-ganesha/nfs-ganesha/blob/V15.2/src/tools/mount.9P

> > I would be happy to maintain Thunderbolt transport.
> 
> If Dominique is okay with this, I suggest to send v2 with a MAINTAINERS
> update as well.

OTOH if you're going to maintain this I have no reason to block, I can
just say I'm not reviewing in depth and pass the ball to Linus or
someone else higher up the stack to decide...

-- 
Dominique Martinet | Asmadeus
