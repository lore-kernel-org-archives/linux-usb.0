Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180615;
	b=Cbuhg+gcpO/YzkbU8+fL7tNlKJH03dE/Sa3Rl5Ts1szIKhoMUtEWi56O8exavsEJmabs
	 C0V2jHG1AUCIsgVwDOtoBhe1FafMV4VCF0NmcyoqCsDQFp2TBCU9Ti8LRGNh8sxMGMz59
	 1CRo0oe/kYwjGlRSbIcRJsBN/uhYR5jlwhmSyPLc0DOk3SN0P7zxwmz6wGr3T3m9cRUtD
	 t0MobVGrJXDr6CvuTZ/rY509PP2Dlu8zuvweKYvOD4noMFO5lVuYKysxYa1bnk0iesMRH
	 zfE5JvNJQ1tD7TVnL5V9xsGYWzOosux/8li6AwKVn81EnWGl0FoOAyz1sxlhfG6WQEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Uik1EuYMBAB4IuJ3lkD8ogKL5A8K0R8JHX7Ne40Kvnw=;
	b=OY2nkNFm0U2Q9Fuo1Upv/EJw8IuiSgOy35ckc0SJrSpUPedubZaGuiKKekFXCifBQbyo
	 ha3nVlASmzRziHNr4xgy8oDZD8xn3VE9y34XYCCo+87ryeO14La2KEW2RNAiBePQhYKmR
	 zAk120VnfzWWO4G6+VRb+Nz/5Bvqh9D+ltRTWqHOrSVevg5WtKVqXYwxXDKe9UNDN0WHS
	 0fIsv3oMw3q8KZz/GJs7NU9WaliqndvA7lnVuWDVzgWYxFZFcZi2scJRfHDQXq1Oba0CS
	 lfXFv5xmZKrQFa8zDwXQhE4b5zaiP8Xmehl/Y1gAZI0Tav3Au6RMnSBLuBivea7ZTnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+xL8Olm;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F9E606A32C
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 09:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27F9E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+xL8Olm
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so5874685e9.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180613; x=1793785413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uik1EuYMBAB4IuJ3lkD8ogKL5A8K0R8JHX7Ne40Kvnw=;
        b=o+xL8OlmBVwp14ASpE2+HCEJsGeFsArqMQQFsxc0Dt29li2itU4avjU6MZ8shFnJew
         Evp3zVF/RMp6kmotUj16EHMxJjkLF3dHq1j7I4AEOAhwYf524PNo+5vyNw+62UJ/W4BS
         JIo/WJECdnwyY8FG8UaNFEUZfu8KIKNPDG5eSFMcO94snPnGVI54wWppMzaAVj7QpDpW
         aVfidSP0w5K0wNQMqIK18YuYiTMU7wrGUL4T7nXcne3ulULJHyJB3GBR2SGbDVA0c5Xm
         G0KzbPFNhIcW8SrEV4KF508zMVxHazWUjpDl9NS+VJVNUrWXMVx+NARAHsiRuRZf7N0T
         lZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180613; x=1793785413;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uik1EuYMBAB4IuJ3lkD8ogKL5A8K0R8JHX7Ne40Kvnw=;
        b=nXOWyKKUqiaenhMeMi6JNMU34Q0ai5KIN5V0SEBz7JnDFw2CnUieErzIkLagtHTepA
         3FuDo3cGJgSSfNcm3O+TR/zvt0isznpmy4/uFtPxrc3dWQ7Bgmp8XNUEHaPP91XVO5ZX
         pz1CGaBRslyb7EWzrHEFaBvb9qaa74FlkVS6Ks9L31kKNBz7QdHkhmFYieLklxMQIaCW
         bdsrhrSLmN3w1aYTIATgdS6CpoV5HkbRXXxpm0fTKqBYC3JtbYu8zvQz4+RUd3yjUoLS
         93TmU6y7mi07MToPYUx8+/XjUa7y9AxYLGShliuWhzZLvC/Ra9Ay+DY/3iFq5BBtrZgG
         Tgvw==
X-Gm-Message-State: AFq9FYJbXWp6zEFzqb10FKoy/kbbsVpHgt4ae3hH6tIPKaxOKJDM1xRa
	HrbzzDp89ZSI/i+hjGc6IrwJzmvGVbBWMKgE1UP0wmJPupmQIInEfHZo9bcnMgVS
