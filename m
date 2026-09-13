Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209982D7DC8
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 04:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272645; cv=none; b=qkUFauRpuZ0hubt0GNAB5C/zmMafI7do/l7PApj8SSYdZz0Nzuh64T+R6ifbxbzB00Wt3Q8t0UhCpZqH+vbWwRhnZfkV15keJA2AktXHDm5cTGVaaSMU8/or2miytfqSKzXs6C9iS0OKp3SKgdoyq9eI8nwL9Gv9SKxxkcdvLAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272645; c=relaxed/simple;
	bh=q70lBCJF9U8Wv9pSNev+Rilr/PYDCEDGEVWmQL9R7qo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qsY6slFcY4wj4aA3ZzU/ow5pFPoDdNNHOfnZ+A7vS+5G5/tQlgbLPFZWxyBJWGKVPX5H3QkOCq455XZkQjBK9GoDbjeN1qD8ec2T/tJ8zvmERrSa57pzbXVvPpgbBC3vRUtngZNGTr4oncPKFdKPSaa/uta2mpHCwLKtbOzGvXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BA/YgI/L; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BA/YgI/L"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd148aso14335766d6.2
        for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 21:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272642; x=1789877442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LdnUVZ9fGnxxypDVfl/aC1u8LA5L3SFgGUxVp+gDyPI=;
        b=BA/YgI/LX8qY2e/HXaOWFxUY8/TQCfPDJXudwkboXgVFDCbP6vkykCYAJyz2VUKd+e
         nQwruyyxF7x6OK2uNNvFSaXXNYXKM1tykIJlhlyguyoSvcHpCo1oPewNEmtyA4E9aFCb
         Hh0f+7U6MKLq8Xn8bQAH6JtIBE2Zd1iSDOFjDD20lzC7ydYCXUdNcPilScTKocTt3Cy0
         I2M7rfj008J2ZsbtrFSJblzVlWNzEGQlFgBxIPCvmMOxaarDMBRrQgRBMatDC/XuH15y
         303IZKs+Fo6rS3gClNgspR6EacP3GXrWtD8VVgyKSYVUo2BsyYwl/+MKxhqr+Oa+H3TL
         LB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272642; x=1789877442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LdnUVZ9fGnxxypDVfl/aC1u8LA5L3SFgGUxVp+gDyPI=;
        b=XxAvEwk1FknyOO9YZ4KSCg+5KvcTQxYwKVBw9GyMWqwLGIHcD0VyAG9JOwEKERjvIt
         TMEQ0lCNIhRIU0b+8HssWNP/E9cCqTDw3N2wAbTGw5FnYx4WJBjaigHgmL2YbtkN7Mi2
         hWvftZq44OK4pdYwIKf4lwZsJfYC5rELeW76FnIyAQu9fsJkQfzlS8sO2LhNWO+FeIOq
         xyV6qr751AAuS5r2YDdo0fv74OcYoC5h1zcC2cbCvmsEi0uXpc/iDBjrrtEYFMwJDQZR
         22ZsX9W8vOKZBzkrMz1sClTnJu6jWOLfPjzj987tcS+3BRNms05Z1shV3L2uhvQ0oaP2
         mPBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUgEJwCoz2Hvaax2EJMaf32Dtm6dvVWfDjEAauVaygqzWFSB+pUBCOLCko5+OK/kh8xEDk5p8csWE=@vger.kernel.org
X-Gm-Message-State: AFuF++mgp2m9vTo0SQQis3Yd2tI3aloa2A77EcUNyrXu7DShWugaK7o1
	tiFm4ZINtDq7Nx3b88diasAUDKZUZewwPOQNpr75scg1bpDMFZAy/C0=
X-Gm-Gg: AYBFou0dECXi0qs4HQ7ixix50C7+MTFRvaZnGUp/m/VuUhJdL7diwOm+F6E+CC90Wbz
	MSDCdgObcmzjNoR6M3iI8BJZlIokL2LbVobzqVFvDhTMCb+NdzkMxNNOESEAwE9FsZZ/2xsD8Cu
	OhJQ+c+lj54HZXijDyrx9tKX1+NXB+UVK99hlNvtjmQKDWSQuS2fe1TPYKLc/XebxDCe4nbnl3j
	kW0ICU46iClbTVerSLYoMlAv3K7ndUJ74g0i2zbRiUFRoyklA6iJrKA3dgtzARATDGDdvr2x8/X
	eLb3py5e6N4Eh+aMZvWiF+0QvQdHIVnJCBlpj4Ou1/QWaj7mUKG7x5b1gGYWdnhwIb/QpkWACxg
	tSxmQKLJ2WzFlI7j7eOKAbCJL9j1dJH4uyl5YGv4BRl9MUXDddhynEAHLEKRdRNUW9dzLS2Fd7E
	j0clken4ofz57Vkxbiqnhxn9qidSYd98f3H38UkfVjs0dL4gSxtmNMu5PeVNodRx0qM6PuhiVdU
	Koz3qpyERAC2dFE6k1Qb121vmhhTPaoECsaKF4x4JIWyd/XRGfZn97j91FVBcos7TSC2HYwiPfd
	87doZfFtOwhfGNrHhUprMv/3YikksOc6/A==
X-Received: by 2002:a05:6214:2a47:b0:910:706b:6a73 with SMTP id 6a1803df08f44-9121206f50cmr172281656d6.5.1789272642083;
        Sat, 12 Sep 2026 21:10:42 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45a780sm61544396d6.10.2026.09.12.21.10.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 21:10:40 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] usb: chipidea: tegra: disable runtime PM on resume failure
Date: Sun, 13 Sep 2026 00:10:33 -0400
Message-ID: <20260913041033.25144-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_usb_probe() enables runtime PM before resuming the device. If
pm_runtime_resume_and_get() fails, probe returns without disabling runtime
PM. The later error paths reach pm_runtime_force_suspend(), but this early
return bypasses that cleanup.

Disable runtime PM before returning the resume error. Do not use the
fail_power_off path: the failed resume did not retain a usage reference,
so its pm_runtime_put_sync_suspend() would be unbalanced.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 8b85e11c1a7a ("usb: chipidea: tegra: Add runtime PM and OPP support")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 372788f0f..26225b034 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -306,8 +306,10 @@ static int tegra_usb_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 	err = pm_runtime_resume_and_get(&pdev->dev);
-	if (err)
+	if (err) {
+		pm_runtime_disable(&pdev->dev);
 		return err;
+	}
 
 	if (device_property_present(&pdev->dev, "nvidia,needs-double-reset"))
 		usb->needs_double_reset = true;
