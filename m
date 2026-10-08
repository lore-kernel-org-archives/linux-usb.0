Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06723B9D98
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 11:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458811; cv=none; b=MDDDbhV0v4v1yP+Uz80Szqd0jXQFhSFcfl9qQVXNusGIKe1o6HeoJLqbi1X0yT/gubfL+b7L1AgcPst5a7X9aYxhOTHEe2ZVcQ0TZLq3tvYC2bTqyAJv4H6O0YXnuHsa9X7xO39ZZ9yBl4pqSBnW4J2Pf1C/FAFTp2JGWxrAbbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458811; c=relaxed/simple;
	bh=AZeZBIDeh5u7dy3d92kG69drFR2UguJCjl/XA2N1EIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VTXjsbR/epGu26fbh496DkuzQL/Ov8e86MGXlPclNuy3S6BHPQrF9nHQxFShRY5fc4OIjwaxtuGlAbFUoSmXy+DXYJqGu5J4n2R4T+dq41W6x1AGESkAb6TSMlGJOYQYs/VTP8H9+IySe0n8FiyqZySRQbQVE0ETYG2yx9Y9/dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0nVJwwT; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0nVJwwT"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49e73611928so4365155e9.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 04:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791458808; x=1792063608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHbdqV3WrEigCNy1tObIuBbS8ZiZjytasJHGB0ISHRk=;
        b=L0nVJwwTp7+DXGgnI781BgJ22G4gbklWbtj5kW20Oq72Waez5YLNhiQAqVYlbjKFGG
         nEKHkA9G/dkfN3oHBjFhC8utZnfzxb9vlUJQhCwotv22Jy+qn22bapUFn/vY3sMguERa
         1LwQCJciEwbxO7TG/AnKfL458QN2Uqzsz1jbk7iyh4e9TPW24nMOY8Nj0V6qaYQ9VC1z
         qoj8qaPpOGKeiH+vEl7B4bPehWTOtOyrfS/3yzbvv/13mqeyhvfAxuZXU78hyiUVPJRf
         mV5B6gE/Qsk3Zax+5pkGj8YG3CrG7cEVBAKDK77cI1E7AN2maiCfIxNQp/2NcXQuQ7OK
         xtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458808; x=1792063608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DHbdqV3WrEigCNy1tObIuBbS8ZiZjytasJHGB0ISHRk=;
        b=cNXUxgNb8yOq4R1ZAV48UC7LAt82Dv3kEaUXV1L+P6KlmqTnfwJrZMiRd0kWmIN28o
         a2hpBmzLBhSqsIcLbNESr3o2tkgn3zFrVFV0w5GUs8MsSOINpfbsHB3TVsVDiYJo/Pzr
         a238MshmZg55i5j8BjesX7agk0ZuwDJoRS7Y2tjZuLlFWGiij8kPZFiMr+fcHY46O5xy
         YsfUV97IKglMK5mPHkiHMw9iA+FAY/EicPvrJm0Z/KOpW6+e0MsCcsAc7hkBbBQ85zuo
         SlsKnTV0I7vNvzpTWASQ5+Qcm45yZD/f5+gYFOVcwxPZUVvumnTMpjtzm2uic+Jgf4q0
         T0lw==
X-Gm-Message-State: AFuF++lhbqDiL3PgT/mEitPGg0Dmxv57AlWr1HFOSJdDNT67XhNhkGNe
	k48uaFCpD6q88j0LNVW1BJd0UGqF94sYNbEMJg5QUGSwPf/ykrl3jmMUKaCM6A==
X-Gm-Gg: AYBFou1abEmJjCvCpBaQqQe+kLnk4wH4VSNHb5cP1psWJzLtjNkPjPUAGvUwH77C5fS
	fXJnpS/2FBFY4xm+yQr1BdflLKqT2di8+OITE7TjaF6zEQW4DxA7nRvNIMV0BQxD3ns/5ql2XvE
	WoVOVSm2KlTK1+NdWXoo/QdfdeVZ3Qf1mECRX/Qd7lL8Ap+XD2MCrs33/cmL3A3DQClaqdxfxYq
	iHxY7TgvUT0T7gtpURw9uudWVfeK/4al3R0KSBjd/KWxwb72SKWY17vme07hxFuQUJ+K7NEgZUw
	tR/dPnbhm8ir7gPlIxBifbJXN9OxBUlleaM6DURYlaQiz/tYYrUV8+VVlVfZkxAAH84FQ/SJS7d
	J+UBsXKgKrIJMoVKfPGvpdLYY7j2YuXlXudtTDJauasPT6pt0w9//9OiMVP+PpwVJ3FvqsOX73J
	eb3Xy5evRCNzGMRKeVtWK3Oizy/ygFba+edLt2wN3ZvAPm2E3FxCTKIlp/bQWOR6ObyKuPxAsDV
	vr5S7Mt1LumdDH7qzkaXgp5k/fHHW86L4YEnuYyzOMGag7hDnmzz/gB9NGm0w==
X-Received: by 2002:a05:600c:4691:b0:4a1:6282:1cf3 with SMTP id 5b1f17b1804b1-4a1851b3756mr46001435e9.9.1791458807613;
        Thu, 08 Oct 2026 04:26:47 -0700 (PDT)
Received: from darkstar.tail74c586.ts.net (mob-31-158-15-193.net.vodafone.it. [31.158.15.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18445b6b9sm67716975e9.8.2026.10.08.04.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:26:47 -0700 (PDT)
From: Luca Cecchi <luca.cecchi.info@gmail.com>
To: linux-usb@vger.kernel.org
Cc: linux-scsi@vger.kernel.org,
	oneukum@suse.com,
	Luca Cecchi <luca.cecchi.info@gmail.com>
Subject: [PATCH] usb: uas: implement .change_queue_depth to allow per-device queue depth override
Date: Thu,  8 Oct 2026 13:26:45 +0200
Message-ID: <20261008112645.1820678-1-luca.cecchi.info@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <f82a72b7-6122-4bbc-adf4-2d08706344a2@suse.com>
References: <f82a72b7-6122-4bbc-adf4-2d08706344a2@suse.com>
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

Signed-off-by: Luca Cecchi <luca.cecchi.info@gmail.com>
---
 drivers/usb/storage/uas.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 2651629..74fc438 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -910,6 +910,27 @@ static int uas_sdev_configure(struct scsi_device *sdev,
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
+	struct uas_dev_info *devinfo = (struct uas_dev_info *)sdev->host->hostdata;
+	int max_depth = devinfo->qdepth - 2;
+
+	if (depth > max_depth)
+		depth = max_depth;
+	return scsi_change_queue_depth(sdev, depth);
+}
+
 static const struct scsi_host_template uas_host_template = {
 	.module = THIS_MODULE,
 	.name = "uas",
@@ -917,6 +938,7 @@ static const struct scsi_host_template uas_host_template = {
 	.target_alloc = uas_target_alloc,
 	.sdev_init = uas_sdev_init,
 	.sdev_configure = uas_sdev_configure,
+	.change_queue_depth = uas_change_queue_depth,
 	.eh_abort_handler = uas_eh_abort_handler,
 	.eh_host_reset_handler = uas_eh_host_reset_handler,
 	.this_id = -1,
-- 
2.55.0

