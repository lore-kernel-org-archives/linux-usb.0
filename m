Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA183AEF57
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 08:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029533; cv=none; b=cVH55mRx/PxZkZofFsFcE4nYeyF0XW88h+dkB62qIvjtNmiTlSd7HYBOSf7aEZ6MSY0Gku3vtaZ+fnsybpC823h7YACzM7p/m6Wcb1xhEQBt9kLIui32jAYbC3zn85P0nVcA2P1DZ1FuXZOuW6Bn9+9wHnbCdEUO57aYHx9IHdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029533; c=relaxed/simple;
	bh=Iv/FuHLzpjRfX/Hu97z4K4S4AtbS4uRUVjP2BEKtEN0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gltoZuVqDPjI18btTrA59L1a1amO0Fo6Nsbm1BGwSlORP6yzOOurvqitzkGwHWm1Jhw1rqyHrv+aMe3Vp+h52mREwJozwFa3KDlQWLvCMn1JDZYzPSmuPLcM9i/D8L14kETn1CGwQtN3AFZJyIp3cVcmv0JleLPEFN+6uNAEgCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNr+DALi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNr+DALi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so11097935e9.0
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 01:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789029529; x=1789634329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=krWlsGzKhYn79KLVkVDG+CVwssGuEXbVIFgPkModltY=;
        b=PNr+DALiX77pVm3xrCt3IDwjU6z1l1QfxmxYeXwqBBcnn/8/9OXnr7bAYuK6jYLkAJ
         sslbhYMAEmEY35sU6/hpAwNsIFG13Ch8SiNXcc57jEnKrBjdMxsOuRvAilN6iqlH1bZ3
         2HdURyW5Rk2LAt/r5VPYtPZ9YoKqhtWPbrID1PTGAYhv1spnOdyOaX1/UhphxiylbNVL
         rfe4RfHTstNZBfxbBZQtV+DesJtr3tVjFBk5OC+dThvBemHHVZFDgTB2umWciz0EFDrz
         7b57/23fFTkfuLWA+i0fnZZy7NubgpqoQBTWKd34DWKNcaKwo7nHolqp+AB23Qqe0aIb
         9E8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029529; x=1789634329;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=krWlsGzKhYn79KLVkVDG+CVwssGuEXbVIFgPkModltY=;
        b=ZtXYd96jWgsAEj3VoT7nYtYtlXU4ayYT5aJ++Zj1ucXni3NejgnL7m7NOLuvfM3I/3
         qiJLWlpFTnzm3Su0/Higcj4TJxvIUUGBXGGoVr9FQc114jkTKGduBzCvJ6KZ0nb6Abjq
         U8/oKtBZAKPfHwhbGZ7i0ZBUWu3BtGKLrMC9Kltg+2/c91za5wqjaqt75PkMSlK6SEy7
         V473XZGAvUvb6TwsS5abT6y85vVby6zg7UT7vq2WamJS9xKv7caEM8ubf/WIdvUfv5bN
         0Ahf1/UXCaG7cLPijgWnLCuX6tY8dADUWdO5ttqdKkBIIMufnajZy6/AyMAAKYiT4/TF
         hvVw==
X-Forwarded-Encrypted: i=1; AKwUvBxE5yldU3NKQHv0HMfGo/0QMnOGjH3j9/QbZRvPsdj0s3zvMbdDSlyxIHCaaj3IZLW6hL2YOnpE5pQ=@vger.kernel.org
X-Gm-Message-State: AFuF++njLVX2pVRTlva2brM4c56DVfaQqTIKyzoBAD+NqJOzQxd7Spe7
	NHfZqH1ce12i4MgMGUGaODgy0YvoQ+/fXEadAGAimQVsdk+f/Jv5llrX
