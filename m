Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F77221DB5;
	Wed, 28 Jan 2026 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594165; cv=none; b=kHoWUmEyEyesdC0vnWXwVGiWHW/C0izPMmuiJp/GKFjFkCCe37eYz2FqVCD1oSh8u4Z36XV6YRVC+SUWaqAffnseKtknO5dypkDjAtr0d9dKyPjgMve3riPw8Hsucjbb+KHgRlwI610FtQthPrjTsC5I8hHtbuwkvS/XfvXF3t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594165; c=relaxed/simple;
	bh=VVQR9NpTdo4q2Cx953f9219u6RnrKgHsvrgQl94zgqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tqf4FIa4H/PYrmKLOhbAqeW3/QcU+U1Bo3VV9LGkeq8XGoH2QFRcp/9ZsqcSnvBsJtx3Ftv8X2GDQiSl0aLG4i82V7507YYxEs2UXDhcy6iOMkgX/jpp3LGMTT05sWMR0SA11bHt6kRYySQK3tA5Hcid4V/C1GJvDK3eEY6LN/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Zbbc/6N0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wU2nMqII; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Zbbc/6N0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wU2nMqII"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769594161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rNcxc6Bq8GztnTvIUU2YUvPzAfrY+gHe0eaodLb2kXc=;
	b=Zbbc/6N0iPU6WezyxybeNQfqavPtaJsx0zBed31+JUaE0gQgAbZ9JRyqlTL7M0ioRR0zDg
	f+yZEaDqJ3x1Cvd5mryo3eUnx4PC8GooLB/1jOp0elvkIo4dMYAOK2YUS6Vm6R2vMKc3pN
	DHphjI0DTAcg8Aw7EgIxzf8LoFime3lYCgR33U9zp8srPkGveigC2Ag4Elz7M2LNboSC1O
	4RXpcPNU9q0AnAFdHfYpoMZ1FRWwpteP+5gZFhWbEqmhUfxvW+2bBpelW3sGrCkhweVPNI
	pu+eP7NSwsbwdAYzIktATL++k3S++XGNOq9l2so3Vb3+AqE3fLB7+h0PO3b0OA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769594161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rNcxc6Bq8GztnTvIUU2YUvPzAfrY+gHe0eaodLb2kXc=;
	b=wU2nMqII3zMB133xbB3BubgGcMEUrtg3W2mIKC3ScJqAhkaQNuBi8P9EDtz3diPutYMKW3
	gG2hCZZ/guLB8IAw==
To: linux-kernel@vger.kernel.org
Cc: "Thomas Gleixner" <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 11/20] usb: typec: fusb302: Remove IRQF_ONESHOT
Date: Wed, 28 Jan 2026 10:55:31 +0100
Message-ID: <20260128095540.863589-12-bigeasy@linutronix.de>
In-Reply-To: <20260128095540.863589-1-bigeasy@linutronix.de>
References: <20260128095540.863589-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Passing IRQF_ONESHOT ensures that the interrupt source is masked until
the secondary (threaded) handler is done. If only a primary handler is
used then the flag makes no sense because the interrupt can not fire
(again) while its handler is running.
The flag also disallows force-threading of the primary handler and the
irq-core will warn about this.

Remove IRQF_ONESHOT from irqflags.

Fixes: 309b6341d5570 ("usb: typec: fusb302: Revert incorrect threaded irq f=
ix")
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
---
 drivers/usb/typec/tcpm/fusb302.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb=
302.c
index 870a71f953f6c..19ff8217818e7 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1756,8 +1756,7 @@ static int fusb302_probe(struct i2c_client *client)
 	}
=20
 	ret =3D request_irq(chip->gpio_int_n_irq, fusb302_irq_intn,
-			  IRQF_ONESHOT | IRQF_TRIGGER_LOW,
-			  "fsc_interrupt_int_n", chip);
+			  IRQF_TRIGGER_LOW, "fsc_interrupt_int_n", chip);
 	if (ret < 0) {
 		dev_err(dev, "cannot request IRQ for GPIO Int_N, ret=3D%d", ret);
 		goto tcpm_unregister_port;
--=20
2.51.0

