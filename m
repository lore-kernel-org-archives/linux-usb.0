Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B214F3DAAAE
	for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 07:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786864233; cv=none; b=lpVDbFOHJGRaB00VOA0gdnolhVNWeMH2928AeGUjGFiy17x6KD1tHKKMEDZCwZZJ9dmwOClKext+PoQoi7oSzVK9jbatPUCZ1d9TXnXKtpyxVTkMLaxV26kRZKl6yrrmT0/BmqyDvP/mYORIF0NJjCX38fX7M9kBVr3+0Posibw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786864233; c=relaxed/simple;
	bh=tXzsqjWYbT/DrBupcdNgjXO+pQcKgGFXWkOHwQDnMK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOYGgdc3FNgT+3KRN78fO1mdgRUq43T0uOvvajDiVEFgDG9qHgJ87u1OxljSDyTqk53j0C4LYSqu29X8POQVPlhh5aNK8R+4D72hvbyEo54M7g1/m/GcGRT4OqmISzU7wLJSU2AUaxalLWEmWM9ZCVSOrP6B6Jnrpb2CbKLdhkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OK1JgmWy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OK1JgmWy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caf228a910so18847255ad.2
        for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 00:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786864229; x=1787469029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U6xHaLkd1n/4+mC0EZEdafPnkO5n+dbx/Yy5btF/NQE=;
        b=OK1JgmWy82mUyCqhQyNXwFjBINrN+cPJsDbSoufab5b39aBV0CHpdjnwiGp5KLlyde
         4Sz3oQGGVN/9WR5BaGlfbW/blnTlJfFPxlwfCNPipVFWFpawcNPbMeWS9nYbojEFQcqg
         ZZrYKupwXeSxYJRQOw+yAp9bOakRdPa7V0g5bTSwb8z35AmsMlwu2TzR4MwmYUdn3DDA
         5/VffKDP/iis9c0zLvXSNWgp5rBttv7RFr3D61iniDpMll5P7DrDsyA2r+JHE4TVFS3C
         nVLqkNMAzg/2tY3hbiJXnuQVIX1b/GJ5z1rEpv5/eW8DDgfG4xJHqZCvUysHS9L+ExLf
         gVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786864229; x=1787469029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U6xHaLkd1n/4+mC0EZEdafPnkO5n+dbx/Yy5btF/NQE=;
        b=bFsYJNJP0a4qd7uYV9JTR9kE25ycm13oQJw11zWdXrX2x0hQFMFnhhhke8pZO7jUFF
         OI+ctfmhOKYdjKqsR4yFlKsfC10HxuE2+xFZ0uNMNJsGoGnXjNZwPI+Kv/uMgZOhT6I9
         ZQRfhqw2rc9ZumW3N7B2Kyhpvej26ZOx/Hd5zpMTTTFgQDFFrSdzq5ggt9pT2cSDtHs7
         m0hTGZFow8FmNTvPflxQjAjvzI2g8XBf6UQGVamzVYeDh9LzmQClyN3xAZIuiQxfCpck
         C4EFlh9hv+2Cp4fU2fS6qwO3J7yoP4iDLVNP/CsmvXQWNGycTsKBLarllZu61EdcwkNe
         GQBg==
X-Forwarded-Encrypted: i=1; AHgh+RpoSFf+7Oeb7EO2cZTnaDWgjE673FTOyxqOVL4qT4CLgNU+o2LRL3zV8p5CgtTNBESVQNHL5/AsC8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVioDqBL2iC8Gq0V67MNGfbFM71xcVfZfNJ8PsPK6r1tFz446S
	ViMCy76EoY3RPfHGkETHHVOBlJwBPEVwMDcJXqs9czasiGOzqfDZQqNv
X-Gm-Gg: AR+sD10LHnDTrxQlx7YVsWmhaA2wF8y7CwxPthL5mt7OoDG443Ktjjxe3mTCQmmXfQD
	+khP126WtK9hyU75H2Gq7YPcqg4BE/Pu7oLbIGx956TV6PfwBZlGNu70kvx0i0WICtoqmbFro/E
	S6gVFo4XMJ+mzoHJ9A+4um3EmjcJs5LhRoum+LynZeCgXa0PVACbEwQfIIIRMPuYlygDcB9qojB
	tXWlnaU9pW9tJ5ftM1WowAqu2azvu8RPe91jCPUfymLnLSxZis4cLcjeKxFqfzFLjNt5VlGLzEV
	NkWOFyzQIwleUZVasXV1jIe8dSFsLxKBHONeC9KHpYJr/jmddHQ7r1zcTvopw+gQzxOY+fYo03X
	GnwP4g8eCl1Bz50b/aXfty/w984YKQX5met6gKYuNjMpwacYIkkC+Y/0ZP9RmMq8nM+OC0z8pJH
	XIOnxGT4YuKvDPjKWSmL9q6nnTrXcZvz3R05sao0+z+wa7trsORZYdc5g8ZpdcTiWSWBUhQ6Ige
	t6f7obHoEOjo/Kr9AAZFd1ntHwyv2s2rGhUuUnLlPKXPs79T8sF
