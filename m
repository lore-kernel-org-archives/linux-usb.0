Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1813A7F58
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 08:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042011; cv=none; b=TJlyrjM997DE6j6iOHC9uZzPqaE1sKjz7PCAulOMPJogYE+mRSSneABc6ZYQ1s+6cInxl3+FIU8ESMIcwwGTR61ci7n6W7GzdYkGDoR2QBhqPNwaf1cvnxEHaZZknzyEVKz7yL5rA0Z8rkisvVK8GGS7CI/hJhk1Z8ecsKJotb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042011; c=relaxed/simple;
	bh=RlsS7vAu3DE/r5tm5+GKRG8WE9EmSc1cMP6e7fbOCVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XGRPFTpmq4Ysp9R9qhuYrnVr+G10+E1IT6xsjGprpiLu9p8hOIleN9oaLL8ydS3xUCGLBICN+S8fn+cobXTE10t6DvLnksJU1momeW18vJNiuKwLKNPoXlusLt8b/c+9QgqKMj0tdKEzyjBj/Zr0cCRDeSY2I8LsRYVgDnxqub0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbazJZhL; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbazJZhL"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-382ef647e20so4187444a91.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 01:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787042009; x=1787646809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=srZLzFpNfDNrD79+dnb6Flm08rVfyHpmgm9TRApXS9U=;
        b=FbazJZhLJC5zX3DES6CHukut/CyoJuVmjFufMTFroVu7H9+eMJiv/4W/Jx7+N6Q9gR
         Uu2VBvmDIU+BlnCabCX11wo7rr6dnvBmi8LL9zukHQ6+dImrljL7sq1l2bUiKLd9k/BL
         VLwK286v13Cmj0cO6vE/qUVVsKrneHNStRwSB6SpB0axfWJRRfClMs4fjs2VNgjiEMpk
         sM2GgbPaRcf+TplZPflzOMzBPp0urZs43UXapdawl26GtY0kPf1gzBZ9I/gKmxoyIaf7
         Kj8gYqmgpZgRJwtCDJOJnPOUhQRexOvww2fAVbFPewQ2UPYVwxcFnUB/FrN1C6hmTh5A
         0Rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787042009; x=1787646809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=srZLzFpNfDNrD79+dnb6Flm08rVfyHpmgm9TRApXS9U=;
        b=ONpFqweLUbOsQUO7crKYlnxgpf4QpWJDPipLP8S4+eMZiC8lS4pOWhWh8uwHZODY35
         Mm/Mv9H5+mr25ZopPhSKAwa1sEnvrvmsLic2Q1MtS5ZTwYLbxUd9gU24pCNLQ0ojlhPZ
         uQl8TFmLw016m2uQc1slX9lWNsD2x+2uXCVfWDWs914hujZDrTFuKR6aez0ncVUjsCcB
         TrhqffqGPv6w8eXaeOM9bkXYSNsuXUdQ9ocEwEJlZ8+NAmABPLaowd5jAA8jH045Ueq7
         rj491jttlV/zrKN9n+0/omm03ZYHaUHUOeJungorZex//PiE+x+H0zdUHchHaeA7+lSf
         FgGQ==
X-Gm-Message-State: AOJu0YyToNIdAVbUNDw0CDyZD5mlzbv6MhFFwsq3qnbucOU8poa+LsIt
	4ZZwv8SF/owUUEkP0qWDXAqxDzjZ+bU0IV4agmR41u2jkhqipQlAus0a
