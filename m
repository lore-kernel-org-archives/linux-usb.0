Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4849A369D55
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 20:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529827; cv=none; b=oou15D5x3XM3PcbGUuDnrSYmYfwnqpYc6u40/Ld6H8bMtEkmpMTQjloe/Q7+wePhN8oGTkTKp6ABeMc0kxAsveLGEOSfIdl1VoYXyT34JykUjsuwX9e19kPyQkaQnyfnUhGQ/aD409P15YiBjX1YpXH0UiqsBZaI1Mfche2o5+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529827; c=relaxed/simple;
	bh=3s03pkL9oeJUPVwr1dXRoijssDjCiRbpXwT8ZRzki2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8vwA7vhOeVeveZnTHM2EQmeGhNvHX8Ey7zgoajkVwxx5DW2BfKx32SoTq+O9M8I4b+qMPSDkZBYtF7YaUXewLO5BoOPm4MBc+3Xw8KY4Wn0932T88TUZwn/3S4y690+6a5LLlH0BxI1tqzZTYhl6jXYirulT7n1uwGZEO18cZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJcIS9jk; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJcIS9jk"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so1079842a12.2
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 13:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785529824; x=1786134624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qw3gOUllJFQoCjPBirotENfbkzHV53ONak3oQ9/a8JA=;
        b=XJcIS9jk9LC6oyuW6aVK1av6/wn+e2dKMhIQ+5qvl8MgNDdnf9+Jtvq2bOKWFZVKBK
         LZxrtpvzV7XZnUJmfDmSl3VPdT32ZwU8uEyz7+ooWUJDJOUJH9bm/+A48ZAb7RuL3r4c
         5nUeE17AqHkI4ZsuJPaYr2Kw77VM8EjzobbE5Z0u9Eb7jDAwY5+l3c0IoPmDvF4qDZgx
         wmhb+VPSHyHrpMwNWsByMLWB0yp2YMMH8JSYeSFUKZRdgxGKhvRrvfQYVcF87qYAAE+p
         FO201JW9ReO1IwP/8YbWThziGqXgEIzbkpn74cqRNKoIYZUgcJGRfn+VSEOOdZo1rM2M
         kzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785529824; x=1786134624;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qw3gOUllJFQoCjPBirotENfbkzHV53ONak3oQ9/a8JA=;
        b=jeK3JjmszS+d3J3C5r33p+/xZinZ4maGyjNqrbEXMiPrLcNWY0am2g9yjEA5Kvgr/I
         +SSGdbHTb+R4pEmEcQoJdKATyS5b2PVJkalnEdlHpxmUmzv1x9u4D3hu6vcG/y+h8qj1
         oUOd+HwYMNvvzDYOgMfZ3H6ycytgyTB1sxcqn79riHlcPxMjqE+BWru7ZDfuUSjD3Y+Y
         ke94xX8TqnQstfxQ1PYCFExJXPkzfBQ/ybMaOg+VVAmELo12gyWCSwenic6dggc/u86u
         IES9nitEWFmg4qtKbcJucLNXwVHaDzvq9Z1tPDBIChypXRpSMzbc0QLoTXLRKJfX+udR
         xG9g==
X-Forwarded-Encrypted: i=1; AHgh+RpaWcPgJ8iyk+l93EDnN1syT51x35idak4GYdyFol6AEZE2xmXEVYx3clByZxCfr4qeM7JS0gwMr6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmA+gBa7hgpwLpR8pQlM+J2CtP59J9RS+BbSZrQh+bdEva0Trq
	9zpYRKQi4TyTpaX/7IhSei0OWVF5QtRKA/Qk+3I/NxOv1x/S6OPYrs3k
X-Gm-Gg: AR+sD12KHGGUIc9A9EhnnNCjXKJfvJQ4OMLCgU2I+1zifQJs6ZtQvDpofokY1u8iZ+6
	YEUkFQg+6X3dUseYywxj5z2FqkdIExbh4bQpc++lt9/PuJxjqcqYy+qEzij8yCJZ73KrbFp3lnU
	OunXiH8dqbiFd5HFPTAM5HMFZcRmdPMeI/6iQXQs6qfYx5mPKQB+pwdjWP4Hk+zq8xeIxlqb3ww
	MWg9sBlp7I8Ddvc9ypgbTJWd4YGLSJzdZSaRb09tzCirQIb1WDFsqfwdPP132z/K1Yj5dhhEPrb
	/pUg/MtucsQ1kWEHZICBfNTdkXfTM4hReYqkGzwmxC/JDvbBX30AHm8Li3t/z46GtQaoTeipArw
	IaWvNUGx8aTheUgY++zGsVrSLKKlntNhGMRPtkHqLHTLnhitxPO55Fe6rFWMOXKBiLuUFqV7zaQ
	jwdT30RG+SbCCk/KHQWO8Wbm0xbDGOABWT673gCOCi40vGFvj1eId9KAeOKd0PdyU6e3qk9gPMi
	WzBFdJVKYUfRX6PjWnE5z8yidH8qi3NDgEu
