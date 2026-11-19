Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795126949;
	b=IZmWzcDJxL1gAqfZesB4M4bhlkmMrffhzDPsCie4G05rixTdFq2Zgcv512FU3tJNqRYP
	 uWDbLzYrSzmtI9td83ztocEZkUD+eZDhBersDZCnUvFfWHeFtAIWjzR9fsVEwj0L4cR5F
	 cJi9QqFaIMzM/y8QzGBD+WU/8TqqzyTbNi3X0OwP079kzH11NJUQGPf4MtxEgSvdS6m40
	 +QeXUBoivgHzQ+tYWzktqltA3jYwHFRLvDBbAE2csFyMtZb4GaLeLv/HrzvBdU2I4yE2Q
	 ILLEpQmhcoYI951hCbJnhI/xA8a1Cen1/3SJOtfXlwsRGBvRkqSUcSRtzV9MhS2rFCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126949;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=V1GVOogHW6X+icDibV6ijnZgsUDRLfB7deSSTjVmRek=;
	b=PADSAOzI2PMUIxESGP7DAMSQU/VY7gjK5ZX9AOo+mQjs20sT9gYjX+KtiB/CIhldgcI/
	 tjjVNiUWOrp+/EHmhybohf3epirP3/8yjsKmJkXLv0Fq8YqNYrF6NLrS3Ho1GqDWRsMzK
	 NhEtEn4Tm50vntXw997zVA4HGx0T9GVb/YztjWY3AtbnlNa7aadvKfJDvjiFvJ5nIJHuX
	 f88cCsi4T+sddUJ91T5Ud8kCBaNe2Xi1mmPJ9LhHKu0+u7Z4+faLTictSMUFwF8RDjlop
	 +fqVgPyXXjTAY1v3+UgMPisY54AvI59viMkXJ2OYEG9g1XVwYhAYHHzWkxKefX0B0gQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F0kEdQuL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E5F606A33A;
	Thu, 19 Nov 2026 22:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F0kEdQuL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795126948;
	b=FRf+SYrWM4P3hhXjTT8QwxsFVlenZQrqmjst5ycqfKLXZAWdJOciGvlRM6tnBEA1K+tM
	 h1eUDTAUxBrW6wp3xMmI8tO8DYXFcvrkHV52it7oDMHQK5E3a3DCJnuX6nFud4sSmSTwL
	 EVqdubnftD0m+hFdf4NFXKiHcdJS4JwJ4dP4xunkl+XKbOl7mh9Cfgmq+aZ6M0YqLHmzC
	 TG74YlvAZgsFHI4qg8fjERxqyKzHdgymu3rywGDdmt/OEfN5ABHPI1Z94nVi0TEQy3Gju
	 SUMh097E2Jirjx6Ih35IsDar1u9GgPZqAVUOksD0qyxwLaR/22mgqFI1+WiAnXL46lw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795126948;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=V1GVOogHW6X+icDibV6ijnZgsUDRLfB7deSSTjVmRek=;
	b=XLOtcSmNAVQA0wO284q3wWaiNm8PuN5oP9fsOFfRcNtoIKgO3pSpJ/DpHjRPo6IWJNcw
	 E9eyOaihRDKGm5b3CgPdsYhgJ4/DRctGc4uZs6Tx9xnHz1JJTS0LUZXJKUEPPW4JAqFDL
	 8KodRYM+kAeOJy8RyzHV92iCBaSgi3FR3fym4oIYml6E7iW4e3ropPZUYm8m9hxGCOu0h
	 HPA9yVhvgq9GAj4lYlWuq+LAT/tcXG4nymA5+qR2Yd6cg+P0Ab/hY4nOAJy2kP8fYLCaf
	 RER9dVZ52uV1Gij3gEUgxET8AQzPv4AGTpMk0i+60KyFQZ+cydI8OnW9gLv+IZX5xFA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24D641F000CF;
	Thu, 19 Nov 2026 22:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126948;
	bh=V1GVOogHW6X+icDibV6ijnZgsUDRLfB7deSSTjVmRek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=F0kEdQuLlnx7/bWd3jr1G056QwVp48cCrsDcV7VyCEOPEjEHNT4riZUBy4SS+NNEU
	 9B5f/SoA9iHzrMPUtxCfsSPtkVKovoAm5dZgBf98V2ikrsM53WFMO72VqhezK3fB5L
	 32ND+bwm/IloAniJcEGSkKVSWkP0JXXJIiwHBrbNF5ZxdKoNxSC+A358eR844ge0jK
	 q9LrmlTjKRmXhG0CrOp+dUyd06hWnoQN+Y2DWbto8Fje5Cx/rK23nBEm9z8pWguDEU
	 pP/fqkzO64vRgX31U4snyx9dRrfWeJsJ8djvzk/ildEUUp0nruHSfiK2s7sbWQNjo3
	 nBvoMq+6uQxVg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A2F1B41B34;
	Thu, 19 Nov 2026 22:22:27 +0000 (UTC)
