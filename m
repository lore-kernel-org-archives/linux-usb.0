Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6188337F732
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 16:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439927; cv=none; b=TSoHz7HQhZSwcnIe645B5JzZgx1D5I1ryxqd2O7s80KM8b00nos4+kVTd92rf5zAsexb1JD6Kb7+LUkgxbiu5Lw2ZrJxZee4Z/GKjS3nWFzyX8T54VI/wvtkh6xrQGoXyjJND9B5IZPaCTSjTALZyy6UFnNFZSaReNAClInvVSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439927; c=relaxed/simple;
	bh=guq+rkDi2+E+Dj+mrhLgj+C5Kv+YlrMk5QkUERPxIs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nT/DJ8jAVmgVeUeH/iBaRmuFoqKvpjMNzShKzghfmHLzsYRXqTrkdvxsCNDxOIAvb5qZmQxbFgkM0H7KeonvTWlALkeupyWWeslSQsZfmAmqsvzFhsu8rKC6Yk10bHKd/hUuwOrzYhswFOjafkgP7xGPlb0/3WhAlyO60qfO9pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s4z01Go9; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s4z01Go9"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-91415b09bf9so16354856d6.3
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 09:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439916; x=1791044716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G9Q4b0eLORsQAHfEyrgPHMbEPou/wIlLxhzXAIh54I8=;
        b=s4z01Go92wDlC8k/R5ZcTEbmUrPZUk/QLo8zzrprfei1hJLkU0BPPm8GGeI0zxtvJ6
         cU0Lu0ulGltkFmVBQeWMrUt0oCholT8052ZuudFaHSgawBYDLHsobimck15kGtZUCMA5
         nWpjTiJdl42wx/TjZC31hD0rkendmgb72dzA4Np/7nFik0qIqTrDOs9fIdrmSktS6crc
         cDyhP7fGC42UQ3FqUqN3zFP824U/Zx3+c1zUsnhBEjE6ektbLWIyp95OvMt6OE5k2zfS
         POQ+5Zf4c81UD9ZS+VtvrZmZTdCwYVBe4Xg5WC+PuDV7Z/RuJalAMCVLK4Tcl39oVi65
         ideg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439916; x=1791044716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G9Q4b0eLORsQAHfEyrgPHMbEPou/wIlLxhzXAIh54I8=;
        b=cOiwF6psNUKWrXsJtvKeKFT7iEx/MvFOmfdFjftUx1VaLxUE9OO6QXoUSobN7lK3lx
         U9OpsyVWWTzEX5l9QRgRn1H/GtyEKoNZTka7gfDOzOMNyg+7enynp8AWknqhyc6vJqgs
         NwOTKIQMgBLhgutE4bWuQEoQUOZUi0Qxi/Fq2IMptT8+JnWZeWdCsCGx0dy0fCLJ5kKb
         /CnKlhWFHr2PVTWEf2YbKNo27AYUHIgglQZk2eDihis2hn7vDtiXPcDieC9jt5cuRK39
         DHV0yfyeX1DwpxRaLVygTK1sv1OslPw0n4in14gjwZONTPmiRmos1zvHvNFrLbGrW7Ap
         7WSg==
X-Gm-Message-State: AFuF++losJwQ0jImIO3Fma+tKc9iJha2poFSJVgu9Y908ythYkAp5cM3
	Wz1IAs9/DocTEUk0SgCvQYzrHDp+WGTn3mjCeeIJ8GCROEe2YgofQcSh
X-Gm-Gg: AYBFou2udIk7rol+RLM7Z8yYMByxfzZu9LIBv/Lbkxhp1uwDMDQINCJDGbNJkPY+FyV
	m1KFADbjczItoWxhJ5Ru9RoqwH/KrdIIGOF/iLL8l4D1qVxUHO9ngWnIV362xoZvFTyvWXvoGv5
	C8ekTvxdecCtoy+9M5Ciqbvl/Odu8/K6aPqnE2IXjxf1csbcge9RfZTR/3ikBWQkmxKlndgqruw
	EvJNhErYkkF7mR6d4gtzspqgGS0JWpPE9oC5KeWys3h+0lJ5cFj9goJn/5q7WQQT2CvQ1wleMZZ
	FvlWtgjm9DEYc54v010aI6xx74m34qUZOQnsX63zpFzHFwcL75lvQl7akmiSSOSvjxQL+zxvhC3
	ACymmCofIhCOsgFNHRu20UqF7Mxvkfoa5L7snFtdMN/JeHq1+C3YNVndlZBirUQ0g/PRYTVu5gi
	G9E0vy40VF0xi0g5z0hNChTfJiISOGqwq+M2oeH4gredwt1WznY6xajNvxCMVFJCd2Oki01f5E0
	zgY00/e/FBGuJQYhN7npsGoc+CXhKAHv5cM6VSA5t7cTFHO
X-Received: by 2002:a05:620a:1a1b:b0:939:d38:3ab8 with SMTP id af79cd13be357-93c43b6120emr1113869385a.12.1790439916403;
        Sat, 26 Sep 2026 09:25:16 -0700 (PDT)
Received: from zaina.localdomain ([172.56.198.134])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448ae879sm444974685a.13.2026.09.26.09.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:25:16 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: ohci-sa1111: remove unused dump_hci_status() debug helper
Date: Sat, 26 Sep 2026 12:25:13 -0400
Message-ID: <20260926162513.25268-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dump_hci_status() is compiled out with #if 0 and has no callers.
Remove the dead code.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 drivers/usb/host/ohci-sa1111.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/usb/host/ohci-sa1111.c b/drivers/usb/host/ohci-sa1111.c
index aca0338a2983..7e500c772616 100644
--- a/drivers/usb/host/ohci-sa1111.c
+++ b/drivers/usb/host/ohci-sa1111.c
@@ -40,20 +40,6 @@
 #define USB_STATUS_NHCIMFCLR      (1 << 10)
 #define USB_STATUS_USBPWRSENSE    (1 << 11)
 
-#if 0
-static void dump_hci_status(struct usb_hcd *hcd, const char *label)
-{
-	unsigned long status = readl_relaxed(hcd->regs + USB_STATUS);
-
-	printk(KERN_DEBUG "%s USB_STATUS = { %s%s%s%s%s}\n", label,
-	     ((status & USB_STATUS_IRQHCIRMTWKUP) ? "IRQHCIRMTWKUP " : ""),
-	     ((status & USB_STATUS_IRQHCIBUFFACC) ? "IRQHCIBUFFACC " : ""),
-	     ((status & USB_STATUS_NIRQHCIM) ? "" : "IRQHCIM "),
-	     ((status & USB_STATUS_NHCIMFCLR) ? "" : "HCIMFCLR "),
-	     ((status & USB_STATUS_USBPWRSENSE) ? "USBPWRSENSE " : ""));
-}
-#endif
-
 static int ohci_sa1111_reset(struct usb_hcd *hcd)
 {
 	struct ohci_hcd *ohci = hcd_to_ohci(hcd);
-- 
2.53.0

