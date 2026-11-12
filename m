Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466577;
	b=Rm0NDCq4ftzD/BeFVHOaCGkadut1HJFU+ahIkq2Hzw/lyKnrIEd5HdOF2Lq56RJMrtDk
	 eMatYLBrEygH6ObPWsKknNEoJks1Qct7bKiX8uCV3SsHA813zdEhNOpgJZo0mcjCOTAOl
	 04+Qy+asCBUHN4XAmmhrU5lQ86D1hYwj/u5GinzjHd7wbpEYUAoYys/ibUkOUyYSx99TK
	 Q5KcbVNax6vaViSdY/7Eu/U/ORrpxqfZBFW2tHaLSz7pUbJLV8ufHQb8X4izzlmSfYCHH
	 PuEgU3+EWbdJmg/n7KByjeBgJXlZ8Ah4X23OAtmYhxGRzMc2K7SPWEZIokKPN8S+4nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R8u1ixJmi7TH1leov+iud2pI+lutflCpqRALV1qurqM=;
	b=2XgGM0Xi7Rnc8qXhiP2Tis/izzaxbvu9UDqL6l89jkwfrdYYfzIWfBIu1uwAQ2A3BgM5
	 MQ+Qy1qwadA5QZQUVmEQ4V4uCZZ6OBlvHbISLaDbIsQH9zRrsn22ULI5iV4nr5x2qgx5o
	 rknESFKhKtQqoM8JcmrFlZzl/oMspaEnwJV3+ZR4tikFtw1yquwqEFIaiE00mty0ZuUiu
	 SLBqihWEWpaJey41JwfSKzuOmSLomXI7FkF+CDwHonHXYmqVtz3UZic4MAndVu4LYr6Cr
	 0rwFOMn1D2KkSug2ZcIWVSLMhvd4n5CfZJ3cwg40WxAR1undYHNDDFM/nv8Vv4Wpx6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cE219Tvo;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260BD606A323
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 06:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 260BD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cE219Tvo
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e55db58cfso357808985a.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 22:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466576; x=1795071376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R8u1ixJmi7TH1leov+iud2pI+lutflCpqRALV1qurqM=;
        b=cE219TvoeGWM7xjel8oXWWtPj89dTmLMtC0qCaJuJjc37uvQVOl/km/Hpzd3Yuo9Vs
         tUcXKSAAefqN7AyG2gUALa6hoEtNTg8+LiW/m7O1+u/mPPyhOKTkd5xYDgmNdzNgmjBO
         VjG0vVQCgznEB0gWSwHQSUv/ijROn1tGO39PBupfW8QjbrviCn5vxLg7QEhrhi8xIXII
         K+UTEGkKjJZyP3S3MZQG7HlD5or5Wc6nCoeSDb4OlKd6EMtcIETigZc/h1O6ODEeGFIY
         DWmTRwrxAJuFcZzwQuT2y+Ij3pCOZr5+iQ5z5jKgM1W35j+xupY3VTqEwzcGtwccm4oU
         UgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466576; x=1795071376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R8u1ixJmi7TH1leov+iud2pI+lutflCpqRALV1qurqM=;
        b=OCyoAnZTj23LKo/1FXXVB9QCfgpmhvMyvlA66I8JfKWMOtxGe9XjGfdOMJ60RNXwHE
         L+XDtljlDCk3Hkc1cZFjEhkBPF35kW+4e0tW+Ds2UTOd6CrLfVCDCdSRMfeeNWj8Ooy2
         UO/ibASVlRRrvgmWtOTMopNl+1+2K423XtM3tXnGCJgr5gr4V5/eUrqntTIU6Y6JS7/u
         9nBQBLd5t+PliIL9Tq/8UpuqbW+pfWIZcLWODGq9YcgIqKNZYC62HcdkAxPO6vvMXoSz
         XiZ+seCPPiVRxSKbWZ5wKSGRu7fKzo9sA+GDVKZt7/5O//AsA92Uh/Y1PkKmHryVArMz
         EaVA==
