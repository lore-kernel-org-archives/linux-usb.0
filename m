Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECCB32B13B;
	Sat, 22 Aug 2026 20:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787430430; cv=none; b=Pp885HY7dxI9RpI16FS/9Y47LO8FBtIkwSCmOxsA7zeg1HNtFFJGS50ojs4lFgDyxEjMIxTqmYiOOvQxpuzSFLf8AJBp5eK4jVCTX/FvMQQetQ0UqpxgToyv03LLQnNimK5WV5eOAzdJzSPaBk4wxBsgtAMpoVJmfcQd8y6+vKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787430430; c=relaxed/simple;
	bh=Jne0vSjTk8urRwY5DnbFtjbr5xlZHXztOyzs97q4oQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dIYLrqYF1RS0v77X2N9gTIZQaQPB5QLHajfkAR5pUTme9sl6LdOP1oRinsfN2zUVV6phqRRD6K4LmcbPof8ul760OJ3r2VfOvjoRXEuSJesYOLSSBtC9bIbjZxiNOHcAYoM27VAI09L8eEgWWpvXuwCLSjMHxlXhhhpOCXGVMZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d615d66c9e6711f19a56ed5b684f684d-20260823
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:90de4038-0780-4861-a7bc-a714c868c02c,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:9ba4a6d5fb5dd4ba335854e6e60fc36d,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d615d66c9e6711f19a56ed5b684f684d-20260823
X-User: lihaofeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihaofeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 547001008; Sun, 23 Aug 2026 04:27:03 +0800
From: Haofeng Li <lihaofeng@kylinos.cn>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	xu.yang_2@nxp.com,
	Randy Dunlap <rdunlap@infradead.org>,
	hhhuuu@google.com,
	kees@kernel.org,
	kai.aizen.dev@gmail.com,
	andriy.shevchenko@intel.com,
	christophe.jaillet@wanadoo.fr,
	dan.scally@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	13266079573@163.com,
	Haofeng Li <lihaofeng@kylinos.cn>
Subject: [PATCH v2] usb: gadget: f_uvc: fix Extension Unit descriptor heap overflow
Date: Sun, 23 Aug 2026 04:26:59 +0800
Message-Id: <20260822202659.4168893-1-lihaofeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260822194705.4151650-1-lihaofeng@kylinos.cn>
References: <20260822194705.4151650-1-lihaofeng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An Extension Unit descriptor is 24 + bNrInPins + bControlSize bytes long
(UVC_DT_EXTENSION_UNIT_SIZE(p, n)), where bNrInPins and bControlSize are
configfs attributes each accepted over the full 0..255 range by
kstrtou8().  uvc_configfs stores the computed size in the u8 bLength
field of the descriptor, so once 24 + p + n exceeds 255 it silently
wraps: p = n = 255 describes a 534-byte descriptor with bLength = 22.

uvc_copy_descriptors() reserves xu->desc.bLength bytes per Extension Unit
in the descriptor buffer it allocates at bind time, but
UVC_COPY_XU_DESCRIPTOR() copies the real descriptor contents, i.e.
22 + bNrInPins + 1 + bControlSize + 1 bytes.  With the wrapped length the
copy overruns the allocation by up to 512 bytes.

Attack chain (write access to a UVC gadget's configfs attributes; no
race, no USB traffic, a single bind triggers it):

    echo 255 > .../functions/uvc.0/extensions/ext.0/b_nr_in_pins
    echo 255 > .../functions/uvc.0/extensions/ext.0/b_control_size
      -> uvcg_extension_b_nr_in_pins_store() /
         uvcg_extension_b_control_size_store()
      -> bLength = UVC_DT_EXTENSION_UNIT_SIZE(255, 255) wraps to 22
    bind the gadget to a UDC
      -> uvc_function_bind() -> uvc_copy_descriptors()
      -> kmalloc() sized using the wrapped bLength: 22 bytes for the XU
      -> UVC_COPY_XU_DESCRIPTOR() writes the real 534 bytes into that
         slot (22-byte head, 255 baSourceID, bControlSize, 255
         bmControls, iExtension)
      -> heap out-of-bounds write during bind

