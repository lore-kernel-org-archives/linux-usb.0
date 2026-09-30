Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E90437C0FE
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 09:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761239; cv=pass; b=O9UZrXJ2yC1TRyc4r9ELBFtD3MhuAKnrAOdQqR1hOHf21oL9nwUxdHl2+fhYCXYfKLW0VrF9CMNn7qM4HnuLSK8pFPwjVdzu294ZIPCtUrQopCbqD5VzbWZkNhC7t/jBcabNA0iK4b67D7JXvaT/cbNhepXI2gOsVWxMeJjMuss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761239; c=relaxed/simple;
	bh=wFuX1r4Y7eDqGdmym8I60OlUlx3AqSTMX8iIAdniMwk=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=QHz9xKqJoBt3PGsH1i/mjCCZBnOcxJrCl+uEiFiaJFqAEvpfoTF+bdEz0BL5vaHs8rLwnJFNyXtpdy2Jja9qlJ+jXIAXCLNVJsyP6aq+y0O1yqlAITCAsrokiDjFgPZrhIt3NS0BEqrVlCNqzSrMBJS9dU387pu0esEWVAVwcqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSzG1He0; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSzG1He0"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c83397eeeeso3538258e0c.2
        for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 02:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790761236; cv=none;
        d=google.com; s=arc-20260327;
        b=OXK8T7ymCHQhGKVRXxFQe0PV4i3EB2oGiQTbWfPTaSMVFnjjlhx8bXkfbSa69rOuQ5
         mXwmK0/jBGR5yNNSz3ttVtnICZH7X87ye4wPT78dVvqLmXojZYwdVO2b9d3sQrVWnax1
         Gw2EJVR4G5ct7tnVCF76zYzDJrs/mUK6xn8wV33GB5nXRu1jucFkTAS4bQSpEtGdFyGc
         vr2WchmIHXP8bzQ5NTZjLmCp55wLCd0cjcsbavvIMCH+R3OInV07Bd776vj8tODzrwvM
         WD/sZ6DMkAgZh5Saoz5LUYg/3GXVEU0CNK6Lprt8MMC5LHJhXVCsJtDEooE2XB5MeLRX
         9TyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=CUX1jkSNU4dlWBksEEfOjIcGTWWCdgISW78UHeYYIhM=;
        fh=GBf1QxRa5zW3wOZpWdkpEPEYiH0rjJSdZZuNHM7Tnts=;
        b=PUCNCh6UwDJRdK1TblRBXRqlVG0RRNygDzxwssOGeH8WlE9vSb2WVw+po6A4gPd/7s
         SRasICDm6EgrO+HnFMQBV8HOqci0Bi04oNpoE+p+oJYZ5bqH1BxVFoBcacYPTcGlRVyG
         yt5O+DZAdxUFPQXMQfwqovvvM1+Ee8DeQaglicAnar4TjMLcSW2hShIH81lxGPGaCKw4
         0keoGuZ3aBWdo2DZUcX/wp7Xm3TgTr8IHb3qSFy2qhqs3WXybgZit+iz3+ij5cpexKxV
         wLLXR8+IPbCh39sCUnSl/N8y2CnjSE02Rcr1riTVpaj6ssuf8J/GmadphzBPNmF6O6nq
         olNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790761236; x=1791366036; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUX1jkSNU4dlWBksEEfOjIcGTWWCdgISW78UHeYYIhM=;
        b=MSzG1He0jMY7fTHn6rOXuCgCFGongt3w3MMwXkE5UlTzYxp7ZJ82+qakiTXc8TRlzn
         onyEzrwvGPwmOGxFV07Rf24X5r1W7/DRknCmraK2b/L++HAmZy3hk+Ri0ATT3oE2w8eK
         8dkTTX8qtvRtxKD9+UMN7dXQBPMvDOilPqm3BFb65tWvP6mJ+baMyWTe6v7+fFdgHimy
         K9ooo1r0LtBGkw0xXFqY0Nbq5xC5zSwY6UzQqazGEdA6Jm19UPCyj+bh5SPg3LczNivz
         sL5oQKmofIIM7aKWGUBiMYRnq17nTmxH75ybhT+m8TmaKf23Z/xswDYrf7zggTeN5jFD
         d9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761236; x=1791366036;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CUX1jkSNU4dlWBksEEfOjIcGTWWCdgISW78UHeYYIhM=;
        b=l5piXB1SLX2KWqWuwHK52AzWJQSCrtfBKARWtqlKSbTq2dLEfWGGoiAxMlRN7bxnMU
         ZsA+u2qlqacv/8+ROjeTQ866JUjlf/OZwi5yvZt8d7wE0urTTRNIKyfBRGDhYrN6C8hF
         Rj0ncAx1S2xMA51K8h1yAmXD05u72v6e3QHzq3KT22J68CqaEQ7djKfMuK4wlJUAcuNo
         urLmfrmYt2ls9pakX1TuXTJPu45yKKliEeoOhzUSr3Ci7rdGkkRbCXa2hYV0huNLhSKC
         1Arp2dqifIPQ6cYf/j4+6H0AZxCQdszlrnhXpLKxs9X6SdCBwPFXBzCAg1txHgBuyJpG
         Ukeg==
