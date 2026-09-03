Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B32B38332F
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 04:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788409511; cv=none; b=n9c9W5sTadQsOPxcFxju3UiVxQlJjSVLfN+fRGTnUOqqgsNoF4Ugid4RZCMtrfDlvHzGHl5e5WPN6A29arSNhCJDLHZnfKX6pG1vv2AevwdEJ/jfTf6mQoordv7o+mtR7QR3oOdF6rzz7KjiNs6xUti6sewbBS5wwCrP860zuJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788409511; c=relaxed/simple;
	bh=ZFx3Q9CVV7DenPP95PrnXW2mBbZp6+X+qUC2c0AEvuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WKyt7v2/3G3wTvBrqQrpUifYyiulLTwkVuJznh/eqA7OsXfXozKtleqOuMLBIELCICHNH/N/UForb1isAFc4juvB6xkCchtFrgvNunnLbEpRbyLZO8kXj1dTlA9YJ2OfdaqQyuGnrAM+KyIDfGkmhbbrCEcs8aCe6Gej77a0VXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGiv2+J2; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGiv2+J2"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-977ba4d3b49so472952241.1
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 21:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788409506; x=1789014306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlvKvqaox0NfebLUVzqa94KBTGlj+HyEivmqV8xa538=;
        b=CGiv2+J2ds8eE3Fqt3zG+/vRNNp/a5A9D/qTfBLWBrfHM17TuPmjWp94fombTzNQfY
         rAA+ffSGXB8xCwH6H2zr4qxlfZ8nh894DP5zyc+9wNysuNMC6wuuqp76udu0bUpfd9Wu
         L2Pko2Z1dOqpWgFy3x5Vlmyv4ftibEWMP46jrvZZItwAO7xBkzJ/HKCkiXtTVHoOLmVi
         zMCdqvydUVRD6rjytC0oqaLT0wDJGG8OlH6A2QSiksIjHnOLG4e4s43j1y/b1cPmFb4Y
         TkqxVqS219OMtV7EqLBhS5T7uR1ARojOKzvofNpuPFwSi0BWvy6HUb+ExL1H1HDs4xNH
         22Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788409506; x=1789014306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlvKvqaox0NfebLUVzqa94KBTGlj+HyEivmqV8xa538=;
        b=UKIGRQERTdL7t/C3Iy7HGr5jmUebl5eZk7j8D2qPOXi3ARI4XUTxH4sca/Wgo1gMja
         UW3lFpoVWclQM1+zr0ss/M1M+VOEb0kAYeBdCKGHUJjpDjTZ6EQw3FgEqVwMB2SyXuA5
         fwp6VSoWcBDXEehe69hdaMTii5nJ9uevlg2yTY/1W+Ijl/b8wHY/rgqCt7hjO3sXh0uP
         4jGx4g4RCEtdSoXiW3J+9PBfq/RwW0tVRsbSGoH8sGlk36CsqbocSS5Bs4KzNck+2E/a
         jrCWKUKBCeQx24s6emDKJA857iUKPSfRZ6sWTKv6q7bFZIgVQng2HbzvvZyj3hbj9eMS
         LgSA==
X-Forwarded-Encrypted: i=1; AKwUvBzDx+oJne7DC4rWnW4+XiukaU9ETDZHAG7IND1N26uxe4q65SRJe1AoscanVCGMhI3f/NabQfigHaY=@vger.kernel.org
X-Gm-Message-State: AFuF++lS3IMQpH/nNjKz1oFXONNdaeIWwlJaPBAbiRH4qQ7V2yrYBP+X
	lHX2qTmA5SZYd45jx1f4utz42IU0hDHp54DBHMlcz853jUNrLVodr6Uy
X-Gm-Gg: AYBFou2Ak3W1+RWRFJgn4pbPfzSqRttX7qn+YgsEqjXz3yDtKFViLsEXBmEY9sFmvK+
	xI2BlbwP8b7leZ1Ly+tsT1cqX7AIanuTY2zlxZrF2Tvkh5QMeFdonsVh6zmWjnU0/Z0Mrhz7DDA
	6LE1hSB2xf0yhTNrER2zJfa4LWwWRN6abTdfZn4hPghyIb5o3EALO1MhHwh7QAfae1lGoqUacao
	eUw4pNE144PAgIlHuOHLbIjhbcPmfqbiWpofOKtrcvEO6xU4zcEaRQElb+3rVVCrvKHN34jBHgw
	O9XPFnafkcQVDChW5s0HBV0+viwuc60H322Gb/YeA4fWP4eC4soTojtYlbyYkzFE6rppnbsoIa/
	4+dRbqRF4raopktmBCDOl3n2Y+hStFngivwGgJC4ItHJsp5la180SQRdvFbM3u10QsqHjfa70/b
	cWriHij/YaGthFAj0fR78uvKtn3VKDzaEnVFIa+5VfoKdQBMj9lNRGJfY3cmGp6BM=
X-Received: by 2002:a05:6102:291f:b0:786:cdba:8f6d with SMTP id ada2fe7eead31-78a2edc5af5mr988472137.1.1788409505843;
        Wed, 02 Sep 2026 21:25:05 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1a4b1143sm3857241137.7.2026.09.02.21.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:25:05 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	jirislaby@kernel.org,
	linux-usb@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>,
	syzbot+473d7477c523b41d4046@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] USB: serial: fix break_ctl() NULL-pointer dereference
Date: Thu,  3 Sep 2026 00:24:28 -0400
Message-ID: <20260903042429.130320-2-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260903042429.130320-1-adrianox@gmail.com>
References: <20260903042429.130320-1-adrianox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't call into the driver after disconnect, just like serial_write()
already does.

Fixes: 9e98966c7bb9 ("tty: rework break handling")
Reported-by: syzbot+473d7477c523b41d4046@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=473d7477c523b41d4046
Tested-by: syzbot+473d7477c523b41d4046@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 drivers/usb/serial/usb-serial.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
index 17edc057a311..5f42bfe39212 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -532,6 +532,9 @@ static int serial_break(struct tty_struct *tty, int break_state)
 {
 	struct usb_serial_port *port = tty->driver_data;
 
+	if (port->serial->dev->state == USB_STATE_NOTATTACHED)
+		return -ENODEV;
+
 	dev_dbg(&port->dev, "%s\n", __func__);
 
 	if (port->serial->type->break_ctl)
-- 
2.51.0

