Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9CE38CFE4
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 10:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013306; cv=none; b=aTIZ5KRzCPWUS8JqIza0KIep4YH3gm0OJMi5ydBpjqFNRgiLz2W0+Z+eai1YkFRIVGProUp2y1zJg5inDl6JGCd9yPk2dRsqajK2I8aF17fMAcP21/TfhFP6A4Z2BpCGoSk9z/W5l5pH6v9hHVVa5aiD/QG3+N/EEsn0iNOpTSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013306; c=relaxed/simple;
	bh=g+JIjgCGD8pYHgloXfxcgCIBDE+57bytIqMKJ4nsoDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rh5WYQXRmwrftVaK/JRHUZkZjXkuNVTJwTI31QzQocPvhjMS8ECv/5xlLeTaARN9VksdsuN56Nr+t6GI6WeQwukIFcvV1OQbkuyNLxa6JCOs6Sry2QJExzq52zbStlngWSWoheQ4mDjB2VgzTNrIWTfYuvOsE+9tfnQRzS7AXu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PosoEICd; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PosoEICd"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1814151a91.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 03:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786013305; x=1786618105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=flSv7xBdlCbrg4AJcw6jzs2xlfv6qS2mtAaegxjbgz0=;
        b=PosoEICdy2NY0B7DHi5ZMlgduIptpI4BbYFf/v0nMMB1oOR0z7VOVlU/pEDaTgZ93D
         UuPrBVZIx5Z49lEfvsYXrhgi/TT7d3MfJekyHlfrU3wGXdezB10cmsiKM7TJRKeTnMby
         p5nuOoSAEvE4LtH1gPo7CrzCPhgy5RhjpGLo+TPN48I1HthJ9wZq5JfY5ugmdMwCprlt
         e7O+qIy6bh6jMUV8/KvZDH8FaN2spFLYjiNRg3gyLnYmhl2rnr4SWWdou322hks+lDkQ
         vD2NBHmVKpKYoH99LQkUuun3m6UIE57cxLTT1bQwYet4+QqtW5rvyEI/dT2J8M+UX2hI
         BqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786013305; x=1786618105;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flSv7xBdlCbrg4AJcw6jzs2xlfv6qS2mtAaegxjbgz0=;
        b=JosRexY9GbElodLBlY4li8whh0d5EkRo6bOe1/O+H9fjFt+dVBzUJ/fJmfFtIa6Jnq
         2HCDoUYliyTgIjy/x06dJ7eCq1A6PhQUHlqnDUMPc/QxCpxPsL7abd/+HVzm/0/X8x+C
         5nWCW2zsqrme82GLJ8YGtqwkrhSsL9Yf2kvAcf1/ODlxh6uGfhmib/jl6ohRceJ4XpoN
         e36tiYccLfo+4+Pht6j+VuAnuOJ9ezDAmaXLdW5dWQBn6UHq94yv4FUHZx5HwH3QOGD+
         zSgQsVoSD1qZHx/Riw7UC8lXJ7Ger0gJgtQMBZBw1F7P7HvtqjkaiqGHHB3poAMgxvf9
         egMw==
X-Forwarded-Encrypted: i=1; AHgh+RrDwQrITasq/1Xzwdlpwsu1SFupGSjEja0iKgJchABUTvepUxu+f66NnDObEue0Fla3Yze4+5WXkjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaoJR8+ms+iBneuePCu7BSv3i3HXNOIRhDfT/GGKmGd2Bzb64z
	4qJ9pWQp2PpSCEF56AilOoV5pYOcuktqcNTIhXl2XtYgOVcTWQElMWG7
X-Gm-Gg: AR+sD10fXZJD6qUNFBCQND94R4OcXeL6GrD7FFjaZgPwvFHSX8uXqIA9Q0x6bbGQcAX
	fIQSSKWYYDNaymKlEsztLH/9+vTpxVCaGcyM2Xz4NvHJGJTTQR7Y7FD92Hb1Jbq6Km8tk66xLin
	SLGjwuif7TmEGbDCgU0TMyJyNgpq3ecXXlXs3mdvmNQu3/6E5LvNHbRvADU5Kd8ThgtO14ByoAB
	tO3yKO3Aw7+gd1NN9EinMFc4aL0G3LpC/Rsn0V/bIIlm1kTUDHP5Pg3fw8ZKgbP5nNz0HeGQnZB
	dD7NALpVbPcuAcZKhI/GIwlCkaDb5OVPVMfjJzixmMPJ6VwwrG7NkZzVrhMQugSnJsYgLKHUFjl
	3Eh6aCaTDGZa65ek7chEUx1IIA8xaaTxMPsOh2tS058OVAHe4tXGULxDQHVc+OOICoV9SWsV287
	466l7rDnLBabw90AobKCXzKS9THN0FxNMX3LgAhteySdxamyHgM3oolkYzwjtCsYegMtvpokFGD
	gy/bsWA2oaJaG0n1bzjUjpeEFM=
