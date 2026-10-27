Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080993;
	b=4+ap9mduKIwF4+woe8871wSZX8g2cD5WqdOyqkskRSguLHkai4GJkt6a8qHTvVIFempp
	 TIU+a/zAHeD5mQg8ocxQhCshzgKk49Ldxf3HSpUVe7cp7K6Yb3auWLfrPNOPJN4Zual3n
	 43bOKeFmtgsZjQ4Cy0I0/3e/p3Uva9DuhFfTKy2UrF1POV26Pp4J5Mp8xPld3pPtsWYFd
	 UVlveloMU3mBJwRIraZkJ04bQnBwHkhQ4/vrZZFFKr23fMUhdm7Ja8JKO2GGTBZBpN15M
	 b2Tt/VraGYuIZ5V9XZsklDo1Xhktgwc6YnaoOiEcu7LoyagrsSFL2uVckfDZFy+QDGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KtHkcu0sQsAK751caVzJBQDY0o4i7F/zlOnjMPPeE5I=;
	b=mSbsvs2VJr1TnBWiM/nMg6PLsnr5EVS8W5l5Q/w5QcsDZntqGpWAoxqpHHuv6WUmQP1M
	 ZxYVtsyxISXmLoe/afSWj2szkjFBNWhGmKzUodZQMLfef3smKRWLYKehxvAva60u6zkPF
	 t9YW0xy9PhEHHmU3f36M+8qsf9bnMu9c6Jdy09IYDF7VZMPT/YW1QeOgKwryI7+hgushq
	 KqXLdP8NWg3PMgj/Ys2YZWCZ2BBAL7GKJV/u0a1diviacQBBCkbFz/VCHSHR2mQBsuwlx
	 /TbwXDaqjSq/cZmnXnHVmR5AiotWWOck4NWMVm+Ser1TZPiPPW3lB8lCvNSaclgcZ1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fd+rVQCT;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFC3606A31F
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 06:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BFC3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fd+rVQCT
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so19859285e9.3
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 23:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080991; x=1793685791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KtHkcu0sQsAK751caVzJBQDY0o4i7F/zlOnjMPPeE5I=;
        b=Fd+rVQCT6h6iWDR02V4pfE6w4B9VB1S0lffsv2IDdIHHIRdyK3jUEt2FmHBfZxMBXo
         /6CAn9UDjbhCtzDFEAD5X9jRnzYGPQcAkOmikfnG13ul8dm2gAbZsM9KyfdVDLAcz/Ay
         UiOYwyOaUeF+/xVxB9iMXFcDyDlueTVmMgBFt8QsaC3JgphcNjaakCDKqO2hcesvrHWK
         9oqTpTZC6ExZY6JzDB3EJe6w45YuoOXY55hHfzjgqADewKP+nXACtXCBTHV/WG0pE4Ke
         YqA7i+Nq+iwiszDPQZGl2GpPWw21M4pwSa8W/8EODi1AZRQE76335KaE1hQ2D2r+gA/7
         74bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080991; x=1793685791;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KtHkcu0sQsAK751caVzJBQDY0o4i7F/zlOnjMPPeE5I=;
        b=kyIwrCk1Xd5t64GhlafX0EMuwyGMvEZ6g2zf66q4omJFUq3lWHmV4/aJTbbnxZ0SpH
         RNnav95cZ2CajzJu8ukAzYM9PR8uSrM70g8+i7G4E/pLunTlpSTPI1UTBzF2uyiHYzOS
         GRlf6EgzBioWaQt7uXF9h16m+0lvVPOyq3Z45YLdgmmVVBLpEfrHrDJd8diOe9e8n18f
         5CM9Mz/MxOSWNmBHtvpf9L9p/FmPfU6yHEbltRl2fZLCLxat5YBZo2XYNb7otrtpso1D
         hqJHNlHUb4/+IkjWFI7gNWJV8IRDV0H/E7iUAaIpySEnlZugXZkMdaq6IXGqXd5lzZG4
         OEYg==
X-Forwarded-Encrypted: i=1; AKwUvBxsysgIf3w50kwClch787bpK8uEWWxfvI2aFBwiU/+DSz8M2jB1URmHzfTqfXW9gLVvTmZ54SXzZRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLT9R3YIx5upUbvigj0QZymNANy47Z6yMXe1at1/h9MTnuIoS7a
	/cLiaeJS+RMBmNTzA/HAOT18ugVo/pdlvsPdkebcF8LLBuZVTlcZGXCS
