Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792473294;
	b=zPhGnKxW5WFOrkMApI3BnWYfzx89412PMmExYe4MAWGXF+GGbNlQBRQSALAYPiVjUbCw
	 AaaIU8L+4RWLE5ENSV04U+6w5b74f2taBfbzDWmvGWYnfGftKalRK8BebxD+jPj7GE+cJ
	 ISQzJH7d28UhHxMW2yfmbSAil1E5QFEYtD/gVMezmolWFGCZqjz1d42MWRNrROFSqmR2I
	 sUe8V8RRC3teq6Yvbhtf//4OpW56LEP0F98Cumk9BK7vmRDIg8TCmQ8XbkBcGP+izR/3b
	 Lh/8rbJOr2vsCg/eHWYUdakL1vgTz3S8cgZBsGVkeher5w7HQeR3j0nCJXB0sgAilqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792473294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=TrZLjxuUWkEymBh2PSVn3/lyI3kENtzx2QTXaKgS9MY=;
	b=Tksay3R59DR/uuJh2upRLu8YiK7kLRMIlSEjYQOK6dECTIChS370SW+YPmeYy0XD5iOn
	 lqkqOSKUMdm7z26c2LuHlmIviodAMRNosHXZi6yDMKH5Wx13JmLbcVaR9GwRbtjXzxyvO
	 KuNdM5Y1Mf69AommBMW7TkHBSlDrCVjXDDCX2O9R8GAdj1i/AKaRYpsUgjobb4afyseij
	 hfZVKeT4OnFXUsfn/DMNv8+bbx0sX69ytcjrfPb5oRTcC4+Bj0WqCVLrLuxLS8PDN+mw5
	 zP4Xspg4TT0ITSh0o8ZgnD1IPZzjPKR6NOG3746fdEQtPVKfaimGsbKGW77BCNuLhPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="pj/U+8sT";
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64D0606A319
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 05:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A64D0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pj/U+8sT
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd60d155070so1257670a12.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 22:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792473293; x=1793078093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TrZLjxuUWkEymBh2PSVn3/lyI3kENtzx2QTXaKgS9MY=;
        b=pj/U+8sT7PblrBdJkCpGeL6ASX2udgplnUPFcQFKQG3BPcwrOXWHzlHAFPQOJcZJZI
         uNRbdtAb2pIPDl2pyRPQVH9WQLhw91c6oE2QvhkPt7a3ToJmcaSFeZNPwzcaqYE0BT4X
         2CKHmJTb3voGDHNfKyWPzvb+diIMoXnbmzA5ovxp5ESExbdEqQeu1ZL9gnI1qYRTD+dN
         VD4TZm4wJGbuzZpWJA9Vh8lwPexwq5w/2UEBytdfr6ommumrhGiBbFy2XpEwc8DLsnem
         5T5MNWq4sz32gXflMK+dJ0NHSkx9CoocrkMrgA6bVN+ceyTVrC1+giRjTHG4vPZBBc7I
         qBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792473293; x=1793078093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TrZLjxuUWkEymBh2PSVn3/lyI3kENtzx2QTXaKgS9MY=;
        b=GPQSXsZiH+KuiVhkjILcOBAzyfz5YO2trprWZcyMjwXsBLUhqMIHdB6wpDjBjRxldX
         7kb10sUS8V3S7tEvnbpEhs83kedGktDUL+qvIjCciRxLZzyfqzqUu09dW5nB9CFIS8K7
         yp3U6hsi0W3vs+W7vaQH85f3gSIIuhGe7KBepchyS/p6g+cEYxu8Djq3hkmf+dm8Ijt4
         Sgyzmjxb4TFpN4nISN3Bvrk3JwyQSqkorCSjVMFDdgxhAVITCiz8F31HiK5nGweRzg6N
         ZSgKdHr5rBYnnqiOYLcyhjld13lUwJ8BekykmDmFaoJGGmD5xDA3/2crf9HcZg5hMKP2
         kaYQ==
X-Gm-Message-State: AFq9FYLtSDsQMFXa2Ix8+UlxYtgLujPg4KW4tSK/vyHvsY3Y9J+JxxPj
	m43Zn1qwruHnoP5EExzuc9D92AeSHHA+nNrsVu6EBxmG1ZWA4H9jAdx0Yr8RxXiZ
