Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335929;
	b=WMdccyTvpdmlPbn/OI4WN5O7VR5QAbo7WrDFsZxZzApATBovjtGlRLgWRIWqBYjv3Tlf
	 Urrna4Rfh+7+lSHKeXfiIlLwFxApokdNZ7oiD0h4x1u9AuELU61I8j+FjVYlMXyyVr7u0
	 5bujPsB7PXATN2GS/ovAuxm1yYH78VtzB+TDIB3jGqNvCjTd3Hag35gl/F7YA1yoPuQqc
	 losyxWAdwabE7AankOCd7hgYRT41DU90Nhm82djmOGegtedl7kOn4B7NxhLizlolAcr7q
	 XX330Pgzdf9VksIajzIgEQkukmjpXfWvC1SnugAQ9Wb1//GY8SV7ArnExn2ttoOK+gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9C8VrUUMQ052sNkqdlVlnIUSUE4gVO3LQI5iweO8Mtc=;
	b=EUve6bmPSS3tE6gIbNRqE5QH9HBfv7oDNcTLywJUOkZaO8kPzFH4i5eb/8fLP4gsyhNl
	 ezj+AfSIb0whx9oGjtd8rdtT/zCAVih6QxR0hErpMzcSy4fXMwzDCAFroLBasASagrUti
	 Q8ryT2WeTgTRB1sn4KC1QyuiJ3GU+kttnBtuF8WgekQvqugdZBwDsytB4zNY/LWLT95nS
	 GXEVJ9q+PGHEM8e5JkxRTuEU5f9LEsPlxb6T/le/NLEkN300yQYGKBsodI05aE4yoBSht
	 CQoiFEv1dK/kSrD5PPinnVHVWBpRXOEhLsncdL7f34bh9PIFBsDhN8os78AJQQrgkug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xqi9qO2g;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB54606A320
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 08:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADB54606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xqi9qO2g
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so2738157a12.1
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 00:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335927; x=1795940727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9C8VrUUMQ052sNkqdlVlnIUSUE4gVO3LQI5iweO8Mtc=;
        b=Xqi9qO2gn9gR0YkDVq1lPCaXmr3v6MxF8ivf8UKDfRYNlLV7b9pQFoW7W2T9UBwyG8
         6q6UD0I3kucveel+jM0PgeXwfik5bmxlnxLoJhuphijYs6mZH3RmwuzL4xopRsbXvo49
         oCKEoxA+FUsACKuGNDZ+gjZIB+gAf68y445IGcbsxn3sMNqsvu8RMxF7UNZCIGhArRIr
         GLjfu/CCnVz82xUcaWCEwuF/wfz2fcRpkocktfyUIqNHGMBuJKE6sXlfLpTV/wl5wg49
         fnW3Sf5EBQSaXEsuZwmSxKik8JW6zyjM3mM7lLiYV1yaDjy++010wCG7EyAuS3EJYV3M
         nqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335927; x=1795940727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9C8VrUUMQ052sNkqdlVlnIUSUE4gVO3LQI5iweO8Mtc=;
        b=t8dIypYaKd3EqXGtcaLhyOLCcJpMj0tiXYMFPA3oyciXyqTLoXszJ4tE5nmvII3ybC
         mw/Dqj58M/2ppZJwhREC81S/hf9qozasLoMo2g9H+OoS9AXP5f/Yk3+DZsly2e9itvKj
         O1qYIqKijWlkU+6PEZVpALIQ+7b4+fcfLWJYux3/etoZyJYDtcGs3QyfTe8lFvh7NMhX
         oOB1gj69aT/WETsq7dVI/oavG/xUhdku85F4DBh0wvoQZWsx5a+GhJA2LcUBBwGhHA8d
         eiLpgB9FXP3sdSYa05/I2P5L+euYUk7dMGjx3XTLOmzA+inrSWBciVxe3Je58ABj5maQ
         vW2w==
X-Gm-Message-State: APuU4Z9JFUAiNb7INIR5Ax/4UgCj3lMg8CPYtREOD8NAbOi3gTY0/bOn
	oz+i6GHbmi5dWoRx6PJxB/oDdc+XLn25VdPPRJr/ECR2E/uXrbRrHPBo
