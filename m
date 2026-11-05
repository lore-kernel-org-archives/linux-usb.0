Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837222;
	b=SQpMAGGFEIQyhEpbVrTxh/ycMgL7OHn1vNnqT91ohmklDKN/1Bj3pYJacx99mGmfrc89
	 7BDg+BCOdpIVaQfRw2i0Or6XyBcacDDN5yqHgWJIZ8yQ6MyM3PHKBuRqQjkWmqJNc0kcf
	 lvx9u/kC+ApdcaiHTlQ0QXv7SJZChoj49iaF/bX07Uiim8Ml/6ohTRG0b6eaB3kG8yJZz
	 2/iVC52gQ1LH+dZZf7DnE8KLZ8VMs/BKMsE+0lKf9GzBDs/N5jUZQRLf5A38aeiYQyf0x
	 bqbys+5LRjNEf1Pc022lERpqNiXWTBhxN/3FS24Uqah05k37ppeIVeqUUZZ5QX23A9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d1p/rD6sTNhuzYzSDYOdeVCwAUdWvLdNAWonA3aBGkk=;
	b=r1T45Mf50Z2IH6BUtlFDq3UZoeKjfEHhEQrRbIQx20+V6x458nwbons9Q+VVEMETkdP/
	 J/ySZr9DepFRu5lWEhAm9HPRgpI63pr7KLpnUToESUlEK5RgbRpptzWz0RJpradIwp3mC
	 Oc3sLi4j8oiMvrYH7QsT+B+FCJt+6R9R8TdSLOs99kkMMyjT8b+BTCTVj608NW/9X6tuS
	 u0iIv2AULcpzkIlCCWq6GX8P8Rd5eX23GatzuVMtVLDVrH1Oi068q9XKc27p01s3hrCur
	 a4lNXh/Kat0VS4x7m9gWjjzduP11jdT3wV8Bfx2CcCjUIoZxnDONSYQi48UJlTP5SUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBSvJJA7;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C433A606A326
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 00:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C433A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBSvJJA7
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso8758665e9.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 16:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837220; x=1794442020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1p/rD6sTNhuzYzSDYOdeVCwAUdWvLdNAWonA3aBGkk=;
        b=HBSvJJA7LE1rpkWl3EQlaKPvM+vmsGVv4Eo/eNaB2C5Xa3ZmFurERa2waV1z3Rbofm
         BR54o4qXWgVU/Uqgpqru+uLVcm3iOhXeNvXXl6miESzC69Hprt7lgxQrIA6l3IJXtdmr
         2shcTnrsIEJJ6eqk9cUzOnWCC4Iuc6JTudDOVnyC2F3RMHNmYirpvZ7A/KlY+DZEXSjP
         GANFegY6laUwc9iKd+9K51CNwHJI2ZqjiWRy4T0ThK6yfkyr6hUtL/EX1EETTGs0n3BB
         Rjc1jA3RNJzRMFvsx4+2X0PepDc02WblQAmfKJBhea+ceuJAjXsNnJJlvNmCHAcKGJHh
         WYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837220; x=1794442020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1p/rD6sTNhuzYzSDYOdeVCwAUdWvLdNAWonA3aBGkk=;
        b=MjWYdQkeRTRnxLFhhAHjO/Yze9k+aH0FicuNVrdaW/FvLQ9hY22Q5T9BpIOuQRfkOX
         gdNy3geGLE/OmyosZDZ43034OQYfUhNxJtee3dWwZnG/pg1lOYKuhyeKZjX/rn+hXjGG
         MXBcXZy6z9IzC/HK+PqO1SLV6B2kFnAVPXTtxxFBwvuxMGlWvpjOmYNYEVB7TNPZmMOE
         4S/kTDPstdUJYzTzvHeDleIkK67tJ+oKsFCkmok8FeXkYrVeHtwpoUIEFq3Os7jhWH4R
         kA1UUtD2CvN9IQ8ftetaucWMn2kLK1N0DExY7JpKkKtYlnyRSJFmFCbeSEHEOlbr+gUY
         PBJw==
X-Forwarded-Encrypted: i=1; AKwUvBwmpcTqIBRur+Gl3axhmVBzXYAVI94MZFKdb2Yy+PjxIqZCMHdeVuXivMlMRF3boyh2ADJhO2TVp04=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RcWbYgUJ0SOV1P5zpcDgQEyFGmkVTfMKqW3be1SeZGuxOARs7
	aLPnWWx49ZsNok9B4QDYlDI3MWRQozJXEf0QniJcAX8Ocru8LPyJwFv2