X-Forwarded-Encrypted: i=1; AL+hErHJwaZUP0DJAAa/hNYQ3mxnDl9rUD+/zayrtgl9UzW9nuE40Uyik7HdNWrWu7I+r8e7rH07rnhHHRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c8UPscKhkm95fZ3+hVTlFKkYM6IaYUg/G+nEJyuoen9J3JAsv
	uv1ycYqlCaAFlkxXQOscMnOtY2/kEUNjJCLZ4XOZgB5np2DRu3ii8Qw=
X-Gm-Gg: AYBFou2pws5D0UsKJgC0j6ppcOlGN7PKxY8hVba12/ziOc9DKQXFfVPGcjHvJF7LGCW
	a9tN9GbPoxhAeMshPTwxBZpyCiKXMz6fr1TsMdzFoWTGqR0aywNRpllPR9A/r5fwd2Zi57sdd/N
	6sfYf0QuuHt6yaf0IQ6jsCgtP1x69uAHHRud6jYQPxb51i5b1ls17QQzn8fizcoikhyRP4b5UB+
	t38d3sbp9WW/cYZiNqtovbeH9t+hgQS/Rjvea8ELHQ25IFahiBMoXPpIX0CHy7bX09VN9+AJxKv
	IYoZl+JsLAZKGIzlF0PD21xf8cQ8VKYJYvl/XqJ3mI29/6zxpvEAVvdg4B7Zl8zKcDh3TfhfCxc
	jG/lJl60guVgRR2O8BFZ4Fqhsx4najt2CyBFx81QjOt7MUTIYOBNth2mfxHUo9Pp0+E/XdtWoVK
	RhFzknQE7dltdM/aaTiS+agTedda+d94EBL+ve7cg8D6l4MJVxOGGRxubUvbpbbejqGb5sm4hFx
	CUff17oibtNbOAWqYlg3GoDaURg8PSRFux1B4oqHGpSjOP6urGZQdrk2JFQ6/rOludN769WcXI8
	WTHTVeocjc+Ma0sk/xRMMGSZWiSkrLiJDedCI/EtmVfxm5g/SteqUqaUL1AV1D6PZ/tmHhBZmwE
	o+xY9BfS4q7O00oiFaD4jzldNSRg9C1s5SSHDiKvD/726RhdnjWeT0HAg/Fu0OoVeUH2u+VMDxS
	PHZYGj5BtJcUuDSLLntfPmw0DuKOUO9piG
X-Received: by 2002:a05:620a:1a26:b0:946:f22d:1efc with SMTP id af79cd13be357-947b0049770mr887965685a.67.1794466576048;
        Wed, 11 Nov 2026 22:56:16 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e76b1c3sm663813885a.16.2026.11.11.22.56.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:56:14 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: hd3ss3220: disable the interrupt before unregistering the port
Date: Thu, 12 Nov 2026 01:56:13 -0500
Message-ID: <20261112065613.34182-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

The devm-managed IRQ remains active while hd3ss3220_remove() unregisters
the Type-C port and releases the role switch. A cable event during unbind
can make hd3ss3220_set_role() access either resource after release.

Disable and synchronize the IRQ before teardown, matching the existing
polling-work cancellation. The ID pin IRQ needs no change: its GPIO and
regulator are acquired before it, so devres releases that IRQ first.

Found by a static analysis tool under development.
Not tested on hardware.

Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 drivers/usb/typec/hd3ss3220.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 60d6de9ba339..19c5dbdc97a1 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -554,6 +554,8 @@ static void hd3ss3220_remove(struct i2c_client *client)
 
 	if (hd3ss3220->poll)
 		cancel_delayed_work_sync(&hd3ss3220->output_poll_work);
+	else
+		disable_irq(client->irq);
 
 	typec_unregister_port(hd3ss3220->port);
 	usb_role_switch_put(hd3ss3220->role_sw);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0

