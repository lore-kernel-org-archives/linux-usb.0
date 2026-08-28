Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7093C3C0625
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787903958; cv=none; b=EToBuWD0S9FhPKkAjGx2d6TtCdiT8Uu0crAX9EfsWhpRcH1rNmQj6zpq6txzC/pd5KkQfT/J180GF1cSexZBLiZbQy/5k7pD+JJMnp0d2co0ehJSCyJuRQu9Iy5Qr6APd9gG5t888EYfy/rGPVK/sXarP6wgKeu9Nn5pTis0+Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787903958; c=relaxed/simple;
	bh=1GPU0BWMOwmqInTTjh9l6XuuMTaDwPJpNzEpLt9Wx50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nKTbONMzX/PR/cbDjpFAXmNmigwCGusYckiuLF94nqPNiYND97NlVPuiUAnp78s8a1Fulg1d1IT7BlIbBgsTth30/nGW7iGvSf1hGQNvcYOEEP2gxdKCtC2SCgYVtMV2ZV0jIZh8qvAjehLaG5UWRb68Wcdhhgx8LVmfNPJcqYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNB43xKR; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNB43xKR"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so1004079a91.1
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 00:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787903957; x=1788508757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xc2kLyqHA8feBVoBxWUFDrEB1k3VVg85UTOGkhcrHS0=;
        b=WNB43xKRewMCYrEDJMHB11hiRdWpw67a5Wt03xAaxWy6POdsAt3OZt98hkhcabtdFb
         MlV2lp6nDQ+9oMkukd2pbut4OBq91B576XUhcc2PH9yF+360n/MalvCAOQjb8Ixda4yq
         8YgHgZw1Z+I0Z6FuleZ3IBwI04C7lLBk6m1JfD6YsniGwmBLEMj7ugqituBBOX/8nY6A
         lzBKwujjlbs3416THKC1yOXD4ilFjSJlDzTX7bEswviIOY77RzKWHLshS1Z/uwNUNssU
         KktQOGvxjCOzv+r0LuL1j1RlvMxc/kPxGtdK22LPVZXBJ+2bvSzZeBd5CmY2FD3tsfCm
         MKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787903957; x=1788508757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xc2kLyqHA8feBVoBxWUFDrEB1k3VVg85UTOGkhcrHS0=;
        b=nQNJECPV7GFWxDrTjcD83IJ9LeZK8PLTtMXCDlRkw4NzOTGRNupE3kd8yYl2TXToRm
         fXqbQJ2MdMIFz3mWmczCo8thwNlyhZf+6A+j2PWEjwxFScf562HkIBeitzJCMAlI3hEq
         bAam1TISNxChZkaxwSP2fMbzD+kZXQIVibQx+xp+dlfuFmIsnUBcjXKJGSuLL/obktnQ
         eXPEV91aXtrErGrNCjXj2cqTyhQmw5w91zIQvojULCamGLZJekpbKx5HOQoftKucL+om
         Z/Ck47xTJEgZo5TGJ5o3T09QqltqTDhNAixKAb9cjn5aCq9atXfYB0zm0wkr1sqGe+QM
         pMIg==
X-Forwarded-Encrypted: i=1; AHgh+RoJGqexc3jY/9Xer5fNhMLBjoumrw4ValQTTjQ/Ay0Sxa880hm/yY5jk9PFxbA/8JCPZweHNBDuqRI=@vger.kernel.org
X-Gm-Message-State: AFuF++mrvP8EATYngwQQaGfR76nkwsQCfWCzpj8aHwsQ4ZOj36k8KBOc
	bcDwJp4asEl5BW79KAji/97Rmooi3IabObUX85A/efd50zS5VsS+uDftc2S2G6fW
