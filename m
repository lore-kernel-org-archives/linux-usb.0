Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F8F42E8FE;
	Mon, 13 Jul 2026 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783957500; cv=none; b=GEmJBe+haKT4RGbU64tiZEIjfEi/EztMXrI8ODJWlAowAuCOyzVRQUz6ZzXyE/OnPlsqlK/bwuy+VKySu3q/khurhLry9/yrsLgKWVkhxJy+LO3XFMmrqvlwAnmVRHTt6hh5lw30friabAJt8j6Jr8dX9yF0Jc3SUYTbQWwgp2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783957500; c=relaxed/simple;
	bh=qiFAsQb8gUaGA1Sdt3fo6PE0mxhDQJ7KW2hdjuBePxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YnNB++FmDH1TiPHHay4x657xnoIReoUSNs3MgnckDesnju1qkItb/VpU4o/PzpJ7G5ul2VxTDpvTMWkbAT3ppDn6tWgxti031KOPlrBq0r31wZ5Pelzik9E4nvEy9KZ1zYoqYQu8SIYmuC3L8fqYe9sdqqFN0LQ2EVMh9Ygfk3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=E7QLxJi5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UuyjrOfp; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="E7QLxJi5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UuyjrOfp"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 1F6F4EC009A;
	Mon, 13 Jul 2026 11:44:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 13 Jul 2026 11:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1783957496;
	 x=1784043896; bh=G5CDfNhUwyMB821dnYP3ZRG3UTDWP6nc/ymDxsJ0UUg=; b=
	E7QLxJi51BtGKoLmlbCT2ADd5yOD0bbDF4X2Ukn5lO++0w+/PW+nHSV6BLmQQsxb
	ieq9NywlQyUe++sp7s5gel4LP6IfGOudIW08y9/IHrTp+WlkHVUFFvpGCZ8HfUg2
	Gevu5cJ1slHsYm8GBaJD2vnxMWfCez0VXGHcYaK39b6SE6zdVD6V1Fx6/4+4lgCL
	ysgswYn2VsRez0CzqtyyhN2ZIqzLHXSosmAbgRzpXrRKgLJAhM3eY1So1EZ6OH2g
	QYQMV8+7wHyra9Oo0Q0BBRj/T5WoNCwNksH3eTRe+ytMynB8T8TKAFMdZbI6CFWj
	MpgM+umir6nk8X+V9a71VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783957496; x=
	1784043896; bh=G5CDfNhUwyMB821dnYP3ZRG3UTDWP6nc/ymDxsJ0UUg=; b=U
	uyjrOfpZgbl6Mi2tn0PNARS+t9435M15lzMx8bObYgKAFeFIrZRh8sTyQyALNkrH
	7kJxfzQPaeiQnZrYwZgGfSej0fb4c9v5R59Ewg8kVK99PFq1byEL1MfehwadXp7n
	du6Qb0LfWVQRNmwfvCB+ngK0uXkVhmmBApiYpuclrSv17yFMAQwfOfUG+b88z+oS
	puVXDYPblLPbz8sLpBoAT0VF92wfq3Ku4glkB1ibQTBkHmWJIeIr7ehoS1FS33PG
	lgzl4LsLCe0/BInQf2xyU6+kNCsG531Z3M0465rhB/UTwIi66Q/4BoxpK0H05Byg
	0ghloBaynx8N9mqwsZy1A==
X-ME-Sender: <xms:9wdVasA7zqF3k9BxtWHAF7swdgGbbaSlWnRrxD9klbOUvBdK37tGjg>
    <xme:9wdVasX-nZzXwZUfDCZMLjM2eZVc-Q0PrnpVs4UlXuXnfp6i3D9XBnzz_YYi9MgKl
    divmS_c_6ma6Um570QTS1WuvZIFkOG3kB3qYbD3-hTN_7G7GO0>
