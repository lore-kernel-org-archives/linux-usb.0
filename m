Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79048442100;
	Wed, 22 Jul 2026 08:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708271; cv=none; b=umRTNxDuAAz2ZMyTJl8MN9VDykeatWBPZrJd7gUekjt+y7LJq9euOwlCNcjksZ+6wStediC6EMoPCFk+3XKOzeAHtWc0oniOm9m3fhbKDLHGaUeZZY0IJ3OUkDaPVIDgZHnk/GJqps474IOyHsVnkEaDB3kY30Nta399b+c2YtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708271; c=relaxed/simple;
	bh=NHSqCaPSTMK6t4DHcO4rh14hrBvmEjv6Is1dEv7guPc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KprEUDs7bh38rmMq6btE5UIlb7fYv8z8MqtnGfAgebReogZbQUdapjNrkSGcupVUo86EniUCDTQqHMkyoXASOJq6V2X3WxM+m0hXKC+fMsND3r9Q88n4ToA1zkMV/GBvA59r15cy/XadSS+h4WuIdoSfGLQLQ8RSyx3KEodpsro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=R1P5SRxJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PPxOElfh; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="R1P5SRxJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PPxOElfh"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 88C69EC00BA;
	Wed, 22 Jul 2026 04:17:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 22 Jul 2026 04:17:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1784708268; x=1784794668; bh=sf
	am809qY0gev3Vy6zA+kyH49OED5PGKP5i/mN+Qbgw=; b=R1P5SRxJOxaf59lj4d
	1R6zKWeg2zpVI3EpZ8ILsmAWFb/6N4Lu6EIjXj7c8zaiGgvwNueTEY9P5sRa7V5t
	NGsjPYodWGWMQa4YK3XXkJxq0LbBgeAgO9eFJKT7zLOFVdCgaXX2g+BxxnvPrO67
	JgtiRjC4/xWtlGDi0e3lI2Gy+nZ0TnJZEsSY4GYpVuE4lkvESuj60VrAvHng3f6q
	MOnQfwfGwxuGr1BEf5btJ4CN/WZwIa1ogDzwrkm3hbmCn2Wkaw7ieh22myj0gtIQ
	P7yUUDluq3jisrSIDq37JbQRxou2M1Bo5+byzsyTOjR+7m2n32l9wxJTLcWo8xyp
	uPhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1784708268; x=1784794668; bh=sfam809qY0gev3Vy6zA+kyH49OED
	5PGKP5i/mN+Qbgw=; b=PPxOElfhpDxghpi/p8dU5t1UEkfx7qSKw0vmA/MWAHM1
	DMkvqd4lzt8I/a0NRgrvJRsP7GbZEdnwgyH9rx+ZLUS/211E6P3ZQ3GhsEnhk1vT
	3FfIDrsXI0y5tgp3haNBxyrtwJWkqKubkBDxglNNh9zQa3lJG3Ukc03mQyIakLHE
	Is7q+TuIMmlK1pkeHWukVpmmV93Uab9Fj2V8L/6nP/jcwGBI2TL4T18qqSMro8Es
	aWs5SIgIZy/sCNAlgA12pWz96IZQJLsItd9o3vtJwatSmXHVyeBEptqMe7zLwa//
	/MoxXL2Wcsu7AEVbxvtACJmzKTSIRM8V3PDp0cQZaA==
X-ME-Sender: <xms:rHxgatoufil-F6RMMgwiJJimL51FWKNUzzr7d5N8juwMJxJsO1m3qA>
    <xme:rHxgaokoxknnJJ_6Qg1la7fp0g5iIxVEshM4SSr20cNn257B3mLbAQcjo4XV0oOdg
    4L32-_om0o9k0jf9qkgg6DG_WyYpNxFcv7uk7-MNZzdXDHgwaQ0>
