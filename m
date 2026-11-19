Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795097932;
	b=rOWS5b5gceoT8rr/UeFVP/NXN2T1Q97r/0igqLsrVEV0ji6TEVv7jRKqXqVeARwMKwlb
	 WQ0wvyozHdDg2EQKy4NPt1cbaPyjriSFJ5snGQlNDwArsEPCHH+3PmY0GpveYzMlbrdbJ
	 8J0EMbmjLFiNioX+RFisND6qNTtrpfEvlUeclK2WmfaVdWXBlFvBBMs/5pNiqamK0Tw5x
	 vCbr1YtJiDPAmSIlv8X8FgFc9NW2CReJUY5hMOY9IPHkFWlpDcd8XzZ25J+XBmGUmcL2P
	 D99eu00osZTdxOLJo5AeAmJrGp1+p9fncySAyiAAwY8Q6CDDxNZOOI39GMfLHqjOR9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097932;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=F2QtB5pwjdPeOh4hIHJFS+b+zFty7GOmgO3yI9+d/A8=;
	b=DwRQ6dHhyJGRXULes7ntiBFV7omEKqQg49QV1TRsqBtnhuY2LSUy9TaGs+7/Qnp/s5Ug
	 LaBSXfdopgFXxjDV+FPFHlkG71RAMzOf2Yhk/vbJ27siCD46l5X2OLtTzIUqFtVwep5BM
	 KQVxWqiYZlkKS4s4nSx8xHq6peug2TCdrHHE6mnk02GjZkgc3icSLHqsvHMFtU1EQMcRW
	 nXvOTM3mcgwHf9Jy4AWyfgN9iA7tWg9EPjDtymTi0dzFoznGGGr4AQuWVoWBV9WN5mh3U
	 g7fG4dgv+ewSgbPuYp5MZfQh5/OfSILpiu1P4gXZXelX0cv8vLFUsjNOivelA1tAhig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nWXa7o98;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E047606A338
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nWXa7o98
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795097931;
	b=AWXoZucgCJpir/Gv4bThCitDqGp5k0j9m0PIyfWbEOATYJP/qZSD/hfs4eTdoB6V9/Ru
	 ZnIIRLe0d+KUxF8l4znMK4E4e+CWNSADNLfNdaGyBCJopr5vGlr1+FH+VwVW0+AKrBzWl
	 Bf71uETF+W7TFeC0sNAOilHVwqbEX1KTtRw3BfdBFQezeqYf9RgFcoQLQT2a7tniKM4Wu
	 AZ2r6FuMGTVrLa7jeCX7qOG9P4F3Fbwpcv01FQgnRsES1T7jayztCmNhJAsL4S9j6pxJv
	 GdWkALujUzZb3djQiOm5Kj/IFDn4mOJkwmpXpWCStVbUFKW7IZQkIilYFPNXlaf1bxg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795097931;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=F2QtB5pwjdPeOh4hIHJFS+b+zFty7GOmgO3yI9+d/A8=;
	b=yMttHO5LyH2OdlexQWsHgOd6kFyB4LDqvz+WUjc14YyD381HRar8j03M9z9g5hxEc9LN
	 U/h0Ppxg6/mvr/kTEWoGeU2pDc7z7rj7miO9my678vgK57VrS5xLoOHH0cG8vGmsoNnD5
	 2L5AfX1B1B4VhC9XTeJO64tcLlT33pb1y09vXHVv6f6KLwhryMWvr35dXKbZ+vOSPv6KU
	 LPmm9UaDbCN4PCRlKAUSpVucxhW3XirGyXypJYf9b11PLpv+Dl6uCWEbJMazSIcBUQ+TP
	 NGJtj1IzAwERL7MdRFR8rLOSGytW7AmwShuVWsVl+0c2jKKtmM+61HWsvqpumYwvRow==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6EF191F000C4;
	Thu, 19 Nov 2026 14:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795097931;
	bh=F2QtB5pwjdPeOh4hIHJFS+b+zFty7GOmgO3yI9+d/A8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=nWXa7o98LgAMVOM8aSHbl0hHnc4+SXlDg26vlVljuiA6swnmgl2zfFhreXsiZ8IFd
	 Gc4t5jhddxLdRG+/Fl429GmS7ON533HZXvaXGOaGPMKUWlWbqQG3NRFF72xo2QATTv
	 3zSUIKZdWD6HajPINCoXNZo8cK1MrcwNTCdph1/0h0sJ8TvCSToY642kB5KFqCfyuF
	 U9o29XLnCqwt4ySzKs6KkoajqEVyb6O4lDmu2tO4GiClW8Fx3RBYaafQ3C7WzoeH8B
	 HosSkYgb+fFgCwGkU6Y4XjWKU2bohYN0mK0y9RUlVPx7CFQ5WwG1HYeGWBfUQzksI9
	 NCJ4Va2YpYnJQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 01F7D4B2DB;
	Thu, 19 Nov 2026 14:18:51 +0000 (UTC)