X-Received: by 2002:a05:6a20:6a05:b0:3b4:7eb0:47a1 with SMTP id adf61e73a8af0-3c92a53b04cmr1045998637.19.1785529824407;
        Fri, 31 Jul 2026 13:30:24 -0700 (PDT)
Received: from localhost ([2409:40c4:1:e82e:8e53:b79c:e61:f58e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm13998718eec.19.2026.07.31.13.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 13:30:23 -0700 (PDT)
Date: Sat, 1 Aug 2026 02:00:17 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Snake Pilot <snakepilot10@gmail.com>
Cc: linux-wireless@vger.kernel.org, pkshih@realtek.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] rtw88_8723de: Wi-Fi and Bluetooth fail after warm reboot
Message-ID: <am0AOC9ZmP81kGcT@eggarch>
References: <CA+fxq6gPCQOYr6mh+_1ReOGzaiTULzMazXhs5q0PXc8PsjRJEQ@mail.gmail.com>
 <amnGXPlG6nKUdEl7@eggarch>
 <CA+fxq6i05RW5G289EL9V_uUgidQhDOpUhiy_J++pDDwqLwJp0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="6locgwin6sw2oolp"
Content-Disposition: inline
In-Reply-To: <CA+fxq6i05RW5G289EL9V_uUgidQhDOpUhiy_J++pDDwqLwJp0Q@mail.gmail.com>


--6locgwin6sw2oolp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks for additional testing and logs,

On Fri, Jul 31, 2026 at 03:58:32AM -0600, Snake Pilot wrote:
>   Module unloaded       Extra delay    Wi-Fi              Bluetooth
>   ------------------------------------------------------------------------
>   rtw88_8723de          0 seconds      failed (-16)       failed (-71)
>   rtw88_8723de          1 second       failed (-16)       failed (-71)
>   rtw88_8723de          3 seconds      failed (-16)       failed (-71)
>   rtw88_8723de          5 seconds      failed (-16)       failed (-71)
> 
>   btusb                 0 seconds      worked             worked
>   btusb                 1 second       worked             worked
>   btusb                 3 seconds      worked             worked
>   btusb                 5 seconds      worked             worked
I'd say this rules out anything in rtw88 and we should focus on btusb,
since unloading it fixed both functions.

> No Wi-Fi interface appeared, and Bluetooth remained absent. Thus, the PCI bus
> reset did not recover the device after the failure had occurred.
Yeah and with -71 above seems like chip isn't answering read descriptors
at all.

The previous boot journal there's no other bluetooth activity logged
after boot, so a graceful bluetooth shutdown doesn't seem to be
happening on a warm reboot, but it does work when you explicitely unbind
it.

Problem could be in the power state chip may be left in a state warm
reboot cannot clear.

A somewhat similar issue with the Qualcomm QCA6390 combo 7e7bbddd029b
("qca6390 enable failure after warm reboot"), where they fixed it by
simply making sure chip got proper reset/shutdown command before
restart. This could also work for our case but needs confirmation.

I'm attaching a small patch that just adds extra logging around the 
shutdown path for this chip to see what's been invoked and what not
before a warm reboot and if it even completes.

Could you apply it and perform a simple warm reboot and send the
journalctl -k -b -1 after it?

Regards, 
Lovekesh


--6locgwin6sw2oolp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="diag.patch"

diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
index 7f54d2d..b78feb7 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -1402,6 +1402,8 @@ int btrtl_shutdown_realtek(struct hci_dev *hdev)
 	struct sk_buff *skb;
 	int ret;
 
+	bt_dev_info(hdev, "diag: btrtl_shutdown_realtek: sending HCI_OP_RESET");
+
 	/* According to the vendor driver, BT must be reset on close to avoid
 	 * firmware crash.
 	 */
@@ -1411,6 +1413,7 @@ int btrtl_shutdown_realtek(struct hci_dev *hdev)
 		bt_dev_err(hdev, "HCI reset during shutdown failed");
 		return ret;
 	}
