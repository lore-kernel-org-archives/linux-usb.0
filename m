Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792649547;
	b=EfIHSdjUwmOqTd3Ch5v31b3WjdwsqONrwiLwwfQXh+GWccE5yObUuY1wsaDccDstqtd7
	 ZPKN+PnirR2f++qhPtAxilQ7FNFAIlRX1UDM2j/TfBm2AeyhJkffoV6EqicAJt2KxmFxP
	 eAyn+Fg8J7MNMUtq2AfXANlVYLMYEX5rCuvaJOqaenAelbh8CVCfFcAPdx6iy29QNaVfS
	 KDFZ9UWFYgJvQhSQ3eqHL2Th0cMGwJCGKMcsAo9RRbo2IvcF5+y+GAydQDl+6W0g4b0Ak
	 tMqVJFj2T3r+af6jMYyVnTycIqefxkOrA8TEsPH6xtk2wl43fzAENAjo3gkgeV6a30g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5pnnS+Y/wXmkMAXZOCcNK/efgofVbcU1KgsjqBCjmI0=;
	b=TmGU+regVpxkhM3b53mIkyv0ocZk2Kv+HkPmNvDySy3ouoywcF1Nyvhah1CZZFaGfnkD
	 4g+03+wTF17WIsNW9VDpvCZC9Mw8GYuJkS8f0fAorQw35s08niC6U52uS1vQFr1pWHJt8
	 v2sYB9BLLytMX2wW6ePyR3M9T8WThr+SABTzMnn80/nnm/RZlKTvXP7cZU9tsLwmJQYGX
	 cyAuXYJ4r3QwdUGzrnwIwDCt3PnW0wY60heZkJbcUYF7p2tCXMz6sB3Wyq+Mlrw5o+6Y+
	 zKa3fZNTDlUMY01yxfO+zvBMCkVr+m85Sy//xocDRBsUnwPIv5DBD/YPau865UBT5Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=WEjfd2nM;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9333C606A31D
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 06:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9333C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=WEjfd2nM
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e0d1da913so394470f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 23:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1792649545; x=1793254345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5pnnS+Y/wXmkMAXZOCcNK/efgofVbcU1KgsjqBCjmI0=;
        b=WEjfd2nMGBudUT3dmNXOoIRpZoXAimNjhvXn4cwjyjKfQNR2yXufkltVvyF0wnboaJ
         issnGpKDJ6HzdZfclQY2GqRp4/gRtewob7HY7mmKOOIbbLyktLG8FjeTyc65bY6Lf2o1
         qoIIUqBIrrBvhaPU9KS2YamLkmLG621IvR0MJevh+Wowdp/L7nD5TGSi3ytxY0P9AN8l
         T1covCMQdXiGv6JhX8yEV35s2kVBaKF+m+g/B7FD9l7+F/1LqlQXNOUpCMdi1ttyL3dt
         /AM6S4pqyKGh1dzaoMSWU+/eq+B6uz2DkS5qeRtJ2hefWCGrsuh428qXO8EL+nNCtYKA
         cd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792649545; x=1793254345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pnnS+Y/wXmkMAXZOCcNK/efgofVbcU1KgsjqBCjmI0=;
        b=m/7xSz/hnQYC/sEICRasetyzJI5VJDMj9Jzd/qyM802e354F244Hxmu9tVC9Sfo6LI
         JhFE5u/9O94jVgg7NacyLurWU0KSO5UnzPdqHTu9MNTRRYK7lhqPlBYjxKiVcFpcTocc
         mFB7bEaIsEPc+L7SDLOIwh/FWIkhPfbcAmD3tdam64bkKfQ6Ixzj6xskbenBPBISK7jq
         OEZQ3f/WINv+N9jADMKPdw3bYJLYHs4TQu7IMrBz4BgqomQg6zkvn5atSi2VgqtuVI5n
         tLeeRB+5e0y/AcCxq3uXZpaU34vrVf1Pa7Baj5Mu/yHaBMnHi8ovC0mmMQJEnXTlvqqy
         MngQ==