X-ME-Received: <xmr:rHxgalygT_RKMrzSRIAD9c10t-ifZoLG4PFUKk34Qnrzh7JcCLSymxv7ZIa8dG_D2Aw6FE_m836lepwyCKwp97bSKDIhqhIZPg>
X-ME-Proxy-Cause: dmFkZTEd1xPCf2QlPvdlshXtN9avaCOf9nKx+QC4aXzwf+bLuJqGO0IN/elM7iaPdnw0Ts
    koBig6y+Qv8OHiK/iyTvz5g2WSB+kbb3sHNnjeiN0cGfcHounblp8vxd2jiIs5sgg3v+vF
    fnjH9HqyUjS1ekonTYl+8Fb/vYtspksbeeqYu4sHtFByMQHOLqMo0dJjr4l07i3YdhY+FW
    qzUIPdO0yBZjyJEd9Xyv6lMr+fpqMIFZUrDEfS6GZOEWh43egB9pqqBPEu4rak/Kl9ECar
    RPIXl0oPlu7DcvYB4T7TCMDbLYU+F+qJrM30Mqn8ia0OrnvZncogCnCIifdUQXt5xKiQLd
    jSmq07ceA+1S8SX9O0OdQ3FYq3rPmqv86BWXcPriNvC0WWjDcYWFg3Rr+q5zFTmfteVJaB
    PZUBJeCNrggRqHk40CVYtuKJwBEcxJCgNQczQNTKcR2SshFFALtISODVPcUiJSjKzxg0w/
    2PaLCfZYgiejWKvAmteYfR8+RKZg0AmYMi6UG3xQPvgalGu5kT36BW1NYt/YwcTt6QW7Kz
    hPndiMUrO46I7mJFIj+RqG3Hdxe3NulOIuXsTowhTTxDhUU+AG2AcEjQET5++Yvv/KaMCn
    JtaSDsfcS2nhcrL6S4K0am1mKEox/mEijTY0RtSNgxIrQR9TABWQZ1znL4mg
X-ME-Proxy: <xmx:rHxgao8wOySOKV-WA9_Y6W1IyykhPBen59I1IbHTJThyurQfFsJb4A>
    <xmx:rHxgapKBa6kgkhvop0PL7TwbybY3wRREOJ8XsUfoxSbKVd52utcgTA>
    <xmx:rHxgaufGtKsGdcOrs6aFACkf9LDgbiiYfEddjxrwjFt1s6rd3-r0iA>
    <xmx:rHxgao8JFpwDFgvDjnIdnoMBPSrTPEzzNLU7FJn8SanMaTJ4L5l0Qw>
    <xmx:rHxgaonkarkELLwLM4cngFdbXtqSocRH6HFAuzATewrb0bEdHc2vl7m3>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 04:17:47 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Subject: [PATCH v3 0/2] USB core hub error handling.
Date: Wed, 22 Jul 2026 10:17:38 +0200
Message-Id: <20260722-usb_core_patches_2-v3-0-87622252bfdd@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBQFr2K6tqb9xUJdeQ9jSFs+thopaYFoC
 HcXcMPCuJzkvZmRJIweEzntRhJx8MmHZgax3xHrdHND6quZCTCQLOcZ7ZMpbYhYtrqzDlMJVAs
 0quImNwrJfGwj1v61Si/XL6fe3NF2i2lZOJ+6EN9rdeDL7m9g4JTTDEBpIQsthTg/YtDuYMOTL
 IEBNgrgPxVAGWVHJpUtFNSm3iqmafoAIqnPkwkBAAA=
X-Change-ID: 20260714-usb_core_patches_2-a3eb9d1b7b9e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>, 
 Alan Stern <stern@rowland.harvard.edu>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784708266; l=1100;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=NHSqCaPSTMK6t4DHcO4rh14hrBvmEjv6Is1dEv7guPc=;
 b=OGZcLEh0K4fJMZXcrK/aL+G+q2xDHnCX/3mg32/6GeBW6cs2dBK9/g05YPnRmHAVb3wyTWu7Q
 GIc+ATdTh/jAb3/lR/QjgcZps+yfnUNPnFH3Ak0A4pD5HYXdh38eOxR
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=

A small patch series dedicated to strengthening error handling and
readability in drivers/usb/core/hub.c.

Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
Changes in v3:
- Added INT typecast to unsigned size_t to prevent unexpected behavior,
  as reported by Sashiko.
- Link to v2: https://patch.msgid.link/20260721-usb_core_patches_2-v2-0-05069c892fbf@kroah.com

Changes in v2:
- Added a patch rearranging error handling logic.
- Link to v1: https://patch.msgid.link/20260714-usb_core_patches_2-v1-1-4229a368a633@kroah.com

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Griffin Kroah-Hartman (2):
      usb: core: Strengthen error handling in hub_hub_status()
      usb: core: reformat error handling and messages

 drivers/usb/core/hub.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260714-usb_core_patches_2-a3eb9d1b7b9e

Best regards,
--  
Griffin Kroah-Hartman <griffin@kroah.com>

