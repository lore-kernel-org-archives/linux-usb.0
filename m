Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83062498920
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 12:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462371; cv=none; b=tRNPrN6/NsgOSOV3w18SeL14zFbHstCcCIBS959xWTirizcJWm6zPg1Laa8KWuukFDqWS59ODNwi5Jn+GPsyoGanl4GI1KKeGR6kP9Uzzrbkmi9AAHoJD36n9wFgf1dWwP2n9KfIQ93v8UKWGQ52jFTYBj5jXo9xtUuksoelZA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462371; c=relaxed/simple;
	bh=iymJ7fmG6cm/wUDWqpQm4azkLBxslQzmfVj4k11ryLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g8KEoWEcFRzNJDadzec3/KYJIbqArOILUG6oMJcOb3JdjiH3MHDeLP0plxX2WMGfe598tizhs9tvXnpq7BYCBTtlMfCj9qzdSRDjz1oGA1XKCNMitQuii5qr/zfX2QcET+vBijRSjyUZAd/tdB8agCS2nCxc/FxbdQxqd8AXeao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K25O18KF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K25O18KF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b060ec084so2143023f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 05:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791462368; x=1792067168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VnfXbi4ES2gslS6Ax6dbIr4fzItWbunDisXmuez8GY=;
        b=K25O18KFbbs/YrL1ie8ql+OSEFFopI14aHArEoPVJTqYF+9Bjv+367eQ6zPyb1qEKD
         a1xtH9tZE+v2VzVRMtUjdGZsv76avSJokPVF2eZdebRyLQ5dFeS5ArOfOCzO1ETFebrO
         ugkCfy/LDIF4ERRRQ0pHF+n5jwuHoF+I6SSYdiaMlad199URYpIVBMMI0l51VbKzBsiL
         h4T0U01B+DSlRPs/UaQ1sCL9nmkwhOV9ZyKrtZg9CZSP1dkbspeIljbTE4Lmg9hXzUmd
         /CprgqHNB/58Gh0UIBg9N0XCDKfyxfVj9dsdwSf0GTAflBRVFaQEHZSbswje9dHLCLzh
         TsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791462368; x=1792067168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8VnfXbi4ES2gslS6Ax6dbIr4fzItWbunDisXmuez8GY=;
        b=LHXUn0si8+Yktr2E68KtvT1NySdoltBTZBjU/xEtpqR7BjAWpLds7n/WVH7p73C9HG
         PhPy2/FFTn8eK5ZGtH6ILdKZ8XH+9BrQW01nvWW3xGwQvvacUrqFQfQZQ7RICdEjm3iD
         dw2V/XMsRqlZlgGr4zQhHNMggUJp/qundx3F8Vg05QJV2iv0ASZrrOEPMp/OtGKHZD/W
         sYowr9Tg2G7h/6wY7jCJ485sl7jh1zJin0S3e1ligJRbP6UbvqTRKCVMwLNJboYjzQig
         or/w9rHNH4gGhRmksmN627Ko5oolhqGUXrlPcLlExarnVTtAXijliI27/MZIfryVbcy8
         TTnQ==
X-Gm-Message-State: AFq9FYJrDZjs2emu0DtljCj1tVGbITpz41HUBLs65Ho91fuq0EBkxQSb
	8/8dIeCOacva0ARKw5jf035kOvK9E7eF4KnYGJR4zS90Plq3ZnpeU3SY9B6BPc7Z
X-Gm-Gg: AYBFou1oHUMJdArP2yLOdRuOJDaEhljtTnXZMl8YwePFELX3Veg73jiwDqDUZFqaWtE
	MjfCQ4Iubgwk2ZOkpHUvdPs3Pkpk1BCOYjXx4/c7aIwGcmaIHtoadFpe/5R+AlMpxYc3s5pjZuT
	xzcOInheChk2kZGTT5IafwJLIdj///ItCqtFWsc0S/2EEMNZr139SRd5TYvYV4aVsjiUX1Ox/lZ
	/YAPCqI330QznWu24m9q5X9q3OaLiHod5WfUILD+QewynhhJajhTjbgHu3wYFIPBH1c9+zL6Vj8
	vQ6ZPr+2/yjaWBy28NSBorjvi1otHAQT6O/rQI70iV/7+9RC+xmRGOV5O3Q2wIlz8doqHmKWb/E
	pqbeVBeUBYH4bdktK7dw1nq98AQ9oDxiOSqGL55R8m3gff9gl3lofTgqaw2wC+aJGm9MBao7HWG
	D2VXYO+tOnqxFfUZD0jCZhlDs+BrWlZ02PJlhqk/CpR/oFLA9HLatZyc1opopaX2Fzgsgl/jg9p
	T1ydgbEMot9IQa1wms2E9h2pB8=
X-Received: by 2002:a05:6000:4814:b0:48a:fb55:416c with SMTP id ffacd0b85a97d-48c72767815mr9749245f8f.21.1791462367431;
        Thu, 08 Oct 2026 05:26:07 -0700 (PDT)