X-Gm-Message-State: AFq9FYJIv+pcmZtKpkQDgjiSL1d42lFqpDFGwXCQTBUfmmB3RosevzNc
	QI4t856GB8om9GuvGx9ODa0frWSB5Sazd4cfWMlq/0TQ3vuG7VX03GaE1G+/8KgXI84=
X-Gm-Gg: AYBFou2yOrEsbicuyOONjRQkzPaVL47TXKi16GvPizNz17/SJrgUUzzeFFxNW6c/0CW
	PTZgDhQAyN0IOyFPhiPVQ9QZmiHInmyCZC5zBMBvT3S+v79Bayj2zuVUbuktbhiOkOemJJynLLk
	O/In48ktzPQWDzalLOA60VS0Ry1IBV36SwsVhovY6DaE6rL3LXwY3vCniYh1E837Z0keOAQQuKI
	Y/Jw7Cs+Ma4e842sc2TqPQ3tzJyzjWCElDZ75pmsL5wkV+48i6pTgKp0caYpAqvwDoiO2DQIsw8
	u2bP+i4d0xcc11Y+PXL6nPTIuRWp4c47yH1tMcErLDqymSPmm8ovo9uCcZz0bnpvZxgH94/EW7h
	lNjLWPCUuiDuiv1sAf1/O9Al6cA1w5DbcGugzla35gqSbPdqlj/I/t5OBlgEHKtP8eBDQWokIoF
	VAs9TwUE/cO/puws9ngkb22uAoENIbPvhehHYS5oULzIS4YCrMLl03qnRj9e+LAd+xsOh1Hads5
	G5jEOF4/GAqfCKHcySYVSt5d2KGKHdpg1K72buk/JpyQDYe7wER6vxvtoXz7npmaUlU1XdYzwPL
	sw==
X-Received: by 2002:a05:6000:29d3:b0:48e:adc:b97d with SMTP id ffacd0b85a97d-48e2d142df6mr1820877f8f.8.1792649544694;
        Wed, 21 Oct 2026 23:12:24 -0700 (PDT)
Received: from tuxedo-os.fritz.box ([2a02:8071:b680:2840:9131:192a:9b8d:6849])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25827087sm10064063f8f.21.2026.10.21.23.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:12:24 -0700 (PDT)
From: Danny Zimmer <dzimmer50@googlemail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: quirks: add DEVICE_QUALIFIER quirk for Mobapad C2 Lite gamepad
Date: Thu, 22 Oct 2026 08:12:14 +0200
Message-ID: <20261022061214.3497578-1-dzimmer50@googlemail.com>
X-Mailer: git-send-email 2.43.0
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

The Mobapad C2 Lite gamepad in its "Xbox 360 Controller for Windows" mode
(USB ID 2345:e06e) fails to enumerate on Linux and enters an endless
connect/reset loop. A USB trace shows the device returns its device
descriptor, but then stalls the Device_Qualifier request and stops
answering any further control transfers, so the host resets it and the
cycle repeats indefinitely.

The device works on Windows, which does not issue a Device_Qualifier
request. Setting USB_QUIRK_DEVICE_QUALIFIER so the host skips that request
lets the device enumerate normally; the configuration descriptor is then
read at its usual size without problems and the controller binds as an
xpad gamepad.

Tested on two hosts (x86_64/xhci and Raspberry Pi 3B/dwc_otg).

Signed-off-by: Danny Zimmer <dzimmer50@googlemail.com>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index b5b577f..06d15ae 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -586,6 +586,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* VIA Labs, Inc. USB2.0 Hub */
 	{ USB_DEVICE(0x2109, 0x2817), .driver_info = USB_QUIRK_NO_LPM },
 
+	/* Mobapad C2 Lite gamepad - stalls on Device_Qualifier request */
+	{ USB_DEVICE(0x2345, 0xe06e), .driver_info = USB_QUIRK_DEVICE_QUALIFIER },
+
 	/* Raydium Touchscreen */
 	{ USB_DEVICE(0x2386, 0x3114), .driver_info = USB_QUIRK_NO_LPM },
 
-- 
2.43.0