X-Gm-Gg: AYBFou3Q8T9Bx9wgllThfq+SVNJpHE6d21SbajfoamitpvwEp3OXNAmSEcjv07+jrMk
	V3ane6Cmifsn2bI+Vgt2Ekk0ryeeepm+aAYVgm1/s3DXWWzxe/d3GMHNJugMFCLhs/sydBVE/ot
	rIGhHaA/stjP2/3iNvBT2SH9ie7toubGOeQ1KjWtD3EA/rI8VT1LB+CZ/uGI5iFYJ1wJoCmOFko
	cfQTUfuhgQNrnK4lvP7eragmjBdSWhW8jT7x13EwaJC7dUde81c3dsSDiq63K8rieHwWBF4X/wL
	grOWGsSIl9Fm7H+LdZ3VLhhPe3Y0W8l5Oo2kdfG+fjaKeHRA4WCowbqyPG4+Bqcq21PPj5nb6P9
	VCiMQKTkTpvKmiYLjKvLhL3fLFsOWLxZ2iuNRPP4u6+MF2ABuzjzxWxrzfeLWt0RvjJCztLIdqr
	fEs7Hj6sXlN59TABr1ZrjvnkSlrUs+QfykZqBGJcICxU24cm8dNKrgdhJduzQf6ChdjdcsyHe7C
	7d/ivEn8/TTWCN8vHysh5eD5k3wxOXQq/e77Po24kG/uMdZE2kSxj+LyaWkK4Zo
X-Received: by 2002:a05:600c:3acb:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a35aca4fe1mr159192175e9.16.1793080991458;
        Mon, 26 Oct 2026 23:03:11 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm240600745e9.8.2026.10.26.23.03.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 26 Oct 2026 23:03:11 -0700 (PDT)
Date: Tue, 27 Oct 2026 07:03:00 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alex Williamson <alex@shazbot.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>, Armin Wolf <W_Armin@gmx.de>, David Lechner
 <dlechner@baylibre.com>, Danilo Krummrich <dakr@kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Daniel
 Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Aaron
 Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Bradley Morgan <brads@mainlining.org>,
 Aleksandr Nogikh <nogikh@google.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Richard Weinberger <richard@nod.at>, Thierry Reding
 <thierry.reding@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20261027070300.4c45616a.michal.pecio@gmail.com>
In-Reply-To: <2026102637-buggy-mothball-2a08@gregkh>
References: <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org>
	<arIvG0nx4LXG9nlW@monoceros>
	<defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
	<9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
	<2026092321-province-yearly-44aa@gregkh>
	<arOfHEsGGglNse7T@monoceros>
	<2026092348-victory-erased-0e5a@gregkh>
	<20261023181326.0dc2f7ed@shazbot.org>
	<2026102437-vista-unsoiled-b089@gregkh>
	<20261024103512.4601ee4f@shazbot.org>
	<2026102637-buggy-mothball-2a08@gregkh>
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

On Mon, 26 Oct 2026 21:34:57 +0100, Greg Kroah-Hartman wrote:
> > Even if we could come up with a set of device IDs, it's a policy
> > decision whether a given device is intended by the admin to be used
> > by the default in-kernel driver or a userspace driver.  
> 
> Great, then have the admin never allow the in-kernel driver to be on
> the system, or be loaded (modprobe has deny lists) and all is fine.

As some maintainers like to say, it's not the '90s anymore :)

Users don't reboot systems to kick a kernel driver off a PCI device to
try something in a disposable VM on a whim.

Even if they did, it's completely normal for desktop users to have two
GPUs from the same vendor or two xHCI controllers and pass only one of
them to Windows/macOS while using the other on the host.

bind/unbind feature prominently on every distribution wiki and forum,
this cat is absolutely out of the bag at this point.

> > That means that at one point we want the default driver bound and at
> > another we want a vfio driver bound.  Coordinating this is exactly
> > why we have driver_override and, building on that, match IDs that
> > require driver_override.  This allows drivers to describe
> > themselves as vfio-pci compatible drivers via modules.alias while
> > requiring userspace to enable the match via driver_override.  
> 
> And as said before, that's a horrid hack and one that is breaking
> things today in all sorts of ways, which is why the taint was added.

Are you aware of bind/unbind breaking things for PCI specifically?

Without also involving 'driver_override' or 'new_id'? Everyone agrees
that these APIs used for anything other than pci-stub or vfio are foot
guns. But your patch targets something different.

We can even bind PCI drivers to wrong devices *without* using bind and
hence, I presume but don't care to test, without tripping this taint.

> If you wish to override the kernel, then great, a taint flag is added
> and all is fine.  All this means is that now developers know what you
> did and can decide to ignore your bug report or not.  No functionality
> changed at all.

I believe people pointed out that it's a functional change for users of
panic_on_taint who also use bind without being idiots.

Does this taint even solve a "real" problem? Those bug reports weren't
coming from users, they were coming from "abusers" like syzbot looking
for trouble. They were quite obvious even without a taint message.

And at least on linux-usb, they seem to have stopped after Google and
one other copycat were told to stop sending them, and before this taint
reaches released kernels.

I even told them to block not only bind but also new_id, so there will
be no second wave of reports caused by syzbot discovering that it can
bypass the taint by using new_id intsead of driver_override.

> Why are you worried about a taint flag?  So many servers run with
> taint flags enabled due to out-of-tree or questionable licenses with
> no problems, what's one more informational bit here?

And what's the point of a flag which is always set on countless normal
systems in the wild? If this feature survives to April 1st, I will send
a patch to rename it to "VM passthrough taint" because everybody (or at
least those dealing with desktop users) knows what it *really* means.

Regards,
Michal
