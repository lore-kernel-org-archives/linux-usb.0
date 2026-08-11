Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9321B42CAEF
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786442320; cv=none; b=WpuQ3DUqpoT2kItQv8sh8R8s92tB4bOXGNSScGau62GSJGlw/uWcRHHeCpCsqvqZ4nrbObdfklicozSo8y1pfzuKs+YvKQZOi2UJjJlG3tu3NrHo4CkzIw+WXeSuk1ptQX8GcSY1vVb7ZQY3EX3bPZqGceGfK7TMAgzjnoaCGRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786442320; c=relaxed/simple;
	bh=SHJKKXa6Qxl1b1vatYjKpZOHn+aOrWkwm9LDa9rhBCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hgS6tvfhe7+pmMHNn3udp/xX8liEiptTQuMIBuyD7fh4LwiA2v7MKc11scHXukbuH6N59dAAndjKomJsMkkMIyASPKFtWTxlV0JB6BzXRKH9OgDgBpGzM4hjNuQOvplfanZKzGs5d3Y/SBI86/jq30k6LEO36577Wrgo7BEdxG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-84847482584so573954b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 02:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786442318; x=1787047118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9G16LNyyTi82BYCiJ00/MXPiMBCTYGTmoQ2/cxSgig=;
        b=apHFeCFLYq7/vETs8xBSRbH5sjWE07qAVlT/QspJDjlfVl8hapALe9C34R3VzQDp+S
         ezLTldNtVV6Fmtk5zxxa83DWJhJ/Tbh2HTJm/AOBLeACzcDMDug3MDkUNIVX2q1S42Zy
         35Q5Lh/w9t22Aw9JwAREUV2b5l6XXhOUjPtgfuQtPc88WeB2kND9uOx8EqreIr8OyAjR
         ZN4FQcduLp7yBzXi2ksrGJURUtTIyzeDplk76E02nCRhzQd67lVs0ideZx7jG9xGxbzH
         83Z7TJBaKp8PepiVI3bTqSdw2PP9/9cZoP53pDRNYQ/lt+etv3EINh1qTLpLlj3LdEg0
         E1Jw==
X-Forwarded-Encrypted: i=1; AHgh+Rrq/YLMbF63Xgy5qWhHryld1ubHzstFKJkrj/JCrmBW1g2RvytJURBMNsmRvowiCRAX2uMvbyDce8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPUaPVQed45Tez/F5wJVW6Qj713b2XJoee6395lnTR+Goc1vij
	xPUqpz3INkqciKbkzxgNgWSJzM1/xbQoVD7WUSFKdqIoZPn0DiHZaBu1
X-Gm-Gg: AR+sD13BR4zdlaufXa0IJeJVn6VAFpKJC3YSo2BsIb+lm1QrcS5lWhbthm6LuX3pfmr
	xy9nWr6F+BQarmVb5ihMwYAT4dIlSA/vAnGobYNqqPVwrpYHeg7y9MJFVYHWCSekHycBWuAxefd
	BJe3Nc1P6eXRW668p4V6pQPPBUo9kG9ox7IVfjx25y85nlLbjc7bFaoLDJkHr7/wVn8XOQGlbE6
	bZO43J81+gZWpqAxKzIYUr9FzLHrU8oEEhO54Ijb1GYTcAckX+S8QMUMrN1w3ymyxJjb/JaO5es
	V2qHGMiQpaUAGlbItqEu83ditetP5iY84l0rJ2H6BZ4pvFSIS+9sVVkavu8nFhvXZM2TPTV0Ect
	Msg90gfMHEyRIBtawQxIU6S5/Lsnvfvzm/jr296KMD38VshzRyZFgqNu6VB60MfZunsQbfdoUVv
	q4pzYGafxeO6jmCgG5HEIdltE292s3worlgybPfjuwAZx7M6IsYe+i1N5RUXjB6BqCMB7LvSriM
	1ZoKCnneQ==
X-Received: by 2002:a05:6a00:228a:b0:84a:2b96:5986 with SMTP id d2e1a72fcca58-84fa889d2b7mr1889004b3a.8.1786442317744;
        Tue, 11 Aug 2026 02:58:37 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbed970200fsm661840a12.7.2026.08.11.02.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:58:37 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: pooja.katiyar@intel.com,
	johan@kernel.org,
	pmenzel@molgen.mpg.de,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xueqin Luo <luoxueqin@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: typec: ucsi: Add ACPI_COMPANION() NULL check in ucsi_acpi_probe
Date: Tue, 11 Aug 2026 17:58:27 +0800
Message-ID: <20260811095827.1001654-1-luoxueqin@kylinos.cn>
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

Since every platform driver can be forced to match a device that doesn't
match its list of device IDs because of device_match_driver_override(),
the ACPI_COMPANION() may return NULL, leading to a NULL pointer
dereference at adev->dep_unmet.

Test steps:

  $ sudo modprobe ucsi_acpi
  $ echo ucsi_acpi | sudo tee /sys/bus/platform/devices/alarmtimer.0.auto/driver_override
  $ echo alarmtimer.0.auto | sudo tee /sys/bus/platform/drivers/alarmtimer/unbind
  $ echo alarmtimer.0.auto | sudo tee /sys/bus/platform/drivers/ucsi_acpi/bind

which triggered the following crash:

  [ 6599.180948] calling  ucsi_acpi_platform_driver_init+0x0/0xff0 [ucsi_acpi] @ 24208
  [ 6599.181198] initcall ucsi_acpi_platform_driver_init+0x0/0xff0 [ucsi_acpi] returned 0 after 207 usecs
  [ 6729.051074] BUG: kernel NULL pointer dereference, address: 00000000000005f4
  [ 6729.051102] #PF: supervisor read access in kernel mode
  [ 6729.051113] #PF: error_code(0x0000) - not-present page
  [ 6729.051122] PGD 0 P4D 0
  [ 6729.051136] Oops: 0000 [#1] PREEMPT SMP NOPTI
  ....
  [ 6729.051300] PKRU: 55555554
  [ 6729.051306] Call Trace:
  [ 6729.051314]  <TASK>
  [ 6729.051327]  platform_probe+0x41/0xa0
  [ 6729.051348]  really_probe+0x1a9/0x410
  [ 6729.051364]  __driver_probe_device+0xc9/0x170
  [ 6729.051377]  device_driver_attach+0x46/0xb0
  [ 6729.051390]  bind_store+0x77/0xd0

Fixes: 1f3546ff3f0a ("usb: typec: ucsi: acpi: Check the _DEP dependencies")
Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
Cc: stable@vger.kernel.org
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