X-Forwarded-Encrypted: i=1; AKwUvBzMOZsPY9nLMlWrpJyepTNLLTbT3hPU85JgNq7Fernq/UNPH0chEmanCXySSSiPrkhp69Mt64yObnA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL0TwmdfR2M5iiQlSYPt7zD3kH20yhd24nR42uD2Xm6h5x2y2i
	GSZBBvzHJ1UxlJNOYMw59+aqQneMeu8tyktEYGsCx21VI8mH/LQt2lYWa4IJJ4mx6fZ9TrmCtNl
	HRu0w5hn9oOE7qHTDrwBPdhJo2Et3LIiboADs
X-Gm-Gg: AYBFou2P0+nBd2oiZerkb9fAI3W7Bf9yH6cszryvVKpf2jddlejYSMFtSuqqzt8MDvh
	gr3fMKR68V3Oo9evD5WSC8N8enPxkz8P+iOyZBH4HY1gg5nYSK23P2OVb+RshIbBEaxbeAPha5L
	e65vpad9mDsZg746AV+nI1vzuVS1AE8dtWOhmJGa14YX9XDAG5w+jfmNxtP2DIlcVbsFaWZKWHH
	R63JvWZXIJFCxygymWV8qAG4Zfhn5gokwZRoXU+j7PKkmRuQBE1dmb1FWpryDlTJaIIHPNfR7T7
	xEItG2Ec8xk0j+ZdUU7qDme6RkowJEhlegCMDXAyviVT5nOskWEQ0qivrdf9ZAqUnulgKVZY34/
	Al1fmuP7za03CjexUQDvxbB4J9jko6o0ftApwo63zB5Ya5A7x1//PhQs/2FL73BgR6z4dudI=
X-Received: by 2002:a05:6122:1998:b0:5c6:8480:35c8 with SMTP id
 71dfb90a1353d-5d67b7552b7mr142766e0c.8.1790761236462; Wed, 30 Sep 2026
 02:40:36 -0700 (PDT)
Received: from 543150747168 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 30 Sep 2026 02:40:34 -0700
Received: from 543150747168 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 30 Sep 2026 02:40:34 -0700
From: David Pieters <davidpieters1978@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 02:40:34 -0700
X-Gm-Features: AclHuK_GQfg0iT4xKk2tKp-2KAyN4MTRhJfMh3s8BkX8U4dZY7fQFIYirkLp0yE
Message-ID: <CAJ3h-bO00mynmttgf3UxVtqM=S8Q=Tf56Ts8SEqmPEM9dc4czg@mail.gmail.com>
Subject: [PATCH] USB: quirks: add USB_QUIRK_NO_LPM for ELECOM DEFT Pro TrackBall
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The 2.4GHz wireless USB receiver of the ELECOM DEFT Pro TrackBall
(056e:0132) and its wired counterpart (056e:0131) fail to handle USB
Link Power Management (LPM / USB 2.0 L1 sleep states) during initial
enumeration on modern USB host controllers. When LPM negotiation occurs
at boot, the device stalls and fails to register any input events until
it is physically unplugged and replugged.

Applying USB_QUIRK_NO_LPM prevents LPM negotiation and allows the device
to initialize properly at system boot.

Signed-off-by: David Pieters <davidpieters1978@gmail.com>
---
 drivers/usb/core/quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 1234567..89abcdef 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -350,6 +350,10 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Corsair Strafe RGB */
 	{ USB_DEVICE(0x1b1c, 0x1b20), .driver_info = USB_QUIRK_DELAY_INIT },

+	/* ELECOM DEFT Pro TrackBall (fails on USB Link Power Management) */
+	{ USB_DEVICE(0x056e, 0x0131), .driver_info = USB_QUIRK_NO_LPM },
+	{ USB_DEVICE(0x056e, 0x0132), .driver_info = USB_QUIRK_NO_LPM },
+
 	{ }  /* terminating entry must be last */
 };

-- 
2.43.0
