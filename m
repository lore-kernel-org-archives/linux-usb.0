Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886EC4E06F2
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 21:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680001; cv=none; b=pNYYnTAB/s4f0BLwWu3ejjQPsoPQU6ND0xJqnb5OzA0LRw2p+t9C1EqlM+aKe32lFLLPMDV/SpdKbZsc2XtHryAbONXNDxmLIESfvDhV6Me1CTCY7oDny4e048YiNjbbd2nLerwdU0bydcAbMOjRj8LDrRrR8ck60RBOzM0485U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680001; c=relaxed/simple;
	bh=LZSYtjDL6rm8OvTl3dPnZdBgXJ4Krf0C8RDMVYvhpEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LFEHcskYAuF4rBlyMTG8rx2QMLYlyZQUeJT95F22bQ67P8ti1FLxpXYzyiamx02sbj4obrcJgX7djo6nbnLk/LeHG6PxtVYzpEikoc60B3IaVdj2sccafG6k3Uk696877lLpW+IH08TFOLtY7xXRyyEdyvPp0cM0V8AXqRJ94ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=VYxTMxcp; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="VYxTMxcp"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd78so12334f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 14:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1789679996; x=1790284796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WP+SvTWO/ZPwSJKpdGUFyW4Q/3Pnzr6Y0d7TgXRZl/o=;
        b=VYxTMxcp7tA5lGA4BEqF26q+tfaT3B6fbUay846gOumc6aJL3f3brTI9W3v4wK+Z5P
         SktgngZIwTrRcoYepxIwqLd52f7nqW+vWU2CMaV0BwiackXY+aalE+1k847zWBWA/wQe
         CiMKNT0C/cJ4r7Sx4FGa3tIzX6YWlRPRUulfibfSsxrV2B15Gsc6VCNdzg0Rb0pGVoyy
         ZyF/lnDp1IETrYQW0mKyVswEFOVswD9b3kXDb0cVDcClBQ32e0uGYFD6UNxRCnOa+dpj
         tbqF7SXnT3SdeREuKX4Q8EKwCr6NcxghWmCRKgs9AyahdTaTp4p9+d50HHPWFBmV+BEr
         JaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679996; x=1790284796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WP+SvTWO/ZPwSJKpdGUFyW4Q/3Pnzr6Y0d7TgXRZl/o=;
        b=R+AKW3Cio5uaxLfn2nTzPlE2JQS5QojS4Pvaj7PEUtnMWd1+VjTolTlLF4SgTyg8x6
         6ZSqVXhcJ2ypbQz8WKb+zYykgZxGG6FWYioljHsrABYF+drpccdRG8VypNU8CQAsh3TM
         7tAKK23fKOtCIsbSuUea/i2ElmoONS9uAePhjJN0S38Er1g0z59SMhlqJMcA7n+8ZHHw
         EjeFJeh20ycShR7F2wfESga19p3SSAveuuGibiWwqpfkU+hY2xH0TzrBXjX8U8ZYFsU8
         LCOoUC9QJrYbxC8D+yo1g5uXbpVgNAG3B8GEnjAcMfLPGrEtucNOHycI9fr1Zjy38ljk
         w80w==
X-Forwarded-Encrypted: i=1; AKwUvBzUUSqilu7Nf8eIgwePv1YCf6zCDOF+6lx9zUfLRt1k5xqaB4KdRvom5r5SAsPq7Om/0AeI2PecwRU=@vger.kernel.org
X-Gm-Message-State: AFuF++k5a52oYROYYKWxvxI2a6cityhSIn/OvWQ3ENaYBzqQrBVIgf0T
	ThR4rqMMc8dPCHBJTc33sWla5Egd/F+uuJlJX3Lj/lDcrOD8RAmqSp72zInf30jnIg==
X-Gm-Gg: AYBFou0k2it/dQrrblJk5o10zSibf/8eRv72J4ZCTbO/IqfY+y7myMjLmekjvY4I0kW
	mDnrw+7dYkhFdd637hc6a/jpNIgkwPLUgu56XaFsraPvyk7ibg05Wq5xN/dbqbjxm6Jkx9cmfDI
	LPMwwOQXfNtNl4PR8U5KKqo09w3IQNmWvN32U6EPvNzqED/fD3FsNLr89gKBGpnRK4iSkPrKloD
	NsKGlMYPyyKhnd32x0ZaC30/j/FiGgd13WllV03FiOVtANOXCpWesydlvuxsormnk6FqNxfxkp3
	3Ne/XpdXTyNwhJrUbFRV2E+71SXy/NuB4bOHYXjqaVhRk32ofbrBUohRk3eTmZbFVpbVktukceb
	MeJ0RNj4IKFgqFUDSC8vTgqIszGeQDSoVL/vSNyON30q4UqSgKaTio9oRzMnGQOugFJKd215KyW
	IreDMMxcL9wee6AHlTg0v8NwpB1ep4EqGgPhtIorTCBhthMWObyzVKZwAZhnWFE9Pg+0ktBobbV
	8BMvVnCzikHB87OqqLY280ybQ==