X-Gm-Gg: AYBFou2oVuHxibuXeJTpf7DmoSwK7SQxP4zqYnvqb2jL97u7L9H/99OsGsAzCeITojO
	6satTHRwFlPqM88CE0ts9tYbIQtzTI7WPCODEaviaSb/Nc/GmeJVjYS8P3jpmhUzx4gi19kBgVm
	lvBufkaZs/LPPs5GkbSsQRoRAe4cBfP9oX75rAV7dnZbiLM/8h6nYXnUUkRMbn4Po2roXxnfcqF
	VyDmJgQIqihLVoDbP67Nx3alRdSYcvaGd6QK3PPtsnmci6D6dG4GrEaTOsohg9TkkbqMd/wGM1g
	skVgU3P2YVbnq3qPn2H6JmbecuX4KD5dpiHnV6r3wdZmgq/cDw2q0hQSduYA/nsVXBLZPr54f2+
	+BHEL3HwZ9tsOn1feUTu/r9Cp4l+9WDlsejYSWG7seYHbaJwbXX2Im/4YkXI3jy6Kd+Cn0GBSLg
	Ck5r7LkPGGlHfLqi9wouyPHZfv3VH4+VBGgSrhCFkiQq66L5bBD+hk0tgGpTaP1lJTMu7hx6nHY
	INPPcd8g2laBn2W9IaJ14tvH33DC2eWKX6RJZNjfAEoeqc09uF2Ob0aQWnDMriy+CM4Dv1u/7ic
	TBv0yQMB04feBu9Zr+GT2Stnk1RlqFmNnU0kLQrFKzHhjvNDLgK9vdFdL9E=
X-Received: by 2002:a05:600c:468b:b0:4a2:16c0:f5e with SMTP id 5b1f17b1804b1-4a965be6173mr31930875e9.10.1793180613431;
        Wed, 28 Oct 2026 02:43:33 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a978795f42sm37559165e9.8.2026.10.28.02.43.32
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Oct 2026 02:43:32 -0700 (PDT)
Date: Wed, 28 Oct 2026 10:43:29 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Nicolai Buchwitz <nb@tipi-net.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Relax high-speed bulk max packet size rules
Message-ID: <20261028104329.3d1c8029.michal.pecio@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Nicolai reported multiple dodgy high-speed devices still being made
which declare out-of-spec bulk wMaxPacketSize and actually require
the host to use it for correct operation. Apparently, Windows copies
this field to the EP Context verbatim and other Linux HCDs like EHCI
and DWC2 do similar things for compatibility's sake.

We are also aware of devices like astronomical cameras which use 1KB
to reduce protocol overhead, and audio devices with MIDI endpoints
that specify unusual MPS like 8 or 4 (the latter was full-speed) and
work with larger sizes just fine because they never do multi-packet
transfers where MPS really matters.

I found that sensible (power of two, 8 - 512) MPS are usable on many
xHCI controllers from vendors like AMD, ASMedia, Fresco, NEC/Renesas,
and VIA. Nicolai also tested two Raspberry Pi SBCs and a modern Intel
machine running Windows 11 and 64B endpoints worked.

OTOH, Etron rejects Configure Endpoint if MPS != 512. For such cases,
commit e4f47e3675e6 ("USB: xHCI: override bogus bulk wMaxPacketSize
values") sets HS bulk MPS to 512, which obviously breaks those dodgy
devices that perform multi-packet transfers with other size.

Problematic devices known so far use power of two MPS of at least 64,
so try to recognize them with this heuristic. Non power of two or
small MPS seems to indicate a clueless device which treats bulk like
interrupt and specifies intended transfer size; we will use standard
MPS here to avoid trouble with potential other HCs like Etron.

Reported-by: Nicolai Buchwitz <nb@tipi-net.de>
Closes: https://lore.kernel.org/linux-usb/20261020-fix-usbtmc-short-packets-v1-0-903f4d029193@tipi-net.de/
Link: https://lore.kernel.org/linux-usb/93d5aeb4-f1c7-9342-7bc5-4b277b4ec55e@veikia.lt/
Link: https://lore.kernel.org/alsa-devel/CAE-xCyPhrS6pgY0T9SG0TCubSi0CE2Yd5H=ttOzBmvgrR8fTPA@mail.gmail.com/
Link: https://lore.kernel.org/linux-usb/348c50de-f922-8295-ef87-cf5cdea5c7f4@gmail.com/
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-mem.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 83ed26c4f9e4..bbde39ccc4f9 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1473,10 +1473,22 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 	/* Allow 3 retries for everything but isoc, set CErr = 3 */
 	if (!usb_endpoint_xfer_isoc(&ep->desc))
 		err_count = 3;
-	/* HS bulk max packet should be 512, FS bulk supports 8, 16, 32 or 64 */
+
 	if (usb_endpoint_xfer_bulk(&ep->desc)) {
-		if (udev->speed == USB_SPEED_HIGH)
-			max_packet = 512;
+		/*
+		 * HS MPS should be 512, but Windows lets devices use anything.
+		 * Etron rejects MPS != 512, many HCs dislike >512 and a few <8.
+		 * Non power of 2 troubles Fresco, hopefully it means the device
+		 * uses single-packet transfers only and 512 will work. Some 64B
+		 * endpoints (shared FS / HS logic?) use multi-packet transfers,
+		 * so MPS must be exact. 1KB EPs are unlikely to tolerate less.
+		 */
+		if (udev->speed == USB_SPEED_HIGH) {
+			if ((xhci->quirks & XHCI_ETRON_HOST) ||
+			    !is_power_of_2(max_packet) || max_packet < 64)
+				max_packet = 512;
+		}
+		/* FS bulk supports 8, 16, 32 or 64 */
 		if (udev->speed == USB_SPEED_FULL) {
 			max_packet = rounddown_pow_of_two(max_packet);
 			max_packet = clamp_val(max_packet, 8, 64);
-- 
2.48.1