X-Gm-Gg: AZFdTZfeNPeI9vHfRSNB0Tzoto+uhK5YDINmq/3lEzS8nuXQmS8I/5g8/NUlSqDpVjr
	a7ytu1KhH89Z5saF4E65MTgZ+/RnPVHVl3Ccxg/AbTP3JdJRgALmukfMqj5jFuL+l51ayBi/ihH
	RM8X05RXnvU5Vi8C3W0GM+MevvEBJvmUxzNaKyJQdGSzjrBff/EqRBIe03kpN/KaF3vA/0nkbXy
	Terc6B/YeXjYzSLYdJp0s0bod2fJRUYctPWiu2dYhyAte3K2j/Nmc/ZS8WMFuMB6pMIRgPPRE+Z
	S4AH9YZ1rF1JcMcePC9aYI+kk94V+huAwtw6VHFcDOMBz4/IRE0wtth4HJ9mjFE6tS+aN17NS6X
	JIhW163OpzaOE7DN5JX/d/mxxqSEEvCLHOB4unerEMFzYBBNNuy1crgux+FolxFt0a4Au+elUKN
	9EbgoeH8TbROUbRKiePlnwKiqT28121Uws2FFV2FznMY+oSnHj1wm1rjMNwerO6mSMDP3jbjQFn
	LebqQeLlBIOfKynBD4XZo4+ra564yzfMYQ+i+crhV1/m9p5PA0hHkbMrsJYfF0AhjMUx/Dt9l8l
	9SOgtDaE/XToUpQILpynZCRzkGpRwvwuNkG04nAFmsI3zpH/TEUdGJMvDCyPLK8wWVwKLyxFK3E
	Pi6cpunb7xxA=
X-Received: by 2002:a05:6402:1cc9:b0:6ba:a614:2fa6 with SMTP id 4fb4d7f45d1cf-6baa6145b71mr370609a12.43.1795335926933;
        Sun, 22 Nov 2026 00:25:26 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba6f8fa5b9sm2116187a12.37.2026.11.22.00.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:25:25 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] usb: misc: onboard_usb_dev: Add Chicony USB2.0 HD UVC WebCam support
Date: Sun, 22 Nov 2026 10:25:11 +0200
Message-ID: <20261122082512.64304-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122082512.64304-1-clamor95@gmail.com>
References: <20261122082512.64304-1-clamor95@gmail.com>
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

The Chicony USB2.0 HD UVC WebCam is built in Asus Portable AiO P1801-T and
attached on the USB controller via integrated Genesys Logic 4-port USB2.0
Hub. Add the support for this device for the power supply and reset.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 2 ++
 drivers/usb/misc/onboard_usb_dev.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 0606d405c16f1..f846d7fe331ea 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -565,6 +565,7 @@ static struct platform_driver onboard_dev_driver = {
 /************************** USB driver **************************/
 
 #define VENDOR_ID_BISON		0x5986
+#define VENDOR_ID_CHICONY	0x04f2
 #define VENDOR_ID_CORECHIPS	0x3431
 #define VENDOR_ID_CYPRESS	0x04b4
 #define VENDOR_ID_GENESYS	0x05e3
@@ -651,6 +652,7 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 
 static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_BISON, 0x1198) }, /* Bison Electronics Inc. Integrated Camera */
+	{ USB_DEVICE(VENDOR_ID_CHICONY, 0x0b354) }, /* Chicony USB2.0 HD UVC WebCam */
 	{ USB_DEVICE(VENDOR_ID_CORECHIPS, 0x6241) }, /* SL6341 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_CORECHIPS, 0x6341) }, /* SL6341 3.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6500) }, /* CYUSB330x 3.0 HUB */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 3523f8f8a1496..10f010fb57c07 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -150,6 +150,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb4b4,6504", .data = &cypress_hx3_data, },
 	{ .compatible = "usb4b4,6506", .data = &cypress_hx3_data, },
 	{ .compatible = "usb4b4,6570", .data = &microchip_usb424_data, },
+	{ .compatible = "usb4f2,b354", .data = &bison_intcamera_data, },
 	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
 	{ .compatible = "usb5e3,610", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,620", .data = &genesys_gl852g_data, },
-- 
2.53.0

