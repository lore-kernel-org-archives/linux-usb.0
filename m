Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633293CF1E3
	for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 08:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784275643; cv=none; b=k4sTc0efY7N8Epg60cWwviUzN7syZSGsvYINmVeoji0ygNYAY02c98cqLdqjjaDnDOaL+Ivp87O7cM3YDrGJBPPasAV9i8MdmO0GvcJcyVBa/oJ7xoJ43N3k+YARybuDyL97LSBwLrUGfRNIjA5NBJhxB7xZYOgd7j8G7+/QFXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784275643; c=relaxed/simple;
	bh=L+2PIl9c91cGPKqFh5rawFvpSlD16Mcp4ipH690q0yU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NMeHxiet6WEl1umC+JEk22JS3n02GWQ6kycmqUD23PQFmrfQy8k/ro0iEeVd/rUJXv0ShRInZBmm22k0UArDvkCMxa5EaQd87uMGY8Os+NMMCbwSANLMoDYRetijbjKfqs3C2xpPp2RxSxQ5JKuzufRmdA5gm7VvNtZNbDr7Ocs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVq0Iacr; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVq0Iacr"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6a37e8b3725so2567770eaf.3
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 01:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784275641; x=1784880441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bUD8b/O4I8LwhV5Q1VRQ5q+jG0xHp0fGcr6yD3Cz0hU=;
        b=cVq0IacrErL/Zb/LfUZklGwsbXFjfjXseBYZkhQJ4m5/Xe5NpHOQg8o9Y3QG6tCvju
         y3AD6G2lIEIFutgEbWFlitiL9MdeKo9yvslvPpIbCLS5fROPD4ogYYF3YarxE648aKTR
         SW7p0FFvzN8Ua1udnJ3f6tEsZzQtomGgB0pSqpEssfTkI6gPfzCbM55gUoSTWP4WKKm4
         QccO2h08jRuxXfEpjrnQqygIucaqk4hFzlw4FALuT/torxoN6lu/ZtUVNxoONzCl1gX4
         u+9RIWppcUa+pUOJvqwPLff/4np+mLAAdVJTZNk6XnXcB4r/OgwAGw3Vfrmg0xNIzOCX
         f+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784275641; x=1784880441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUD8b/O4I8LwhV5Q1VRQ5q+jG0xHp0fGcr6yD3Cz0hU=;
        b=nnH/CUXLVxJERORizaO01Q4linyugY+2fbUxLnM66GkdL+MJYGjaEPzelkbb1mtugW
         tOzhzB4y0qKtnAe4OI+i35WwkEZ+TJFmjs51yu6Urb7ew2g9DLDqwFV+ejpTTRa6SMSC
         ac1Iyf5Uf7BleVUIJylAQxz9DF9VoSUVRWGhCJXZi0QAJG94GH8TUWGU/JxBmONz0JnL
         xvQ/+Y24jhD3SHz8sOByPbxdWKQ6eqX0ftiKbllTumzQWz20dB1gf/PhRzLQtUIkPoD6
         aNIxrG+mg0s7/wjSxLy+nyBmh54OovrYydN5bpRUPiEPa7oC8A4QbdlKrEMyNizEJaC/
         97hQ==
X-Forwarded-Encrypted: i=1; AHgh+RrqHInY+ML5Vu2C8m2Dj5QvBwbL8Bzy419dtxrEoucfAR7pDPi8YIj33QyU27sf0TgqehVw35QarG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YybbQSzfEHxnuPrJX+iA0fZ00MRmEWrtbP8TuUoqFh5CmmpJXU9
	2G2mtx/gx/11dMbiMmk/DZpZJKSAkM9dGNu+y8gwUw1u+XveX1JYmyl7
X-Gm-Gg: AfdE7ckKgZZOgc6ilCwn0CIaoeoh4vHDLs87dyp6GD3Ha8KVE0ipCBj3s88R8UPBU0W
	G9L7WJd120Z+bgeM0p+ttnE/3gFL33KHMKGfwKt4tJFhl+pPh+pw5bIwhJulnUoRDoxrC9NB1QS
	1DwT95YBkLl3Hsz/o39CuHzBTAVTQ3+tfZaREO7/Okd/GID2DkM6BUN6tci/24IwDCHuhA4377J
	sYdUtvlQWYKq01qNl1iYzxvjiCpK1LpyJcM8yNDavcxPoyy8MM8C6Z0d7T5VJigNQtH0HF/3q2C
	w5G7SvE+0TAVM3txx3GJbIHBwimBlnSmwwlOm3khtxfvnV75JdHl/lB1Gff6YwfV4+JcXUSSIxh
	XyyNqu8Cv3TI77DwA4c86nLmMaw5QHLDX4GPQIxFskNU7sWIs0mZYFgJsNmcRPP+w3DVoZUmD+G
	Unr1sEcqvaUEDa
