Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF9637A85D;
	Fri, 21 Aug 2026 16:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328339; cv=none; b=KZJEuhfppBnBRCo4CeFYXr3p3QpPwQ4nZ0TxnlHtl4lyHtmS250eKzjJ2ydo7TW0IumNLYtEa8F60CFLtLy+FjQPNTTKT/j5iATy8Tk8QvZVP6GuybCbrGKYbsmPlfFNf+IgjBNLkvXQfed/+9V8ozlDb5PU/WfAFGZ0fQr1NIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328339; c=relaxed/simple;
	bh=wsxGeP7rgipdr+TKY4iho2X7a40FOLgC37V1bmceKCM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WOlg43ce/hTl8QUMiBSBQoPJwkNTHMXVbnps92cAeyCL+glVV/XLPHIypTt1lKsjkIx4CdQxzSIC4y8RzGUH8WgK1uaF8PrQIepfZrqXNE5o6wjzMngqzAYmidweOYKJ4lJqT7+41MUDQPnqJ+5sSYdhLRTE8BDpzkFmcKJcnso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 206e2bb89d7a11f19a56ed5b684f684d-20260822
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:4c2032a0-32c2-47ad-9f33-c5b4ab8ef752,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:dc744a0eddf5bf02a9c2bd0423ec7d5b,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 206e2bb89d7a11f19a56ed5b684f684d-20260822
X-User: lihaofeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihaofeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 576014764; Sat, 22 Aug 2026 00:05:28 +0800
From: Haofeng Li <lihaofeng@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: kees@kernel.org,
	mlbnkm1@gmail.com,
	christophe.jaillet@wanadoo.fr,
	raoxu@uniontech.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	13266079573@163.com,
	Haofeng Li <lihaofeng@kylinos.cn>
Subject: [PATCH v2] usb: gadget: f_printer: prevent OOB write in GET_DEVICE_ID
Date: Sat, 22 Aug 2026 00:05:17 +0800
Message-Id: <20260821160517.3439548-1-lihaofeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2026082154-estrogen-spoon-0a9e@gregkh>
References: <2026082154-estrogen-spoon-0a9e@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

printer_func_setup() services the Printer Class GET_DEVICE_ID request
by echoing the PnP string previously stored in the gadget's configfs
pnp_string attribute:

	value = strlen(*dev->pnp_string);
	buf[0] = (value >> 8) & 0xFF;
	buf[1] = value & 0xFF;
	memcpy(buf + 2, *dev->pnp_string, value);

The EP0 response buffer is exactly USB_COMP_EP0_BUFSIZ (4096) bytes,
allocated once by composite_dev_prepare():

	cdev->req->buf = kzalloc(USB_COMP_EP0_BUFSIZ, GFP_KERNEL);

The two-byte length prefix plus the string body must therefore fit
into 4096 bytes.  pnp_string is stored via kstrndup(page, len,
GFP_KERNEL) in f_printer_opts_pnp_string_store(); configfs passes at
most PAGE_SIZE - 1 (4095) bytes down to the store callback, so a
4095-byte string combined with the 2-byte length field makes the
memcpy() write buf[2..4096], one byte past the end of the allocation.

Attack chain (USB Printer gadget on the victim device):

  1. pnp_string is set to a 4095-byte value through the gadget's
     configfs attribute
     (~/config/usb_gadget/<gadget>/functions/printer.usb0/pnp_string);
     configfs accepts up to PAGE_SIZE - 1 bytes (fs/configfs/file.c).
  2. The printer function is enabled and the gadget is bound to its
     UDC.  An attacker in control of the connecting USB host sends a
     Printer Class GET_DEVICE_ID request (bmRequestType=0xA1,
     bRequest=0x00, wIndex pointing at the printer interface); the
     usblp host driver also issues this request on enumeration.
  3. composite_setup() -> printer_func_setup() -> memcpy(buf + 2,
     pnp_string, 4095) performs a 4097-byte write into the 4096-byte
     EP0 response buffer, overflowing the heap object by one byte and
     potentially corrupting adjacent slab objects or allocator
     metadata (CWE-787).

With KASAN enabled the overflow is reliably reported (this is
reproducible end to end with a configfs gadget + dummy_hcd):

	BUG: KASAN: slab-out-of-bounds in printer_func_setup+0x2ec/0x3c0
	Write of size 4095 at addr ffff88818e461002

Fix it at both ends:

  - clamp the string length to USB_COMP_EP0_BUFSIZ - 2 in
    printer_func_setup() so the copy can never exceed the EP0 buffer,
    and
  - reject pnp_string values longer than USB_COMP_EP0_BUFSIZ - 2 in
    f_printer_opts_pnp_string_store() so an oversized string is never
    stored in the first place.

---

The DeepSeek large language model assisted in finding this bug: it
helped locate the unbounded memcpy() in printer_func_setup() and
trace how pnp_string is stored via configfs.  I then reproduced
the overflow with KASAN in a virtual machine.

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 drivers/usb/gadget/function/f_printer.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 1857d786110b..4b28e73d35ca 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -1035,6 +1035,17 @@ static int printer_func_setup(struct usb_function *f,
 				break;
 			}
 			value = strlen(*dev->pnp_string);
+			/*
+			 * The EP0 response buffer is USB_COMP_EP0_BUFSIZ
+			 * bytes and the first two bytes hold the string
+			 * length, so at most USB_COMP_EP0_BUFSIZ - 2 bytes
+			 * of the PnP string can be copied.  A string stored
+			 * through configfs is at most USB_COMP_EP0_BUFSIZ - 1
+			 * bytes long, which would overflow the buffer by one
+			 * byte here, so clamp it before the memcpy() below.
+			 */
+			if (value > USB_COMP_EP0_BUFSIZ - 2)
+				value = USB_COMP_EP0_BUFSIZ - 2;
 			buf[0] = (value >> 8) & 0xFF;
 			buf[1] = value & 0xFF;
 			memcpy(buf + 2, *dev->pnp_string, value);
@@ -1269,6 +1280,18 @@ static ssize_t f_printer_opts_pnp_string_store(struct config_item *item,
 
 	mutex_lock(&opts->lock);
 
+	/*
+	 * The string is echoed on the wire by the GET_DEVICE_ID request as
+	 * a two-byte length prefix followed by the string itself, and the
+	 * EP0 response buffer is only USB_COMP_EP0_BUFSIZ bytes, so a
+	 * longer string would make printer_func_setup() overrun that
+	 * buffer.  Reject it here as an additional line of defense.
+	 */
+	if (len > USB_COMP_EP0_BUFSIZ - 2) {
+		result = -EINVAL;
+		goto unlock;
+	}
+
 	new_pnp = kstrndup(page, len, GFP_KERNEL);
 	if (!new_pnp) {
 		result = -ENOMEM;
-- 
2.25.1

