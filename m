Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429798;
	b=fzqj4PJ15EZY7w9mFgOQUYgYXYNePP6DCHSEI7Po3Z9MwnK/D+F4fySLEv042DdSGURI
	 w6n1kcgwylTrP0bOoGvD+vdaxer6rhyArPNE48XNgkwT6f5Hx+TxwMfbB+rDwoFvoJpj8
	 enRuVJWFLaMpPW19daYMUFAeaETdYI7fh6CHj8Dpzj02R+CN/QzlyTbhzfCHif7nO/Dam
	 8DeaFhDNArmNIsKynnFtfN/9ZJP5pdq3BlyYiU3e/1tHZDxzOgwhLk/4j1Xabxz+L8fRl
	 V2yZ7Pvk2ymWfBgd5fkmNkoUuBvPTksmzDz171EbOMbN4YwJQPMT1aAlrLPWFGtssLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=iOgtqJN/g8S5vmccnJUO+N9pGJMh8XJl/8mA5i+Ub84=;
	b=3xLlKuV6oeZul6NfENRmAEsoenecOx3oURtSMc3ipZytv0S+EBS96DP+RnVC3py/HnIc
	 j7nA9E5QgR8ptiPtDUD9qfSHgPfVk9cpfG528tWCAj4i4FOBzsKNmSrfuOTd2LD8EObju
	 FLUNQF+c/kBJs5+ZVWuK6bmr1IB02H5ImNRJzBb1QBkDpJyZU1SdplZQvH/lPNhkqz8ZR
	 nHE31gV3HAMKdCTjia8zKDxQYl8QUENTbcoy1RYqudAWCeXbTn5nqvxtfGyyR5iLbqrXb
	 yXnHdeJVAEQ7SA4sEEpU1iTKiZ7/ad1KQtJJUI82zIPwnulh95wqBRKIteIyNVQnLYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JP154tCK;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72938606A32E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72938606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JP154tCK
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-385d8a00598so4244325eec.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 02:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795429796; x=1796034596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOgtqJN/g8S5vmccnJUO+N9pGJMh8XJl/8mA5i+Ub84=;
        b=JP154tCKzfKSkEgXpH3CjD53LbF3lAsxfXxZssihMUogBuTWs4Xi7uZzLfDTzrYkLd
         zEA2V/qJlrdt0eyaAXP04CbCwIDEObVDk3/F2JxU7rZ9aLERt8OT4Rd9ETSTCSh3xgmk
         n76wizVqQtCsfX0geLPuB1hRrrytShyFhkWh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429796; x=1796034596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOgtqJN/g8S5vmccnJUO+N9pGJMh8XJl/8mA5i+Ub84=;
        b=l0Uwe4c9kv8hZei6zf295ifAy/GvUxcSbbR859QOytSoxMp+kWO8uDUsyF37GAcud7
         av6pGFeSVHkqbzHasx6biRbnxkt2t4GscxEyj68lURNGtMNeQ4Hu2wKe25PKnghg04Ep
         N4xFm9EnfbnL4pZIvuT5YD75eP86dsOZTLFmwMAxu1OD1Kt+0MiiIajnK6GZr69hKq7O
         fHylbUU60J/1L8gC4m/7q+VuZU0Wm6DbIaZZHUlXMdN8o42RwykUUAmGVS8zg2tsfYsf
         zcjj+olUo3i2EIuz9mPfNcbSkzBbX8HGXNz+4r397186f5dvTtZpr14433tDyLau+OdJ
         RNOg==
X-Gm-Message-State: APuU4Z8txJaTo5cdY3aEjRHBf9rbx2bgvyaC4qudFR8BK2fVwRAqUoV6
	ueFY0Lu7WzGWfFoDtDApagxJ2kVNHAyjzx0nHPaLjyGpR+loSLUnKRBiRkTh2/Go7g==
