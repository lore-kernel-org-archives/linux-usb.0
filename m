Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF87581225
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 16:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788971238; cv=none; b=hYCbssvF0whQJQ++MGhfpyRIlrP7Vu4Fw7/I2we58twZulxIEQq+IHdurbFkFB936FyFH0B6XHxpOqzEMUQ6LUoyy41Kre93/hR04mOANgjhx1P2Tci5bgHZV4Yi2DJaaWu2ZrHo0T0vfi3qQ7FVaxSYJOaolgRIz2q/iuTjURc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788971238; c=relaxed/simple;
	bh=AOZLttGhmUv5jquu2+3I7Ud1egnq9QSCJNwq8sO2MTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjPMZL5sKOErZWIZ/KTW28HmoStQSxwRvNx3GTjQfyAXzXXgFsvnfKK15NXo7RHwLgdGWqPXbnmwoUfC4l3zQb8Si4efbHAMKb0OEmD4rCh703eD8c9qQV660LzkruW/qo6MrTEfZPaJoT5ufs6ZpMLZfRM5GxflOdEJ+oaPvBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o/dKyk41; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o/dKyk41"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso4665226a91.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 09:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971235; x=1789576035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+WQUthtyqHxeRsXcz+ABlRT5Bj9eULs6bP863YlVETY=;
        b=o/dKyk41ZUfB5VSOLen4YL5DpNQmC2e4nOGvyB1V50ak1I9kQzi5kuHNFASteJkdYe
         XTji+WrMPfW+xMlkx6UQ7FFUnkIzQsq2radJNPRPBl2NuSNN2/4HFJ2vD2CXlWuAbxzG
         hJKxj1bcOAgYq5axYn0dhCFIRtE5aLBnGqwcsrPh9JNd13qVma6+1abLQfvP8UW2IC9/
         W2xZEFgnuB6WBy6p4jULYOUasBA0fIK1X039703bs8TEpGsbFMNqsnVK66toW9m0o8+V
         O3VvqYUednC5BApJG+kUvUHdnkuwITzZOoiEcqPsJ4ehjCkRuocbYu8SJhSyUQuKEcup
         z1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971235; x=1789576035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WQUthtyqHxeRsXcz+ABlRT5Bj9eULs6bP863YlVETY=;
        b=Zqzc/HXo+OIOdVL15ftDdlZjFsrijkCNNwScrM43vcpKLUP1zF9J7+OFmJqiyxSYW7
         ZmFrsIcfm7FRT9WrCWkwgLOPL6i73T+DV1hVck4H5fVDp6/lOOqJSKW7uGwxgV97qxTm
         94qAe9SJkTsbKMxxHgxMlLnRdCcJ61W9djWuZ3ugki5NrzXE5pd+QyQyiBYA9hrssUAu
         ovesrUSN55IUKCg4ZXHI3piVt4lAH92xrqGzMd342LOee3k3Yv8YuGWP2T1rDvBfCVTs
         gCMHcAMsNvYAjEzvmceK09Phv6nM4wZsuzyhOvcxuCzenaCjyDbYOVYiyh9jJqUDltom
         pI0w==
X-Forwarded-Encrypted: i=1; AKwUvBwiCdiYUUwZBSlN/nfbrisUNkgoio4qh1KtoLWYli+GmTfpSaT8L0T/umzu7fQv60fnmCL1MaMKTp0=@vger.kernel.org
X-Gm-Message-State: AFuF++mN7D0WfmvzHD9aq6yNMYXjc6bGhOFNk2/UeV+HxTK/AbL9BwIG
	IqigO8ppk6ngJqbk+myyBmijsfT9qYUpUHnMut/4z51f50V9Hg5eH/w5
X-Gm-Gg: AYBFou3IAoiT6dNovPuT5CP/4T834yFV3ljyGB7sD7gjEn/ETODp2us8U8dpzVCTETi
	yxC1yDoEQv4Sh3xCmS2nSYLt3jZCb5H2F3pva3Q7BbvHYf5A+QsJsB50yIzLGs0WNE/V4mvOfJX
	OcU7YIHcWmapfPsGxphB4zjnDdlRLfuFiEi3+tMCbdDfKHklGUzVS5yLMPusOHpcNIW61X7qODK
	bAMoHDRAJQp3jX2zIIy42gtonwX8Mdb/sxc6xJLpFTP5XqwpgWw33k9JnxMbG58qIrCtfvVyGKM
	uE2B/zAujUHgdU4wjbcmRmErJhmPEFikI+9bvV7kRBM1wyqjxQ9fJgiVsgjwAdQHy0y0J9YviGt
	ezWosxWYMznV+WN69I9RNtKTMqRwtEEbTBow2VEgmMrNhY4rdoVh/Jk71bavXER5M9Fnoa4JadJ
	vGLFXE9bShMI+/JGTpMRr2/ImCAFMNuxxsWHhHn/oaoVYZs4lomosBSkRdBJ0CB5BCF/TsIpw2E
	fNjW+jYqUrVEBRC7KJ1HWaRqSRxsQ==
X-Received: by 2002:a17:90b:394e:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-39b26272d76mr55263314a91.12.1788971235372;
        Wed, 09 Sep 2026 09:27:15 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:24ba:44ee:a9ec:98f1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d770bc9f5sm174254a91.2.2026.09.09.09.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:27:15 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH] usb: storage: ene_ub6250: set transport_reset to avoid NULL deref
Date: Wed,  9 Sep 2026 23:27:10 +0700
Message-ID: <20260909162710.28740-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Set transport_reset to usb_stor_Bulk_reset, matching the same pattern
already used by the other subdrivers with a custom transport function
(alauda, datafab, jumpshot, karma).

Reported-by: syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=356ae236154297f0d60d
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/usb/storage/ene_ub6250.c | 2 ++
 1 file changed, 2 insertions(+)

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
--
2.43.0

