Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793317583;
	b=gayCp5iwwOl9wOFHehxrCknLbly641XgT9SztnDEgOEjkpHzBEzEjcBQQf4UjegDUW64
	 RlvInEvdO/zvTIe4jibSBZ8nJf+Ch1pQVCCb741EUxbq+rXXr9pPfsee9Ncu60Q//zi3h
	 nUD4vSucnbjPx5GSBZLDNo8utdb1R5xeW+4vx032/qAPu2j7hNSZ0Ffuptnag6AQKNePd
	 iGMOueo7MuPIj1XsTq+bkxnG7poWMbshh5YmAaWlCafKn74ALTXRLrXsC6LH5lj224qG8
	 rLcYWe+gIobsLXTGqFf/HxUJCPyKFep9Q5WJ19mhQw7ySDY/tdR+cgMDjCWp4v58RTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793317583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=PllxAaGrXJhLNtXCiCWXAHfgTtYT2V3WrE82HbznE6c=;
	b=OLVkKVqN5nhqVS4ksyBdn1cDopEkhoDqKhW4Nv6wtEcB77LkvvKEO4CQhhl1Dht2QeNl
	 2HdzFPgOsm2VoADnmRk5pC4fM/grBD3Yje1EpErzUMwbgG6lE5jJMXcu2Kk3/EJwT/2G4
	 OGjr5fyR/yy8gdoS7ojLX4yL20jzFkzvo+xhP/uQ3+RobXoIuP2GMSe5A7j9di2I38SGe
	 X/sQdLlNnqtJTKVGjRUH7pQpxWeATZhGjwp4SOfMjIBJ+8xbBn4XVLkXs6IcYW+IifSsc
	 G5Zh0xosb5+kvEjovSvb6eihvGoBGeM8SUJFh3lJneCe6ykL8UhQjIIX995oDg9Iz+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hesling.com;
	spf=pass smtp.mailfrom=hesling.com;
	dkim=pass header.d=hesling.com header.i=@hesling.com header.a=rsa-sha256 header.s=google header.b=C74lyjM0;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F67606A31C
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 23:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F67606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hesling.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hesling.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hesling.com header.i=@hesling.com header.a=rsa-sha256 header.s=google header.b=C74lyjM0
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so321347eec.1
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 16:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hesling.com; s=google; t=1793317582; x=1793922382; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PllxAaGrXJhLNtXCiCWXAHfgTtYT2V3WrE82HbznE6c=;
        b=C74lyjM0lbcQc5NBWL2BfcIgE2mAqwsSxl+vCe1ghq5A6GeKC9qyLQiZjTfcdk+LAf
         HBDO3m6aZ3O/MI4zvT54fAfxef9IjgOVXr13NfqTY0hVrxu4emX8cMnZoiQfxUOYEfHS
         1jXSabhsc7G6Sah7KKwZGjToEI6VXpJWUVisuRlLSw0K2JEl7qdzYo7hycQYsLog+m/B
         oORU9bhL5sF+6FtQ5zcbuBhY1c62aqryhm3yZgPO2C15UVkU58B1R8LkcXQdgkd9M5JF
         lSWwXESDMU6Fij6KHm32K1EiquCRetGyJjy1mlmELgJ0yRvDkNk/EftLgte/Sdy0fWEu
         4l1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793317582; x=1793922382;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PllxAaGrXJhLNtXCiCWXAHfgTtYT2V3WrE82HbznE6c=;
        b=FyUa4o71Y8VGy7G1Kkq93AnAnbvwJlkGYsc+BR0adbRSmh1mJul6L9NbUKC3JuZ1is
         nJrJEAHxEwhb6QD0zzj6GIxfPEBFaZ60R/GzpXRUIV2MVqrl5gcRPjTfbHRLqMZVoDqI
         ez+5ythIXEuIqPWR9EjIlD/QthpeGqEd6ZYAdYAaCzJKRyS+sb4o792D8Yw81ZLXSPiC
         glORQpxY9VTWfTJHxwaMNQyULwkVpveQOcbLwtY3qW17EKRZnsZFn1dRQqVcELgjv/+V
         BQ0rSQP8ZiV0l93SNAvgtToO7IETFGexaCJrHxMzod9oacR9GRRB13xaiHVu1Lr/8we1
         2QwA==
X-Forwarded-Encrypted: i=1; AKwUvBwmXK/9s8CMXI1acTNMfAoPKcq+d8KbFgyhaptLIGW2Kpi85e3X2SYrnRFrGFJUKjqdW0umb4dM6Ss=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNW58eMTOr2VnJC2L6KMGPTr1emCD0vPVn6rV6/n9+Y7amLJOp
	Xg2fZxsEl2HyOxR+M1QhgKGzLglJZqGN9BgiSD6+gr+3zmrUNQrmmXiLF0aIDtfQUEt5Pv0XuZU
	TU3V2cJo=