Received: from darkstar.tail74c586.ts.net ([217.201.94.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2e2dcsm12348992f8f.42.2026.10.08.05.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 05:26:07 -0700 (PDT)
From: Luca Cecchi <luca.cecchi.info@gmail.com>
To: linux-usb@vger.kernel.org
Cc: linux-scsi@vger.kernel.org,
	oneukum@suse.com,
	Luca Cecchi <luca.cecchi.info@gmail.com>
Subject: [PATCH v2 1/2] usb: uas: implement .change_queue_depth to allow per-device queue depth override
Date: Thu,  8 Oct 2026 14:26:03 +0200
Message-ID: <20261008122604.1862534-1-luca.cecchi.info@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008112645.1820678-1-luca.cecchi.info@gmail.com>
References: <20261008112645.1820678-1-luca.cecchi.info@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uas_host_template does not implement .change_queue_depth. Because of
that, the standard sysfs queue_depth attribute stays read-only for
every UAS device, not just mine: scsi_sysfs.c:sdev_store_queue_depth()
requires sht->change_queue_depth to be non-NULL before it allows a
write.

uas_probe() already defaults can_queue to qdepth - 2, with a comment
acknowledging that "some bridge firmwares" need extra margin. That
margin isn't enough for every bridge. Right now the only way to work
around a bridge that needs more headroom is the IGNORE_UAS quirk,
which disables UAS entirely and falls back to BOT/usb-storage - a
large performance cost for a queue-depth problem.

This patch wires up .change_queue_depth so affected users can lower
the depth for just their device (e.g. via a udev rule matching
idVendor/idProduct), without disabling UAS altogether. Default
behaviour (qdepth - 2) is unchanged unless userspace asks for less.

Tested against a Lexar ES3 external SSD enclosure (VID:PID 21c4:0003)
that locks up under sustained heavy concurrent random writes at the
default queue depth. Capping the depth to 24 via this interface
eliminated the lockup across 6 consecutive test runs, including a
continuous 1-hour soak test (1.36TB written, ~822MB/s, no
uas_eh_abort_handler events).

v2: guard against devinfo->qdepth holding a negative error code left
    over from a failed uas_configure_endpoints() call in
    uas_post_reset()/uas_reset_resume() (the device stays live after
    such a failure); without the guard a negative depth would reach
    scsi_change_queue_depth() and underflow the unsigned queue_depth
    in the block layer (found by Sashiko AI review)

    Re-tested on the same Lexar ES3 hardware: writing 0 or a negative
    value to the sysfs queue_depth attribute is now rejected cleanly
    (queue_depth stays at the previously set 24, no error in dmesg),
    confirming the "depth < 1" guard behaves correctly against real
    userspace input. I was not able to reproduce the specific failure
    path itself (devinfo->qdepth left negative by a failed
    usb_alloc_streams() during reset) on this machine - the running
    kernel has CONFIG_FAULT_INJECTION disabled, so I could not force
    that call to fail on demand. That half of the fix is verified by
    code inspection only, not by a live reproduction.

    Also switched devinfo's lookup to sdev->hostdata (same pattern
    already used by uas_sdev_configure() and the other scsi_device-
    level callbacks in this file) instead of casting
    sdev->host->hostdata, which was pushing the line past 80 columns.

Signed-off-by: Luca Cecchi <luca.cecchi.info@gmail.com>
---
 drivers/usb/storage/uas.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 2651629..971a47f 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -910,6 +910,38 @@ static int uas_sdev_configure(struct scsi_device *sdev,
 	return 0;
 }
 
+/*
+ * uas does not implement .change_queue_depth, so the standard sysfs
+ * queue_depth attribute stays read-only for every UAS device (see
+ * scsi_sysfs.c:sdev_store_queue_depth(), which requires
+ * sht->change_queue_depth != NULL). Some bridge chips become
+ * unstable under deep command queueing; wiring this up lets affected
+ * users lower the depth for just their device (e.g. via a udev rule
+ * matching idVendor/idProduct), without disabling UAS altogether.
+ * Default behaviour (qdepth - 2) is unchanged unless userspace asks
+ * for less.
+ */
+static int uas_change_queue_depth(struct scsi_device *sdev, int depth)
+{
+	struct uas_dev_info *devinfo = sdev->hostdata;
+	int max_depth = devinfo->qdepth - 2;
+
+	/*
+	 * devinfo->qdepth can be left holding a negative error code (e.g.
+	 * -ENOMEM from usb_alloc_streams()) if a reset via uas_post_reset()
+	 * or uas_reset_resume() fails to reconfigure the endpoints; the
+	 * device stays live in that case. Refuse rather than let a
+	 * negative depth reach scsi_change_queue_depth() and underflow
+	 * the unsigned queue_depth in the block layer.
+	 */
+	if (depth < 1 || max_depth < 1)
+		return -EINVAL;
+
+	if (depth > max_depth)
+		depth = max_depth;
+	return scsi_change_queue_depth(sdev, depth);
+}
+
 static const struct scsi_host_template uas_host_template = {
 	.module = THIS_MODULE,
 	.name = "uas",
@@ -917,6 +949,7 @@ static const struct scsi_host_template uas_host_template = {
 	.target_alloc = uas_target_alloc,
 	.sdev_init = uas_sdev_init,
 	.sdev_configure = uas_sdev_configure,
+	.change_queue_depth = uas_change_queue_depth,
 	.eh_abort_handler = uas_eh_abort_handler,
 	.eh_host_reset_handler = uas_eh_host_reset_handler,
 	.this_id = -1,
-- 
2.55.0

