Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDB33B27D4
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 14:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274582; cv=none; b=OojTAg3oPneNy9Y7sIg5WRaJ0YjoHuFn7ZyGWKHMKoBl5AdSIUOOqGMpRMGVrhpX1knb1ygEKKqeg188wjgnQF0lh3guY69GJo8wmHtyGtQRKFqWvIaMcW0AVbfvBGyeeAKFCaDNvptwbVHZF11mToYJfQCj6YHcLzZpOKkGV/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274582; c=relaxed/simple;
	bh=74nU+p4AvwjOMMyaJKS8cH28y3pbGWscg6d7b4xTKtk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qH9EXF+YyqzvJ0wGZsDHRvhHbL8TpkwevyeeauOwlchnkWnm7OR4zoEJ7tGgwa6YsVhvfhivYMNIxzvWFFpOGFdLb/nB1q3wiDbd11VXF+rdVypbPXNZg/l3r1tXhGBsbCPUgDKv2bdlT00vzU4XV4OzHew/0aizWb+BhgJW7C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKkCUfQr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKkCUfQr"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b7c2788dso1828659f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 07:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774274579; x=1774879379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XP2z4EeTIErAA0SCjA9USYIYpOzE49JnT+Yi7rCFLbY=;
        b=fKkCUfQrDEbktEiQkHJOEe0IvCeEhXrRL9uVaULPiv8tlhkvfD81NYD+zuVUGkLC0M
         6nqAn4qNGE7kgm4okapJs3eIECWmOD8bs7pCb9QtriPmRImexM+5yHZXPdV6mtz+hNzw
         wbZ/Xz52F/RJT1pdW84nBqspNH1zx8ngOT/eknBk62T5Fd2ojgG8pXsfXt8RGodwH++i
         ujSlOYtPXxzmVApSxDnsywHEOrrOBck0BsFGtqfwRlmuCroGRL1ZZC/DFuuJfyB0sQDQ
         X295x7Oa9d4AOnhc9RE9OmFtuKQ9hl/ewrMd0vpPzUPYZc9R8A0DDrJk7NFCnb3epZKQ
         aXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774274579; x=1774879379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP2z4EeTIErAA0SCjA9USYIYpOzE49JnT+Yi7rCFLbY=;
        b=HRdLJWezVdpiQyl6LrUPOVomir2MrGD4t/yVy2OXKEbMmDJZXcDk+iDtWO3bknKo5l
         gefhwyJ9fwJm0cATLL26lH+nqrhIPScskm+XOg/ctRM6KKBMSbZpfYi7AJnSTKnwc9v9
         XXitgeyHjgYa3p2Yit8Kpikx9EhGetowRQ5THyeZdX6f0uQkJ8+uxc4K5VYAaMBpC8gw
         2MAw+oTQYKuG/ky7BWsJRZEpwYPPd54jyUGqxrg5owW1tNTMV1SGoyCn5mrx82aBax+e
         0TIj/LSm11J0PWI9uQhVMGzx/DlzXGG1xEk0w2iZHHv8pSKXgv/efLNAtulhfC+Jurzz
         WvYw==
X-Forwarded-Encrypted: i=1; AJvYcCUJXEy5HIwgB2XmMGerSYHvtcLnFmnqUmK5uFGtQ3KvOR9dvv0barPM0aICGMXML53w2Q78jUh/83w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIDxDzLrwFW/6KDT368sYekAESanu199MB6CfZpaHdL3t01N9l
	vTrPxKa9W0Io4JxhH4VG7ELyN7OXASNiHcbiMBf/3zHLpiq+YP+ZMzKy
X-Gm-Gg: ATEYQzzOXxmdyos57LWURVCuBTaiuXKXcsQ5QPKv7BY/JE/qsO/nMKAUfQw9whEQHDV
	BNzfEUHbJB4/1MYEFAJHMWwj7g4R46eAeb6JgYQrWJNzi8fY46RFCVPPDF0ULUkgX3ikym0atO/
	UcF1DQwxgXmbn1fSET85xW0C0PGRkJ1rF7CvSYmdujqDIJnVC+Ybep8pgLY48+pFfNDyGldwLzE
	nB2SBPGEsbQ3DRv0GAOg5VSYnyoWec7q6Mn9I+ggGKTPCGh6jCdt55AYXBuUtOnOSNuDbI4u0xy
	uw/zvnRLFHuou3RpTIjc4qL3ejDTsGyZRfjUOcVL9HArgNVnjPFghmTynyae4H80KPyI9tgR8UR
	X68oAjxLSiqzLsVFIvhOswaMAnM2oWEQ8TQURobwU7C6CZpLs5QfZdW+iXzEBh3UcpVwAY7gUEY
	XZ6qj9rKiIrJ/1o+j9sBM3gJn7vVr8ZhdiFxDxOCZ4IYSJBJveGpatttWGPdDADWtepA==
X-Received: by 2002:a05:6000:4013:b0:43b:4960:60f2 with SMTP id ffacd0b85a97d-43b64291854mr18445975f8f.47.1774274579298;
        Mon, 23 Mar 2026 07:02:59 -0700 (PDT)
Received: from arrakis.kwizart.net (82-65-38-83.subs.proxad.net. [82.65.38.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703650sm30440010f8f.20.2026.03.23.07.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 07:02:58 -0700 (PDT)
From: Nicolas Chauvet <kwizart@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH] usb: tegra: use MODULE_FIRMWARE if SOC is ENABLED
Date: Mon, 23 Mar 2026 15:02:48 +0100
Message-ID: <20260323140249.173603-1-kwizart@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows to reduce the size of the initramfs by only selecting
the related firmware when a given SOC is enabled.

Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
---
 drivers/usb/host/xhci-tegra.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 3f6aa2440b05..5587302a69dd 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2566,7 +2566,9 @@ static const struct tegra_xusb_soc tegra124_soc = {
 		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 };
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC) || IS_ENABLED(CONFIG_ARCH_TEGRA_132_SOC)
 MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
+#endif
 
 static const char * const tegra210_supply_names[] = {
 	"dvddio-pex",
@@ -2604,11 +2606,15 @@ static const struct tegra_xusb_soc tegra210_soc = {
 		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 };
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
 MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
+#endif
 
 static const char * const tegra186_supply_names[] = {
 };
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
 MODULE_FIRMWARE("nvidia/tegra186/xusb.bin");
+#endif
 
 static const struct tegra_xusb_phy_type tegra186_phy_types[] = {
 	{ .name = "usb3", .num = 3, },
@@ -2681,7 +2687,9 @@ static const struct tegra_xusb_soc tegra194_soc = {
 	},
 	.lpm_support = true,
 };
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
 MODULE_FIRMWARE("nvidia/tegra194/xusb.bin");
+#endif
 
 static const struct tegra_xusb_soc_ops tegra234_ops = {
 	.mbox_reg_readl = &bar2_readl,
-- 
2.53.0

