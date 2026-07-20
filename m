Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D923B993A
	for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 13:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555224; cv=none; b=Qyugp1uPBUdEFVOPWy+K3dYAEon2Zz3lmbrFzSxz4lm6rb+AMYYMsLHGcP4AkwH+o+2VoxxGCXx7QUyW/kwi9Pk4DBhtPUEPmQlRj1Y12ACyOFoZf5zTdeF4V5/C1/SaCoN3Y8p7d4D4dxThtkHTdxbA4JleJbK4FpnNC5Mb8Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555224; c=relaxed/simple;
	bh=rYGxhjl3tU7Baxu64EfNXZ1IdXU2+FBVxxwAOM4T7SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYZL3QnGLFRyn3lSdJWungthAsT0dUCxjTDKorXebn0h5Sf2RGiTCar5EIex8Q+HpLh5cyzRllbP2pOu7/zxjxSydATJQ7LKSNYkskFXyFdMYax4lAD7yZt23+j+Tyh25/VwFuGZ8oQdhTdr1OHDohKF4TVQ/tcURvrV6MxBR8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=GPTAfhWa; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="GPTAfhWa"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c16ac21acso43410371cf.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 06:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784555221; x=1785160021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MEmSdk8FUYtyT1biqtII5IZPHYk7SB6YtNrsAF1CFWE=;
        b=GPTAfhWapEXu1xoIpx6a4VW5d/wudE7KYGZtIOoyr00REyI3jaHUwRkJ3W0N1+oHCf
         NT97tTWCO4maxHwEdwvdt33eX0m9h59W+ZP2+k1nzGu9dZtLIync5oCkBtfuIjFnbnT5
         N9B58Mq87oqsbAydtQ3QRDSKs4S6/Hg5mKN8ALyUChwUvbl5LDZJRgFdWbRn6zElcPYF
         4fOr6MEeE4JRyvH/ezoMporJiEgYBIquCV9coGqSTH0XOIW49+hx5yYCjhS/eyxWFM3U
         +cyVNLsgUPy7sjkLGcDFbTFAQeMnCly88PItAj+wZVCGOE3JmRKqxw+dbbYQxbipVf7b
         OfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784555221; x=1785160021;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MEmSdk8FUYtyT1biqtII5IZPHYk7SB6YtNrsAF1CFWE=;
        b=jX3RpVb/ReWstNi4FsY2xFlvJV5IHtt0Xs3FQ5Dv8PwXUZSzlP1f6JJukqiXHk4Ypx
         uiGLVXIzF73UT4mzb0Qw6vBnOdYX7yHPM+6UFdUWn7TW94huR18mDH8oy+4t3RuXSYDY
         J+9T/0c8tz7PiK8RcBQ+B3evNq96vECwkRA+/patynDsgROG4VVPxFD3UyHFbaW2a7pi
         nvLhbIdqdOoO0vCC/jKv4hm+2ko61BTk/IT3rjuRLlNcwHVBkQcZ6HMb01/6bi6iGjVU
         Aoyb826j8q+wRKXSHWdUVUN2EzugSca1uYA5p2seW19lKFYVLSZEgum3TeXGwv/orBYU
         KFQg==
X-Gm-Message-State: AOJu0Ywu7SnIH08BB3r1D1mLKgd/X+MZpszfI1hWnwP0AowLlVqq87+1
	EVokQ/Le/EeSUGCztnDVUwTotfeB2mr413lM1qAgKDTemzqi/dXHlYbAxreX7F2PQQ==
X-Gm-Gg: AfdE7ckNEjqwEe0DGK9+TzAFP7+UmsmSsRZQWYQqyEZ/jnI7V5pyTPAcaXqO2nMk8Cg
	IJDp9LXeJuqTaYGBJjR9iGznWOM9CxvtJx7mBIulAZNX+gm7VQjcdX5jbP6Xmnv0Yysj33iKiKN
	N8z/wZrlxZLYyiSehBpwAdK9UxmhOkv64+4OUpi00uuzVwZ+0T8/z54vE5tzXFWx3wpFm0rfUst
	IzHilAn/k5Y8+vgi5dZ/WRtRgaCxkC7UCd0RR36gGk9/tsZwIKZnovfXKqi0h2XUTCv0eDKedn3
	0xnTAaY1iiPV/LBDR55DpbVzp3/6vzMjEi+kDrsDqhJ/Vd23tgjonVTmHQOGXr7n9JLWlKk8fMc
	I/Kh57MDCp5iXEQ5bj8Gm/67OOUWNiDr1RS0rg8Z5XVSM+H6Vpb6bxhmDPC/x0Ef5929IeYDtPR
	7v1ijpL8cyAZN3cVocNFvF
