Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE3A3F44E4;
	Mon, 15 Jun 2026 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534168; cv=pass; b=Bpk8qWPYaNGkscaVn+eaOnwJgq/zMwfUWhx/BkRVfHiToS12nJDb9oXxVhdGdELw0SF88JkJsJzaGANfYxvFvtaNJvzfJwv7Ws6oz+ECcIvde14LYYupJSyuajUh0fE5gaUTXHCakcvDykKhe7jmM5W35tSPYSLxrtpV3DDByug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534168; c=relaxed/simple;
	bh=rkAP6YqwWCS5cGUa5DvmRXLt0jBDm5CaDGoJUbZ+N6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lfn5YD6Vf0nLZnyYJOmXW/w0WUuDeiX+Kglfg2IkZhMBJSjZH/m2/oQqIyJFkvg09pEoWS8l7z/vYsjj/1D52G/UO3rD6hUv5I5rVC7Xql5z77auHcCO1SZxn2J9yQcOIKfo0gvXp48OPzd/OsSyzKV6Dn6oOOP1nV0FHMWiXIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=bnw9glbg; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="bnw9glbg"
ARC-Seal: i=1; a=rsa-sha256; t=1781534159; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YHXLC9Z8LfiAt0jovLkQEA3xV9PVhkaPkBb+hOJsC8/7Hv7gbd5zHyqnorHbI3wXHp9GK6kHXyL3xUk6LOkKfORvxn9UCkfaopMCjtIWzxcKhl1nU7E4Au6fr/gnHZDvWXxkQ3Vzzb2b4Cn3COL+k2RS2wXzA5SA3ypOTodd1Ag=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781534159; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WbyFAdXv0amXKRe9FoCu+3GE7MXeSTJ/XGsAa1Kt/yQ=; 
	b=Z68XpIlIetS8tpIu7SqTuEmKlNZf2WZLYYzvobHjCBIlWNGxhetJGJnlXiDhT4R7YckNI1iLTI2eYNPoACyYS2qOjsshiwBNVMHAQK8qzGQMUgDAthFetAh0VUk3l6hD1GqTPEb+MjN1uiHzStUSnFEOd0QFCkvpIEpMxiSdDEQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781534159;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=WbyFAdXv0amXKRe9FoCu+3GE7MXeSTJ/XGsAa1Kt/yQ=;
	b=bnw9glbg+R7Fi5McgSFcsp9Gh6ebJm7CKiygWJXDYoYmey8opoMoZSNkB23obuDJ
	VLd0BDCjM3bXxX02HKkr4ovQmV6pcNWdE71vIVs1KK2NrBtkzJza0bUbMgvII5c8QiK
	UKEX4sfltRoYCGnbN7Kzm3rZD6O1MytJLKIEz398=
Received: by mx.zohomail.com with SMTPS id 1781534158126808.950981769617;
	Mon, 15 Jun 2026 07:35:58 -0700 (PDT)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 15 Jun 2026 10:35:33 -0400
Subject: [PATCH] usb: core: Notify through uevent when not enough bandwidth
 available
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260615-usb-notify-not-enough-bandwidth-v1-1-09ee5098b42d@collabora.com>
X-B4-Tracking: v=1; b=H4sIALQNMGoC/x2Nyw6DIBAAf8XsuZv4KBj9laYHgUX2shjQtsb47
 0VPk7nMHJApMWUYqwMSfThzlCLNowIbJpkJ2RWHtm51rRuFWzYocWW/X0CSuM0BzSTuy24NqHw
 3WOt1r54GSmVJ5Pl3H17v8/wDse6t7nEAAAA=
X-Change-ID: 20260615-usb-notify-not-enough-bandwidth-5f39ccf6754b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@collabora.com, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
X-ZohoMailClient: External

Currently, when a new device is plugged in and the host controller can't
find enough bandwidth for it, an error message is printed:

  usb 1-3: Not enough bandwidth for new device state.

In order to allow userspace to react to this and suggest the user to use
a different host controller, send a uevent with
'USB_NOT_ENOUGH_BANDWIDTH=1' to the root hub device.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/usb/core/hcd.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 8e8a5f59b319..a71605398540 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1825,6 +1825,13 @@ void usb_hcd_flush_endpoint(struct usb_device *udev,
 	}
 }
 
+static void not_enough_bandwidth_notify(struct usb_hcd *hcd)
+{
+	static char *envp[2] = { "USB_NOT_ENOUGH_BANDWIDTH=1", NULL };
+
+	kobject_uevent_env(&hcd->self.root_hub->dev.kobj, KOBJ_CHANGE, envp);
+}
+
 /**
  * usb_hcd_alloc_bandwidth - check whether a new bandwidth setting exceeds
  *				the bus bandwidth
@@ -1954,6 +1961,8 @@ int usb_hcd_alloc_bandwidth(struct usb_device *udev,
 		}
 	}
 	ret = hcd->driver->check_bandwidth(hcd, udev);
+	if (ret == -ENOSPC)
+		not_enough_bandwidth_notify(hcd);
 reset:
 	if (ret < 0)
 		hcd->driver->reset_bandwidth(hcd, udev);

---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260615-usb-notify-not-enough-bandwidth-5f39ccf6754b

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

