Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFD92D7393;
	Sat, 22 Aug 2026 19:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787428062; cv=none; b=k1sWYkinIx1uokF6kA8bosLTnZ35k+GtRMjvjeAp1+pkwKPHetOg/VRxapvT8m6thopQDYoJmzKK+jXpoPdNpSTUvOsoKDDE+42M9S3d3o2kkganolpc46IoWetjsfdxQtlTXL1DPaYWciprkq5kYEzsBG87u4SsQNGtZ23Q+3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787428062; c=relaxed/simple;
	bh=5P/8Y0CwvsMNZO2C0PLCQjnvDiTyOZNXM8xcXEOXahQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hkz3VaqyNaVo0aXBJbcJHPaBf/TOxG/CkZ4/hP1Az8SDEG5C4aCnU6RpQzYthDiDdJapRR4HpajqXm7K3/CISZnePE3SjfhE2wXs2JjYhQv1+mhJTzdT3hSgzhj1CezGGJBVzZ96FTxpIy37wbDh5OaKoDzI7tbwewRHSAu9Wa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5237ae6a9e6211f19a56ed5b684f684d-20260823
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:ecdcdb94-13e5-4573-b645-f5ecadc45b49,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:85087b7d43f8ef2a0aa8c8cee7f43d45,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50,EDM:-3|
	-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5237ae6a9e6211f19a56ed5b684f684d-20260823
X-User: lihaofeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihaofeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1880279097; Sun, 23 Aug 2026 03:47:34 +0800
From: Haofeng Li <lihaofeng@kylinos.cn>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	13266079573@163.com,
	Haofeng Li <lihaofeng@kylinos.cn>
Subject: [PATCH] usb: storage: shuttle_usbat: clamp device-reported read length
Date: Sun, 23 Aug 2026 03:47:28 +0800
Message-Id: <20260822194728.4151923-1-lihaofeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For device-to-host commands other than READ_10 and READ_CD,
usbat_hp8200e_transport() asks the device how many bytes of response it
is about to send by reading the ATA LBA_ME (cylL) and LBA_HI (cylH)
registers, and then uses that device-supplied value, unvalidated, as the
bulk-in length for usbat_read_block().

The value is never checked against scsi_bufflen(srb).  A malicious device
answering 0xFF turns a 36-byte INQUIRY into a 255-byte read that runs 219
bytes past the command buffer, and for a command buffer above 0x100 bytes
the 16-bit form can claim up to 0xFFFF bytes.  The length flows through
usbat_bulk_read() -> usb_stor_bulk_transfer_sg() -> usb_sg_init(), which
stores it in urb->transfer_buffer_length without reference to the
scatterlist it covers.  xHCI paces the transfer on that field while
walking the SG list, and once the (shorter) list is exhausted it keeps
enqueueing TRBs past its end, so the device's data is DMAed outside the
SCSI buffer.

Attack chain (the attacker only supplies a malicious USB device; the SCSI
commands involved are issued by the kernel itself during usb-storage
probing, so no local privileges and no race are required):

    malicious device identifies as 03f0:0207 / 03f0:0307 (HP USBAT)
      -> unusual_usbat.h: USB_SC_8070 / USB_PR_USBAT, init_usbat_cd()
      -> queuecommand(INQUIRY), scsi_bufflen = 36
      -> usbat_hp8200e_transport(): DMA_FROM_DEVICE, not READ_10
      -> device answers the LBA_ME / LBA_HI register reads with 0xFF
      -> len = 0xFF (up to 0xFFFF for scsi_bufflen > 0xFF) replaces 36
      -> usbat_read_block() -> usb_stor_bulk_transfer_sg()
         submits a 255-byte bulk-in over a 36-byte scatterlist
      -> xhci_queue_bulk_tx() keeps queueing TRBs while
         enqd_len < full_len, past the end of the SG list
      -> out-of-bounds DMA write into kernel memory

Reproduced end-to-end with a FunctionFS device emulator standing in for
the HP 8200e: a kprobe on usb_stor_bulk_transfer_sg records length = 0xff
aimed at the 36-byte INQUIRY buffer while the device log shows the forged
register answers, and the host controller WARNs in dummy_perform_transfer
with the scatterlist exhausted and 219 bytes unplaced (dummy_hcd stops at
the SG end; the out-of-bounds DMA itself needs xHCI hardware and follows
from the TRB loop's enqd_len < full_len condition).

Cap the transfer length at scsi_bufflen(srb).  A well-behaved device
reports the actual response length, which never exceeds the command
buffer, so only malicious devices are affected.

Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
Assisted-by: opencode:deepseek-v4-flash-free
---
 drivers/usb/storage/shuttle_usbat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/storage/shuttle_usbat.c b/drivers/usb/storage/shuttle_usbat.c
index 7e5424268c73..4bcb7e684d7f 100644
--- a/drivers/usb/storage/shuttle_usbat.c
+++ b/drivers/usb/storage/shuttle_usbat.c
@@ -1666,6 +1666,9 @@ static int usbat_hp8200e_transport(struct scsi_cmnd *srb, struct us_data *us)
 		else
 			len = *status;
 
+		/* Device-controlled; clamp to the command buffer to avoid OOB DMA */
+		if (len > scsi_bufflen(srb))
+			len = scsi_bufflen(srb);
 
 		result = usbat_read_block(us, scsi_sglist(srb), len,
 			                                   scsi_sg_count(srb));
-- 
2.25.1

