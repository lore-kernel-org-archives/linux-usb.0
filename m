Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7B1342CB0
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 17:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974390; cv=none; b=tYVKkgLgwKQvoGUdz+gw85Rrigirc/KYTCJhg2QZ31zik0yxlTv26bhAT88FAsMV/sGrn+l7TfFvEThH6VayfXr0FkvO/mkxQEgDsGuXaIvNaqkPULTG6uXI4BrH4izpdze4/wYDcQFQqMl3expnUs+KDXrNPwusS3GTFVWr2x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974390; c=relaxed/simple;
	bh=IlcZ7axc1icPaRsnATE3TTEkSRdrgKhV9fd+K+TYx+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LwSrt5GqDT92Cs+jRMmeNsJyeouDuRbfyxeyv2LjuzFuobS/UD4OCpMo+bmu74gBPQNjn4KdVOcApHYKqCmDTqqKFl4V2NFXaBc6AUJN9g3wG+hWQaab9/cSj+t4VFYcVwO2Jh1PvibLKxnd9nyBIOwqrl1JgU5FJSIYsFV0uyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=beBJrA5e; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beBJrA5e"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso5898094a91.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 10:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788974387; x=1789579187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMRip1Y+oPvNX5PgfN0DgCOA+dU2bWxzbPCzDRfdUU4=;
        b=beBJrA5eoszoD1Nr2DYlaVj/yst75vyw+Z496KCAbew9i5HU9CcTjRGW4fKSsLUJPw
         taOO6sMcucm1LxBBEe74A0r3mILSmmYimM0e48pS67e1EXmry6jz4OcfthboF623VRpi
         7RRBBo/HWsNjQHHYK99vYifyQjVaZauCIm/yUbw8bhiG9LkKQYttuKKHWadafhKOxeVI
         WFj4DjENZZJzgz904S/hErs88NFU3BTgtXaiLQjgoasz6X5x4YNlaZT3ayLtDoPAF7Eq
         z4l2ab1VKyaxDWMtSXF40OdhG0HPv14pXTDlyh3LkxtrwiLLuBR+urTVyi87i3l2q9UQ
         vQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974387; x=1789579187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMRip1Y+oPvNX5PgfN0DgCOA+dU2bWxzbPCzDRfdUU4=;
        b=TPt6T51Q+X+DveHxcfL0t9ic8ZuxygdNEvj6UscUiFw7kYvUmFRbpoV3xYzUR61iQ4
         5+PakV2voV5woOeZPGHxsDzwXxAtTVLwWNS43P67VshB3sQsiq+HPJG6NbCmE5wxi76U
         K9rrf98x3qScvhihhWM8gxEu+TB+My7pOfnkwfN1zBu/XTPqle43UHDgtjAY5+v4L7sZ
         U5bVsIYOtoHTsVguHbq8af9EorqLGqEfDL3du+FGCvNZRPaWSxh4/zf32/Ty1GcnXQmE
         0E1WpRIYnipoOzMkqrJEKYoeEV7BUzNSaTvtfXeKZYQEt6hDAzrnntOIQInv6wsvvCnD
         CIoA==
X-Forwarded-Encrypted: i=1; AKwUvBykw3qRghx0Om/n1uqzsCWS4H7gulDT3t+I5gqiwWTvBdSSWZg8LvFwW9PRwHZcCt04neMwAevhAvg=@vger.kernel.org
X-Gm-Message-State: AFuF++nMwp008aKc0tmgWTDpUn5rbr99fxXdmeRo3uUxmalWVVk1kVXi
	P8qEbYId6QOJ1Z2nDBctrZnlljCpW3USPn9Fsf/GIhQpSHrc0VHzE1Yb
X-Gm-Gg: AYBFou1/CwrswBTXB2u+ZvPjivp/8WwM3adBSEla1m3RU+VfejdHPZVLt1nthowzuFw
	WsSlk58Pe8wwS1Af78m1rSpNM7QoyFxwpw8aBcBbc/72ALhDHmcOdLdorTQPYvnOyLIxDb1jt5n
	evl+iuf38fFi9kyxB57KD5vIS+AvFG59boDSmxExQtRvT2gXX7fukL7TGPztcK4khsGsWh1Lng+
	xWrEO4N3f1Ix4LTGJ7RBpY5TvhfXwL6ulyUbMkZXun+Fkm9NXlEtoTEmiy2WpltYnSqENpNkDpN
	4ZLrIZPB4JbwKc4eCOwC0RNQKWQsD4EUMc55cpcr5AZcfI+sbK60uvk11UCTzgu3juZFVoT+RcT
	Z5ExK6T0fODmt9pFdzQjBLY2ZMqZrqS96yl9siEjIKhx70jXDSsue3G+ejit7FLBXu4z0pNAYKK
	+dsHX1661maBlokFjBrElmxRiRPPHnJdy3eM9u2EkKICZdNLN5faG+OHzWLnfr2fYA5ydf9rQBR
	a/v3Kq5obkdyCBlLtY=
