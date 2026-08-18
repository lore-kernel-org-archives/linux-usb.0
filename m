Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1994746B2;
	Tue, 18 Aug 2026 12:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056897; cv=none; b=cJXNyv5eiMaIliGljeJSK5q3NT5lHJmeEuhuUkm+n7bu5ZrHlgeZenhiWcbS/3DGpukXkWdb2Bkts4T2BbvLtIVm8xAnDGecz/hMwKpuT9DedG1p43WykM4oejCquyWZFWMzFkvqSt9tat559wNWTaDFnm0khpf/xe+lsmruQqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056897; c=relaxed/simple;
	bh=4wDMGKMp2mOuBcTDn+31ZEh/ssqJsL2i219zJSRWMHY=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=spTbz7c82z/OcvT6soT0UMMRgB3/i5E6DmKkC8vvCZjpmexLhZxcLCNGry+g5flTsBAjlIFmjLFXUuehuqXrUA6XtOswkTXppQII95z4lpl8sSm59mwvx0iUS5vea5ZZKiuBcoyap7JOp8tZJLXQaFsKWyJMXPpQAHev1nYJGzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=zuyK35Gb; arc=none smtp.client-ip=203.205.221.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="zuyK35Gb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787056892; bh=4gN5Bzu44Mp5j7wpfiS66+lZDbNl2Rk7pPXW7o3kN9Y=;
	h=From:To:Cc:Subject:Date;
	b=zuyK35Gb67RbqgBKlXXVZ6N8qiWMeEv1PdykgTUMgIRgjRMUwCbEzOznsWGSkLh51
	 kEC3BpuNWjpKDt0Gyrvp+GK4nymqfxn0mn6CPU/bSVuFBRzYQKbJeKTwsB1eptKNsW
	 1TIA254/3KO+4+mjsNKBf0QhDfuKFEHWJYT3AK6g=
Received: from ws006419.mbzu.ae ([5.195.0.150])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id A5D0B61E; Tue, 18 Aug 2026 20:41:29 +0800
X-QQ-mid: xmsmtpt1787056889tzw9h6z02
Message-ID: <tencent_30752557FD78912E64BC2E901338A0D0EF06@qq.com>
X-QQ-XMAILINFO: OK7NBzdNss/RK8OU+4T+ckOQ6L7UJ4G+0o3mUQguEcLL05sOch7u5mRSVzzcc+
	 5W7csBG78M8Bb1CjbJUhpxvG509a9hBtyuYAExZIkUGnLyWxrXlJMrbkeNRL/xtmpTJcif5eCvGb
	 wiiw+lawOU5HLJNatoGP9Yy61mSK28kLlis2mPxgvGeVoPMGNzxspn3Ed6U2r46bDlkEI2lcwfbt
	 oV2+gGR5rE2vW+Zs34Lcw9eKSsMzsatjs4uyFsmQzfcWVDi3bWXQYYwiIwNIMTOhABDW/UJskY4g
	 LmQ3DZaBQBzRJnETCr2oc2FKx9Yo8S75AvRzWObIQT0/JeEkbHEJo+C/bMF8X4UI2XJ1TbljmOzf
	 QQXUVeRjt75BO6Dvy1A++sNdc8ZOJN/qlCG3Fu58ED5jXlxjtux8nSkhNlr8iMc1QeskdSh+T0Yr
	 IyhJEj8oMZFRaanGjo1ktN8Y+I2HBIW/qJUqDn9B3pAm04Lcasesa0b9bHoIR4zp3OQ+6WAz4dEF
	 bpOBjOVwZEB5eF6f0rFMNtLf2bBSdvI3K9wXJclH00zBBkEaUzfX45ijhCGuz0HCQmykWW53/gf9
	 QcCYFnEJ4uZvjWuiGzHLral4ASxTdazcyocX0ffwjdVCvPGaWH63FPl4ySYChjWjgpZfEgYM71u0
	 N5roS/KWS4bYJxm77XWThcWJYtaS1reVpSuUyPyHlwir1C9F/AO6aBVFHEme+RPLSWM0PsLQ8GNf
	 OOMmVmcZRaTsgO80e/PWBWgBps1GB0lXsKTK2ysinoqRPIxyDhGRifHx7TaQOjihDgcumjFGrG7B
	 2X/9JDTHlgy6tDlXYaVbKTr8Ltd2tah0GKcK4ANsDklY/B5dxU4hTFZD7LxO/ocMZwTWmiwkmPIy
	 08ub3MZHuxM9fgfDyXv2gX0smLoinx583Pv1ibgjwCOXXvwZIIEJmGKrmXZesc0+sfwWA1up5s4/
	 lKxdXsGjTUDR9jEd3XgGywUOEC5uR1PjM5OX022WqyaCWyVR+h5pvNNoUT1hRleUZVHUwC5MXETx
	 rX/58ngri4D107EUYPlx/Qei+E95nMBrPp7Z/ePv4wcy0jtOR8012Zr+Cqfhs4pFqzh8XmHfGHyU
	 29mHg0RJHsbfkPqU8wPDUOIVbUiw==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Jiawen Liu <1298662399@qq.com>
To: Juergen Stuber <starblue@users.sourceforge.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	legousb-devel@lists.sourceforge.net,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jiawen <1298662399@qq.com>
Subject: [PATCH] usb: legousbtower: clear interface data on probe failure and disconnect
Date: Tue, 18 Aug 2026 16:41:28 +0400
X-OQ-MSGID: <20260818124128.246989-1-1298662399@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: jiawen <1298662399@qq.com>

In tower_probe(), usb_set_intfdata() is called before
usb_register_dev(). If registration fails, the error path calls
tower_delete() which frees the device, but the interface data still
points to the freed memory. A subsequent disconnect would dereference
stale data.

Clear the interface data before freeing the device on the registration
failure path. Similarly, tower_disconnect() retrieves the interface data
but never clears it before possibly calling tower_delete(). Clear the
interface data before the possible tower_delete() call to avoid leaving
stale interface data after disconnect.

Signed-off-by: jiawen <1298662399@qq.com>
---
diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index 111111111111..222222222222 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -814,7 +814,8 @@ static int tower_probe(struct usb_interface *interface, const struct usb_device_id *id)
 	retval = usb_register_dev(interface, &tower_class);
 	if (retval) {
 		/* something prevented us from registering this driver */
 		dev_err(idev, "Not able to get a minor for this device.\n");
+		usb_set_intfdata(interface, NULL);
 		goto error;
 	}
 	dev->minor = interface->minor;
@@ -846,6 +847,8 @@ static void tower_disconnect(struct usb_interface *interface)
 	dev = usb_get_intfdata(interface);
 
 	minor = dev->minor;
+
+	usb_set_intfdata(interface, NULL);
 
 	/* give back our minor and prevent further open() */
 	usb_deregister_dev(interface, &tower_class);

