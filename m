Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9253F3D8132
	for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2026 08:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782982319; cv=none; b=arFPTbj8D46h77+nEq9pWJN3ucANuBDGVZKffsUr17ULb/hnc7tpO31onJnhyok8B2lXzCIvNfX2vU7KKnV8OHJ4oAsnHnUZhlG9qzyCj5ZJKSfi8j9mFT5QI6FQIP83CEQFC4rNVqvdfKFtvCPc/hwbFibNueZFH30nZZ7DJLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782982319; c=relaxed/simple;
	bh=R4kGJIghn1KWvkJmBEGSJwAxWo95gPNTyxhWsiXBHsg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g5o6y76FYRcF5gSpnUhfvW1kjIkgsmTb0gOqh0X5ElW3+gU9G0CojLHCX06hioYdPYwuu/pwxcZIejzbG524iglLWVam0h9Yk2O6ScFkFj62ap8Z0qRxWgsspFJ8RK9RU3VDZ3YpgJSnz/wFDD8klSLV0HJokGFODxTJU2ZBL9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2/mLyG8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2/mLyG8"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b966dd74so6473135e9.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2026 01:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782982317; x=1783587117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjJhAXUCodBRIete3KMDiKKIuJuHCvq4k2HNT0bmD+4=;
        b=I2/mLyG8CzpUKz7ZX1R8W9OBxbJ5KwMFak4jEK416+fra5+Tv01ppCcgIiV3MkSspy
         U/q8MuFFQjD93MElwYML89pqqWGzjL4wix+nZobq3vJ/jmxJnRoMZvhMTJ/og8MtiWxc
         4ITSP/3lV2BS1WVIldFAbS1jFXgCH+qhSMz5PXMWKBk5fqWEC36JtMBJlHcJ/4zmNWy2
         WJaMWbGzIACKVp9UMfASsN2olhqhVJCpMOIBeVIVI0apSEF0Qywhx3DERze5ljuRaFPR
         scU11Y3Gayb5wy42ZCfxgCgJOTG+OQyWrvrj/t5YeyPHkJUg71dS6ZUSARHmjrQTvpzx
         i8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782982317; x=1783587117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UjJhAXUCodBRIete3KMDiKKIuJuHCvq4k2HNT0bmD+4=;
        b=IPDAGmfJNc92atzSchZ9NL7ci8oSYH/DsWXd18wV8YN9RLASDxMao2rvJJ/DFKYEKp
         lhbVb1Y0yJsOv3s8BAUx3e2Ne/xDmMBncAUU0ZcyuzFEO1xs2iSLC5xAggF1MXYwMxyT
         LkwNTs3UvoqG6qOALVl40bTQHenYyLR0aX2f6x7gpTMYPIo1wUUWi0kzMg538edTmJWi
         +3LPfWIkcCVF6hEAo7YVz8JkOZFFtKm8SpTvg9jaDr3qQ+yAqVihZlvM1HhZFB+i234h
         Ye8RPK+pIL5Fgmd2pXOxMiK7s/ygqfZF1qcP4rY6rKqY2S8mWBGT/tM7J5VudGLnTRSN
         0BYA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZC1Zr5HkHOQqeKTex4daKU8p/uT+Ubb01JPeRyOuESpuQm9SoGI8wiyrniU3RmoOJ+oblT8G8jOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvdgeKwDRyEjjrJPf0ucImJIqlfgahB+NIkc/D4rNJUR+viztj
	+1H4npJaSHcKllKLSJAGU/EHTaB/4UN3nf6RyJ7I7lUQJtnuu2AfsOOo