X-Gm-Gg: AYBFou1Ma2cxll1ny9dZnqCyXIJhYCZvIAMRMFwPvhf0M0rAM5Lg8+o5cDbK2pO72dT
	pwvmsFPHdoRqvDscVyDwXOn1QeJr81WxvNoGvshLmeaF94EyHZqFbSKbzhVgO3Ev4ZA4JqtJwow
	/mLDJvkkyG/DPA5eOwv/LVJNTZuDka7YtfQ9WuJrJ+QwGl0lCQaWr21IGAmjvhd7Sp5Ch3uBHdr
	IFDCSpneAIjytHlP1oknHqnSBlR94LcEmc2He2Z/N/jvR5OR0X7OPJfhsQjeCtpHqafD8qHK27K
	dwmNTCPyyz9eJAT8R8yOA5QfTB4wjWeBZKh5qYDm0dvKpyItPaHcDnE/4y+eeQqhApec8eaaf3k
	WGgMp3wSAn5s8EfZcMFjNof/TqFOZlDUsjVonbvct/6ecXpAtCOmSWT9dGLxYZT6akZvg/CVjpa
	W74/Cs+zSsobGJZm0BYFXTPlr6bZZ7q1ufi8Ym7QxS6m1Jxe8zt/R2x+QeZbtMVtpwHi5OngFW+
	lizOxm4cg==
X-Received: by 2002:a05:600c:8b10:b0:49d:1e79:35d6 with SMTP id 5b1f17b1804b1-49d26dcaa22mr38489625e9.14.1789029528985;
        Thu, 10 Sep 2026 01:38:48 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb058c8sm57245275e9.0.2026.09.10.01.38.48
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 10 Sep 2026 01:38:48 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:38:45 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Quinn Schive <quinnschive@hotmail.com>
Cc: linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG] HID: logitech-hidpp: G502 LIGHTSPEED loses hi-res scroll
 state after S3 resume
Message-ID: <20260910103845.71b194f4.michal.pecio@gmail.com>
In-Reply-To: <CY8PR14MB59803EC0F6C7FD39A6D3C42FA0BF2@CY8PR14MB5980.namprd14.prod.outlook.com>
References: <CY8PR14MB59809F95431FC6FFB0D0A56DA0B02@CY8PR14MB5980.namprd14.prod.outlook.com>
	<20260909222724.30fc8f52.michal.pecio@gmail.com>
	<CY8PR14MB59803EC0F6C7FD39A6D3C42FA0BF2@CY8PR14MB5980.namprd14.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Sep 2026 18:13:17 -0600, Quinn Schive wrote:
> I tested the patch you suggested, and so far it appears to have fixed 
> the problem on my system.

Thanks for testing, looks like that issue may be somewhat widespread.
BTW, you may respond to the patch (in its original thread) with:

  Tested-by: Your Name <email@address>

and a brief note that it's confirmed to work for you as well.

As for the Logitech driver, I'd guess it needs something like this.
Of course, the xHCI patch must be removed to reproduce this again.

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 1504de32b1c8..0107ffc9efb3 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4711,6 +4711,21 @@ static bool hidpp_application_equals(struct hid_device *hdev,
 	return report && report->application == application;
 }
 
+static int hidpp_reset_resume(struct hid_device *hdev)
+{
+	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
+	int ret = 1234;
+
+	/* reset disables hi-res scroll, restore if it was used */
+	if (hidpp && hidpp->vertical_wheel_counter.wheel_multiplier > 1)
+		ret = hi_res_scroll_enable(hidpp);
+
+	dev_info(&hdev->dev, "hidpp_reset_resume mult %d ret %d\n",
+			hidpp ? hidpp->vertical_wheel_counter.wheel_multiplier : 4321,
+			ret);
+	return 0;
+}
+
 static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct hidpp_device *hidpp;
@@ -5059,6 +5074,7 @@ static struct hid_driver hidpp_driver = {
 	.input_configured = hidpp_input_configured,
 	.input_mapping = hidpp_input_mapping,
 	.input_mapped = hidpp_input_mapped,
+	.reset_resume = pm_ptr(hidpp_reset_resume),
 };
 
 module_hid_driver(hidpp_driver);