X-Gm-Gg: AZFdTZdrhtd2Ht5H5fg0I8hKwfV8s+cuwuZ/9fziJe1W9ZjVwnJBq5ppIZxR2mOt6nY
	YVmF+e9Zx4SZojULPAitqNmZ58Dxz/fF/RbcQ35fZnoECY1cMmQGTTfpggA41dFCheU/UJYbp4K
	704mwdHdgeqDZFlJHwPibZmUn8jnR4EwggNEjPS+YZFKzLF6MrM2tdauftgQ+qusuRo2X9/iZ75
	knal5bhkTOJPeiLLwxxiDaGyhimmKgwDcnJxFiHR5jeGQ4fn1kMiCERoXl1dgzp1vg6fk6k2sos
	uVhKSHsUmLs54RLr1OHVDTMNICtv8exrw/M02Z2mXkseqOYJVqNm7c9zfPEVKkPfdMWrx0HJYy7
	BQOxtc1Blh1TZm51/OWUNbRWFgagUtZX9CdH9TymX/y4aeKzHBoJBIiAUc2R1y8DcjrqpbB1/4+
	El4+nNu6o6urfO2752qMOEHxsU4QFtienEKKx5UMcUTrn0oKr0XeHxfzrgPFhJToXJfKCNSiM5Z
	M5gSUM3Byp6ENRwSXIOkEQbNxO2Fp4Himi+LtCHsHlTLXZsUAZRgGOT0GjjRQe1QwTgqZD/wq0a
	W2Rwl/o1d+ubyQCgEJCHN6rKS2ssGVMeFaL2fJwFl+BFUuG/q+ERLmyledrbITxI0k5Ty2K9wr5
	sew==
X-Received: by 2002:a05:7300:a9c:b0:386:a8a1:9855 with SMTP id 5a478bee46e88-386a8a1ade6mr4149923eec.1.1795429796409;
        Mon, 23 Nov 2026 02:29:56 -0800 (PST)
Received: from localhost (224.57.158.34.bc.googleusercontent.com. [34.158.57.224])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-386aa203267sm11296660eec.0.2026.11.23.02.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:29:56 -0800 (PST)
From: Shiva kumar Martalu Gachanti <shivakumarmar@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@google.com>,
	Shiva kumar Martalu Gachanti <shivakumarmar@chromium.org>
Subject: [PATCH v1 1/1] usb: core: quirks: add quirks for Kinesis Advantage keyboard and hub
Date: Mon, 23 Nov 2026 10:29:50 +0000
Message-ID: <20261123102950.934878-1-shivakumarmar@chromium.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
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

The Kinesis Advantage keyboard (05f3:0007) and its integrated USB hub
(05f3:0081) fail to re-enumerate after suspend/resume or warm reboot
when VBUS remains supplied, reporting "hub_ext_port_status failed
(err = 0)" until physically replugged.

Add USB_QUIRK_DISCONNECT_SUSPEND so the devices disconnect on suspend
and re-enumerate cleanly on resume, along with USB_QUIRK_DELAY_CTRL_MSG
to avoid control transfer failures during re-initialization.

Signed-off-by: Shiva kumar Martalu Gachanti <shivakumarmar@chromium.org>
---
 drivers/usb/core/quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index a4bcbe9c913cf..d8518fb3517e4 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -350,6 +350,15 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Genesys Logic hub, internally used by Moshi USB to Ethernet Adapter */
 	{ USB_DEVICE(0x05e3, 0x0616), .driver_info = USB_QUIRK_NO_LPM },
 
+	/* Kinesis Advantage keyboard */
+	{ USB_DEVICE(0x05f3, 0x0007), .driver_info =
+			USB_QUIRK_DISCONNECT_SUSPEND |
+			USB_QUIRK_DELAY_CTRL_MSG },
+	/* Kinesis Advantage keyboard integrated hub */
+	{ USB_DEVICE(0x05f3, 0x0081), .driver_info =
+			USB_QUIRK_DISCONNECT_SUSPEND |
+			USB_QUIRK_DELAY_CTRL_MSG },
+
 	/* Avision AV600U */
 	{ USB_DEVICE(0x0638, 0x0a13), .driver_info =
 	  USB_QUIRK_STRING_FETCH_255 },
-- 
2.56.1.750.gf70dc682cf-goog

