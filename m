Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD99470126
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 12:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314764; cv=none; b=N0hmJ+lCj1zow6txZ5XaCxKeGEul+sQ/PQTkt+ZN8iY/LV05ta3ud9ue4GTKmRYmVce0yAcLuB8/CAsAQlT9CppeDAZiwZj+j6yENC2FJTY8xHMz46qvMmZ+d0aqADjD2BkarmuF4IAaLWZM0BC4iU0R6gdNyPvoaakEjPV4Rk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314764; c=relaxed/simple;
	bh=/X7C+wc+bNlFX5VQk77g+9xZVi4dtlKTTZSaa/XXUjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IGZM1rvukbxZQmrr9U5vY4Tb5bh/tPcGk6RB2T7aawpVpxZ3eUQ3lb6sgKaAie9SLFIzlDmkTDP9BpPflEGKHOUcWlNb/2Giis2S6Sg+DU7Vz0uwrnTX4ldN1WGKrBhdllvgrcgG1cNHjgmmNYEXEfTUa0MZFW3HRHiyi4fRkJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTUX8z4L; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTUX8z4L"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso7161025ad.3
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 05:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787314759; x=1787919559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtJmOeUQTMpLnSgDqruIxWyKaSSwGkNvswm0ArNYHq0=;
        b=kTUX8z4LVIbDOjvIGKQ3RZzBcouFUNBOFtheQQ60KO6f0dLURBpM8ZTHs82IdCzlik
         zQrDeTss/Ynt7i+9Tfzfj56pX3MmrIaf7UBAvLXJQwSfwYrg88MCGbvMYToaJR/++Lp1
         LDmvtss1BHBHPlOM+RChsYMPHCBlatMheIqp2A0lxOnIlH5fozgFG9NL44KKYzq7hp/Z
         dp+HVF2ntELkWrCp1JlUWxoe6JUq9P6QvoL+oCgXR2RLpnWP0xmyUYVPVRyDjW5zbh9U
         NuDl4tKFRxcvYk3qDb+4INm3GwAcjcYh67SvxYAVvbD0GYiS8OijfHU5Y8IjbFlfS8gZ
         eoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314759; x=1787919559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtJmOeUQTMpLnSgDqruIxWyKaSSwGkNvswm0ArNYHq0=;
        b=qIaEvJBrWcPYysL+lPqm2RfuK+RAy2XZEcbqA765NwXg4Y2mKnyWUW5/utHC/Mr32V
         glBXzcEowOmqq4Ebeb9rF1TQvw96kaPguMX6DWNDkqjwN11iwCOF8m2LyiVL6V7bpAtx
         53zSqL8amABIPuOdzwOWOVvkDGlV5w0DD7wVzhz62MGSNrKxNU2hVzZZmb5OkynDCHny
         DoGKTtOOzo29pzxyD+Dkj7v6WuWsBn63AoOzxcppMPa3oqYblpb+13/THk2c7WOHqrEc
         3s+d0ZR9NhFilexpB/coXuzVD59S4VF9lRxFVvbLTY+rS1awWtQKcd2ZdDTHj6rokqdI
         6p1g==
X-Forwarded-Encrypted: i=1; AHgh+Rqo9P5M3l5K8lWcUT0pvbuXQ0SLMpBeCkOAEEiGfgPwx9LCfPsgGGOlEHRxu/TyeZwnp5JK+A0AosE=@vger.kernel.org
X-Gm-Message-State: AFuF++l96hiEHu4toDEtq3i74COEP2coXnbvOBEDug/JTjg/YSftux5o
	s7we00f+x8LrYB8CzSSKYDsMMtKLFTJhIEQ+gYjVn0I4GD5s3B3r4/EL
X-Gm-Gg: AR+sD120TOawoFoLKf7T9dzCi+b5UphYcsXbE5uuGu9sbXBk4+sAumUGmIEC3t0/QXW
	Fqxtp6RtAS77yrgUHUjotq1uX1kSEV5vSueC65fXIxq0FVyejTlJMejKhEml0XGzKd2rn6S2ZHT
	9cMgJCXRA84PoBioh4W9XWLCVtELUz1F72dKykkgotP6zq3ccxOfzHkw6Wc0vKmyGejQgTQD62n
	K3dfEEgcvKYQ57wnRV9cRpzniFihiLdm3jLE9QuqEd7XUYNl2DlPEC9WNLxrZlNarWqkC6L05h3
	bxafcEQT05/UT5/LYYoRGFlcYWTxu9Pxf4kFjAfMKuDSyWfBm9zQixqJse2kpXjf9qDhFrZaL2U
	VmKKqwg49xO9YxkswMT4gspcgQz7LPqfuIL1t2X5U61AUa++Q2aDQ0iQRyw/B4oQyjLQNjf38fv
	GgivmgZQs/Tu12MwGsW5zCcBhV9jOh6U7yuzaYkjaFwrzbOHhRuwIU/5UfL3uYsqEn4wk3B7Pt+
	WaaGjM5ioaBrEZZPCmec/0puuOV61Z7aKae5+659km8M3brDjQowg==
X-Received: by 2002:a17:902:f70e:b0:2cf:afa5:b19a with SMTP id d9443c01a7336-2d64afd7c86mr127975675ad.11.1787314758722;
        Fri, 21 Aug 2026 05:19:18 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:569e:7ed4:3735:ea2a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf1970b0sm27831246eec.29.2026.08.21.05.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:19:18 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: pooja.katiyar@intel.com,
	johan@kernel.org,
	pmenzel@molgen.mpg.de,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+23cf45a9fce78e4e0dc1@syzkaller.appspotmail.com
Subject: [PATCH] usb: typec: ucsi_acpi: fix NULL pointer dereference in ucsi_acpi_probe()
Date: Fri, 21 Aug 2026 17:49:09 +0530
Message-ID: <20260821121909.13556-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ucsi_acpi_probe() dereferences the ACPI companion device pointer
returned by ACPI_COMPANION() without checking it for NULL. While
this driver is normally probed through ACPI device enumeration
where a companion is always present, a platform_device can also be
manually bound to any platform driver via the sysfs 'bind' file
(bind_store() -> bus_find_device() -> driver_attach_device()),
which matches purely on device name and bypasses ACPI matching.

If ucsi_acpi is bound this way to a platform device with no ACPI
companion, ACPI_COMPANION() returns NULL and the subsequent
adev->dep_unmet access dereferences a NULL pointer, resulting in a
general protection fault.

Add a NULL check for adev immediately after it is obtained and
before any resource allocation, returning -ENODEV to decline
binding cleanly.

Reported-by: syzbot+23cf45a9fce78e4e0dc1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=23cf45a9fce78e4e0dc1
Tested-by: syzbot+23cf45a9fce78e4e0dc1@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 18286d3e9cc5..9fe4ba43afea 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -196,6 +196,9 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
 	acpi_status status;
 	int ret;
 
+	if (!adev)
+		return -ENODEV;
+
 	if (adev->dep_unmet)
 		return -EPROBE_DEFER;
 
-- 
2.43.0