X-Gm-Gg: AfdE7cmhh4M6cUN+mdUCbFjqhqAyHl+0JUyPBGQDAAJOo5g+rmEs6Yg0SFER27LNyJ6
	hiQ1m6ZqlJNaYuV3xkm/XH0D5xLzw64rYuWOH8xLTHs205zEU19tmSUv38lK7fG42js/pKNCWNZ
	VHMwv+SETsTwKc4DCEITDeg2Ok5QKzqZdVjsRrRJ644jiQA3ItRLrMxTeV6q2+E9Fi/JnskDAMs
	kmtVjEZ8OsH/LrAUADS+p4wE47YseIPthxLykxix57pEZa7Mefgo6sQGrhyNumS7/RRZvv3BiKU
	JiURKyywTV/18A8SL8QIepKiDS0uQ3nIgRplZmAq9GmZOW7Vkr6byjgFK4rIezWb1JJXb+lYzbv
	bUAY5Q9QLeT8LnR6FVz2yLvCZyR7HQSsAI8oM0bYtwx2LMW1yOIBgMWBIYwrRQykf+49DUJjWjI
	ZDzqZBkvffWEQOg/JKDgHrCbYh
X-Received: by 2002:a05:600c:5782:b0:493:b03c:5650 with SMTP id 5b1f17b1804b1-493c2b7f3c6mr54522455e9.19.1782982316763;
        Thu, 02 Jul 2026 01:51:56 -0700 (PDT)
Received: from foxbook (bgu190.neoplus.adsl.tpnet.pl. [83.28.84.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c635c41dsm58798305e9.5.2026.07.02.01.51.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jul 2026 01:51:56 -0700 (PDT)
Date: Thu, 2 Jul 2026 10:51:52 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: 7.1 regression bisected to "usb: core: Fix SuperSpeed root hub
 wMaxPacketSize"
Message-ID: <20260702105152.415afeaa.michal.pecio@gmail.com>
In-Reply-To: <577c7ba6-c638-4e73-acac-fbf6c4fb4ccc@linux.intel.com>
References: <cb287e3d-3066-4820-b464-6208b947974b@mailbox.org>
	<577c7ba6-c638-4e73-acac-fbf6c4fb4ccc@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2 Jul 2026 00:09:42 +0300, Mathias Nyman wrote:
> On 7/1/26 19:02, Michel D=C3=A4nzer wrote:
> >=20
> > The ethernet port of a Lenovo ThinkPad USB-C Dock Gen2 connected to
> > a ThinkPad P14s Gen 5 AMD stopped working in 7.1.
> >=20
> >   ip addr show enx482ae347e7c3
> >=20
> > says the interface doesn't exist. The only thing about it in dmesg
> > is:
> >=20
> >   r8152 8-1.1:1.0 enx482ae347e7c3: renamed from eth0
> >=20
> > In previous kernels, dmesg had more lines about it:
> >=20
> >   r8152 8-1.1:1.0 enx482ae347e7c3: renamed from eth0
> >   r8152 8-1.1:1.0 enx482ae347e7c3: carrier on
> >   r8152 8-1.1:1.0 enx482ae347e7c3: carrier off
> >   r8152 8-1.1:1.0 enx482ae347e7c3: carrier on
> >=20
> >=20
> > I bisected this to d1e280334b7f ("usb: core: Fix SuperSpeed root
> > hub wMaxPacketSize"). Reverting that commit on top of 7.1.2 fixes
> > the issue.

Incredibly bizarre, I wonder if it's some userspace madness.

Does this alternative patch (on top of the revert) break it too?
https://lore.kernel.org/linux-usb/20260504111353.55ba2530.michal.pecio@gmai=
l.com/

> That patch limits USB3 roothub change bitmap from 4 bytes to 2 bytes,
> which should be enough for the max 15 children USB3 hubs support.
> Odd that this change impacts the usb ethernet device of that dock.

Very odd: as you said before, hub driver wouldn't support more than
15 ports anyway, the problem occurs on port 1, and is not any obvious
hub issue like connection event never noticed by the kernel.

I thought that maybe writing the status change URB overflows its
transfer buffer, but usb_hcd_poll_rh_status() seems to be handling
such cases correctly. And xhci_hub_status_data() isn't even aware
of URB length, so it can't be sensitive to this change.

> If possible, could you share a dmesg with usbcore dynamic debug
> enabled
>=20
> mount -t debugfs none /sys/kernel/debug
> echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control
> <connect dock>
> dmesg

If not possible, please at least post ordinary dmesg. Even if there is
nothing more about "enx482ae347e7c3", there might be about "8-1.1:1.0".
The snippet above is a small part of typical r8152 connection log.

Regards,
Michal