From: Jakub Jatczak via B4 Relay <devnull+jjatczak.antmicro.com@kernel.org>
Date: Thu, 19 Nov 2026 15:18:45 +0100
Subject: [PATCH] usbip: Don't print port status error for full-speed
 devices
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-usbip-fix-v1-1-e6c04690115d@antmicro.com>
X-B4-Tracking: v=1; b=H4sIAEQF/2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0NL3dLipMwC3bTMCl1jEyNTS0vzRNMUcwMloPqColSgMNis6FgIv7g
 0KSs1uQRkgFJtLQCE5RM8bQAAAA==
X-Change-ID: 20261119-usbip-fix-3425997a5d70
To: Valentina Manea <valentina.manea.m@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, 
 Zee Yudenko <zyudenko@internships.antmicro.com>, 
 Jakub Jatczak <jjatczak@antmicro.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795097930; l=1347;
 i=jjatczak@antmicro.com; s=20261119; h=from:subject:message-id;
 bh=OS8UqiwHqBptFTeFSM2QQKndU+D8JiAutl3gaRQ0HY8=;
 b=DylVeDElqJMVpp2f6JinhL8i9vgioHQURK0gg2v4oqaXy1cB7wEK7K+8MDgrGKhGfA9fuudn3
 0Ls4bYkfewzC8yByy9zpxSiuafhQU1XA+WHD6xxr5p9ScDK1bAIOdGr
X-Developer-Key: i=jjatczak@antmicro.com; a=ed25519;
 pk=cNMAGqBjphJgwMUhAbseW6DasEAKdiJqPK/Zbl523Kc=
X-Endpoint-Received: by B4 Relay for jjatczak@antmicro.com/20261119 with
 auth_id=1572
X-Original-From: Jakub Jatczak <jjatczak@antmicro.com>
Reply-To: jjatczak@antmicro.com

From: Zee Yudenko <zyudenko@internships.antmicro.com>

When getting port status for USBIP, we only check for high- and low-speed
settings, but not for the full-speed, which causes an 'vhci_device speed
not set' error to be printed whenever a full-speed device is attached. A
full-speed device is the default status, so we don't need to set any port
status bits.

Signed-off-by: Zee Yudenko <zyudenko@internships.antmicro.com>
Signed-off-by: Jakub Jatczak <jjatczak@antmicro.com>
---
Patch authored by Zee Yudenko; I'm submitting it on their behalf.
Please direct feedback to me.
---
 drivers/usb/usbip/vhci_hcd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 39e8faf4c18c..936b98629921 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -480,6 +480,9 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 					vhci_hcd->port_status[rhport] |=
 					      USB_PORT_STAT_HIGH_SPEED;
 					break;
+				case USB_SPEED_FULL:
+					/* this is the default, no flag needed */
+					break;
 				case USB_SPEED_LOW:
 					vhci_hcd->port_status[rhport] |=
 						USB_PORT_STAT_LOW_SPEED;

---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261119-usbip-fix-3425997a5d70

Best regards,
--  
Jakub Jatczak <jjatczak@antmicro.com>