X-Received: by 2002:a17:903:3244:b0:2c9:e69f:8b0f with SMTP id d9443c01a7336-2d3b0cad616mr189049975ad.17.1786864228597;
        Sun, 16 Aug 2026 00:10:28 -0700 (PDT)
Received: from Inspiron5409 ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aebf1ba7sm23643315ad.78.2026.08.16.00.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 00:10:26 -0700 (PDT)
From: Jianhui Xu <neuromoments@gmail.com>
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch,
	andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	hkallweit1@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	neuromoments@gmail.com,
	pabeni@redhat.com
Subject: Re: [PATCH v7 0/14] ax88179_178a: Add support for AX88179A-based chips
Date: Sun, 16 Aug 2026 15:09:54 +0800
Message-ID: <20260816070954.3440027-1-neuromoments@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810-ax88179a-v7-0-da633191c129@birger-koblitz.de>
References: <20260810-ax88179a-v7-0-da633191c129@birger-koblitz.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Birger, 

I tested v7 on the same ASIX AX88179B adapter. The 14 patches applied
cleanly to net-next commit df13c1df8147675470213ffff29dd5762fa321f5 and
built as 7.2.0-rc3-ax88179b-v7. Full and focused W=1 builds for phylink.o,
ax88179.o, and ax88796b.o completed without warnings or errors.

The main functional tests passed: cold DHCP at 1000baseT/Full, the
1000/100/10/1000 Mbit/s matrix, EEE and pause disable/restore, EEPROM read,
module reload, and QEMU USB detach/reattach. I also ran 30 additional
100baseT/Full -> 1000baseT/Full cycles; all points passed carrier,
negotiated speed, bound traffic, and RX-growth checks. Including the normal
matrix, all 31 tested 100baseT/Full points passed, so I did not reproduce
the v6 intermittent 100-Mbit carrier-without-RX issue.

However, suspend/resume with magic-packet wake failed reproducibly.
A deep-S3 cycle with `wol d` passed, but two independent fresh cycles with
`wol g` both resumed with the AX88179B interface stuck NO-CARRIER. Bound
traffic failed, neighbors remained unresolved, and RX did not increase
during immediate, 10-second, or 20-second checks.

In both failures, dmesg showed the USB reset followed by `Link is Down` and
`Link is Up - 1Gbps/Full` only about 11-13 ms apart, both before `PM:
suspend exit`. No later link event arrived after resume. By comparison, all
six retained v6 `wol g` trials passed, with Link Up occurring about 2.4-2.8
seconds after `PM: suspend exit`, when the link was actually usable.

I then tested a small ordering change in ax88179a_resume(): 

diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
index 6b57111a0..dc101902b 100644
--- a/drivers/net/usb/ax88179a_devices.c
+++ b/drivers/net/usb/ax88179a_devices.c
@@ -215,14 +215,14 @@ static int ax88179a_resume(struct usb_interface *intf)
 	ax88179_write_cmd(dev, AX88179A_PHY_POWER, 0, 0, 1, &reg8);
 	msleep(250);
 
+	ax88179a_reset(dev);
+
 	if (netif_running(dev->net)) {
 		rtnl_lock();
 		phylink_resume(ax179_data->phylink);
 		rtnl_unlock();
 	}
 
-	ax88179a_reset(dev);
-
 	ax88179_set_pm_mode(dev, false);
 
 	return usbnet_resume(intf);

The modified v7 passed all the aforementioned tests, plus 13 additional
`wol g` deep-S3 cycles. Every cycle resumed at 1000baseT/Full and passed
immediate, 10-second, and 20-second traffic/RX checks. All 13 `wol g`
traces contained a usable Link Up 2.017-4.020 seconds after `PM: suspend
exit`.

I'm not an expert in the Linux networking subsystem, so I'd appreciate it
if you could take another look at whether this ordering is appropriate.

Thanks,
Jianhui
