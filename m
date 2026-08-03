Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191033E0090
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 11:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755244; cv=none; b=VyfC/kO9RSE/D0JaCHMP3PJ7iZ+rM5tdFleW62pSfdQML/2Pm1WB/SEKsc2+CsVG3X45j3LaVyc2M2bqf7dHcTLjwAzcZTAGuSAIrQR8BzhkI6am2DicZFEt61IWXw+TJZmJ7lNZF12JHSVv+qCyNdXNf4NLflyMFaGbA6ZcCEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755244; c=relaxed/simple;
	bh=kx7Tqf/hlHoa0pFYeuY6JbaFYF677+N66Yr9a9Y3xCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MCqb1dwKnaf9tqqRFDXCdhC0j/rvTlg0YNRfkImO13hGtsFTlopoNtpH3y/nGuL+hU9WrU5KmUP8DrIFfaS44IVA0r6cIXx03iDaaGVAi8uurzJIC3A/d9T+6KNyBJZkPRaZtRW20BDMDJJWzUE6c0VUYDw/Eg01MD/C3jCh/qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qabxqPuh; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qabxqPuh"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1669223f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 04:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785755241; x=1786360041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qIuUPtqynuFa8VYYKQJcEKb8Og2XbEd8p7B0qvItkjQ=;
        b=qabxqPuhuRc9w6cCk1YljiiLwzMlpdPVHUYKMQedjc0zYs/Qo6PK/LhQ0/DITtwYLt
         PaRcYKVIewJ15Ce1uiUeBwPocb9IsEXw/MvVFG/QPjK8vGZA44BQizxk3W5tvDnSoV5c
         LskpQi38AbZ0xdWSmIhZxpO2jslDBrM6BCRXsABy5LFozqovLCYLwtc1IrpOZtZFZ3GU
         CiZlXTS+Pc1cf/iWRKxNqQkXGav+A/5KlduCARi0hdW1gcQ1UM7eyhAEVVyAcDhu7G79
         6NKmTNmnU84tum/7koNjLDK9MSWK7trcO+o+a0YY7Br2eBjdxg3uNLT902zxP0pKYzb1
         mmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785755241; x=1786360041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qIuUPtqynuFa8VYYKQJcEKb8Og2XbEd8p7B0qvItkjQ=;
        b=EU68cquKiiohbzw/Ewm1QL4Bqz+GShKkrkBsNoaMUbysC6O7vHLadmCNHsxXx+XWyd
         rGaIs5nk6aC1XqoWkI9oyTc2QE46Ne0S0t3nbrq1/w3tuP+VToZ+53tO0K2OzZn235l5
         /WhKnee1pMmdY1s116i1FCGxdgMu/FnZJocyoQ2BAp2DOHJ4o5qWW1WvsaOSgmRTxDdD
         rxrQjLM8mosl1RUXHwwy7OmtsZ3MnDGMKku06DtAv3w3qupPQOIl1wsH1YE+eCip1/LX
         qsk2C2NUSKizgN9sFJha+XOx+Y5fxunC4iH2W5/nObVDGl+HR0CoXAjeXSb9pEtgGQ21
         G0/A==
X-Gm-Message-State: AOJu0YzUSdloEEPLK1oluI7IOTwqHiBiNkGuxMxUzU2kFIHMbTl96dYM
	IPzoyCcFHYxE038lqn3QcsVJqel7zPmqcVVaEb0+MUKBJ02gmcG3LtA9b1QWKzq4ZvE=
X-Gm-Gg: AR+sD12cC+51vb3LD9rlk0ffDrVp1qPbR5yU9EH/zQkxpKDvC/m6SMb7ha031k8T/bo
	hlULSITEgGMLraYvYsOMn7ikAbAbgbjigizxKt/QLNMrQLYvM0oq1vpHvw6qOgmcOR/GNP55c1/
	kqaetaBTb6JedOyIHheMuDDRT4a1GIEiYe77VmA5rqxYRGEG/oEkooK/6JK2iYlzNxsZ+E6FrRu
	cn+ai6I3ugnYapYb48H1H8xC/0uj14B0pldPdzO20B+wdYbHZ2Jh8duSGqvFGdoovo7Famrb9L4
	SiudCMxKTxe1G6Xzk/crr6V0evk/NgSx2QTgqat1BBaaPRJuLjBxIKju1NrsWzu6moVnh+sWaEq
	3kM0cAdXAmwP3zBadE6UdDfARK3N/APEtKMXkPYZjsRL8Rz6sK5fkkmtIdYkhw9b9w0IjAY0XWF
	TQ6PdRn4+SSNiuLwIIGCg82zePta8oqAAyjuvpgCBnQ3ScF4HkQSrlF471EJG5Q9kST0art3BG0
	A==
X-Received: by 2002:a05:6000:29c2:b0:474:530:9d with SMTP id ffacd0b85a97d-47fd72b03e1mr16772676f8f.13.1785755241100;
        Mon, 03 Aug 2026 04:07:21 -0700 (PDT)
Received: from SVR.localdomain ([86.106.74.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4562a38sm31558064f8f.21.2026.08.03.04.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:07:20 -0700 (PDT)
Sender: Semih Baskan <strstgs@gmail.com>
From: Semih Baskan <strst.gs@gmail.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org,
	hkallweit1@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mathias.nyman@linux.intel.com
Subject: [PATCH] usb: xhci: Handle USB3 port events when there is one roothub
Date: Mon,  3 Aug 2026 14:07:04 +0300
Message-ID: <20260803110704.381-1-strst.gs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

handle_port_status() drops every USB3 port event when xhci->shared_hcd is
NULL. The check dates from a time when xhci-plat always created a shared
hcd, so a NULL one could only mean the hcd had been removed.

Since commit 4736ebd7fcaf ("usb: host: xhci-plat: omit shared hcd if
either root hub has no ports") that is no longer true. A controller whose
USB2 root hub has no ports gets a single roothub, the USB3 rhub is served
by the main hcd, and shared_hcd stays NULL for the lifetime of the device.
Every SuperSpeed port event is then thrown away as bogus behind a debug
message, so devices never enumerate even though the port sees the device
and its change bits stay set:

  0x006a1203 Powered Connected Enabled Link:U0 PortSpeed:4
  Change: CSC WRC PRC PLC

Broadcom Northstar is such a controller. USB3 works there up to 5.15 and
stops working from 5.19 onwards.

Ask xhci_get_usb3_hcd() instead. It returns the shared hcd when there is
one, the main hcd when the USB2 root hub has no ports, and NULL once the
shared hcd is gone, which keeps the original meaning of the check.

Tested on an Asus RT-N18U (BCM47081), which has a single roothub. Before
the change nothing enumerates on the USB3 port; after it SuperSpeed
devices enumerate normally over repeated connect and disconnect cycles,
the change bits shown above clear, and USB2 is unaffected on both ports.

Fixes: 4736ebd7fcaf ("usb: host: xhci-plat: omit shared hcd if either root hub has no ports")
Cc: stable@vger.kernel.org
Signed-off-by: Semih Baskan <strst.gs@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 4f98d8269625..829f3e8db26a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2025,7 +2025,7 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 		vdev = xhci->devs[port->slot_id];
 
 	/* We might get interrupts after shared_hcd is removed */
-	if (port->rhub == &xhci->usb3_rhub && xhci->shared_hcd == NULL) {
+	if (port->rhub == &xhci->usb3_rhub && xhci_get_usb3_hcd(xhci) == NULL) {
 		xhci_dbg(xhci, "ignore port event for removed USB3 hcd\n");
 		bogus_port_status = true;
 		goto cleanup;