X-Gm-Gg: AR+sD125Z9AvodS/4O/Y0hji3OQbLHg5LInPtbkucPrpIIzz0IqOb5wEGWHCasePDM/
	lVjMvNojhJg5Bb5NS3n1AfQi0oqbDtTteJvqZLElEi1Adqa1PSlbDxNq+wPkFhQKJNAHS9cVTfM
	v28AnsxL5NWrgcz5Cdo1TcVrCSG/AxbH8jAJ7STyeNvZ8jivp3TNKdUL/2bNloaMTHXr6U4+If/
	KE7hP03xTrACDOfpyEPcQdQdP8qYxL/bCnVlJqLDIWBgaJTNgHXfmszGOjjYzypFiJo7BJ7E/CB
	B/otpjI8pyUhGca5rQiXE+Rjw+paUQgJZVYgDPQsAg5vSEoUWUEsLt5mmlu4djHlP5qtiwttBy3
	QkPtAhspyOhoBkVYFpjqUhTSj7MZ0t+EDd9jSBVOttCnV2vr8KM2g3Wp4KrbcuUtnB3S75VVtbI
	Qb9cUWQbhcLGkwaxMrh4QHQPJ5qfr9HXaJRUzsN5pt9WLs3cqKKUniJEB+j16YsnsUiUNAVaduf
	k8bzBPKI5OYe+UMTwVQ+L3NzpIbnpTg0muQvQSk8/qyEEQuz6SfO9n1kjJE7QWZ3S3ae7U=
X-Received: by 2002:a17:90b:582e:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-396d0fabb3amr10246158a91.13.1787903956616;
        Fri, 28 Aug 2026 00:59:16 -0700 (PDT)
Received: from ian-lin-DREAMBOOK-PRO-14V.. (59-124-157-10.hinet-ip.hinet.net. [59.124.157.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b19927a1sm6539128a91.14.2026.08.28.00.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:59:15 -0700 (PDT)
From: Ian Lin <jisayme@gmail.com>
To: bjorn@mork.no,
	johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ian Lin <jisayme@gmail.com>
Subject: [PATCH] USB: add Compal EXM-G1x modem support
Date: Fri, 28 Aug 2026 15:56:44 +0800
Message-ID: <20260828075644.6228-1-jisayme@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the USB device ID for the Compal EXM-G1x modem.

Bind its QMI WWAN interface 8 and expose its vendor-specific serial
interfaces with protocols 0x30, 0x40, and 0x60 through the option driver.

Tested on a Compal EXM-G1x modem.

Signed-off-by: Ian Lin <jisayme@gmail.com>
---
 drivers/net/usb/qmi_wwan.c  | 1 +
 drivers/usb/serial/option.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index 8178a8758..e17afb22c 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -1451,6 +1451,7 @@ static const struct usb_device_id products[] = {
 	{QMI_FIXED_INTF(0x2692, 0x9025, 4)},    /* Cellient MPL200 (rebranded Qualcomm 05c6:9025) */
 	{QMI_QUIRK_SET_DTR(0x1546, 0x1312, 4)},	/* u-blox LARA-R6 01B */
 	{QMI_QUIRK_SET_DTR(0x1546, 0x1342, 4)},	/* u-blox LARA-L6 */
+	{QMI_QUIRK_SET_DTR(0x04b7, 0x8217, 8)},
 	{QMI_QUIRK_SET_DTR(0x33f8, 0x0104, 4)}, /* Rolling RW101 RMNET */
 	{QMI_FIXED_INTF(0x2dee, 0x4d22, 5)},    /* MeiG Smart SRM825L */
 	{QMI_QUIRK_SET_DTR(0x2dee, 0x4d63, 0)}, /* MeiG SRM813Q w/ Modem(PPP) */
diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index e4ad14375..56b43bf1f 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2547,6 +2547,9 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0640, 0xff),			/* TCL IK512 ECM */
 	  .driver_info = NCTRL(3) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x2949, 0x8700, 0xff) },			/* Neoway N723-EA */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x8217, 0xff, 0xff, 0x30) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x8217, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x8217, 0xff, 0xff, 0x60) },
 	{ } /* Terminating entry */
 };
 MODULE_DEVICE_TABLE(usb, option_ids);
-- 
2.43.0