X-Gm-Gg: AYBFou0PAyO59IjCsCqLG9QUV0+43GDD6IfpkdeFj2y4L25xYw7+soq2nZvgKJ53OMR
	GmxLOVas94rXbYrrVWJzbvbgLdL0aC/x1n+h4jLiaS7Lb2VWfBya8PuC9lplfi6hzH/8ISDVjJ3
	iRZaVQhIOIh9QE2JM+4uMovUOfu58is3igcJDpobVzH1la9Z1ragpqBqA37uMQYF5roBFAuzeeu
	mFbtr+oWPdLJc9Htrwe5+g71fPnNo8ARd9uKgbr+nE+jjAJ6nUEB1PEiy1bkuZt9aduQ/YSY7VE
	pNyMQfpolBuPdb3hsXi8MOQNCYZ55un9jOl0nUGqoxqa3TGZ/Y81Qt4EMzNbuiGQVRUAZ0N/f4Q
	HJ7elzu2OpoyWwZa3aDZKQns+ZkmK3aI2nnQWuKNXhR4I3l2B/iA9dYpTxLO7sYvMtsnKwU2Of4
	Cjkei0UKOc1fBgc+ar31mOliRpUwE9dM8+T6PotZ80WYMx9QgIBP3P6Fvq4ESlgZ8FyHcMF0ZqL
	BcfRGxFMpJOnEnuaF/UZ/35Mpl8ub02iNWzcFWzGkQ2XCU2a3bDF/FD2Xx04lEH+3rg5I3Gsnk9
	Cim+4QxESCX+fC07BN1vBFkcXs/DyzwoSQvkYjQ8eKPVrkIKunXwH7Yda8ci0KTEnT/can2QTBb
	rjc9yM7rA/ouhn9C8uYk=
X-Received: by 2002:a05:600c:524c:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4ac17470f97mr398502555e9.10.1793837220243;
        Wed, 04 Nov 2026 16:07:00 -0800 (PST)
Received: from fedora.fritz.box ([93.93.22.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725061e1sm21403745e9.7.2026.11.04.16.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:06:59 -0800 (PST)
From: Stefano Munari <stefanomunari.sm@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	o.rempel@pengutronix.de,
	pabeni@redhat.com,
	rmk+kernel@armlinux.org.uk,
	stefanomunari.sm@gmail.com
Subject: Re: [PATCH net] net: usb: lan78xx: resume phylink on non-reset USB resume
Date: Thu,  5 Nov 2026 01:06:39 +0100
Message-ID: <20261105000639.7070-1-stefanomunari.sm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179375001506.488856.4516083483989818643@kernel.org>
References: <179375001506.488856.4516083483989818643@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 03 Nov 2026 23:53:35 +0000, Sashiko wrote:
> - [Medium] RTNL self-deadlock.

An open interface holds an autopm reference, so this requires a runtime
resume with a *stale* EVENT_DEV_OPEN, i.e., a failed lan78xx_open().
This error path is fixed separately, moved to net-next per Andrew's review
since the failure is considered theoretical:

https://lore.kernel.org/netdev/20261102211119.8738-1-stefanomunari.sm@gmail.com
https://lore.kernel.org/netdev/1449a6a1-670c-4d1d-bb98-51f92e32d848@lunn.ch

On system resume lan78xx_resume() is not called with RTNL held, so
taking rtnl_lock() is safe there.

> - [Medium] Self-hang caused by re-entering runtime PM from inside the
>   USB resume callback.

Same precondition as above. The hang needs lan78xx_resume() to run
inside a runtime resume, with the interface still RPM_SUSPENDED. An
open interface holds an autopm reference, so its runtime PM status stays
RPM_ACTIVE across system sleep. On system resume the nested
usb_autopm_get_interface() from the MDIO accessors therefore only bumps
the usage count and returns immediately.

> - [Medium] On a normal (non-reset) resume, phylink is now restarted
>   after the MAC datapaths are already enabled.

Pre-existing on the reset_resume path, can be a follow-up.

> - [High] This problem wasn't introduced by this patch, but
>   lan78xx_suspend() inverts the lock order.

Pre-existing, can be a follow-up. An actual deadlock needs a
non-freezable RTNL holder opening or closing this interface during
system suspend: very unlikely in practice. In the commit message,
"mirroring lan78xx_suspend()" refers only to the dev_open condition.

Stefano
