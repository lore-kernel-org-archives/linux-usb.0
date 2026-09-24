Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D2A495057
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 21:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286099; cv=pass; b=EdByY2WifJjoOdBt2HEKolC2iOQfvOEj2QGmpt5RedxKfPI4sv2lUjm+AlY70J9lwONkS0tLoSN036Gkg7rhCMjTjVQsukTi4gSvTv2GtZ23xQdAD8oOF6wcjZIQsyHmzTDmJ0hguH45fwXRihMxiA7sMkgcRuYOItdSxiWXvvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286099; c=relaxed/simple;
	bh=87GpcxVJ6wlRutNZWnNn10feaLHPsEDPE/16T1OQ2W4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=DM4Om4g9sAkCsXIXBXmxAV/zoBjXaVToUdohxN7ZsHmrzPAqSuLJZSaW16MNKUfmYnblrvy0nmF0sWLhjOFFzLKScnkYyqVf+7Nb/0PDO2Rri/XoxHHnr9qf6jm0v3SSG2u+t/teisZtulmJ50m0FKsdPIq0HgMaRhtO/WGoEYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbVQsZVx; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbVQsZVx"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaea1cb2e4so54661a12.2
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 14:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790286096; cv=none;
        d=google.com; s=arc-20260327;
        b=hb4Gax2BjYGUOfo83OOrIWXgIPXJlHsltQI63HaHU6uDPGMx/vmFLNrpzp4wYEXQth
         5b/fkNLkMAXwqUde8kOzoE3srgJxGy4KXsYUeg+DTp+qLtgxXYfyEABDbqWoDRnjz0Yz
         zABgJYemdr+tCIJyftKe71QuW2Mhdl1aZs+eWFoRaMpCTdt4MMjWycEo88MnLP/LGdJO
         YJm0C0NlV0Mn3mdI0NDOZSNOsrON0HtMYD5+OWDafI55KI6vjMklG0ijHlgRn7qUr3r4
         76hbqBabg7W9UFIst44awQWfj/1mzbeU54kHKEgIMvbuozDaclFhnWi/LHFrNb9xTpzd
         lK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=2SQz060QqCvrL5IKb7FfmYdL+k8EGntsJZoM76fEKWQ=;
        fh=5PU34x55OrDk8mE5WVE3b9X+WV1GoJjX3JeXzrguQPU=;
        b=IJNZDfUIumWuUUFwi4+3/29C0SkYFEAEScconk+Se/ar0wI4gMmTGySW+4qOUvi1v5
         qDZ4FUMUWZAzzuTWQbuLZtsVSNWCmZpSmvp9D34N1Akr0qk0OET1HZ8Z/gukPWam4bnk
         WNy2FvlqAhl142SJxcKPXJwI90i7yLijkuOh3hmzR0PCwf6p0Bjy71+kdpPLCkqfEj+B
         wxzfIBUtNyAzHwm+ErXMAFgoaHPiDP+E6VSr/lGZEYKJAIuDn8bMRAOQbGyAB/1r4nUe
         8GXcNI82qJjAT4OiAFBYtkm98IwyjwXXmjhz34MdCH9l7VbQX3izZpgoQ+bzS6Al58Uy
         SaFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286096; x=1790890896; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2SQz060QqCvrL5IKb7FfmYdL+k8EGntsJZoM76fEKWQ=;
        b=XbVQsZVxihKwvODXYXjNOXR2+LSzGEPG5A2YupQVxoUgT4soJjX3uI4+1+H9VHWFgy
         yH0d2PLNTOpYo0K1t0HmW0JhL7gg+nUxQRH0O0pJAlHohNM0VYRXjK5g7pnAXnQiD+wH
         gONBxArOnD/kSoU1LZ9ZoisWKk+lWDZhaLVMBkHf8P/mP0CN7j9vM3k1CXv85+aZRZdl
         Ily+kwx1kQNeezZ2P2Epg9rtFik2j10EVHLvOcnnC+WLuR3Epd/iookz2hwni3c9PCK1
         8HpjVfbgZHkk+o3XhDBQXewSionEyZbpUXjfM7QBZrodfLeLSxgYFQcKWf21M5FdGJEL
         uNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286096; x=1790890896;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2SQz060QqCvrL5IKb7FfmYdL+k8EGntsJZoM76fEKWQ=;
        b=V8HNVsaWcnn13r27fk3dCBPUunObVvfFqRACelrUEQSa4mGyxdt7scRdGY9gJwPkFX
         tAVxKn0vqmJcSdBA2wzQWVGeUgpYFskS3Wx8gptS2n56Sq3tGUYTHTW4Yvf1DOr1zHoH
         731WIxHszZ5CBHARNkpJ6aiJr70+o8oGQBihxzasEhT3LKAdWkYjcFdt5sgHeOyY2ska
         Uq1Si5zq0HrrBj2utrmb5RFG0Cdf9djUWhKCHGjndFRGiXROOHMMMYPVCzAcvaC9WjbJ
         dIDUtBobPvtjs5xPgKlNRufVuTENR4xLqGAw3PVndhGv7AAMjTi2YtXxoTFhyy6CfvCF
         IZgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdsRnBEV4S+nnru4CvhIagBULQMU1FOznv6QJrA962G7sZrWpqY+F6bTxyi74l0ai4SqFUUlZBOo4=@vger.kernel.org