X-Received: by 2002:ac8:59cb:0:b0:51c:12bf:d4a6 with SMTP id d75a77b69052e-5213e48ba27mr130129031cf.48.1784555220893;
        Mon, 20 Jul 2026 06:47:00 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778543d7asm92941416d6.1.2026.07.20.06.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:46:59 -0700 (PDT)
Date: Mon, 20 Jul 2026 09:46:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Anon <myaltforstuff1234@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [BUG] usbcore: EPROTO on first-stage Config Descriptor read
 (ShanWan clone, 2563:028e)
Message-ID: <34fd1f17-6e84-4d5c-bbc0-e1cb990d2017@rowland.harvard.edu>
References: <CAJ5U=Uw2R7xVEY3ugZ_gRsi+yC9WviMbFEO9RbR6A3ue-G=adg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ5U=Uw2R7xVEY3ugZ_gRsi+yC9WviMbFEO9RbR6A3ue-G=adg@mail.gmail.com>

On Mon, Jul 20, 2026 at 08:50:49AM +0300, Anon wrote:
> Rapoo V600SE / ShanWan-family chipset -- X-input persona (2563:028E)
> fails USB enumeration one stage earlier than the known Switch Pro
> fallback bug
> 
> Hardware
> --------
> Product: Rapoo V600SE Dual-Mode Vibration Gamepad (marketed with
> Hall-effect sticks/triggers, X/D/A mode switching)
> Underlying chipset family: ShenZhen ShanWan Technology Co., Ltd.
> (confirmed via multiple vendor IDs observed from the same physical
> unit: 0x2563, 0x20BC)
> System: CachyOS (Arch-based), systemd-boot bootloader, kernel 7.1.3-2-cachyos
> USB controller: xHCI (xhci_hcd)
> 
> Summary
> -------
> This controller presents at least four distinct USB identities from
> the same physical hardware, depending on mode-button state and
> connection type. Three of these are already individually documented in
> various places (ArchWiki, xpad issue tracker, hid-shanwan project) as
> instances of a known ShanWan firmware bug: a malformed response to the
> two-stage USB Configuration Descriptor read causing -71 EPROTO
> (sometimes -32 EPIPE), leading to enumeration failure and a silent
> firmware-side fallback to a lower-capability "Android" persona.

> Root cause (confirmed at byte level via raw usbmon)
> -----------------------------------------------------
> This matches the general failure mode already described on the
> ArchWiki Gamepad page (https://wiki.archlinux.org/title/Gamepad) for
> ShanWan-family devices: during enumeration, the host requests the
> Configuration Descriptor in two stages -- a 9-byte header first (to
> learn wTotalLength), then the full descriptor. Some ShanWan firmware
> responds to the first request by sending the full descriptor anyway,
> which is a USB spec violation, and strict host controllers reject it
> with EPROTO/EPIPE. Windows tolerates this; Linux (by default) does
> not, and the device firmware silently re-enumerates into a
> lower-capability fallback persona after the failure.

> What I'm hoping for
> --------------------
> - Has anyone seen this specific earlier-stage (first 9-byte header)
> EPROTO failure on a ShanWan-family device, as opposed to the more
> commonly documented second-stage failure? Is there a known fix?
> - Would a patch that increases retry attempts specifically around
> EPROTO on the Configuration Descriptor's first stage (perhaps gated to
> known-bad VID:PID ranges, similar to how hid-shanwan and hid-sony's
> existing ShanWan quirks are scoped) be a reasonable ask, or is this
> considered out of scope for mainline given it's cloned/unofficial
> hardware?
> - I'm not a kernel developer, but I'm willing to test patches, provide
> more capture data, or run a device on a spare machine if that's useful
> to anyone actively working on hid-shanwan or xpad.

This message might be relevant:

https://lore.kernel.org/linux-usb/20260717195336.98500-2-nikhilsolanke5@gmail.com/

You would have to add a quirk entry for your particular device, for 
example (added to the boot command line):

	usbcore.quirks=2563:028e:r

Alan Stern
