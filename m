Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645739;
	b=4CRv9FxbbyfxUW3T/0j7kgSiN0e6QmeBQSF0HCIIn2+Xp6WJQsbML/mYOTevPOgJef74
	 Jgk73mMSJrl0kNr/sLyixMahaKm1cQbqi6bjrYsmvc8jcc6eUjQYi5iuPKcm5yBAgymTy
	 tR94RYoSeNhxA3Jy9SFllrhvfDYH/KuxkAXF+xHB/KKbkObId6sMYhxwS2w6J9AcHV2YX
	 HXlMgkGeLl5R4XeYw6j4E5/uDNIquxH6PiSqaZvIAff5gdhzhi+rCfQWdYOZwNoG/3VH5
	 saLNmk7NgZntjAU47/fzl5qxn4Ipcu2n+6lJ6FGwtOBXZSklSTvAiPLFGLHJSGnJeGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=sLJgVW+/Vd4As4viT9lUZGKhVy1YU+uNFIGupA5gILQ=;
	b=nbZGM3o3DxaOYYJSqlmIEGJZzeSNl2dB69/Zd5M6Ia1zW3CaJsHlqPRTf/eDzL2ATOJl
	 cFeKWkCu4P7yvOXqF3mNeSW+pz88YWrdOxUa3Xws7UKWeLojWnJMI20/F/yvll7tbw1Zu
	 6cTsHWaABqSCchTyXvouCopLHeZqcqy+sovwWrHkDgQxDFizKWMpQ6Idyu5faFvsg0lLN
	 UOgb/Pqr2I6GJ9T9Dew8LVc4FHbHPHYAeYMg6LD2j6DIx8Ttlz6SXh8IEIyN+HP0rbdqv
	 bCksw1vgk1f7cQBvHu9LkTkYTGGtPFOFwdbsNgrMrieUze9/rRjRlsiALsV7AHHfudw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NYowGDdS;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B48606A689
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 22:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B48606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NYowGDdS
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so7338541eec.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645738; x=1796250538; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLJgVW+/Vd4As4viT9lUZGKhVy1YU+uNFIGupA5gILQ=;
        b=NYowGDdSdLeXb0RUxZvRQ51HbdN+GM5GWA4aLQem06pYn+ezmdLGgdGAvEqlJ6ZPxW
         OL5yE1CdnxCY9+AP1eDKUYQ+1D112KINZOyMWLliNlH0RTjlFosYEflHFbBTYKCWSBgW
         9sqi6daSKH1rBfDgDEVyN/d4sc8Knv8r22U2ayMPHn1CldCcTWn8UL49D6pjpJj3tzeG
         Nc+S4sMCcnJoac4k78L6ge3ySK3fCOAWl4AAcPoUYF8gx01CAiXyvCRZOHPxkRoBgLwC
         59VmQcfK8+Iz3zJW2+HjpZD3ZaXzc7bEyLlEVwjejQyUpJlELsfN94bzSvvPQAPviclL
         oy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645738; x=1796250538;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLJgVW+/Vd4As4viT9lUZGKhVy1YU+uNFIGupA5gILQ=;
        b=gurFTz2LROaIoxyOpN2ILfCJ4oijtFFj9+KdqwFqUxZnjxqnxzS+sNHpzh3vfYeYzY
         akASYEnib46pBnvZ4zDvyoCsrHQ8OmC8azityJjUOTCxuCO6p67hpuHZTX9+aqXazFtK
         ICblVborOaks/DGsEih0wkqapCiZEPu+Gytn1C7IrnwZ3B0g51wbpaxDYPqSQqo8f7GM
         0LWxBpKrADYRLf14YEjIiWoP+5pV913dmAy/rSwR7Dvd3mM4OiqEDJ241WpzRPmjpG+t
         DOUU/1Ooxo4GhTI0p6QqJ4pvH6uWIiZQgtthp9BYYrIxxTJA6OzJ3gxajNCj2IOlQVak
         WPPA==
X-Forwarded-Encrypted: i=1; AL+hErGKsr5NEaaE1smTgrYVNA/l0WosmzUHsl3fFOLJzq9/n3kMScaw9sf56ijPBZ+84Ui7qHr+es41vCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RcfKaXJhqWbqwgd1A73RSxsHnDxQSHJPoB3wBub/pqexEuGFb
	9Io9OV+9/gY1iHRhmwe4+ADKZPS6dEI1RMtvJr+INbQMHEF2Mzcn0I+IRTL5aP47ooP2Bnv6hWF
	+5A==
X-Received: from dycnm14.prod.google.com ([2002:a05:7300:d18e:b0:386:2134:b328])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:1c1b:b0:386:9d31:2d18
 with SMTP id 5a478bee46e88-3869d313208mr14179933eec.0.1795645737640; Wed, 25
 Nov 2026 14:28:57 -0800 (PST)
Date: Wed, 25 Nov 2026 22:28:28 +0000
In-Reply-To: <20261125222828.1452483-1-elkin@google.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125222828.1452483-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222828.1452483-3-elkin@google.com>
Subject: [PATCH 2/2] usb: misc: usbio: validate endpoint maxpacket sizes in usbio_probe()
From: Elkin Cruz <elkin@google.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

usbio_probe() allocates ctrlbuf, txbuf, and rxbuf directly from the
USB descriptor maxpacket sizes without verifying that each buffer can
hold its packet header. A malformed USB descriptor with a smaller
maxpacket size causes unsigned underflow in length checks and buffer
overflows in usbio_ctrl_msg() and usbio_bulk_msg().

Reject devices whose control or bulk endpoint maxpacket sizes are
smaller than sizeof(struct usbio_ctrl_packet) or
sizeof(struct usbio_bulk_packet), respectively.

Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/usb/misc/usbio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
index 6142a32c18a9..c9f22b600333 100644
--- a/drivers/usb/misc/usbio.c
+++ b/drivers/usb/misc/usbio.c
@@ -591,6 +591,8 @@ static int usbio_probe(struct usb_interface *intf, const struct usb_device_id *i
 
 	usbio->ctrl_pipe = usb_endpoint_num(&udev->ep0.desc);
 	usbio->ctrlbuf_len = usb_maxpacket(udev, usbio->ctrl_pipe);
+	if (usbio->ctrlbuf_len < sizeof(struct usbio_ctrl_packet))
+		return -ENODEV;
 	usbio->ctrlbuf = devm_kzalloc(dev, usbio->ctrlbuf_len, GFP_KERNEL);
 	if (!usbio->ctrlbuf)
 		return -ENOMEM;
@@ -609,6 +611,8 @@ static int usbio_probe(struct usb_interface *intf, const struct usb_device_id *i
 		usbio->txbuf_len = 63;
 	else
 		usbio->txbuf_len = usb_endpoint_maxp(ep_out);
+	if (usbio->txbuf_len < sizeof(struct usbio_bulk_packet))
+		return -ENODEV;
 
 	usbio->txbuf = devm_kzalloc(dev, usbio->txbuf_len, GFP_KERNEL);
 	if (!usbio->txbuf)
@@ -620,6 +624,8 @@ static int usbio_probe(struct usb_interface *intf, const struct usb_device_id *i
 		usbio->rxbuf_len = 63;
 	else
 		usbio->rxbuf_len = usb_endpoint_maxp(ep_in);
+	if (usbio->rxbuf_len < sizeof(struct usbio_bulk_packet))
+		return -ENODEV;
 
 	usbio->rxbuf = devm_kzalloc(dev, usbio->rxbuf_len, GFP_KERNEL);
 	if (!usbio->rxbuf)
-- 
2.56.1.839.g22a8290db9-goog

