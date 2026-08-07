Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14627332EBD
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 02:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786070592; cv=none; b=ehscuwdZbNtlFbf/twtipTXBOFELtF9L1IjArUfu0KMXWoywtyzlf/Ec+WF6o6+1UW0JygZf+VAn89r36UBXIajbUxiLfI5MSGN2R7LJRdoy+WjyS+PWMR22jukLL44Lef1yBHydJRDtASvnBbedGAs9wsE1m5s6crpuG1Uxmwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786070592; c=relaxed/simple;
	bh=rCaCraUsyitUcvnePFtaiKWGpOeVONS38ajXlSPYS/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DL61vESd9TwRxjJ6jmxjecHSFgZrQBtsStfNQZfD//V3KLF8Hdblk0pKfezN0FlOxpaNXpkJcDxTC8HnsY5bVNJ0P/5aXFNXNg6rOhYAZzm/1/t8MwVFUNVGjqE7o3qyJgDs1mKWJnaKq9169MAwcaf/XD1X7RkqEa25jhpKlvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+2i6ohM; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+2i6ohM"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-527e352a167so19239091cf.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 19:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786070590; x=1786675390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CsrsyxFG7GOYeXOWf4uqDKnv5HyHjU2WKbIHtlmhwlc=;
        b=Q+2i6ohMcWYjLHGe2N2l0zRHdOmzp0kXvGaiZ57moL32+EdBQCkHJK/5SMOLB8NmXj
         DO4mV419ydVrQpfPg7E2QaIBYQFTBg1pByHwIrrsZCkV6RaVgMlKgyg7pt5LIoEp24cQ
         RsMHU1TLsfb6TChxrBls5Hww6BZCsW2r1FosGcDM3ZfZUGb+FZ+05O25LU6GlPJoPIht
         dy+sHCN7sleNRWKRibkr4wnHHwezsQm3LmDBDSeI9LzUVaDoV2egnXSfCdym3bVsRQAu
         AnrI0/oKrq3FgZJrRGsjUOc/MNhIv0tfz2J45g88M4cbKtqvItd+0MbbSMQvo7EuS9M/
         An7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786070590; x=1786675390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsrsyxFG7GOYeXOWf4uqDKnv5HyHjU2WKbIHtlmhwlc=;
        b=nATdj2JXxOZiqkVtDR2AUApIUPoocczb47eeIB7uzmHj8K4Oc5dc8mOX2IqwaTZr+z
         OkKMk4JLSrEXrL+RzhLXs7+Pu5bDO1l0LrzVTZnNYNi+0wbdkkz/kuolGUygu6PAFZbW
         cV2R5l7qOfh28Aa1Jbeh5lV0s4a0CFwxQxJdjfVZPABH9x1NIV7GFKUmkLJ7yjS4BxON
         fv5zlpgDz0xYoH7nEzMYv9WnD8w8LX2p9EURzObeeWYHq2eCPKhIWOZk0fCzCeJt6bTs
         m/2qqu3GVPj6M9L2aN8cb2h4cCVTs80vq6HiN6TLCsB/i8svc6rwrCxykuVpBWyB79+d
         g3eQ==
X-Gm-Message-State: AOJu0YwT4gtz28NEaNxfqFX/O/uqjOJxc+vh9vniEjpganpEY7+mGxxJ
	SPH7jV5GXX2r/d8VBv5piCzT9JifU72NKdUNhDmVaeYEi+nwDdB8rwow
X-Gm-Gg: AR+sD119RZw+vjmO/RySq8cWjoJ5SfaN4w6N3YuhhZtM6EVNaRzeJfwK42J9t71a2ig
	V0/tlr/dNLy3eKTEAdA/mEyQlkuid1hwZCpAMc3MXWntduC5n4aANe92La2DZT4uIppEFl4tUD/
	jr80/BaYek+NBWuGkfoSeoMaFN7Su8p6YvoDBEMH5ydrnIpwmjEje+XGqrG5/fConWkT08iI6lW
	q6MIDEpkyEB3+Jays2cbxX49bJNxsQJIbcQrbCHV21lcAIMe6/dQCNmrc7q0piPxHwcR4whjrXC
	PYsrhde4shDtnAA1IgNXgFlczoTcHfGpmhfOLdyh5++CH9i77IZGTOt93fAmFUBmxRtn1KBhMRP
	yQecEmXcRXe95xUINFs+Po1glNKR07H2otIl9swsKqvwI//eb2jRkzfGUaYZpKpFlP4WDJwC4hO
	g5CcTndnN+2uIG8egprMGoxkz3tW2QnJ9Xup3hc2wDDdY5j8XaWoUTlVZBp2Ypi3sS2JP7m+M20
	Ndrg86WTGd5LacB998qaKhSTeZGKihnU/smYUhKbHL6pxZwjcyHqAmSmD3rMiIo9mkPysoMIg==
X-Received: by 2002:a05:622a:1dcf:b0:517:580c:bcd3 with SMTP id d75a77b69052e-52ce604bce6mr224287081cf.19.1786070589676;
        Thu, 06 Aug 2026 19:43:09 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d1659c1e4sm2825441cf.19.2026.08.06.19.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 19:43:08 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] USB: pci-quirks: Release EHCI device reference
Date: Thu,  6 Aug 2026 22:43:04 -0400
Message-ID: <20260807024304.928708-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

for_each_pci_dev() holds a reference to the current device.  The Intel
EHCI lookup breaks as soon as it finds a match, so the iterator does not
get a chance to drop that reference on its next iteration.

Release the reference before leaving the loop.

Fixes: 26b76798e050 ("Intel xhci: refactor EHCI/xHCI port switching")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/usb/host/pci-quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
index 0404489c2f6a..ba158d63bb8b 100644
--- a/drivers/usb/host/pci-quirks.c
+++ b/drivers/usb/host/pci-quirks.c
@@ -1073,6 +1073,7 @@ void usb_enable_intel_xhci_ports(struct pci_dev *xhci_pdev)
 		if (companion->class == PCI_CLASS_SERIAL_USB_EHCI &&
 		    companion->vendor == PCI_VENDOR_ID_INTEL) {
 			ehci_found = true;
+			pci_dev_put(companion);
 			break;
 		}
 	}
-- 
2.43.0

