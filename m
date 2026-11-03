Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749880;
	b=jazeCpoNlHNkmZUonEo++PtwyxGLmN9lybtv9dBto2BAygXuqCp+mWxmzHSWSGZq8zA9
	 n4eE0/Pjo/1G4EdGxeL6n2Ak5G7kGQFa4NpTmUpJYk70P11IWKU58FUMH+22KLOOhtfcD
	 nhXBthnC6R5NpSki87Jb0vy/PS1WIieO9H8Nth7rMbCLiI1Gk3bXnh3Bm/I9DuloG+arz
	 rB4LonGv44NUpD+rsb57rwYzax90+nHkrZDQ1AP2ARQlEFZY20t4hvqNYeX2L3YFmkfoJ
	 ipdlza37fn6D9VAY13YhlRr2RK09zf5FWhbGx0GRleUA4FASOIb9OE/z6Fem2AyfHuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HlYo3npPGUByceGrtIHjkrKEtKjClf+MQJt0+OILPSo=;
	b=He/zlJQOAu8duS5/VFPp+n0lrsgc+T4uiIOD5WMtF0sbuPC2yJhdg9EYjztk52iSwMem
	 PAio4JeEUf02Gn1KyVuwmLBBOiENgwfaWiSQ1Q3SuL881hmIEHBbcN206m2F8NVWV+Lic
	 B5SyQfUveCg6f7EDktXj7ze6Q35tTVVjgn6x7N9v+T+iGaEb/dUzl38Dy9i4wlPD5kioy
	 lMeJwtdKxmUJLVNh9ok8Rl8P9IchHIr9qKadQnzM+GybLGR2aBCJa+pLeYQDXW27ZeSKk
	 GJRAFHU0xlHktE0SwaSHmsuoz47iT6LtpFTIBRF+kczmTGW33EW7W+XTW0qb9/OHsLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sanglardf.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="m6dG/A2N";
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DB2606A31B
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 23:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6DB2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sanglardf.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m6dG/A2N
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so175025eec.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 15:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749879; x=1794354679; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HlYo3npPGUByceGrtIHjkrKEtKjClf+MQJt0+OILPSo=;
        b=m6dG/A2NsKVzxeDyOKO2PMtypyyYXjQhUti86iSKwUr7pTjmjlJYqElhhfP9bEIShM
         DL7nmovmsHGt393Jb+ab6O75RiOUvYTFt1epocYtzfU0v+8HEHb+kB8gE3pShMsmEFIl
         bpnlETXk3nS1EndI1WYzaUiqN+GbHOgw1N5eBarEZVphF5wnHo1LD5JgTRpiPohexCih
         SgcJDQDiu57wh0KpivyN7DvXOwHScocOKE+pxvP8uh8CnRVuIz34Z+oR77mzEKnbnv6f
         AjtKzwhNXZrGJlpZZTt2Tfcc867jdRteEo8c+jhw/2cuLWiEa9Vo/P3RYF6lDF3v7Cwv
         dKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749879; x=1794354679;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HlYo3npPGUByceGrtIHjkrKEtKjClf+MQJt0+OILPSo=;
        b=IJDAqL4Kx+CUrkfDXl9VxCKZK22EJN2HCpxvhw2JqzwG+MPLKess3DBJiulZ3hrqSB
         SxtvQEzGHb/f7lFGOM54kRj86UlDwLF9IWMF/D4FZqBF5I00z2DlwZSGekDrTL0vwlYG
         E3KpRfDCik6yONm6DFooyMIXUJj7eb/5LN3RcHTRZqYo6IqXfPogWxzVnVkYUiOav+hv
         qstmClP1LYJ6lw0UYNE9BRQsZxw+S/MW7aw41i0BE6mmOe0iahYjJe+qa0Pkf1FbeTJO
         X7lkKIc7y2AT3uNRaErsq7ow/L+5sGhc9SUh3g5X194M9SHKZAo3awuy18REwcMIm3OS
         lGHg==
X-Forwarded-Encrypted: i=1; AKwUvBwQdP0GDSg+vJronrmsQqsUdw5kzivFCc3KP8Mt9rV7sAOXyZJ8UlPvgISEB7m4CQsmliXSCoLdlfQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cL123SzayoRgfRsPTtjZgdAEIpfcPKkUn0KASLRfyqPUz9pCX
	awoS9devN/Qon1L9zMylIQSrFtIwtdpfd32jMsvQyIqHKqw/wGeCtFzhhWXW3OITRg3eqQVF+/h
	al7s7MmuIzutAK/6wHw==
X-Received: from dycc2.prod.google.com ([2002:a05:693c:60c2:b0:36b:fcaf:70f8])
 (user=sanglardf job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:88d4:20b0:36a:1e0a:accb with SMTP id 5a478bee46e88-36a4241bcccmr22600419eec.35.1793749878549;
 Tue, 03 Nov 2026 15:51:18 -0800 (PST)
Date: Tue,  3 Nov 2026 23:51:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103235115.3991801-1-sanglardf@google.com>
Subject: [PATCH] usb: core: Emit KOBJ_CHANGE when usb_reset_device() succeeds
From: Fabien Sanglard <sanglardf@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Fabien Sanglard <sanglardf@google.com>
Content-Type: text/plain; charset="UTF-8"

When usb_reset_device() succeeds without re-enumerating the device,
userspace receives no device-level uevent indicating that the reset has
completed. For usbfs clients such as adb, usb_forced_unbind_intf()
unbinds the interface before the port reset, and device_attach() leaves
it unbound afterward because no kernel driver matches.

Since usbfs suppresses uevents on interface claim/release, userspace
receives UNBIND(intf) before the reset and no event when the device is
ready to be re-claimed, forcing it to fall back to polling /dev/bus/usb.

Emit KOBJ_CHANGE on &udev->dev.kobj in usb_reset_device() when the reset
succeeds, after usb_unbind_and_rebind_marked_interfaces(udev), so
userspace is notified (with DEVNAME) once the reset and all kernel
interface rebinding are complete.

Suggested-by: Oliver Neukum <oneukum@suse.com>
Signed-off-by: Fabien Sanglard <sanglardf@google.com>
---
Tested across snd-usb-audio (no pre/post_reset), usbhid (with
pre/post_reset), and usbfs (adb) using udevadm monitor:

Interface driver                Uevent sequence on reset (ret == 0)
--------------------------------------------------------------------------
Kernel (no pre/post_reset)      UNBIND(intf) -> BIND(intf) -> CHANGE(dev)
Kernel (with pre/post_reset)    CHANGE(dev)
Userspace (usbfs, e.g. adb)     UNBIND(intf) -> CHANGE(dev)

Discussion: https://lore.kernel.org/linux-usb/20261012171609.88273-1-sanglardf@google.com/

 drivers/usb/core/hub.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 199d3f535..9b3835ced 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -6447,8 +6447,10 @@ int usb_reset_device(struct usb_device *udev)
 		}
 
 		/* If the reset failed, hub_wq will unbind drivers later */
-		if (ret == 0)
+		if (ret == 0) {
 			usb_unbind_and_rebind_marked_interfaces(udev);
+			kobject_uevent(&udev->dev.kobj, KOBJ_CHANGE);
+		}
 	}
 
 	usb_autosuspend_device(udev);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.385.gac671c819a-goog