Reproduced on 7.2.0+: a stock build (FORTIFY on) can derive the remaining
allocation size at the bmControls memcpy and BUGs in __fortify_panic()
during bind - a deterministic kernel crash; with FORTIFY disabled for the
file, KASAN reports "slab-out-of-bounds Write of size 255" in
uvc_copy_descriptors() against the kmalloc-192 descriptor buffer.

Reject combinations whose descriptor does not fit into bLength at all four
configfs entry points that can grow an Extension Unit (b_nr_in_pins,
b_control_size, ba_source_id, bm_controls), and make uvc_copy_descriptors()
refuse an Extension Unit whose bLength does not match its contents instead
of overflowing the buffer.

Fixes: 0525210c9840 ("usb: gadget: uvc: Allow definition of XUs in configfs")
Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
Assisted-by: opencode:deepseek-v4-flash-free
---
Changes in v2:
- reword a comment per Randy Dunlap: "The descriptor length must fit
  into the one-byte bLength field".

 drivers/usb/gadget/function/f_uvc.c        |  6 ++++++
 drivers/usb/gadget/function/uvc_configfs.c | 25 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 73dc7e42875f..0d3432f80cae 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -598,6 +598,12 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 	}
 
 	list_for_each_entry(xu, uvc->desc.extension_units, list) {
+		/* Mismatched bLength would overflow the buffer sized after it */
+		if (xu->desc.bLength !=
+		    UVC_DT_EXTENSION_UNIT_SIZE(xu->desc.bNrInPins,
+					       xu->desc.bControlSize))
+			return ERR_PTR(-EINVAL);
+
 		control_size += xu->desc.bLength;
 		bytes += xu->desc.bLength;
 		n_desc++;
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 70a1415ea401..d5ba9c409983 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -845,6 +845,15 @@ static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
 }
 UVCG_EXTENSION_ATTR(b_num_controls, bNumControls);
 
+/* The descriptor length must fit into the one-byte bLength field */
+static int uvcg_extension_check_size(u8 nr_in_pins, u8 control_size)
+{
+	if (UVC_DT_EXTENSION_UNIT_SIZE(nr_in_pins, control_size) > 255)
+		return -EINVAL;
+
+	return 0;
+}
+
 /*
  * In addition to storing bNrInPins, this function needs to realloc the
  * memory for the baSourceID array and additionally expand bLength.
@@ -877,6 +886,10 @@ static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
 		goto unlock;
 	}
 
+	ret = uvcg_extension_check_size(num, xu->desc.bControlSize);
+	if (ret)
+		goto unlock;
+
 	tmp_buf = krealloc_array(xu->desc.baSourceID, num, sizeof(u8),
 				 GFP_KERNEL | __GFP_ZERO);
 	if (!tmp_buf) {
@@ -930,6 +943,10 @@ static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
 		goto unlock;
 	}
 
+	ret = uvcg_extension_check_size(xu->desc.bNrInPins, num);
+	if (ret)
+		goto unlock;
+
 	tmp_buf = krealloc_array(xu->desc.bmControls, num, sizeof(u8),
 				 GFP_KERNEL | __GFP_ZERO);
 	if (!tmp_buf) {
@@ -1055,6 +1072,10 @@ static ssize_t uvcg_extension_ba_source_id_store(struct config_item *item,
 	if (ret)
 		goto unlock;
 
+	ret = uvcg_extension_check_size(n, xu->desc.bControlSize);
+	if (ret)
+		goto unlock;
+
 	iter = source_ids = kcalloc(n, sizeof(u8), GFP_KERNEL);
 	if (!source_ids) {
 		ret = -ENOMEM;
@@ -1134,6 +1155,10 @@ static ssize_t uvcg_extension_bm_controls_store(struct config_item *item,
 	if (ret)
 		goto unlock;
 
+	ret = uvcg_extension_check_size(xu->desc.bNrInPins, n);
+	if (ret)
+		goto unlock;
+
 	iter = bm_controls = kcalloc(n, sizeof(u8), GFP_KERNEL);
 	if (!bm_controls) {
 		ret = -ENOMEM;
-- 
2.25.1