X-Received: by 2002:a05:6000:220f:b0:487:34c:81e with SMTP id ffacd0b85a97d-4871e226b3bmr226024f8f.20.1789679996270;
        Thu, 17 Sep 2026 14:19:56 -0700 (PDT)
Received: from fighter ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1f6cfsm19086828f8f.13.2026.09.17.14.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:19:55 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-bluetooth@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Rhodes <sean@starlabs.systems>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-kernel@vger.kernel.org,
	Paul Menzel <pmenzel@molgen.mpg.de>
Subject: [PATCH v2 2/2] Bluetooth: btusb: restore powered-off Intel adapters
Date: Thu, 17 Sep 2026 22:19:52 +0100
Message-ID: <479fdb2638f34ccb02f35a40a34fcdc7cc41ccdf.1789679981.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1789679980.git.sean@starlabs.systems>
References: <cover.1789679980.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ACPI-managed internal USB ports can lose power while the Bluetooth
adapter is closed. The USB core then reset-resumes the device and, because
btusb has no reset-resume callback, rebinds its interfaces.

For a closed, fixed Intel combined adapter on an ACPI-power-manageable
port, preserve the binding and run the Intel setup again when the adapter
is next opened. Keep the existing rebind behavior while HCI is running and
keep runtime autosuspend blocked for other reset-resume-quirked adapters.

Tested on a Star Labs Lite Mk IV with Intel 8087:0aaa. Three Bluetooth
off/on cycles reached ACPI D3cold, restored the same hci0 without a USB
disconnect, and discovery found nearby devices after resume.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/bluetooth/btusb_main.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/bluetooth/btusb_main.c b/drivers/bluetooth/btusb_main.c
index be47ac894b6c..4b6ac67f182f 100644
--- a/drivers/bluetooth/btusb_main.c
+++ b/drivers/bluetooth/btusb_main.c
@@ -2190,6 +2190,16 @@ static void btusb_prepare_reset(struct hci_dev *hdev)
 	usb_kill_anchored_urbs(&data->tx_anchor);
 }
 
+static bool btusb_intel_acpi_power_manageable(struct btusb_data *data)
+{
+	return IS_ENABLED(CONFIG_ACPI) &&
+	       data->match_id->driver_info & BTUSB_INTEL_COMBINED &&
+	       data->udev->dev.removable == DEVICE_FIXED &&
+	       data->udev->parent && data->udev->portnum &&
+	       usb_acpi_power_manageable(data->udev->parent,
+					 data->udev->portnum - 1);
+}
+
 static int btusb_close(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
@@ -4595,6 +4605,9 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->send = btusb_send_frame_intel;
 		hdev->reset = btusb_intel_reset;
 
+		if (btusb_intel_acpi_power_manageable(data))
+			hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
+
 		if (id->driver_info & BTUSB_INTEL_NO_WBS_SUPPORT)
 			btintel_set_flag(hdev, INTEL_ROM_LEGACY_NO_WBS_SUPPORT);
 
@@ -4912,6 +4925,12 @@ static int btusb_suspend(struct usb_interface *intf, pm_message_t message)
 
 	BT_DBG("intf %p", intf);
 
+	/* reset_resume is only safe for the Intel ACPI path below. */
+	if (PMSG_IS_AUTO(message) &&
+	    (data->udev->quirks & USB_QUIRK_RESET_RESUME) &&
+	    !btusb_intel_acpi_power_manageable(data))
+		return -EBUSY;
+
 	/*
 	 * It is reported that remote wakeup events could sometimes cause some
 	 * adapters completely unresponsive. Resetting the xHCI root hub doesn't
@@ -5076,6 +5095,19 @@ static int btusb_resume(struct usb_interface *intf)
 	return err;
 }
 
+static int btusb_reset_resume(struct usb_interface *intf)
+{
+	struct btusb_data *data = usb_get_intfdata(intf);
+
+	if (!btusb_intel_acpi_power_manageable(data) ||
+	    test_bit(HCI_RUNNING, &data->hdev->flags)) {
+		intf->needs_binding = 1;
+		return 0;
+	}
+
+	return btusb_resume(intf);
+}
+
 #ifdef CONFIG_DEV_COREDUMP
 static void btusb_coredump(struct device *dev)
 {
@@ -5093,6 +5125,7 @@ static struct usb_driver btusb_driver = {
 	.disconnect	= btusb_disconnect,
 	.suspend	= pm_ptr(btusb_suspend),
 	.resume		= pm_ptr(btusb_resume),
+	.reset_resume	= pm_ptr(btusb_reset_resume),
 	.id_table	= btusb_table,
 	.supports_autosuspend = 1,
 	.disable_hub_initiated_lpm = 1,