X-Gm-Gg: AYBFou0/YlVXIY6hiSFsQOsl4hkj7o3JHIvJxuccZpwogRy5tj+/2wOKQSY/m7wjvET
	Vd/bSR2xA+04y69tsDc2Rvzn62mSRTBSxFyvakF2fEmrMcLqNjPb3YSApiY5e2+quSCr2uHVp8q
	RgpFtQmu5SjyXe1X/wFoVFtAOhIrkZEg1XKHoHxePMfTFZumqkkCtujSDoGCSACGN6oKUgMVhok
	XRLa6C9HFJK9UnHPgPe6fnIOTtLGrgV/Yu3fja70/U103ytvsR543tCasxGJzUWGfCnzcC7MARD
	5aQSpNIAdimUZK/KkflMLgQLQXbF6HGvd+LmLyRW9DV9qTRrXooYreTDpDjLqt1IqR1UioD2TdV
	fX6TnwJlAL2pBSl9jQMNRh8ly88KFe9SDZbX/mMcUaVez8fAoYOHpIpTBOpI4xjQvtAThLJlBr+
	tvGSPYYVCfmvfvUH621Ug15EK0n8NuAouzFTCEUby9eNb7P14bdUanK5S9egwcCSAGnfffMJUaQ
	w2edJ+N1baxxswZMhCAULZ3NsIn1Amor5w60a7yTgObEQ1sSBNBnJWJiSSacMCV66/WuaAZZWY6
	eWGLXak6+873aC1kcM9a0TeWOUWd3F2RKIvEAp/SpHdI0FRm
X-Received: by 2002:a05:7301:4e47:b0:36a:1add:64aa with SMTP id 5a478bee46e88-36a42340ab7mr1090651eec.9.1793317581338;
        Thu, 29 Oct 2026 16:46:21 -0700 (PDT)
Received: from [10.20.0.147] ([12.244.13.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm1676444eec.12.2026.10.29.16.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:46:20 -0700 (PDT)
Message-ID: <fa1ec0429fe8c1287c126b50989f1cffe2567a86.camel@hesling.com>
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid
 breaking VDS1022
From: "craig@hesling.com" <craig@hesling.com>
To: Huang Wei <huangwei@kylinos.cn>, leStoppe <lestoppe@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 29 Oct 2026 16:46:19 -0700
In-Reply-To: <20261015025431.3927020-1-huangwei@kylinos.cn>
References: <20260810091322.2201740-1-huangwei@kylinos.cn>
		 <20261014031228.1fadf3d2@delby>
		 <20261015025431.3927020-1-huangwei@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi all,

I apologize for the delay. I am sad to see that this change is causing
such a headache. Thank you all for handling this.

On Mon, 2026-08-17 at 17:35 +0800, Huang Wei wrote:
> Craig, was the intent of 4cc01410e1c1 to cover only the HDS200
> series,
> or the whole range of OWON scopes sharing this VID:PID?

The main intent was to cover the HDS200 series, however other OWON
devices seemed perfectly safe to cover, given most of them use this
same simple serial style IO. This assessment was just from analyzing
documentation, source, and bins.

This simple serial driver enumeration seemed like the right
convenience/abstraction, for most people, who don't want to learn how
USB endpoints, libusb, and explicit permission granting udev rules
work. Most distros already associate a convenient limited user group
dialout or uucp to the serial device for easy access and also easy
unbinding for libusb usage.

On Thu, 2026-10-15 at 10:54 +0800, Huang Wei wrote:
> And the point that the VDS1022 is a headless scope where
> the PC tool is the primary interface makes it clear it should stay
> unclaimed.

I think I am missing something, but why does being headless mean that a
serial interface shouldn't be bound? Or, is the primary issue just
breaking necessary user application? Again, my apologies in advance if
I am missing something.

To be completely fair, I didn't know the VDS1022 used a pure binary
over USB interface. However, I'm not sure that would have changed the
calculus, given it still LOOKS to be a simple two endpoint TX/RX serial
[raw] data interface. I hate that this change broken this application,
but wouldn't it reduce the complexity a bit for the Linux use case, by
removing the necessary udev rule, removing the runtime dep on
libusb.so, and simplifying libusb control code?

https://github.com/florentbr/OWON-VDS1022/blob/1.1.5-cf19/install-linux.sh#=
L337

From a maintainability perspective, it would be unfortunate to have one
arbitrary subset of devices use serial and another use libusb.

On Thu, 2026-10-15 at 10:54 +0800, Huang Wei wrote:
> Craig - if you happen to know whether subclass 0 / protocol 0 holds
> across the HDS200 series and firmware versions, that would be a
> useful confirmation; the dump in your commit message is the only
> HDS200 data point I have.

Unfortunately, I do not know if other devices in the family maintain
this device 0 subclass and protocol, but I will try an older firmware
on the HDS272S and double check.

All the best,

Craig