X-Received: by 2002:a17:90b:3c48:b0:398:e436:384 with SMTP id 98e67ed59e1d1-39b260d335dmr55306923a91.1.1788974387271;
        Wed, 09 Sep 2026 10:19:47 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:24ba:44ee:a9ec:98f1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d770e3bf4sm388181a91.7.2026.09.09.10.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:19:32 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH v2] usb: storage: ene_ub6250: set transport_reset to avoid NULL deref
Date: Thu, 10 Sep 2026 00:19:26 +0700
Message-ID: <20260909171926.54111-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909171736.53927-1-ngocthang2710.1999@gmail.com>
References: <20260909171736.53927-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ene_ub6250_probe() sets us->transport but never sets
us->transport_reset. get_transport() only fills in transport_reset
for the standard USB_PR_CB/CBI/BULK protocols; since this driver
matches on VID/PID alone, a device can report any bInterfaceProtocol
value and still bind, leaving transport_reset NULL.

When the transport then reports an error, usb_stor_invoke_transport()
calls us->transport_reset(us) in its Handle_Errors path, dereferencing
a NULL function pointer:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: 0010:0x0
  Call Trace:
   usb_stor_invoke_transport+0x55a/0x1a40 drivers/usb/storage/transport.c:926
   usb_stor_control_thread+0x44c/0x8f0 drivers/usb/storage/usb.c:462
   kthread+0x38b/0x480 kernel/kthread.c:436

Set transport_reset to usb_stor_Bulk_reset: ene_send_scsi_cmd()
already frames its command/status packets with the shared
struct bulk_cb_wrap/bulk_cs_wrap from include/linux/usb/storage.h
and only ever transfers over us->send_bulk_pipe/recv_bulk_pipe, i.e.
this device speaks the Bulk-Only Transport wire protocol underneath
its own SCSI translation layer, so the Bulk-Only reset is the correct
recovery action for it, matching the pattern already used by the
other subdrivers with a custom transport function (alauda, datafab,
jumpshot, karma).

Also harden usb_stor_probe2()'s existing sanity check to require
transport_reset alongside transport and proto_handler, so a future
subdriver making the same mistake fails to probe instead of crashing
on the first error recovery.

Reported-by: syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=356ae236154297f0d60d
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v2: per Alan Stern's review, justify why usb_stor_Bulk_reset is the
    correct choice for ene_ub6250, and additionally harden
    usb_stor_probe2()'s NULL check to cover transport_reset so other
    subdrivers can't hit the same bug.

 drivers/usb/storage/ene_ub6250.c | 2 ++
 drivers/usb/storage/usb.c        | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
index ed49a3bc859c..3137c2cdd021 100644
--- a/drivers/usb/storage/ene_ub6250.c
+++ b/drivers/usb/storage/ene_ub6250.c
@@ -2350,6 +2350,8 @@ static int ene_ub6250_probe(struct usb_interface *intf,

 	us->transport_name = "ene_ub6250";
 	us->transport = ene_transport;
+	/* get_transport() only sets this for the standard USB_PR_* protocols */
+	us->transport_reset = usb_stor_Bulk_reset;
 	us->max_lun = 0;

 	result = usb_stor_probe2(us);
diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
index 064c7fc8e368..823a4b2e9033 100644
--- a/drivers/usb/storage/usb.c
+++ b/drivers/usb/storage/usb.c
@@ -1100,8 +1100,10 @@ int usb_stor_probe2(struct us_data *us)
 	int result;
 	struct device *dev = &us->pusb_intf->dev;

-	/* Make sure the transport and protocol have both been set */
-	if (!us->transport || !us->proto_handler) {
+	/* Make sure the transport, its reset method, and the protocol
+	 * have all been set
+	 */
+	if (!us->transport || !us->transport_reset || !us->proto_handler) {
 		result = -ENXIO;
 		goto BadDevice;
 	}
--
2.43.0
