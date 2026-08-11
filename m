Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831D97E792
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 03:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786417862; cv=none; b=pr4uzjIC4xMCOaQqxSGr2wzbuu8sCQURYHGcZcy29x3T+BkS9UeaGUACPPOItUsdLO/mzTTdoYL6Vp3JpkEv1ai5H1KOsnobw/Tz6Mu44agURcQQTmGY3nujQDDArBUuIAnHky4d57rXg2x15zOhwJcpnhqIR/LHu9dk5ur4zNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786417862; c=relaxed/simple;
	bh=9xGVGoG6+15SyTh2I5jQogP6u8bckxgfiAejG+A7hiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PIzqf+vQph82dsyPbRjKSxO56/cxSUu2xE2tz4QYAYST7ihlySQgEsR//tD3aIBb0B7qzd2rVo5Id+d/EEii14gYTqHyJ72no/0uDJ3NbcFOK+qt+oxwGJcQkguw1hYq+HrQpttEZyzsGV5Z3t0aQElNKGbDKicvaha5TZ6UaJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-3810f0aba07so1284177a91.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 20:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786417859; x=1787022659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5zOJ+OKoF01RgSFmlK3dcJuyfCzAbCRmdIbnifKtbW8=;
        b=X+TVmhzJ07ucgtV/nEaElSfqJzB+LkXcf1bo22qJFZ6tp8Cx5umzdpvacRL/thBYkV
         op07SsN80d09RjZH5i1BN6lZo66tQuv7pH6Q4Pv9neTdQxO9BAN4DdIwlwScZ5QTo5B0
         yaVf1y/0L0iDdUl8b5SHV5bdWoR74wKtQPCniYkB9ZJxlPjnmkCJoMIQhwEB9BhbNrRk
         oJrhkHEwDKfmIAqIRxJhTiNahwKNxovrQOVatPh4GNUKVtXfglfKS+3Vw5P8AgRvXucE
         Wi8pwsntxnE9Tq51k1vFMOGOS8eM/MD/BU84jZN0Sfe7C029vSzHD9ptzMMVZ/ZxqTG6
         tqqw==
X-Forwarded-Encrypted: i=1; AHgh+RpEPUaBGDrXxFqtn04PHXMHI2vQlEVrwTrDgMHzatscXVhg9VgmgvbNPuo6OhTHhHYvI5AGUzXeQ+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDJRLNzYg4KR+q7k6zJvsShTkVLEWgKB8Tp8KlklKjJg9/Asxv
	c+DM9YK8xu0z4wXBMWogl8hZp3b+a0Qshy6T7+VJoGuXQ5eOZsZDI8Qk
X-Gm-Gg: AR+sD13U3CZFXwKzugnDYRsdak7Azi8Go36ItF9CByAlVMCy5aeg/ITrjrX0xRe3xk2
	YWpdQFnVDFHoBXWfF9x1ij9QmU3p3uGm/f5u3BjkQ2d3pVtzmnGbgQC1EhZZYppTZvynisfLbq+
	pKrXXy0farDegJwgPqzT6QoZbUoXxIiU7jLFm8y7OptYQHOT9fLTh5NuW6GXuLR+GnJPU929/q1
	cjd0XzmyIjJgx23/U3JqOfbiMvWHtVJemqihz70Sgw8ZkR+Gzdw75wHfcuBgx02c1Pwp39c8W5g
	ih8aXl6Kc3UsGQUvRthBsWMDH5oqIUiyX9GM0WMQXbeHYdKYn5sUr0C9lQl9RkPDxqgQb5bdLn4
	Z0netSbhwMSa8VpYzokgwwpfm2qewtE2LH7cNABbE8fSCucKGSfLUf6mzr6RRT8tVKet+MqodID
	TlUmeew+3RO6ktIL7UCGKNVuOtScZolHddJlfhAube0i4vMTC2d7kWo91nC23dhKnbdX926wMOn
	78jJd6V/Lzg/uAs53jd
X-Received: by 2002:a17:90b:2dca:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-392ec34642fmr243891a91.7.1786417858834;
        Mon, 10 Aug 2026 20:10:58 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d51be07dsm1658527a91.6.2026.08.10.20.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 20:10:58 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: pooja.katiyar@intel.com,
	johan@kernel.org,
	pmenzel@molgen.mpg.de,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH] usb: typec: ucsi: Add ACPI_COMPANION() NULL check in ucsi_acpi_probe
Date: Tue, 11 Aug 2026 11:10:47 +0800
Message-ID: <20260811031047.399164-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add NULL check for ACPI_COMPANION() in ucsi_acpi_probe() to prevent
NULL pointer dereference when driver_override matches a device without
ACPI companion.

Fixes: 1f3546ff3f0a ("usb: typec: ucsi: acpi: Check the _DEP dependencies")
Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 18286d3e9cc5..b4a783217dc6 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -188,7 +188,7 @@ static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
 
 static int ucsi_acpi_probe(struct platform_device *pdev)
 {
-	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
+	struct acpi_device *adev;
 	const struct ucsi_operations *ops = &ucsi_acpi_ops;
 	const struct dmi_system_id *id;
 	struct ucsi_acpi *ua;
@@ -196,6 +196,10 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
 	acpi_status status;
 	int ret;
 
+	adev = ACPI_COMPANION(&pdev->dev);
+	if (!adev)
+		return -ENODEV;
+
 	if (adev->dep_unmet)
 		return -EPROBE_DEFER;
 
-- 
2.43.0

