Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676864;
	b=TVzVCPOI85nyCpqxeXFCfLlnw0sxa/Tds6goNDhew/LCFtiqRSnCelms6zZWDjvkaHyr
	 eKy6zYqfUzamV43TB4CwQXym7NFf2K7SiLZTJ7XvXmllxcw6/b1Cul+XWCJuovZ6xUtU/
	 leFMDb4rfIgsvVCLf1oK5j/xy2ShASodgBBmSj3sleEha4nW3bgOoKQPsDuJB3H4uaysD
	 s8gq7tpdx1NB2uowqUwR8Z9QFvtdHbhM9GZblFGhmlNsYMdVuxbR9jaJimM8agUiMknYC
	 GW5dJCSfc2oSXgmhmQ2IvQFupzNK4XP3Zjflq6io+HzkDCljpxTe1IDKSkYmeXagxCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mwU+A6308ip2iXwKodsHaokt6SloRiTa7TXQScnGfWM=;
	b=P64IODH712ROk3PmlSjzdniKM9aun9woZUreS5xIb/oCx9fSCQ1P1UaQomjDtybN//2P
	 TAT1NVJxTBiAl0xqxLTguEBMsw+GlM4GCqfezdFuW7+jth1LI4ZsHmv9A03KaDUSmFVkc
	 pinH4bNq/sQwTMaT72083oZo1CziedqssMM4RePnXAYqLHwC8Rg4mA4OGGgILHINf+Eh2
	 beb6kY1QHLBrMO8L0TYIoZwXwuKf4dxEjOOqrWMO4zhwlL1BLjDlMpD69QmS0xXy2+4Rb
	 sxtnQjGOixqa+m34oKzhEWuqRDyW4TSRYQUigyML2yGbb0htm5qOaKi3P7u6eLOh+uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kFs3+pAc;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC93606D807
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 03:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEC93606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kFs3+pAc
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdab938dc83so1417248a12.3
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 19:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793676863; x=1794281663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwU+A6308ip2iXwKodsHaokt6SloRiTa7TXQScnGfWM=;
        b=kFs3+pAcB2asJWia3nXl4sSrY/b/Ui7HgpSzZneznbPnWtV6Mq9e5Nv6abO3BjNH80
         A0w5Ur4yLCOq9nLaDLNxez3qjItS5VkTubjlUfhhA2mxe8LUvFkIYJZH9Q+FHvedA0a8
         ZTEQx9yRXePLVOJ8X1rO1e7nCQUI3QqPJfgwI2sjD1JmiKeTB7YyVweGL2QUM+Qj+LBu
         oqmBTywQZo6ayf1POIANGkd6CslqT5/YZVc1LZE3NMPnsUdt57j5pf2Dlg30PUFZyA8G
         PTu/nNLm8iYQHzF38Qc9xo4mMWSwtMfQ+gYTikU2HQrx2wieSsI2NkdOPUJSLtokYy90
         PX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793676863; x=1794281663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mwU+A6308ip2iXwKodsHaokt6SloRiTa7TXQScnGfWM=;
        b=duA5BIkTAUnLx2e+S5pH7T8FbNVEhMz25xZvyKShj5tsLAoFMgBJKJBz2jY+wDQxYh
         CJloINGoc2jrVh3gdqZ2jb7TEf+YaPmj9OZz/7C7xowIdy9kVDtIh0TLh92kRACRXyhl
         b0wQbngmCKFNSkUwWAV+kFiddk88g/Jw6ClX+ehfBary1c2z4vPDs/E1nBCAmcvoQjcD
         YGzLDeGCBPuRu+ZR9bQgbvMg/TQfpU/JMDdkfb9dJFluwOfc9FcrhGzk9CU+kDJW9jq6
         YeRxDXgZvEAalACQSjqPqPSnoRBh/xfqiT1G0AoYkWyYYKNFr1ekbMXhjLupghfT6zFu
         eB6g==
X-Forwarded-Encrypted: i=1; AKwUvBwn2t8DBp3HVR1uUGkcMxTdnfHQgmx3KhYqHnNM0DUp6DWXqL1GZel46hmUngd84gz9AHoRa9bFnZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c3qT//TAWqb7PGnWBqjjHUvnLbLdW9tskCaQfkLC2K3QDygjD
	Vv/x3RijTMSRnc8q4nEhpAi+a3gDA/7pYRRAwk1qBAFplFWOqnbvJt2XTBTi0eW/Hg==
