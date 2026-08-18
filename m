Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03AA449EB7
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 09:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046627; cv=none; b=UXj3sDSY/fWHDs8ZQJ2nZt07FkvZg9AKt/JpBIjj7AxVHXsRJy7kuZn/fsTtZFZTxYUdrRXY1cobbhgpQwsyLz8aSxdayPhudkAQ/CdEYk+3MXXeUwSslAwJaTrt427xm2eJ3iXGTkh2n094LCRrCWugMrGR4NzZwKNLL0PuErg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046627; c=relaxed/simple;
	bh=GD1Vc4R//+edz5nsQcN4ZexU13rPFqIR8OXVB9M60EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DcWV+L2pUPu9/2dBdtKpDwRbmtpmmW9gCy9lOhL+J7ecWC1ZYiJ7iPXDD1TDY8V5V4vwEAf4tvcWUYdwQ4d9cyVtY414hEM+2bD9PT6zo+qNYJJ7u7QwYW9UDgCPUzMvE/L4K5odNQ1lxPl2JWe7Y4GFQ6BMmuUhaCMrdGSWwzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDSUiRWy; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDSUiRWy"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso3560690a12.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 02:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787046625; x=1787651425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UcNrYIKS7I8Ey6PthAcBWgTxm4WMphn6yPUGDS65t7E=;
        b=tDSUiRWytU0QA8uLWJ699OOt+0AV/PHVcSpYRwOA9iyzuEchs71nXycJwi8lPqT2Xg
         h6vL81AyB3IA4PC7y1l6rzacxgLtyJLR8yMUFFf+fassgGnEwSFGHwAAep/GNpkcAXZj
         sb0iNIhAboDsEfbpr97+PxT3xwgWOaqUgK4NugAFJpNKnx8p2m9Hw11ittB5IJH/u9XI
         gQ5TYqfd+XHEDNE3cPAiT552dQBgWT/rpMeJ4TS5X8HvnF+rOJ8j1J5PWenBSOYBacR1
         /anXL3iNyErjCUESnv4xR6xxfDw6wFFuzm57IfSRStviCcYs/XwwNRiq8YtXI78TUbRy
         zNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046625; x=1787651425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UcNrYIKS7I8Ey6PthAcBWgTxm4WMphn6yPUGDS65t7E=;
        b=WhjEP4RlxiZeC+ppZPNwlUPBCmOhlVOCPPfoIfqnutaBNgLOR7keAf8zomv/c+McB5
         Nz67HvFiFTlHlkCVead989yEgj1r/KFwgaFIep6Eh21rGQ0UJfSk1butftdoAJ1sicwO
         3locCaEUv0RV/oD3TIYWE9uDT9hHNndwNWjO237Tm8tJpFUBOZbq4G+zt7mP3qIF2ge8
         ZZsZ4zSr2AeVAY9hH3bITy7rnwqHZ880xhOfttPa4yoWzIttveNW9xgSrsTAeQuQI+sv
         pJ0z0gnzvugrVOxO0NkwT03MnhobpNAvTIBB54Vvhdgm9PQv99R3pWK9VJUAgD8hbg87
         P2AA==
X-Forwarded-Encrypted: i=1; AHgh+RoRnk3t8jo1/OMg9hnZ76fRv8UWYfdG3gkYKkL8QMWUUazR/g7ktLCx109esk+eiCAN0Wn9j4dyGlI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo/qTaYc2S//QNtP7gZ+V7GjDVD7CWypNiFAv4OTZ+CgdXqcxr
	SlXV6f3YrtijsLUojWwdOD8PqDjiHRLunQwTh5GR3G/ZzeFrhHzuBSM=
X-Gm-Gg: AR+sD11Tb1a1RX5DGJySJCf/17OIFUVv5580/lV/DGDWrUWFHDth4j6qsemFRKyPIBL
	b9s46OJhbRH0LVV5eZiLNTfOpnX7OyFq9ds0K8dxbE4LuiitTAIUOe75+kfXtmcRIPCX3CR8YRH
	oY+pzOPCU5R0/6g0vOoBBd4qGxNmhI32UM12t5WcnGL/P/nd5+pJVI5F+DpNkredmJfFLpBclNE
	kcu9AoGnwSH6carGYbz+y7OVKA35bIhIlQRmpRE8FUmUQLOZ8Djh3XQIW+ee5IOfeJM9WfHGHi+
	5H/JRGf7a9h4B1r1Q+n5R2k/W5YIuFZxd836naJ3+eoEDNodJmhs+yVYl8k8akIxYWSoJCBDnS1
	iNKd614EBW8y4MlR4UMOAV8Ad0XPJEPuyLOAXPkDSv9+6kZDI6HxK1aAxQx/DjLaG8nLh3sohrN
	F07wwZ9+kIkPAlSOjaeOwYF3FYGJ5ImO8IpcodIc4HbeKM6oDjV1YshXQsFb5gx1G2sDLduVd6H
	jXtBgzuEaUAxkaJJByS+fU=
X-Received: by 2002:a05:6a20:4311:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3ccda9f9485mr8850496637.13.1787046625023;
        Tue, 18 Aug 2026 02:50:25 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([14.97.72.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798cb9f5sm18466759eec.13.2026.08.18.02.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:50:24 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/3] thunderbolt: Add device links for Apple machines with Titan Ridge
Date: Tue, 18 Aug 2026 05:50:03 -0400
Message-ID: <20260818095010.1857-3-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818095010.1857-1-atharvatiwarilinuxdev@gmail.com>
References: <20260818095010.1857-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device links for Apple machines with the
Titan Ridge thunderbolt controller.

To add device links on Titan ridge, the discrete method is used.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/thunderbolt/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index 83a4e1ba9..945e553dc 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -509,6 +509,8 @@ bool tb_pci_add_links(struct tb_nhi *nhi)
 	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
 	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
 	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
+	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_NHI:
+	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_NHI:
 		return tb_pci_add_links_discrete(nhi_pdev);
 	default:
 		return false;
-- 
2.43.0