From: Oleh Kurudz via B4 Relay <devnull+admin.or1k.net@kernel.org>
Date: Fri, 20 Nov 2026 00:22:26 +0200
Subject: [PATCH 2/2] USB: quirks: Add USB_QUIRK_DISCONNECT_PARENT_SUSPEND
 for HyperX QuadCast S
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-quadcast-s-suspend-v1-2-add8ccf12c8f@or1k.net>
References: <20261120-quadcast-s-suspend-v1-0-add8ccf12c8f@or1k.net>
In-Reply-To: <20261120-quadcast-s-suspend-v1-0-add8ccf12c8f@or1k.net>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Oleh Kurudz <admin@or1k.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795126946; l=2798;
 i=admin@or1k.net; s=20261120; h=from:subject:message-id;
 bh=sclMB3qQjz0MBOArJBKgrL60LLle/8DQgPez0+3yPqM=;
 b=X9dZki4l1j1PUxCwmeR20wUozH0CTxA+s5sv2LERkuY9ZwuP8CnndsPklvU/BQ2hAvlnbmqbG
 WjcH/6+z817Dehe73O0Qkf3feiPDX4XddKFuib320qp/aCPHuaW/8X/
X-Developer-Key: i=admin@or1k.net; a=ed25519;
 pk=99OKf9VLJkjldneE6gRk0c6oTl7G+EdqRiFo4h8sH6Q=
X-Endpoint-Received: by B4 Relay for admin@or1k.net/20261120 with
 auth_id=1577
X-Original-From: Oleh Kurudz <admin@or1k.net>
Reply-To: admin@or1k.net
Content-Transfer-Encoding: 7bit

From: Oleh Kurudz <admin@or1k.net>

The HyperX QuadCast S microphone has a built-in Huasheng 214b:7250 hub
with two functions behind it: an audio device (0951:171d) and an HID
device for the RGB lighting (0951:171f). During system suspend the HID
function drops off the built-in hub, and the hub wakes the system even
though remote wakeup is disabled. On an AMD laptop using s2idle the
first suspend after boot comes back within about a second:

  [   68.618009] PM: suspend entry (s2idle)
  [   69.752213] usb 1-1.3.1: usb suspend, wakeup 0
  [   69.753139] usb 1-1.3.4: usb suspend, wakeup 0
  [   69.753876] hub 1-1.3:1.0: hub_suspend
  [   69.754488] usb 1-1.3: usb suspend, wakeup 0
  [   69.775275] PM: suspend-to-idle
  [   69.775287] ACPI: PM: ACPI non-EC GPE wakeup
  [   69.775305] PM: resume from suspend-to-idle
  [   69.775319] amd_pmc AMDI0009:00: Last suspend didn't reach deepest state
  [   69.780417] usb 1-1.3-port1: status 0101 change 0001
  [   69.793138] PM: suspend exit

Here 1-1.3 is the built-in hub, 1-1.3.1 the HID function and 1-1.3.4
the audio function.

Disconnect the built-in hub during system suspend. Both functions get
the quirk, so it still applies if one of them failed to enumerate. The
microphone then cannot wake the system, which it is not expected to do
anyway, and on resume the hub is reset and both functions come back as
the same devices.

Tested on an AMD laptop (s2idle) with the microphone behind an external
hub that also carries a keyboard and a mouse: with this patch the system
stays in s2idle, the keyboard behind the external hub still wakes it,
and the microphone records normally after resume. Booting with
usbcore.quirks=0951:171d:s,0951:171f:s, which clears the quirk again,
brings the bouncing suspend back.

This patch and its changelog were written with the help of an AI
coding assistant (Claude, claude-opus-5-5). I reviewed the result and
ran the tests described above.

Signed-off-by: Oleh Kurudz <admin@or1k.net>
---
 drivers/usb/core/quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 3933cf9c0..97c63aabb 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -428,6 +428,12 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Kingston DataTraveler 3.0 */
 	{ USB_DEVICE(0x0951, 0x1666), .driver_info = USB_QUIRK_NO_LPM },
 
+	/* HyperX QuadCast S, audio and HID functions behind its built-in hub */
+	{ USB_DEVICE(0x0951, 0x171d), .driver_info =
+			USB_QUIRK_DISCONNECT_PARENT_SUSPEND },
+	{ USB_DEVICE(0x0951, 0x171f), .driver_info =
+			USB_QUIRK_DISCONNECT_PARENT_SUSPEND },
+
 	/* TOSHIBA TransMemory-Mx */
 	{ USB_DEVICE(0x0930, 0x1408), .driver_info = USB_QUIRK_NO_LPM },
 

-- 
2.56.1


