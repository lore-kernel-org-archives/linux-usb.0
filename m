Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3E12737FC;
	Sat, 22 Aug 2026 19:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787427999; cv=none; b=baGL/GehoH4uviGaLWFcZrTG6EYnVSz+qzaXkXyBY1RR7bY3Vr9eWpHaM01XNPAGwA3zaFj+3RR/S5xg85NjkFxztWrPnpDGCB6wbAwsfkkWPw55vNEmpAwJvgnsxJ5QQPwLPV5h6kU8heJM0iMuTpuWcAxVd084skJza4tPaXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787427999; c=relaxed/simple;
	bh=CZ+i74zV3xfcK8rSYOpkfzgsw7VAltbTXwH1CHJmT0c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cdl707PK6MafSIB3+G0SJ7V1eSXJ0fygpKubdTZosbFqKuf1ummYTjfkiYwRqGZpKcPBTuDyXlnk+5tY+fwM273TcEi1qj1M7etkihWJ4GOF/piMOYdF2RF1DO3l/m+TTYLUI1d9CogWTbaDG3f0bZ8Wk5P4/2iAjzfhyn1hChY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 27f36bb29e6211f19a56ed5b684f684d-20260823
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:ebd08fb6-f5a4-4250-9945-25d28ccd8293,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:e820acde98e0d309ccf7d73eea25dbbc,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 27f36bb29e6211f19a56ed5b684f684d-20260823
X-User: lihaofeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihaofeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2106659304; Sun, 23 Aug 2026 03:46:23 +0800
From: Haofeng Li <lihaofeng@kylinos.cn>
To: gregkh@linuxfoundation.org,
	christophe.jaillet@wanadoo.fr,
	hataegu0826@gmail.com,
	kees@kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	13266079573@163.com,
	Haofeng Li <lihaofeng@kylinos.cn>
Subject: [PATCH] usb: gadget: f_uac1_legacy: fix heap overflow in f_audio_out_ep_complete()
Date: Sun, 23 Aug 2026 03:45:48 +0800
Message-Id: <20260822194548.4151087-1-lihaofeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f_audio_out_ep_complete() queues the accumulation buffer for playback
and allocates a fresh, audio_buf_size-byte one whenever an incoming
request does not fit into the space left in the current buffer.  It then
unconditionally copies req->actual bytes into copy_buf->buf.

audio_buf_size and req_buf_size are independent configfs attributes of
the function and nothing makes the former cover the latter: a request
buffer is req_buf_size bytes, req->actual is the size of the packet the
USB host chose to send, and as soon as one packet exceeds audio_buf_size
the memcpy() writes past the end of a kzalloc(audio_buf_size) object.

Attack chain (write access to the gadget's configfs attributes before
the function is bound, plus control of the USB host side; no race
needed):

    echo 1   > .../functions/uac1_legacy.0/audio_buf_size
    echo 200 > .../functions/uac1_legacy.0/req_buf_size
    bind the gadget, host sets the AS interface to altsetting 1
      -> f_audio_set_alt(): 1-byte accumulation buffer allocated,
         200-byte request buffers queued with req->length = 200
    host sends a single 200-byte OUT audio packet
      -> f_audio_complete() -> f_audio_out_ep_complete()
      -> audio_buf_size - actual = 1 - 0 < 200: the empty buffer is
         queued for playback and a new 1-byte buffer is allocated
      -> memcpy(copy_buf->buf + 0, req->buf, 200)
      -> 199-byte out-of-bounds heap write

The write is silent: FORTIFY cannot derive the size of the destination
through the runtime offset buf + actual, and because the neighbouring
slab objects stay addressable, generic KASAN reports nothing either.
Reproduced on 7.2.0+ with KASAN and slub_debug=Z, where the injected
200-byte pattern lands entirely outside the 1-byte kmalloc-8 object and
reaches the SLUB redzone; the resulting freelist corruption was observed
to hang the machine (GPF in get_from_partial_node() during later device
enumeration).

Clamp the copy to the space actually available in the accumulation
buffer. For requests that fit - the only case a sensible configuration
produces - the clamp is a no-op; oversized requests now lose their
excess bytes instead of corrupting the heap.

Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
Assisted-by: opencode:deepseek-v4-flash-free
---
 drivers/usb/gadget/function/f_uac1_legacy.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 5d201a2e30e7..aa045f64c51e 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -324,7 +324,8 @@ static int f_audio_out_ep_complete(struct usb_ep *ep, struct usb_request *req)
 	struct usb_composite_dev *cdev = audio->card.func.config->cdev;
 	struct f_audio_buf *copy_buf = audio->copy_buf;
 	struct f_uac1_legacy_opts *opts;
-	int audio_buf_size;
+	unsigned int audio_buf_size;
+	unsigned int cp_len;
 	int err;
 
 	opts = container_of(audio->card.func.fi, struct f_uac1_legacy_opts,
@@ -335,7 +336,7 @@ static int f_audio_out_ep_complete(struct usb_ep *ep, struct usb_request *req)
 		return -EINVAL;
 
 	/* Copy buffer is full, add it to the play_queue */
-	if (audio_buf_size - copy_buf->actual < req->actual) {
+	if (audio_buf_size < copy_buf->actual + req->actual) {
 		spin_lock_irq(&audio->lock);
 		list_add_tail(&copy_buf->list, &audio->play_queue);
 		spin_unlock_irq(&audio->lock);
@@ -345,8 +346,10 @@ static int f_audio_out_ep_complete(struct usb_ep *ep, struct usb_request *req)
 			return -ENOMEM;
 	}
 
-	memcpy(copy_buf->buf + copy_buf->actual, req->buf, req->actual);
-	copy_buf->actual += req->actual;
+	/* Clamp the copy to the space left; req->actual may exceed it */
+	cp_len = min(req->actual, audio_buf_size - copy_buf->actual);
+	memcpy(copy_buf->buf + copy_buf->actual, req->buf, cp_len);
+	copy_buf->actual += cp_len;
 	audio->copy_buf = copy_buf;
 
 	err = usb_ep_queue(ep, req, GFP_ATOMIC);
-- 
2.25.1