X-Gm-Message-State: AFuF++mkdghmhKtlcqrWDASKrxsYoRb1iBb3mU3rFKsY+M1+2K9vnjOU
	74Bxuq4js7bqnmBA0Z2J0t9lHNkhr2hfFXB6h0l27sJC7sL3xKElJIfHcvUEM3CNwOTEMro/AmB
	tMOrHVO30U4d4hl+CaOCEA4LCyRSkeQ==
X-Gm-Gg: AYBFou2So7A33QBLHS/nwSDXc5XVdksQ/A2nX8K2nU5JsitcLGYXYXIsEUINA+yxW8f
	lM5qFO6jx3d8NEYnqTO6MQgG7bOSKBBhjYW0cvhEaFPJw6ViYf+5AEgBfEb9cQ0bXBF3IweiG6O
	SW1hMzFwcaSm7dejDgTxkJIK/7fDVFcezMJXSd09ycKYrOR1o6/zGajC9mXN8miS278SsX7/hyF
	MGm5wIU+FksCh5dzldQ3F4MKYRaeroZYnF5xvWwgBk0fS/FrdOr8ttxjmVsGi3IkXc31qkwCOHd
	U2V6m6ik/K7YPgw9Nm0KQcf+o22bKHLIy2asrgmKdR3NZ4C8VPJh6XJwWOJIvk7wg3QRwsK1Ek6
	IhODOGbV7FfXuiQQOx2+GQPZUh2mUaH1hB9gceRAwHEiq4l5P0WlQYQNvMMeDF6L0
X-Received: by 2002:a17:907:d10:b0:c24:adf4:5c73 with SMTP id
 a640c23a62f3a-c2ac2310342mr324229466b.1.1790286096374; Thu, 24 Sep 2026
 14:41:36 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 16:41:33 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 16:41:33 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 24 Sep 2026 16:41:33 -0500
X-Gm-Features: AclHuK-LsOlMArYi-bBBEFBbSJHVTEpwXw5N32xMJ3oCEDVV0k2jabu7ooErkFA
Message-ID: <CAGEsz8EXYLRxnOFOD=FxKn6QFFFTGhqDpsvs3q_dZw5dna8fTg@mail.gmail.com>
Subject: [PATCH v2] usb: dwc3-am62: shut down refclk on remove
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: rogerq@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, mhun512@gmail.com, ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"

dwc3_ti_remove() relies on pm_runtime_put_sync() to invoke the
runtime-suspend callback and disable the USB2 reference clock.  The
callback is not guaranteed to run: autosuspend may defer it, and a
reference held by pm_runtime_forbid() keeps the usage count above zero.
The following pm_runtime_disable() then cancels pending work while the
clock remains enabled.

Balance only the reference acquired by remove without requesting a suspend,
then disable runtime PM to drain any operation in progress.  Disable the
clock explicitly when the stable runtime status shows that the device was
not already suspended.  This also handles CONFIG_PM=n, where the runtime-PM
calls are stubs, without double-disabling the clock after a failed resume.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 6661befe4100 ("usb: dwc3-am62: fix module unload/reload behavior")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v2:
- Add Cc: stable@vger.kernel.org and Thinh Nguyen's Acked-by.

 drivers/usb/dwc3/dwc3-am62.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
index 632634d6e..2fb9e088f 100644
--- a/drivers/usb/dwc3/dwc3-am62.c
+++ b/drivers/usb/dwc3/dwc3-am62.c
@@ -319,9 +319,11 @@ static void dwc3_ti_remove(struct platform_device *pdev)
 	reg &= ~USBSS_MODE_VALID;
 	dwc3_ti_writel(am62, USBSS_MODE_CONTROL, reg);

-	pm_runtime_put_sync(dev);
+	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
 	pm_runtime_dont_use_autosuspend(dev);
+	if (!pm_runtime_status_suspended(dev))
+		clk_disable_unprepare(am62->usb2_refclk);
 	pm_runtime_set_suspended(dev);
 }

-- 
2.47.1