X-Received: by 2002:a17:90b:3985:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-3903c5f41ccmr10892238a91.16.1786013304585;
        Thu, 06 Aug 2026 03:48:24 -0700 (PDT)
Received: from localhost ([2409:40c4:9:327d:da04:751e:1623:ed1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158644a195sm24887835eec.13.2026.08.06.03.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:48:23 -0700 (PDT)
Date: Thu, 6 Aug 2026 16:18:20 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Snake Pilot <snakepilot10@gmail.com>
Cc: linux-wireless@vger.kernel.org, pkshih@realtek.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] rtw88_8723de: Wi-Fi and Bluetooth fail after warm reboot
Message-ID: <anRcsdWWWX7zyfj5@eggarch>
References: <CA+fxq6gPCQOYr6mh+_1ReOGzaiTULzMazXhs5q0PXc8PsjRJEQ@mail.gmail.com>
 <amnGXPlG6nKUdEl7@eggarch>
 <CA+fxq6i05RW5G289EL9V_uUgidQhDOpUhiy_J++pDDwqLwJp0Q@mail.gmail.com>
 <am0AOC9ZmP81kGcT@eggarch>
 <CA+fxq6hD-duO3g1gEEQL5o+_S-y8dfFDerD58=scNsd9WfdU5Q@mail.gmail.com>
 <am4JYI-tXa-rK7Hq@eggarch>
 <CA+fxq6gBYA=qDrOQ+LmPHPdVGagtR0Vdnm_KeAC=nM7c-GSu5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="tp5bmuxrjjlhbjdh"
Content-Disposition: inline
In-Reply-To: <CA+fxq6gBYA=qDrOQ+LmPHPdVGagtR0Vdnm_KeAC=nM7c-GSu5g@mail.gmail.com>


--tp5bmuxrjjlhbjdh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 02, 2026 at 11:40:51PM -0600, Snake Pilot wrote:
> Bluetooth: hci0: diag: hci_dev_shtudown: HCI_UP=1 HCI_UNREGISTER=0
> Bluetooth: hci0: diag: calling vendor shutdown callback
> Bluetooth: hci0: diag: btrtl_shutdown_realtek: sending HCI_OP_RESET
> Bluetooth: hci0: diag: btrtl_shutdown_realtek: HCI_OP_RESET completed OK
> Bluetooth: hci0: diag: vendor shutdown returned 0
I'm thinking if reset itself is the problem, since it does not run on
unloading manually but it does on shutdown.

> I did not find the btusb shutdown or rtw_pci_shutdown/D3hot diagnostic
> messages in the persisted previous-boot journal. The journal appears to end
> before the final device shutdown stage, so their absence from the journal
> does not necessarily mean that the callbacks were not invoked.
Yeah it seems it runs after journal is gone.

I suppose we should test by skipping HCI_OP_RESET if that improves the
issue.

Could you apply the attached patch only and start with a cold boot then
do a warm reboot and send the previous and current journal just like you
did before?

Thanks,
Lovekesh

--tp5bmuxrjjlhbjdh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="skip-hci-reset.patch"

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 184e95c1625e..e7dd19b20cc8 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3889,6 +3889,12 @@ static int btusb_shutdown_qca(struct hci_dev *hdev)
 	return 0;
 }

+static int btusb_shutdown_rtl8723de(struct hci_dev *hdev)
+{
+	bt_dev_info(hdev, "skipping HCI_OP_RESET......");
+	return 0;
+}
+
 static ssize_t force_poll_sync_read(struct file *file, char __user *user_buf,
 				    size_t count, loff_t *ppos)
 {
@@ -4338,6 +4344,9 @@ static int btusb_probe(struct usb_interface *intf,
 		set_bit(BTUSB_USE_ALT3_FOR_WBS, &data->flags);
 	}

+	if (id->idVendor == 0x0bda && id->idProduct == 0xb009)
+		hdev->shutdown = btusb_shutdown_rtl8723de;
+
 	if (id->driver_info & BTUSB_ACTIONS_SEMI) {
 		/* Support is advertised, but not implemented */
 		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_ERR_DATA_REPORTING);

--tp5bmuxrjjlhbjdh--
