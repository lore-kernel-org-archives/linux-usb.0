Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B524F310784
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 16:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786464385; cv=none; b=RXKueR8+XySLVZQEPATpcN8XNUdkRdlYiueyCKY/O3it1MuAA7wHdcI8JlkfX3HHbaYLdU8vFp3D+JnKGQ2jzVjyQjjVhKOE3mrMv6qxIYSFWv6z54lXHYA9B7D+yMpoC91R5+qQxbuT26+ucR9THYa2It1EDe6WGnIBQPz1g60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786464385; c=relaxed/simple;
	bh=Q11AFmutljWK/xSGy1F4WCSSPG4F+Gb0p9DCwWyBxSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVuI/qemJouiO9EKJlS4VOP+AoR8NePn54tfrr7HSQdZhry+8j/DKQ0GGCWFM5Ods8HUHnTE9GKImkx3jUZ7P8Z4BlmWoTRTNmWCRgfN7C2/16onED9ecc4+hB1utK/blO9LieX9SFWjsgoyZ3HcuAWbkPhHRGt2lTlFO3xnJuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJr3yVMw; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJr3yVMw"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbedf318752so290942a12.0
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 09:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786464383; x=1787069183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qWLUXRAB0ac5pRSFO1pHnYmTLRg2ASj9kBuww6heBRs=;
        b=HJr3yVMwkECAmO1iz1t/HLWlS/+K62XmH2IGww4q672QC/tadQQ+FP++AsOwnauEKG
         PuOKx8P+Ievr8SOQoV7f+8RcQ98+ANdZhMpYas81kEM8vqzOKKPKCN34diiTk187MYdi
         UFtJRp52xgeL2WDXwKjKWA1JKdRlvhHfZVSPapYX3axpOUtDRcXpP16vPKJs44Y+KSWs
         wPVk795szMRuRuL7gGCK+fl1cEeU8bjch83jHIVx1zFANOzi/rK2+r9Am2z5nhXXsPfv
         HOJvLjthDtcCqdcuQCKmICRpR4taNlNxwp898Rq/y+Ka2ZS5rTSk6av86XBtBdx/z7sg
         mR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786464383; x=1787069183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qWLUXRAB0ac5pRSFO1pHnYmTLRg2ASj9kBuww6heBRs=;
        b=JUGNJTdDQvi7NjfVTzVeGlqSyyJDFedQoYOLIe+DgYdBL45SZKOUKBDFfU14KZU3Zn
         sjjKu6MoO47NjX2DUByHQrXDaAJNfL8t4gUplUmvh1F/7fgJZI7bpnFGxjG3c6vPflXr
         85xTHBUXfYdr6TDn5MOtofrtN555vV2waFuoxnJNgxaNzyt6dyljWRmMmDrEBKrpfIC6
         aEqOPba4gibtkU3eBq9kFxHA9fAroNQsNV9xmxHMXrk00W189QnzFToVaBUiI0PKZB+m
         sQDB4hSE0ODfF4gP3OS4Ky9pfjDGoDKTVHikwL7nFCy2kwMue8f0OYG6H+K+Q2O8a/Nq
         GLPg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6KhqSCLvsLhlllcgu8BcQk3mX/oVKmEvWw09m82cF/+VhrB/mgrup9EunwnC6LoM3BNTbSxROwmM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk/TOJZvfvcHxaPv1SMINXv/0UmsNjs4lq+bCtIvDW79QqD7KM
	ELzQh8+BE1aUPH7MRA3rOngE4eQjB4nyXIyzqlsWwMTA8MF/p/Rt60eO
X-Gm-Gg: AR+sD11M0gW652dXl676FEkf6fpzvnmCkM0p2+Um+lDJP+aLbfn5igKW/AU9KRr/G9b
	EUU+ntMfl1jmhsyE3ouYGdKm6F2bV2X6isNQ+yfjEtPdVEmbfZ9XPX+8wopkH3Cth9mIhBDnuMV
	//37uImIP016Jdmu0HqqvQe/ghTmTvP11N5m/Nx9qt7THvE7nt/+c5VIoAm9aHWQgOU7C65ZhvP
	PcLU3kJu1gUrNMAX1kJzs1h/r52RghJrIxrHjf3RqW4D0T3pmN9ljJ4STslu045WZnq38cc1mmL
	HA9Ev/lFtm+Lk/7oesOrusrq8C4sIAQePmy5oI0Ii2PSsvJcGT26/yX0vUF356DPgvgIu5PBarX
	K0o7Lyja9aYlZoy39zn701Fovs4Y8RzGzZIuB35eeDHavTqrE1rLQHCqj3PGtuynZYua6XHfaSy
	4iUrjcez+ZPYuAwwfxf1Kb++9MFOGjrfXP2QJXyP942Y4+yzzhaUjVJVIW9QmyigpaH2lRGY37t
	jFW
X-Received: by 2002:a05:6a21:e0a6:b0:3c3:7481:7a03 with SMTP id adf61e73a8af0-3cc2baff4acmr6296784637.34.1786464382690;
        Tue, 11 Aug 2026 09:06:22 -0700 (PDT)
Received: from Default ([2409:40f4:1011:30f7:310c:32cf:5ea7:7043])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3624c08sm916149eec.5.2026.08.11.09.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 09:06:21 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	gregkh@linuxfoundation.org
Cc: i@zenithal.me,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com,
	Jeffin Philip <jeffinphilip14@gmail.com>
Subject: [PATCH v3 2/2] usbip: tools: replace faulty rebind_store with drivers_probe
Date: Tue, 11 Aug 2026 21:35:41 +0530
Message-ID: <20260811160541.29461-3-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811160541.29461-1-jeffinphilip14@gmail.com>
References: <20260811160541.29461-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

unbind_device() currently unbinds and then uses rebind_store
to rebind the device back to the usb driver. This is already
possible with the safer drivers_probe rather than the faulty
rebind_store. Fix this by referencing drivers_probe rather
than rebind_store.

Fixes: a46034ca57ed ("staging: usbip: trigger driver probing after unbinding from usbip-host")
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
 tools/usb/usbip/src/usbip_unbind.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/usb/usbip/src/usbip_unbind.c b/tools/usb/usbip/src/usbip_unbind.c
index 66a44d4a0d56..242280cec452 100644
--- a/tools/usb/usbip/src/usbip_unbind.c
+++ b/tools/usb/usbip/src/usbip_unbind.c
@@ -34,7 +34,7 @@ static int unbind_device(char *busid)
 
 	char unbind_attr_name[] = "unbind";
 	char unbind_attr_path[SYSFS_PATH_MAX];
-	char rebind_attr_name[] = "rebind";
+	char rebind_attr_name[] = "drivers_probe";
 	char rebind_attr_path[SYSFS_PATH_MAX];
 
 	struct udev *udev;
@@ -77,9 +77,8 @@ static int unbind_device(char *busid)
 	}
 
 	/* Trigger new probing. */
-	snprintf(rebind_attr_path, sizeof(unbind_attr_path), "%s/%s/%s/%s/%s/%s",
-			SYSFS_MNT_PATH, SYSFS_BUS_NAME, bus_type, SYSFS_DRIVERS_NAME,
-			USBIP_HOST_DRV_NAME, rebind_attr_name);
+	snprintf(rebind_attr_path, sizeof(rebind_attr_path), "%s/%s/%s/%s",
+			SYSFS_MNT_PATH, SYSFS_BUS_NAME, bus_type, rebind_attr_name);
 
 	rc = write_sysfs_attribute(rebind_attr_path, busid, strlen(busid));
 	if (rc < 0) {
--
2.55.0

