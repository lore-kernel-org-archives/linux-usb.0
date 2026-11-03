Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676865;
	b=JDLuQ+skiXQidcrQxjcMWa2BfH29v7y0vqZRb81LEeFtzvGFDnBJn55LEuxETxDQb8ZV
	 mzBxL3ETSNswuRJlSgMImh+Tp5sHrdp/1JKZaoqOoFNOeF8pcK9vW3vzwmNCulNGLKsqx
	 Lxw+0uJUyqLfbjenB0yHIj3EZYasowKGDo3GIrr85uKHCJLvkMKYCCIjIk5YFuUMlBKrI
	 yhib08srcRAtzJ0g6k787dvm2jNPnDwsXczUbj2+/02GW6qlERqZHfHsA8QOqBaXjsin2
	 2Za/a9KiE3PeDtyARtu/HzVsRzjVPC/D/Egn3r0A6SIoiHODWf/uX94STboF289i3ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b1Rw55oWDrh7Qrrp6JFBlhT1fM/bU2NaiuzfyjKKcU8=;
	b=I/h/rnFmpAmdM8bGRcZ30kblL9LHEp5fL3/trygzUr9alKyDHJWlRg1v195JTID0Z1Za
	 k97+BPWWCWO0LW8AL3hYbeVorgTw3Uc70iN1SR8jD4zQpyFAO71pnv1+zraFCe5YvMInv
	 o7lNKV+5uOIxN4s5DOn7b+vUEZYdcnP9N/My67OtUrevckj3JJYlEC7T7s4ymEhOuxGco
	 LIdiYDC/SC7kFogHU0lu5lV4MDxU79Ucl/ywkLpVCsq/E4Rbjq8DvocH0xyqBAdk3GEqq
	 65wd1n9DLcNqFR4Twav42dfqsbh1qy3TvAayW1yzxhlDNPRxdt2fJql46kXUGI4Iiow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AgiwMN+W;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C56606A32C
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 03:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94C56606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AgiwMN+W
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ea94541adbso16060285ad.2
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 19:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793676859; x=1794281659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1Rw55oWDrh7Qrrp6JFBlhT1fM/bU2NaiuzfyjKKcU8=;
        b=AgiwMN+WCDb0CzMHKck1ZwBsxIOmlFDhABJrFx0RhXHXhMEgdpcjCQkcKPD4i6PCpd
         tEwCWnQT5COSNU9Kn67nvGjSDZv81kzF3ZnJPRRczxT9628t7vDQF9fGF8hHW938fkta
         UwWxhrKF6jVlZZ8P+LGMzklD9K3D95NJS1MCXZ3SshiMAgYFtOaG97TujFyhlejTBWVj
         LhjWOZ3aVkTJduAlo82JvxBkn8eKoTcDa/w2rzhd1ysfkhrQcksTnSEvQiyayqY3NIHt
         5qWYfAntph4Sj2ZG5nh+jr6+/XCxRiQBA4naC59UJvxwhllk4l8L6iYI9GYF3L6/uCUI
         ZhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793676859; x=1794281659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1Rw55oWDrh7Qrrp6JFBlhT1fM/bU2NaiuzfyjKKcU8=;
        b=p7YkdZwYwbi9gg78OmYz6XfcsyOSyZmoZOFHvnoFOpOOi4bzy9zvAvAuvHhilQoSDG
         fsv6NukcwZnNmGNIBt0YmqIZiza9aivxMh7jCes+ZqkN0j5isNpBUdn5wu6lPPXCR+0A
         EBQoGCVWMtcRIp9w9rIipzr7qBrmW7LCRC4NKKCgFwKMM5EovW9AS0SsyMXrrbDOagO4
         d6HUiyxrvZC46DBZMfGusVcmbSicJBuyY5jyTDV/LWkaIfdjqxFv5W6/e8gXtTGeipBq
         Gvhv9TLlf35HmRWdziPNoESyNYmix8rtNYXihAFnbNpig8T4cJioOfsPIjqMSX0ECHlJ
         04oA==