X-Gm-Gg: AYBFou17OGerEbruASFucxDoTcAlpMbJE853ShnzdkZperKjRr9z3rfa/PfwiIN6h6o
	oE/dHOe/U68Aw50iCbgmp++6HKYp/AMvVSldRL9UY7OiUHpQqY5+RMh8o0mX2z0vFnyPBqHe+QA
	CCOHCtgEQL+waUJPJf7SyCbZJftVreaw2tI0ChkLzYPhYqxyBkmMasAd72W55RUlo2KTLszm2gJ
	o2JacWjklhBHSWHfs52671ZuFmz8eS5LSpXhpGISmP7S6N4Rqo0fmgBZR4otVsSPJnbPvxDWoxV
	+e2PG1YToX4fWpMkUjOUW6MUKMk+f9iCOK44fVpqlFcvi52drsxrqcrrb7/REMVBxSb9LqEURXh
	g6vgBGil3p9Jsv37CvK+AsatZpEuYnfnGo91pU5H9zpuiIiAw8xE1j1mlopZgzrthcBZUuzbygx
	Wd4eX0QOzvrBrVPQeie4PDJT90p6Ge++1u6z+P8KHjt5sN8fPBvX7E1wf6R/kILMSou+6c2QyjZ
	V437bIMCYRS1qqEyezuB5bwDv+QNxqnrtdTUS+/CFmQQ/gUVSMl64Mi/56dq8vzG6ZJNNSegvYW
	qj14oesna+9paIyZauzgDwvu8eru6gcJzVx8XH1CfHGyJNpqm7u9U2w9cP4erGe9fr0W7rDynPN
	CcPSu/zJK27mDx52dzw==
X-Received: by 2002:a17:90b:518c:b0:3ae:2961:14d5 with SMTP id 98e67ed59e1d1-3ae8979807emr9012242a91.42.1793676863114;
        Mon, 02 Nov 2026 19:34:23 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c29e619sm1965566a91.0.2026.11.02.19.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:34:22 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v3 1/2] usb: core: clean up before handing a device to the generic driver
Date: Tue,  3 Nov 2026 10:34:12 +0700
Message-ID: <74b3f919f214a8ece24161a2c904d8a5744b703e.1793669297.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793669297.git.jjc@jclark.com>
References: <cover.1793669297.git.jjc@jclark.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a USB device driver's probe returns -ENODEV, usb_probe_device()
hands the device to the generic driver. It does not first undo what it
did before calling the probe. This causes two problems.

First, if the driver sets generic_subclass, the generic probe has
already run. It configured the device and sent a USB_DEVICE_ADD
notification. The generic driver then does both again. Notifier users
such as the usbport LED trigger see two USB_DEVICE_ADDs with no
USB_DEVICE_REMOVE in between.

Second, if the driver does not set supports_autosuspend, a runtime PM
reference was taken before the probe. Nothing drops it, so the device
can never be runtime suspended.

Clean up before handing the device over, in the same way as
usb_unbind_device() does when a driver is unbound: first, for a driver
that sets generic_subclass, call usb_generic_driver_disconnect();
second, for a driver that does not set supports_autosuspend, drop the
runtime PM reference with usb_autosuspend_device().

This leaves one limitation. Until the generic driver binds, the device
has no driver. If it is runtime suspended in that time, it can't be
resumed. This is transient: the generic driver resumes the device when
it binds.

This change does not alter what happens when the probe fails with any
other error. The device stays configured, so its interfaces keep
working. It keeps the runtime PM reference, because a device without a
driver can't be resumed. Its USB_DEVICE_ADD stays unpaired, because
sending USB_DEVICE_REMOVE would mean unconfiguring the device.

Fixes: 88b7381a939d ("USB: Select better matching USB drivers when available")
Signed-off-by: James Clark <jjc@jclark.com>
---
 drivers/usb/core/driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index d3a61ebc6afb..9b8cd0e4219e 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -295,6 +295,10 @@ static int usb_probe_device(struct device *dev)
 		error = -EINVAL;
 	if (error == -ENODEV && udriver != &usb_generic_driver &&
 	    (udriver->id_table || udriver->match)) {
+		if (udriver->generic_subclass)
+			usb_generic_driver_disconnect(udev);
+		if (!udriver->supports_autosuspend)
+			usb_autosuspend_device(udev);
 		udev->use_generic_driver = 1;
 		return -EPROBE_DEFER;
 	}
-- 
2.56.0