X-Gm-Gg: AYBFou2fXPJVAzu6OycJQTOxzvvvYJDbfykiWbjhzWovuXnN4IHQSoK3SeBFCLIE3l1
	DYDeGd8NfK6a3PCt1DcVpHX7BKQQQvJ2jsQdk17FwXIA7HkNvgHKG/RXOs5Sw4pUMPX6IeaNZWC
	vAIQkI/te2L9ryNPU2qUfOsYQ6a1Yj1dDK+92PKP3dnnORo/E5YXObQbESMD+5WeKHT6PO/Ug/T
	s6oCA95XSu13A3CeZCuzrYMeHOn61ZVISEdu83tsqpqlZsP6XMVcW4ZU5xpwIiLca8wHSZDmSXV
	iuXR8PJabk8vRaLPXR/wqz7xGVxixQ4A7ja2xpuAdo1AJyZm6Hif2dOoogr7tLEQP3s3nPRoC87
	DKt05BaiMOIzovImlsZcsYoY6PUphG7J5tMTFsFxoitkKNllt9JqZHBRxy6brBg3HejkRiA/tl+
	NKfF2pRt98Vl4sVTsKkAltNxhmhatzCM+lODCoePx4zUvhFmD5fBPv/Kig2gJ8MH/M/WhZRUDaL
	ZYZZFCdLq9FnyovuxPPA26GctTILBVE3dSZouC96sO39ln/NYLRbBTJIQAmGASM1JLKm9XAK66h
	+NmUjQ9O2hG9T6rqeciyVBCVBrRAqI8+/cg99YTzQ2nDh4g+
X-Received: by 2002:a17:90b:5448:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3acee98db60mr7985189a91.6.1792473292926;
        Mon, 19 Oct 2026 22:14:52 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad64273f6csm1843353a91.15.2026.10.19.22.14.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 22:14:52 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: f_hid: avoid copy_from_user() under get_report_spinlock
Date: Tue, 20 Oct 2026 15:14:46 +1000
Message-ID: <20261020051446.92179-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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

f_hidg_get_report() copies the userspace report into a freshly allocated
'entry' before taking get_report_spinlock.  When the report id is already
present in the list it then copies the same userspace buffer a second
time into the existing entry, this time while holding get_report_spinlock
(acquired with spin_lock_irqsave()):

	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
	ptr = f_hidg_search_for_report(hidg, report_id);
	if (ptr) {
		if (copy_from_user(&ptr->report_data, buffer,
				sizeof(struct usb_hidg_report))) {

copy_from_user() may fault and sleep, which is not allowed while holding
a spinlock with interrupts disabled:

	BUG: sleeping function called from invalid context at ./include/linux/uaccess.h:169
	in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 3481, name: hidg_getreport
	 __might_fault+0x4d/0x60
	 f_hidg_get_report+0x155/0x310
	 f_hidg_ioctl+0xbd/0xe0
	 __x64_sys_ioctl+0x120/0x170
	 do_syscall_64+0xf9/0x540

This is reached by issuing GADGET_HID_WRITE_GET_REPORT twice for the same
report id (the first call inserts the entry, the second takes the update
path).  On a non-debug kernel a userspace buffer crafted to fault (e.g.
via userfaultfd) would sleep with the spinlock held and interrupts
disabled.

The data has already been copied into 'entry' before the lock is taken,
so reuse it instead of copying from userspace again under the lock.  This
also drops a redundant second read of the user buffer.

Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/usb/gadget/function/f_hid.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3c6b43d..520892b 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -668,13 +668,7 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
 
 	if (ptr) {
 		/* Report already exists in list - update it */
-		if (copy_from_user(&ptr->report_data, buffer,
-				sizeof(struct usb_hidg_report))) {
-			spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
-			ERROR(cdev, "copy_from_user error\n");
-			kfree(entry);
-			return -EINVAL;
-		}
+		ptr->report_data = entry->report_data;
 		kfree(entry);
 	} else {
 		/* Report does not exist in list - add it */
-- 
2.43.0