X-Forwarded-Encrypted: i=1; AKwUvBy46uq/bvJLwMQHEzdwfFkLPqBKMQQ5zuPw5mK0MxxcpVPoAkPNP8eTR9gQ6PQphcBLuRRZ8Chga4c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+g0UHP2+78L6gmRy5aX9uvI64rXRTHaYFR6ozEsvR3s71C2OB
	JqwtiZPuAAv4cnH+NkcZluXzxrgWoZc1IVUAvvuGlbyOYubYqaHiamZfcreRh939Jg==
X-Gm-Gg: AYBFou1PTlViozIS4+KitWAWEwynuZdCK+nUO6z0QPY+qg0rnlRRbbxxUzOOPakfa1i
	G1FWW5NCiBUbgjODCEhHt4Gj+rAnIyfIav/bmRvc9OpNktqd375jHo3mpg7EHuNG9HWS710sGBJ
	F+G2Fb3Y7insefVRV+SWMUlqM6imjN2C4vEAD7ZtecOp06BNulzAPfY/1fVl6l+8Z1H3Le750OA
	5mu/vDUM2lDgYs1i4n6wUUPh6W85PaJTG/eLibCm0+pdICBVue8tpZNHUCnpA9EeK4u65nfI/DD
	0k/roXsPI3AQ79xc3AuhkNcd9wBX/GdlDiFvUzPEFJRoPvXhBfyStjvoNCW0H9hmUMilzCGQnf6
	QzUINdUrEH9nutYSZg4vp5laMIR27ojbY9jP1Eg5hqAnFTUjrG+JHHVQ/ojYtXqmpdlQIJB5s6j
	g4rdTWslcz9w+9w4bPKo3WQ2n6ow1nXPNyt6xKqyER1ZQXR3yyG7JTzJYeRfyvnZ82LRXtAg4oL
	zVVXc35s7D+f8Mx47PeZ4KmqCKOdPGoBVcAC2xQh1aXPsxGFAw6jO5qLjkeUZRuKijq88t0AGmD
	jSS6fp7YhSGaoaHQbYYkvH/rIxbf/0jrEqvoMcEdyc1IN0NjKDVnEpkoVi0AaJW/EGdCTK5muNW
	lm1lBM1YUcxXJeRo5fA==
X-Received: by 2002:a17:90b:2d0c:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3ae897e30c8mr9894127a91.65.1793676858713;
        Mon, 02 Nov 2026 19:34:18 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c29e619sm1965566a91.0.2026.11.02.19.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:34:18 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v3 0/2] usb: core: fix failed device driver probes, add pre_probe
Date: Tue,  3 Nov 2026 10:34:11 +0700
Message-ID: <cover.1793669297.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
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

On a BeagleY-AI with BeagleBoard's device tree, kernels since commit
f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms")
no longer boot to a usable system: the on-board USB hub is re-probed in
a loop. Patch 2 fixes this as Johan Hovold suggested, with a pre_probe
callback that lets onboard_usb_dev defer before the hub is configured.

Patch 1 fixes two pre-existing bugs found by a Sashiko review of v2.

Tested on the BeagleY-AI on top of v7.4-rc1: the board boots normally.
The -ENODEV fallback that patch 1 changes is not reached on this board.

I found this by booting commit 85b4bc79dde7 (net/main during the 7.4
merge window) on a BeagleY-AI with BeagleBoard's device tree. A coding
agent identified the problem, explained it to me and proposed an initial
fix, which was revised numerous times on the basis of comments on v1 and
v2, my feedback and local Sashiko reviews. I verified that the series
fixes the problem on top of v7.4-rc1.

v3:
- Add a patch to fix existing problems, as requested by Alan Stern.
- Patch 2: rebased on it, no other change.
v2: https://lore.kernel.org/all/20261030151919.3511106-1-jjc@jclark.com/
v1: https://lore.kernel.org/all/20261030114705.3159093-1-jjc@jclark.com/

#regzbot introduced: f918e3804498

James Clark (2):
  usb: core: clean up before handing a device to the generic driver
  usb: core: add a pre_probe callback for device drivers that may defer

 drivers/usb/core/driver.c          | 42 ++++++++++++++++++++++++++----
 drivers/usb/misc/onboard_usb_dev.c | 15 ++++++-----
 include/linux/usb.h                | 14 ++++++++++
 3 files changed, 59 insertions(+), 12 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