X-Gm-Gg: AR+sD12awx9OdcUWnypqoouCM8aKlBuMik1YScAHb1JB54sTpqW1pcYeBCsHHqxfRs2
	kx1Ty9VcYoC37NMeMS+dN082XGWpEctgcJ9irXC4fZBAI9/Jap7aBE3utNt6Np+RdwsHeyjMdv0
	O8UrOm5WtEnNPXff3SXOcWVVXZrW9rxcBzV85QDBtTD46w2YAHK4u1N9B7xDcbdNQY9mbj5pRzU
	NZSW9iRI60vC/GTqpy/dwnLLNpe0CxKyoimZIWgRAKHW25rTP1Br9N18iOfq6MiXJhkpPVSdvPt
	EclUKrkr1iSdu3Uaebv6srptjqi/vTOPoWX2hX6sKgGbNWwaZvD7mPI3gCZZKrkhDwoqJ0+EB1o
	eVDuX+ss4/PkQtz62ryJ7ljgMX0rnLEiicNPQz7TDRjqk3yskroF2Yg8FDspDAQkB4GukgAw4J5
	kWDXDK7jMJZpufiDuJqs5NuVi2wGqp2jxDnqUU7jDXkypcKSrP4TYvBStRnD59hBTnXm4=
X-Received: by 2002:a17:90b:5291:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-3933bd18849mr34288276a91.2.1787042008953;
        Tue, 18 Aug 2026 01:33:28 -0700 (PDT)
Received: from localhost ([2402:e280:3e0d:544:91b3:77c4:f31d:d706])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326794c0c94sm27801981eec.9.2026.08.18.01.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:33:28 -0700 (PDT)
From: Vaibhav Nagare <nagarevaibhav@gmail.com>
X-Google-Original-From: Vaibhav Nagare <vnagare@redhat.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Vaibhav Nagare <vnagare@redhat.com>
Subject: [PATCH] usb: ehci: fix QTD list corruption in qh_completions
Date: Tue, 18 Aug 2026 14:03:23 +0530
Message-ID: <20260818083323.2270580-1-vnagare@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qh_completions(), when completing a URB at a URB boundary
(last->urb != urb), ehci_urb_done() is called which drops ehci->lock
via usb_hcd_giveback_urb() for the completion callback. While the lock
is dropped, a concurrent ehci_urb_dequeue() (e.g. from a TX timeout
recovery) can modify the QTD list, making the 'tmp' pointer saved by
list_for_each_safe() stale. Continuing iteration with a stale pointer
leads to list_del() corruption and a kernel panic:

    list_del corruption. prev->next should be ff27e4e01aefa580,
    but was ff27e4e01aefa1c0
    kernel BUG at lib/list_debug.c:51!
    Call Trace:
      qh_completions+0x28f/0x640
      ehci_work.part.0+0x1d5/0x330
      ehci_irq+0x3d2/0x490

This was observed on systems with an HPE iLO5 Virtual NIC (cdc_ncm)
where repeated NETDEV WATCHDOG TX timeouts trigger concurrent URB
unlinks that race with the qh_completions lock-drop window.

Fix this by freeing the completed QTD and restarting the list scan
via the existing rescan label after ehci_urb_done(). This is safe
because already-processed QTDs have been removed via list_del() and
the list is strictly shrinking, guaranteeing forward progress.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Vaibhav Nagare <vnagare@redhat.com>
---
 drivers/usb/host/ehci-q.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
index ba37a9fcab92..c715648e97ab 100644
--- a/drivers/usb/host/ehci-q.c
+++ b/drivers/usb/host/ehci-q.c
@@ -328,7 +328,16 @@ qh_completions (struct ehci_hcd *ehci, struct ehci_qh *qh)
 		if (last) {
 			if (likely (last->urb != urb)) {
 				ehci_urb_done(ehci, last->urb, last_status);
-				last_status = -EINPROGRESS;
+				/*
+				 * ehci_urb_done() drops ehci->lock for the
+				 * completion callback. The QTD list may have
+				 * been modified (e.g. by URB unlink during
+				 * TX timeout recovery). The 'tmp' saved by
+				 * list_for_each_safe() may be stale.
+				 * Free last and restart the scan.
+				 */
+				ehci_qtd_free(ehci, last);
+				goto rescan;
 			}
 			ehci_qtd_free (ehci, last);
 			last = NULL;
-- 
2.54.0