+	bt_dev_info(hdev, "diag: btrtl_shutdown_realtek: HCI_OP_RESET completed OK");
 	kfree_skb(skb);
 
 	return 0;
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 184e95c..382ff81 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -4470,6 +4470,8 @@ static void btusb_disconnect(struct usb_interface *intf)
 	struct btusb_data *data = usb_get_intfdata(intf);
 	struct hci_dev *hdev;
 
+	bt_dev_info(data ? data->hdev : NULL, "diag: btusb_disconnect called for intf %p", intf);
+
 	BT_DBG("intf %p", intf);
 
 	if (!data)
@@ -4682,6 +4684,15 @@ static void btusb_coredump(struct device *dev)
 }
 #endif
 
+static void btusb_shutdown(struct device *dev)
+{
+	struct usb_interface *intf = to_usb_interface(dev);
+	struct btusb_data *data = usb_get_intfdata(intf);
+
+	pr_info("btusb: diag: device_shutdown() reached btusb for intf %p, hdev up=%d\n",
+		intf, data && data->hdev ? test_bit(HCI_UP, &data->hdev->flags) : -1);
+}
+
 static struct usb_driver btusb_driver = {
 	.name		= "btusb",
 	.probe		= btusb_probe,
@@ -4692,11 +4703,12 @@ static struct usb_driver btusb_driver = {
 	.supports_autosuspend = 1,
 	.disable_hub_initiated_lpm = 1,
 
-#ifdef CONFIG_DEV_COREDUMP
 	.driver = {
+#ifdef CONFIG_DEV_COREDUMP
 		.coredump = btusb_coredump,
-	},
 #endif
+		.shutdown = btusb_shutdown,
+	},
 };
 
 module_usb_driver(btusb_driver);
diff --git a/drivers/net/wireless/realtek/rtw88/mac.c b/drivers/net/wireless/realtek/rtw88/mac.c
index eaa928b..49c5d07 100644
--- a/drivers/net/wireless/realtek/rtw88/mac.c
+++ b/drivers/net/wireless/realtek/rtw88/mac.c
@@ -166,12 +166,16 @@ static int rtw_pwr_cmd_polling(struct rtw_dev *rtwdev,
 
 	/* if PCIE, toggle BIT_PFM_WOWL and try again */
 	value = rtw_read8(rtwdev, REG_SYS_PW_CTRL);
+	rtw_info(rtwdev, "diag: pre-toggle REG_SYS_PW_CTRL=0x%02x, poll offset=0x%x want=0x%x\n",
+		 value, offset, cmd->value & cmd->mask);
 	if (rtwdev->chip->id == RTW_CHIP_TYPE_8723D)
 		rtw_write8(rtwdev, REG_SYS_PW_CTRL, value & ~BIT_PFM_WOWL);
 	rtw_write8(rtwdev, REG_SYS_PW_CTRL, value | BIT_PFM_WOWL);
 	rtw_write8(rtwdev, REG_SYS_PW_CTRL, value & ~BIT_PFM_WOWL);
 	if (rtwdev->chip->id == RTW_CHIP_TYPE_8723D)
 		rtw_write8(rtwdev, REG_SYS_PW_CTRL, value | BIT_PFM_WOWL);
+	rtw_info(rtwdev, "diag: post-toggle REG_SYS_PW_CTRL=0x%02x, retry poll read=0x%02x\n",
+		 rtw_read8(rtwdev, REG_SYS_PW_CTRL), rtw_read8(rtwdev, offset));
 
 	if (do_pwr_poll_cmd(rtwdev, offset, cmd->mask, cmd->value))
 		return 0;
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index c8d1412..17dfc92 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -5416,11 +5416,19 @@ static int hci_dev_shutdown(struct hci_dev *hdev)
 	bool was_userchannel =
 		hci_dev_test_and_clear_flag(hdev, HCI_USER_CHANNEL);
 
+	bt_dev_info(hdev, "diag: hci_dev_shutdown: HCI_UP=%d HCI_UNREGISTER=%d shutdown_cb=%ps",
+		    test_bit(HCI_UP, &hdev->flags),
+		    hci_dev_test_flag(hdev, HCI_UNREGISTER),
+		    hdev->shutdown);
+
 	if (!hci_dev_test_flag(hdev, HCI_UNREGISTER) &&
 	    test_bit(HCI_UP, &hdev->flags)) {
 		/* Execute vendor specific shutdown routine */
-		if (hdev->shutdown)
+		if (hdev->shutdown) {
+			bt_dev_info(hdev, "diag: calling vendor shutdown callback");
 			err = hdev->shutdown(hdev);
+			bt_dev_info(hdev, "diag: vendor shutdown returned %d", err);
+		}
 	}
 
 	if (was_userchannel)

--6locgwin6sw2oolp--