X-Received: by 2002:a05:6820:1523:b0:6a3:f5e9:8e45 with SMTP id 006d021491bc7-6a53669164emr611027eaf.1.1784275640951;
        Fri, 17 Jul 2026 01:07:20 -0700 (PDT)
Received: from capidev ([2806:264:548c:900d:4433:c2f3:888d:435c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4568da4ab47sm923890fac.0.2026.07.17.01.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:07:20 -0700 (PDT)
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
To: Matthieu CASTET <castet.matthieu@free.fr>,
	Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Chas Williams <3chas3@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauricio Faria de Oliveira <mfo@igalia.com>,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>,
	syzbot+e62a973f8322b3bbe3ac@syzkaller.appspotmail.com
Subject: [PATCH] usb: atm: ueagle-atm: reject descriptors that confuse probe and disconnect
Date: Fri, 17 Jul 2026 02:07:04 -0600
Message-ID: <20260717080704.1264-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Antivirus: Norton (VPS 260717-0, 16/7/2026), Outbound message
X-Antivirus-Status: Clean

uea_probe() distinguishes a pre-firmware device from a post-firmware one
using the USB id (UEA_IS_PREFIRM()), and stores a different object as the
interface data in each case: a 'struct completion' for a pre-firmware
device (to be waited on in .disconnect()), or a 'struct usbatm_data' for a
post-firmware one.

uea_disconnect() instead tells the two apart by the number of interfaces
of the active configuration (a pre-firmware device exposes a single
interface, ADI930 has 2 and eagle has 3), and casts the interface data
accordingly.

Because the two handlers use different criteria, a crafted device that
advertises a pre-firmware id together with a multi-interface descriptor
(or a post-firmware id with a single interface) makes them disagree: the
small 'struct completion' stored by uea_probe() is then passed to
usbatm_usb_disconnect(), which casts it to 'struct usbatm_data' and takes
instance->serialize, reading past the end of the allocation:

  BUG: KASAN: slab-out-of-bounds in __mutex_lock+0x152a/0x1b80
  Read of size 8 at addr ffff8880470e2c60 by task kworker/1:2/982
  ...
   __mutex_lock+0x152a/0x1b80
   usbatm_usb_disconnect+0x70/0x820
   uea_disconnect+0x133/0x2c0
   usb_unbind_interface+0x1dd/0x9e0
  ...
  which belongs to the cache kmalloc-96 of size 96
  The buggy address is located 0 bytes to the right of
   allocated 96-byte region [ffff8880470e2c00, ffff8880470e2c60)

Reject such inconsistent descriptors in uea_probe() so that both handlers
always make the same pre/post-firmware decision.

Reported-by: syzbot+e62a973f8322b3bbe3ac@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e62a973f8322b3bbe3ac
Fixes: e2674dfbed8a ("usb: atm: ueagle-atm: wait for pre-firmware load in .disconnect()")
Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
---
 drivers/usb/atm/ueagle-atm.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index 4e71ed679a76..4266a0cb7e3b 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -2549,6 +2549,7 @@ static struct usbatm_driver uea_usbatm_driver = {
 static int uea_probe(struct usb_interface *intf, const struct usb_device_id *id)
 {
 	struct usb_device *usb = interface_to_usbdev(intf);
+	bool single_iface = usb->config->desc.bNumInterfaces == 1;
 	int ret;
 
 	uea_dbg(usb, "ADSL device found with vid (%#X) pid (%#X) Rev (%#X): %s\n",
@@ -2557,6 +2558,22 @@ static int uea_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		le16_to_cpu(usb->descriptor.bcdDevice),
 		chip_name[UEA_CHIP_VERSION(id)]);
 
+	/*
+	 * uea_probe() decides between the pre-firmware and post-firmware case
+	 * from the USB id and stores a different object as interface data in
+	 * each case: a struct completion for a pre-firmware device, a struct
+	 * usbatm_data for a post-firmware one. uea_disconnect() instead tells
+	 * the two apart by the number of interfaces (a pre-firmware device
+	 * exposes a single interface, ADI930 has 2 and eagle has 3). A crafted
+	 * device advertising a pre-firmware id together with a multi-interface
+	 * descriptor (or the other way around) makes the two disagree, so that
+	 * usbatm_usb_disconnect() treats the small completion object as a
+	 * struct usbatm_data and reads out of bounds. Reject such inconsistent
+	 * descriptors so both paths make the same decision.
+	 */
+	if (UEA_IS_PREFIRM(id) != single_iface)
+		return -ENODEV;
+
 	usb_reset_device(usb);
 
 	if (UEA_IS_PREFIRM(id)) {
-- 
2.43.0