X-ME-Received: <xmr:9wdVaqCtBwO-87MyJyRZgPauaxstFrIgbjRK7fOibpTh_qBG9Gtp7gaRKlMGEvVo6yy1UM-D73aXnoGAQbl5MFVpPlZzJGix7g>
X-ME-Proxy-Cause: dmFkZTFY6lH9UbikzGGF+9sTo8UnYKIW62Rg0AFuhhMRxe07csUQLwTQQfvo4sy375h/2V
    Zr/B98moAMOnyZQc0VbUs8/0nQgbxv8BFVIvKwhho5KTzQkAcyd0Vd3LLCSLohNBSMvv3f
    nNZzs+RUmFJ7N3+Jh74cJuWWmgOlbSSRIKuYu4y1cGYLGe8hfMD3YhSXQ9elcHbZpvhVwq
    CnVsURCx4qbz6b3Fevycl3cZxx/tUTnzwkeDlYUn+08SoZotEhtT3huicw7MBejLP2aKkV
    +4GdT2B09kBadJKQMqneWwJoWrlcm0YoXzzK/QlifjeAGuPHj1XuxvYzd+OYapojrw3aZE
    Yk92ExmJdU9TnVX/xU+XqTSPKEZJFCKzvFXmkQ85O1Fu98cHuPizfutmvQ2g8zTQNx+BT9
    Tvg6nMFvj5L9SBEFLl1zYDc5Np8iZaS3sjst2TsFVl7NXwXvHAXOVchzwWboXrArQjjcJW
    PALMjQT4fUeKoFjQ0BcE2pLsrRf2HRZMY3ZAvVy1g/w2d7deYwuJwvTNipOwpcRn0nNUh4
    0NHV1fUMWy+F4GuZO5Q1x14jVE0orzadh2jAWbwgP219yEh/qrxGvRhZq4YqaZpGWPfqvy
    4/xW/Xy0ZMLLmD9h1SpIBWQsH8kaGKrBzOykXYCnlrpGcBIyBaN26VMcPQmw
X-ME-Proxy: <xmx:9wdVav_6WE4UGE5aud3w-BnsrgKDF0hhwA0JCYSllY5ZrDTx8OwCWw>
    <xmx:-AdVahEMY1o85iGyt18DnGeBcFNzYgiYUU2zo2rWxeqxtWFSfOrxqA>
    <xmx:-AdVatNP3HFkpSBXaeeIe24Djl62jrRqhqOtWiWsiqoaNbhy5gKnkg>
    <xmx:-AdVarchHJ4zBcN8hm9AwktgqMYArPxkdgEg15mHD6KHiObndg5u-w>
    <xmx:-AdVag-2Ec9gDIsbnxx4Qvdxf6Dv9si0EZT7gVG7jdNE79fG7IbyTJII>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jul 2026 11:44:48 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Date: Mon, 13 Jul 2026 17:43:53 +0200
Subject: [PATCH 3/3] usb: core: Add lock to usb_wakeup_notification()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-usb_core_patches_1-v1-3-7721c2b33f53@kroah.com>
References: <20260713-usb_core_patches_1-v1-0-7721c2b33f53@kroah.com>
In-Reply-To: <20260713-usb_core_patches_1-v1-0-7721c2b33f53@kroah.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783957473; l=1227;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=qiFAsQb8gUaGA1Sdt3fo6PE0mxhDQJ7KW2hdjuBePxw=;
 b=EUIpRvo6ddcrVFUkKdVT0otwfPKE8FBG8o7WAllEED2DwI7kvHWC4nw0nkdctI8XGrwbNj7v5
 e/fmFTP6VWBBG9dmia3DezVmlN0FfeUcC7fV/4Fc8R0gyMWHmAWkFlm
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=

Add a spin lock to usb_wakeup notification to prevent a race condition
with dereferencing freed memory. This could be hit by the xHCI driver as
it calls this function from an IRQ and could race with the
hub_disconnect() function, which properly grabs this lock to protect the
state of the device.

Assisted-by: gkh_clanker_t1000
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
 drivers/usb/core/hub.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 5262e11c12cd..5798efdd91a9 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -753,10 +753,12 @@ void usb_wakeup_notification(struct usb_device *hdev,
 {
 	struct usb_hub *hub;
 	struct usb_port *port_dev;
+	unsigned long flags;
 
 	if (!hdev)
 		return;
 
+	spin_lock_irqsave(&device_state_lock, flags);
 	hub = usb_hub_to_struct_hub(hdev);
 	if (hub) {
 		port_dev = hub->ports[portnum - 1];
@@ -766,6 +768,7 @@ void usb_wakeup_notification(struct usb_device *hdev,
 		set_bit(portnum, hub->wakeup_bits);
 		kick_hub_wq(hub);
 	}
+	spin_unlock_irqrestore(&device_state_lock, flags);
 }
 EXPORT_SYMBOL_GPL(usb_wakeup_notification);
 

-- 
2.55.0

