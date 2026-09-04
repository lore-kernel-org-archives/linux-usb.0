Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6E83F9265
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511395; cv=none; b=d4XCP+QnZkzuIrnTFxC0VT7g69jdlEFzYYZuB1LR0yY4ihr+D5mjzcitFhCV1LhqijZGDrAvq5PCb69mHJiqxX5ffooB7wcVckuMxOQ0AXoRAvBOYYvmzxgStIezqqh2vKdms9vjBdNRwuzC4dKtGvYQCvTKI7+o3UED3viBe0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511395; c=relaxed/simple;
	bh=k4P8O6O1bZN0BviRcm5rHj8gLkm4KLla0pyDEJs44j0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ruYSNuFLJQLGV1z8FKzZ0UrWoii7oNjS8nAzwUofzYYqtyIlYI//1X6HzZAGPuYi4HI7NTBYprTeXttPWuErTgiHdzaw0GzDp1qhvKJbQDvKmDEcwgpS5xD3K4IE/EFnS46Pnbzew/NrzdfQyJoISQ+hgfPqbREfWAgyFczH8vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jb5zcpAl; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jb5zcpAl"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d94c868ea5so7997745ad.3
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 01:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511389; x=1789116189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bo+9+1CvfJ71hhRjJqHX7wWrfIVVnPJvwTAuLV2zMPo=;
        b=jb5zcpAlMYHlbvIhiedEuGNaWiMPs1+6YhgXqUp1yPJEXaVK9nYS77n7JTbbDP/hhX
         hzZ5uPvwvfB9Xkykv6avovIOOQ8wZAPozy6QDFpL2qQl/UpW8ssNCOu/gJZUYN78cUTh
         JQAyF21E8lTyuMkJgo769lvqmXr2B3ol7gwX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511389; x=1789116189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bo+9+1CvfJ71hhRjJqHX7wWrfIVVnPJvwTAuLV2zMPo=;
        b=UWHeVrKpylQ8srsWiKPpmnTweoT9MKYMlFN9w4N0dXh6Yl1JMBmxAxmjYcDvejKxWg
         4B22TbD3nZthQHGNf0ZGVvhOLyT31D+qtpBBnqCqJAjC7rcpGtNuKpDCJ099tdCa52J8
         HDotwoS57u3RenLdivD9mA51JRwzIxNKeblLUiHaL4c6JbXfpcOnjn9uwA2GvxdW3gnU
         OkmC3p/rd9/kcjpoWSH4ARosVWaXWoEFdmSQMuSCpJIadX/5VUGrlnsYtLJCUX0BUkEA
         qr0f+kVsMhpEOBAcHA3JIxbpTEAee5xDwI6QlAbOFV4x66N4Wij9ngSxnBvG8V44zGs9
         CbpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdNU7B6SZK6sNJ67oPgXOMvFxnSf2OVrcE6McPbM2KLKeR2Q4akq1Xb+bf/w7LJg22EgRvPK5eXMM=@vger.kernel.org
X-Gm-Message-State: AFuF++n+FWi9qn1/GcbaNEA2A2xnm12FgzwSgA/8/Snck9QKDq5a/JA1
	X7MG5H6dXrfVmG9MHdj1SeMXheIxpQJNRfdlDmr6RU10uleoIxJtCwbQT4Cv40MO+A==
X-Gm-Gg: AYBFou0BiMXvCTvbH8vhHg7OmgLRQOwsy6SL7aubmpjri61Ptjk7f9uYokLMH0OW3Wo
	tl3pH/vVN0pUVQ3MhwOliHpUN6NwRfYIz2CbJx+SiDNyV4mBbCWxJbiTuETKqWZXxnrpleg1nRz
	BN/2tMs+fOqihJ3NcJNow6zkfJCLgByZSK2LnyOdHmfbR5AcBHDdHt8VilfBbaCeVnpqsJRbUFN
	1XEsMQh6bomOpRO36VPmKnPSu3R82Of+z1V8uOAsaLYUVHV9HT+qpNKPYZURG1PXUh4MIb6zwOC
	d61acN7/AZ5hfjPpZiK8QqJ8Fwef2cTSF2UF3DXqGe6f0p6uriF2k2+Q9F7W4RAOAWbVHO4d/si
	GUEgHMJJRF9MP2JJ/h+tI1PWko7Jl+qKBxyQR299bv7jdfsRk430f23nUhQTA1MnBkS3kO2Wu8o
	NoHgNmWbK3FmsJhzsBFPy/7jxI/IiIcrKNOB84FcMPEY6JvMiS3f2SPyDyxBJo2IxXYPq+7JedZ
	Uge3ni+hnP6RnkbKeZ1dLfUqvjXtbwOxCsV/SRGeKwx
X-Received: by 2002:a17:90b:1d52:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39b260d338bmr6986016a91.5.1788511386742;
        Fri, 04 Sep 2026 01:43:06 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:36 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 05/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Fri,  4 Sep 2026 16:41:44 +0800
Message-ID: <20260904084158.1341550-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The addition of power sequencing descriptor handling in the USB hub code
requires dealing with deferred probing from pwrseq_get(). The power
sequencing provider may not yet be available when the USB hub probes.

Return the actual error code from hub_configure() when it fails, so that
the driver core can notice the deferred probe request.

Also rewrite this section into the standard error handling pattern:

    if (error) {
        # handle error
        return error;
    }

    # do more work
    return 0;

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Rewrite into standard error handling pattern

Changes since v1:
- Moved "int ret" declaration in hub_configure() over here from the next
  patch
---
 drivers/usb/core/hub.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 16e03ec8d1ab..c19c9912c740 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1870,6 +1870,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2001,14 +2002,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		usb_set_interface(hdev, 0, 0);
 	}
 
-	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
-		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
-
-		return 0;
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret < 0) {
+		hub_disconnect(intf);
+		return ret;
 	}
 
-	hub_disconnect(intf);
-	return -ENODEV;
+	onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
+
+	return 0;
 }
 
 static int
-- 
2.55.0.979.g7e5102b832-goog

