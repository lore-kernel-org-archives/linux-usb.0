Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com [209.85.128.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ACB3019C8
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 03:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782272987; cv=none; b=biK+AQmHIXU3R8Qrnd1BQE0aZUfUbaixfm9+2h33EqBpnEmYgbrhzY5Cz1ax3lS5u8Jlb+Y1V1C64l44PzRele4Pk8ZnC9UBonDkQzBpgIvuQjdJ6wgIos1SGpk5hfHDvyMeLZdoNUtUY+1LecCVKxM/dDWDAny92MUnjPHWVfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782272987; c=relaxed/simple;
	bh=HGV0X+O8+L50gEFS8A9GPsWPKShs6DF22H4HmN1F734=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DTSzfQ+5knPOUltgHlrp+HbVHZmSxFEBfMWJ9NSrCpsWdYxZfAWVZiiomRQrYrXeuZlEjSN6hLrcrmUSAywh2vfY7PBVPYb3oUru8CgXaQas5IjQr85SJYGptRqWguLJMcys+LWL9lwQucm060FoAqrM6DDwstI6XNDKccp7x7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DQf4aWX+; arc=none smtp.client-ip=209.85.128.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DQf4aWX+"
Received: by mail-yw1-f227.google.com with SMTP id 00721157ae682-80236b44a1dso7154047b3.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 20:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782272985; x=1782877785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dLXwVAuePBBU9QBiISkll/5W6YI/CqhcBrATziF0IM=;
        b=TmFTMmOqTiEeeg6KsaEor15cpn0BNRJ9dSmjxk8vYU9eI0grCmOFWEjQM5AwAcPPZr
         ulnFp+OQiGHTbzzCL4eUUkPtPta0eTfPwqDlVLr2gwX0jBStTR3ks2zsKnJx8POESdvs
         7ZsJsPQ7Iyh4QSk66tapKQyQ585MhlAQzswxzdynd9MlfidbBD43bCEMYGy+DQ9MdvZL
         YXU/b8uSP7KQeSnC03ohE51Kqy5LqnA+PpVwLPdxYn2oJUJEyrkKi2+1w641fW0BdSC0
         iLptv/KtnL57kKk4c330SRZxOPYBpRHKzKPfZ+AM6iynekhk8NW5Uo+4MeRNfHR24b5Q
         cn2g==
X-Forwarded-Encrypted: i=1; AHgh+Rp/qJuWMushLGjHgtFs6SvxUvckyXKDraRvpTTUi/y4k0Az/2RTk8C8ts8CZqpojQEKkI/tHdlrUN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW/p3RauTvRxBXmT0/IQUvYO0UZ7HEMt/wFLVs97R72WNWUxvy
	kg+GZs9pKzA65wgK2Hm0Q/buuQ5wx95jCEZqDNsGVyCYB3oyEVsHu/7HJeJs5jRLGpZAFZYsYAM
	k7cVXOtlRkxyUxSK8htNgALtTaKQBXCnS0++Bn91cK3ZpaaCkmJULLlAs92eQh7BCaHlHdq2GeT
	eWBMWwzsBXwVE6aTeUj8IqKynbXtwQQSGJS7TAy4zlbzgO86zgA+d6eUjynqJxG2sKiqqJV5TJ6
	S3x2+oqNyQNZA==
X-Gm-Gg: AfdE7clQmVQYQ39WECKfOQSoPI22FLP+quky1IlonMuvC4Ffp9dz8wr408Zcy9+8E9W
	Caf2FCL1SLITGJ1h/s6gnH5JA5fwABuOKZArfa+zNcDmh5uapQw06AdhPL7z32Vfif8zDqAJZup
	lPAMXZ5bh0+pX5tjtNwfplAhlU6KDY/1eNofwelm3ArQze3nFgbu/YEKCawWaUWVPsMBEGQLrov
	ryl6Sgk3fqoP6XRfs/0NyaSdkp9tP+TW11z6NP26+94TD6uO/1mwSmlL9OcnUfZv7mQLXyXKWD0
	8BGlLxseLxUy1r6K4766bdpfcWOBu7Y6jmvg7c42XDtMmrVC/v6rD+T0nfIIvO43KOv27iObGq0
	vEe94S9RNPI8At90ndCvkWiUTVnhmOtYQB8PwFB07g8nbLlb8lPKYb8EGLq/ABBTZRyRuki5nG+
	eACBiN2BSHwTX72r+b9N2Qd8kILnjq/8i7xfyoh/r6EHIU
X-Received: by 2002:a05:690c:4d41:b0:7bd:5d03:dc18 with SMTP id 00721157ae682-807eec6b815mr16154207b3.29.1782272985151;
        Tue, 23 Jun 2026 20:49:45 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-8025f6e853dsm7169757b3.19.2026.06.23.20.49.44
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jun 2026 20:49:45 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bccca5620so801577eec.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 20:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1782272983; x=1782877783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5dLXwVAuePBBU9QBiISkll/5W6YI/CqhcBrATziF0IM=;
        b=DQf4aWX+//PS9WgrCrOK+IDYHENyncexo7O1nI2EviylGYUsKIrIM7iLFuJht7tRVW
         g3co8vpqBiA/HK7AnM+U4yf/c8iJeYLkHKUq/pNYYUBUH4Wi+OPnTlAyVCrsS9Li0HO4
         pJbbvXdivelxszYYNDsaIyI6yM8jxgjT9ovD4=
X-Forwarded-Encrypted: i=1; AHgh+RrQKaEAZTOEyDUM5YBA/5uAeWS7VGNps5EHA/ksZyEcmyuPLAUCbM65o5mK3lRSdt/1kIdD4ZUGQlw=@vger.kernel.org
X-Received: by 2002:a05:7300:cc10:b0:30c:efc:c399 with SMTP id 5a478bee46e88-30c69404640mr1868261eec.35.1782272983237;
        Tue, 23 Jun 2026 20:49:43 -0700 (PDT)
X-Received: by 2002:a05:7300:cc10:b0:30c:efc:c399 with SMTP id 5a478bee46e88-30c69404640mr1868239eec.35.1782272982618;
        Tue, 23 Jun 2026 20:49:42 -0700 (PDT)
Received: from stbsdo-bld-1.sdg.broadcom.net ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bdffa83sm25451255eec.23.2026.06.23.20.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 20:49:42 -0700 (PDT)
From: Justin Chen <justin.chen@broadcom.com>
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	WeitaoWang-oc@zhaoxin.com,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	bcm-kernel-feedback-list@broadcom.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	David Wang <00107082@163.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Justin Chen <justin.chen@broadcom.com>
Subject: [PATCH stable 5.15] xhci: fix memory leak regression when freeing xhci vdev devices depth first
Date: Tue, 23 Jun 2026 20:49:38 -0700
Message-Id: <20260624034938.4126679-1-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Mathias Nyman <mathias.nyman@linux.intel.com>

commit edcbe06453ddfde21f6aa763f7cab655f26133cc upstream

Suspend-resume cycle test revealed a memory leak in 6.17-rc3

Turns out the slot_id race fix changes accidentally ends up calling
xhci_free_virt_device() with an incorrect vdev parameter.
The vdev variable was reused for temporary purposes right before calling
xhci_free_virt_device().

Fix this by passing the correct vdev parameter.

The slot_id race fix that caused this regression was targeted for stable,
so this needs to be applied there as well.

Fixes: 2eb03376151b ("usb: xhci: Fix slot_id resource race conflict")
Reported-by: David Wang <00107082@163.com>
Closes: https://lore.kernel.org/linux-usb/20250829181354.4450-1-00107082@163.com
Suggested-by: Michal Pecio <michal.pecio@gmail.com>
Suggested-by: David Wang <00107082@163.com>
Cc: stable@vger.kernel.org
Tested-by: David Wang <00107082@163.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Link: https://lore.kernel.org/r/20250902105306.877476-4-mathias.nyman@linux.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
 drivers/usb/host/xhci-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index fb81e61a599d..7f75298a09d6 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -961,7 +961,7 @@ static void xhci_free_virt_devices_depth_first(struct xhci_hcd *xhci, int slot_i
 out:
 	/* we are now at a leaf device */
 	xhci_debugfs_remove_slot(xhci, slot_id);
-	xhci_free_virt_device(xhci, vdev, slot_id);
+	xhci_free_virt_device(xhci, xhci->devs[slot_id], slot_id);
 }
 
 int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
-- 
2.34.1

