Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2C8389E1A
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 18:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787597014; cv=none; b=C7issQggTtIGxkPAhDBDIT9goFUvMpdXP5YkzNoLb8adOGmjp32iHAC6iGLmKRTP7cLMtYipyYGZqZS1FX8I9nwRwsm2ewtxQLWf3Iw4E8gK5Xx9l1qtY8IZTmytYfnxCSNl9+zridHsyzs6k8GUwkKX2LgQ4NNPtJy26NtvnwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787597014; c=relaxed/simple;
	bh=GD1Vc4R//+edz5nsQcN4ZexU13rPFqIR8OXVB9M60EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQkqgWY2+GjjMFhm+Bs0Wj6jFrHwhpG9WNs19+mhZtbpXBuib4lIAhuyGGVemRXiQQ9pPwWKIJeCis/HqyVCyqCbhThu30QdrKZQXnyNS0jj2Smb/oLWb7ky/RPQCDBkRYGDuoMc+SR8mtt83ZeaYZOfZuMjz8rwPbZF5ahHV1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Evs5/MgO; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Evs5/MgO"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cca0c5799eso34035595ad.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 11:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787597012; x=1788201812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UcNrYIKS7I8Ey6PthAcBWgTxm4WMphn6yPUGDS65t7E=;
        b=Evs5/MgOr64p9Zg1LA87KC6p11h8sVwBzBDAO93ptXMJrS/CK8LZ//cNTbKUBQpNlY
         WUQaOBkqHgNJf13NqFlxm/PoHIxep2uyohxn/PWnai3WLDzjXuzcd23efkndpwDeqm1x
         H4sdbMbs5pU3tvaC4fq+k+Cisn2HQgHWseTGngUUfZGA729y5SK9Kl1xE/lfdpbU6gZG
         YBtWENzdxea1PYpZnwwJiyhWgn22f3AjGWGmNIa0tvHFFCOrv8LDSYOtr0hHivhGtkTo
         ra4KFCdPJejS4UR+QqlK2NwXXSO6YU1GsaGHS2bz0mYoGNniP3P1cm1a8za88J+D+1Yq
         jn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787597012; x=1788201812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UcNrYIKS7I8Ey6PthAcBWgTxm4WMphn6yPUGDS65t7E=;
        b=VXpRkvjY/BbnGbjEybJaHSMcHGwGBcmmWvj7NWD3Jd5y/la4+u+CHr3oAS3RlouWA5
         j3ctHDpAPYIfrfL2U9uVbmqmN+G6ibIg3xxmuTS77d59jdbORjb4LY7fyU1L07Zh8XeX
         4XcLFH2HAbkbFjKEnZqyALDHtKModwj2IrdKUBwfj0kKFEOFdqmDM57rPMQGqgxxZAv5
         GBktJHP8biUiRQ9Ep8ejLiMe+K5jLFGnGfXmVw9badCV4OjMzTehX7NSeNRImFdjAlX0
         734xReKOlJ8DvZ0wYM71OOuS1CvtwDzlzg93iIDwoji3cSiBFyFrtL2EtrhgaS4eOyUY
         JkYw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3mXRCD2jeudFhzqNBqw+mE26zDe+2bS1q+RJrIY0JFqOsj4fgrFRNK19ssEoD2E65PKQ9UTzBnb4=@vger.kernel.org
X-Gm-Message-State: AFuF++lXyv4wv5XwUeCcgWx4xg3hLXs2DnHcfYkNRHTeIJkodF0oaoVw
	iUxCVjiDxKHdVd3EKNUOiR1tmarn/aTIBEjbN7uM8ubBxshbu2z0URs=
X-Gm-Gg: AR+sD13YPZV4xSTyCd8B/+UTR2sBduW69LaSws86ozoat+ScxF3Xj5a3s5foPH2TbaG
	L1NzoqMnTA3/DgHeXUspzdQG+BnSsbJ6GaU3/rAJCTZoSThC2htELh7MSXet5T6eVGUdqKb7v32
	9cDL9Py8j8mlvHPOOxcM4t3r0qhHjPOfIe7oMrSmAuwoln+XyWZpQ+Ycbf9f4YbnpQN6jtSLBjs
	RfHeyP+tzWv8+1FjSQntJuMeOZnJpJSKQ3iQeG5aGA9lT9djKPW5xx/8d0n14LdCF0dtSj4tuz1
	iC47uQrclMFuzuN6uhuHy2wON5yhftjnblqNeQqzSoum9QCUV/OVv04ZqFHl/0A2mhsXcS1DSah
	qaAnz3QV58KfOwE5Ig4UB4WMa+zRF5lwz31+YVlGvT4ixdWRTGYPbF1wYQGTbWeHR8iPsb+7K/t
	Ol0PROMTrBhzs7De24q1zAwYVNwMEo/HwQ2SzTKGAbT059exUGe0bqGtAq+1aaWRICRxBkG8C5I
	FIWaMEUjBjipOAj03M59R5O
X-Received: by 2002:a17:902:d4c6:b0:2c9:c517:d070 with SMTP id d9443c01a7336-2d6dca57bd4mr20086375ad.3.1787597012314;
        Mon, 24 Aug 2026 11:43:32 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([223.228.8.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm29781367eec.17.2026.08.24.11.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:43:31 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v9 2/3] thunderbolt: Add device links for Apple machines with Titan Ridge
Date: Mon, 24 Aug 2026 14:42:55 -0400
Message-ID: <20260824184305.1234-3-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824184305.1234-1-atharvatiwarilinuxdev@gmail.com>
References: <20260824184305.1234-1-atharvatiwarilinuxdev@gmail.com>
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

