Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F0E3F39D1
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 23:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790032139; cv=none; b=XVNn9pva54J81jS1PAPYrN3PUGVrRhoqOhe86hB+sNJtUt3ueNkARAKXWmUV8hpJ1bi3tOl8QVyHI0gGEmJesqwq1FJahxaEtS/S8E5Vhs35N/LLC5Clgtce3I6H2j7zw7ortax6UILFJx64/f1G3vRGCwUQ4KugnKVRpyGJbuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790032139; c=relaxed/simple;
	bh=1gnA8TGe9af5RJ6waDfAsYApcBrdbInaq4eInVQa1YI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEHO8uSNwv4yK2pdd9r75U5LbvEJzqlIjJHXqnfJXgq9u6VsEp/nmQh43l1gbkl9UJgYN/H3SsPFoPYRFxa+WV9Pbcz7BO9nlhA+VQ57ppmCXUfMwF/3fl2u5C456Une4GSwAllC0cUOfmZQ7vCR8xeYt8TE1/SOPbPgRGeBnQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxemTQS+; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxemTQS+"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910cadeb0so273926585a.3
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 16:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790032137; x=1790636937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uil38kKcJdnxLESM2C/w42Vib+0WwToXVLrxxQmRKFM=;
        b=bxemTQS+2DFclC5/fsx+gHH1PG43tVu5KjOWk5bfXVu0elQhvWAV6v4FyLkUvnEnW4
         CiO016aTfsnenevBHUcYPc+WCSq8UJfwVpnd6ZwQEoRFzG5d86zvAf42aaHUSyTrsvP5
         3rssbewrN/HGWWyY/BuuKjZSk+w3jKL1z8ZlIaMt5yJcIrCDEJ3PABi58GSv0Cxt1AaR
         6hEJvauXXzGjcILnvNIt3Q8fAFFBBRevjnp7d4tKZMc91iOwx2D5ADl3Z8IV53GlE/CD
         gaVbWpu4FWXTQVVA0gpu5DdzSccolI4L3uJYbfGk15joVe7oIQKGOPK4MNbhm4Cu3+9j
         dhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032137; x=1790636937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uil38kKcJdnxLESM2C/w42Vib+0WwToXVLrxxQmRKFM=;
        b=BVRG5D6FPNXhyfYeONOmFhvZs7TvaDTEm6g6zXtdVV3kU23tQQIHz4m7MnWJx4q9AH
         adCEsSX0Dpt6cauw7J6tw81C4A1OJiDYKqdVBtB5LsbWaHxFO3n7YgP/I02ExrXhlVt4
         NFgD0xxa10rzM04ouQGCDqPNL+HD+6tKV9NB7OUtL0z+ZWsiX9cKqMoIvi7WVBUSvPDQ
         iESZer9tcflESSEjhik7PB0G8U1jKte9h2Vg5kalGklJsnuohUGEYf6z4DQDHPXUwEho
         OuJQzApi08SISr+4yCYE8NLD8qA0YxJ8PCancsfytQSEtUkxbb+pQVoSpUdp4CCElGMV
         F0zw==
X-Gm-Message-State: AFuF++m98pRJiOeRguHV1HUUNHzl+AciRWHejm4S/xwWBIbB4z/1fjfo
	u+6EGt3qHDtJP98WAwy3B4c1jZrGeMLm8I/FZ+fDbfnmw6algcsDtnk=
X-Gm-Gg: AYBFou2CnqVkFYKxz0lhHw8zk/+KdtVpbz28cQe0ykUr83bwlLz745V32bTnvirHiIM
	jDKvVRHnPFYr62hIUAhNsZ1gVgeHFxCfFIVBa1jLdUtHUMsnLuJHKen3COmT5xWadayNuUek961
	DBYiXDKdDySx8sQIOKBPGejH6cLnRVh29P/poCc514aRCPbB98wIYj109uHbtxUWG5/YrI5WLsU
	1G0T45qzcfMPAwRusYJp2B8dkUB6Qe0e2sFKR6m2Nr+YduWULGnvSYwRzujpYqn92UgPTTtClMI
	syfGe7eg7JYMkTBk5KBch0aQD93RWn2nAcMyU2LtDkhZmV0eKcl42sqJafXU0Nqxacvy7NkzSPm
	EUKhGUsJoBokSAszhYGyv3S6OGSrzjhrSMY+aFNovaC4tsxapKIm+qnVLJkH0AnrLsCw3puMwxR
	CmU4pkCp32ST6lGMeYtGcsuYahtWqt1oGMx+lw1dT/JlpyCT0y2esZZx8oDdBiNHG7YhYRDoSRU
	s/DoinKzjonJS90GofTTzRvFw1bSAJLXaWXb7YD9KGUSfgmP9C2/D85EAn+pyLhVCU2M88eat8b
	KFobnYKJKeRCCdb+JUiewFQ+ZVTW
X-Received: by 2002:a05:620a:404f:b0:93b:e412:8cee with SMTP id af79cd13be357-93c15eea61cmr284237385a.73.1790032136724;
        Mon, 21 Sep 2026 16:08:56 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19a7f592sm39933985a.17.2026.09.21.16.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:08:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] usb: gadget: tegra-xudc: Unregister VBUS notifier
Date: Mon, 21 Sep 2026 19:08:47 -0400
Message-ID: <20260921230849.502492-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921230849.502492-1-mhun512@gmail.com>
References: <20260921230849.502492-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_xudc_vbus_notify() queues usb_role_sw_work.  The notifier is
registered with usb_register_notifier(), while devm_usb_get_phy_by_node()
is passed NULL, so devres never unregisters it.  vbus_nb lives in the
devm allocation, so a later PHY event calls it after xudc is freed.

Unregister the notifier before cancel_work_sync().  That waits for
in-flight callbacks, and the existing cancel drains the last work.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 2582d629c9e0 ("usb: gadget: xudc: Refactor update data role work")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Unregister the VBUS notifier before cancel_work_sync().  It queues
  usb_role_sw_work and is not devres-managed.

 drivers/usb/gadget/udc/tegra-xudc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index e9d33be02866..a0585a1f19f0 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3926,6 +3926,12 @@ static void tegra_xudc_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(xudc->dev);
 
+	for (i = 0; i < xudc->soc->num_phys; i++) {
+		if (xudc->usbphy[i])
+			usb_unregister_notifier(xudc->usbphy[i],
+						&xudc->vbus_nb);
+	}
+
 	cancel_delayed_work_sync(&xudc->plc_reset_work);
 	cancel_work_sync(&xudc->usb_role_sw_work);
 
-- 
2.53.0

