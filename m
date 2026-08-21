Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F07E35C19B;
	Fri, 21 Aug 2026 07:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787295699; cv=none; b=bUCVJxPtGdKgRr2+ktpkv7JPmISXjjA9DS6RBuqmKIpvb7zVyXA4njKmK6xp87tmSXdsYpV8Q97wWMRM4W+v1/SypErM8cw9lyeMPkT9KDs4134DPQV2qwE+Ll4dsD20QsNGdX9rTNCrpq2uxZia//c1bIS5ogFDGAiq0iwakKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787295699; c=relaxed/simple;
	bh=rRXFsbPatE0/QPAwK5T15UvhFu7pyKrayhI1X60skDg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V43sGWBDme3ghfWDkJZ0SzHhYA47Z4lcycZbM986O0NkQ6VQ5uNXuws3jjH2SJULcQbA7hidTl5GFZLIfbRv1Ra8b0MMkf+9w3ZOEgZLuE+xurobO88HrGKihFDfqSqhQibS7bJRziRT8Vrf1enhfYpxEQ8lFq1IDUF8WOHPsF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 23bf7b9c9d2e11f19a56ed5b684f684d-20260821
X-CID-CACHE: Type:Local,Time:202608211457+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:5fb639d5-14e5-4b2f-b68d-1e62f138e8ef,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:e6f94b3e20211adc8ac7556ec42b6538,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 23bf7b9c9d2e11f19a56ed5b684f684d-20260821
X-User: lihaofeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihaofeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2107039016; Fri, 21 Aug 2026 15:01:31 +0800
From: Haofeng Li <lihaofeng@kylinos.cn>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>,
	Haofeng Li <lihaofeng@kylinos.cn>
Subject: [PATCH] usb: storage: sddr09: fix OOB access in sddr09_read_map
Date: Fri, 21 Aug 2026 15:01:20 +0800
Message-Id: <20260821070120.3183236-1-lihaofeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sddr09_read_map() builds the LBA <-> PBA translation tables while
servicing READ_CAPACITY.  The logical block address assigned to each
physical block is decoded from device-controlled redundancy data:

	lba = short_pack(ptr[7], ptr[6]);	/* 16-bit device value */
	lba = (lba & 0x07FF) >> 1;		/* 0..1023 */

	if (lba >= 1000)
		goto possibly_erase;

	lba += 1000*(i/0x400);

	if (info->lba_to_pba[lba] != UNDEF)	/* heap OOB read */
		...
	info->pba_to_lba[i] = lba;
	info->lba_to_pba[lba] = i;		/* heap OOB write */

The tables are allocated with numblocks entries each, where numblocks
is derived from the device-reported NAND chip geometry.  For the
smallest chip in nand_flash_ids[] (1 MB: chipshift=20, pageshift=8,
blockshift=4):

	numblocks = (1 << 20) >> (8 + 4) = 256

so info->lba_to_pba[] only has indexes 0..255, while a hostile device
may report any LBA up to 999 - the "lba >= 1000" check is the only
limit on the value, and there is no check that lba < numblocks.  On a
1 MB card indexes 256..999 (744 of them) index the table out of
bounds, up to ~3 KB (744 * 4 bytes) past the end of the allocation.

Attack chain (malicious USB storage device):

  1. An attacker presents a USB Mass Storage device spoofing a unit
     matched in sddr09_usb_ids, e.g. 0x04e6:0x0003 (SanDisk
     ImageMate SDDR09) or 0x0781:0x0200, on the victim USB bus; the
     device is enumerated as a normal storage device.
  2. ums-sddr09 binds (sddr09_probe -> us->transport =
     sddr09_transport) and the SCSI layer issues READ_CAPACITY, which
     is handled via sddr09_get_cardinfo() (chip geometry from the
     device ID, choosing numblocks) and sddr09_read_map().
  3. The device reports a 1 MB chip (numblocks = 256) and fills the
     per-block redundancy data with LBA values in the 256..999 range,
     driving info->lba_to_pba[lba] and info->pba_to_lba[i] accesses
     out of bounds: a heap OOB read used in the map-building
     conditionals plus a heap OOB write of the loop index i (the
     physical block number, 0..255) at an offset the attacker controls
     via the reported LBA, corrupting adjacent heap memory.

The device-controlled inputs, the missing bound check and the OOB
indexing are confirmed by end-to-end reproduction with a FunctionFS
based malicious device emulator; the driver logged out-of-bounds
indexes such as:

	sddr09: LBA 256 seen for PBA -858993460 and 201
	sddr09: LBA 258 seen for PBA 4513 and 203

Add the missing bounds check: since lba is unsigned it can only be
too large, so bail out with "lba >= numblocks" and mark the physical
block UNUSABLE instead of indexing the tables.  This mirrors the
max_lba bounds checks already applied to the SCSI-address-derived LBA
in sddr09_read_data()/sddr09_write_data() and in the related sddr55
and alauda drivers.

Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 drivers/usb/storage/sddr09.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/usb/storage/sddr09.c b/drivers/usb/storage/sddr09.c
index 3d45e1b54c66..2d1ad10bd4cc 100644
--- a/drivers/usb/storage/sddr09.c
+++ b/drivers/usb/storage/sddr09.c
@@ -1339,6 +1339,26 @@ sddr09_read_map(struct us_data *us) {
 
 		lba += 1000*(i/0x400);
 
+		/*
+		 * The LBA is taken from device-controlled redundancy data
+		 * and is only checked against the 1000-per-zone limit
+		 * above.  Nothing prevents it from exceeding the size of
+		 * the translation table, which for a 1 MB card has only
+		 * numblocks = 256 entries while a device may report an LBA
+		 * up to 999.  Bounds-check it before indexing
+		 * info->lba_to_pba[]/info->pba_to_lba[], otherwise a
+		 * hostile or corrupted card makes the driver read and
+		 * write past the end of the table.
+		 */
+		if (lba >= numblocks) {
+			printk(KERN_WARNING
+			       "sddr09: Bad LBA %d for block %d exceeds "
+			       "the translation table size %d\n",
+			       lba, i, numblocks);
+			info->pba_to_lba[i] = UNUSABLE;
+			continue;
+		}
+
 		if (info->lba_to_pba[lba] != UNDEF) {
 			printk(KERN_WARNING
 			       "sddr09: LBA %d seen for PBA %d and %d\n",
-- 
2.25.1

