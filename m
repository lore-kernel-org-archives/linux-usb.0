Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBE548874E
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 18:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832449; cv=none; b=TCHfrtohq1JkDJKCFeLXdV+UuJtrs5WE73F0tSwTXdFfEtw0vVv+8xLqL2UHBal+b3L0/2NNNZjppZZfsceSPRA6BO9Ne6qDQJoLR9udtcPpvQSBUzaiIALoC/IAAQO3LBGx6+ugG2qApajFply/shXKn6uCE8jZzqqmGrJ8Vu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832449; c=relaxed/simple;
	bh=uYqyINOSIs4ZwGOEvHHuixscb0ZcxiQRCToDw0B3yuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1P6KDgOERzmzaBmSftZebgnrd9y+CjULsnMSoHhiaI1LHOJdY6dHevPW6NQ8fxWxfWG8h8mPuuE7IjprrLnVSHo0pJuDx8+Rg2UU7Arl2ltj9qmNl93Edtb+dVLazhJdEqPgvg/kvMrhsifVu6+pLoFom3vzSh/dk98Jb7SHPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqweemoK; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqweemoK"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caea3f742bso13326485ad.0
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 11:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832436; x=1785437236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SiSOFKr0Kvems3WldMsj2qAd8XWvGaX93cSHCBNiZh0=;
        b=NqweemoKyNtknpypcRWlK+uEZxc/8ExfNlT7yP3H/rpladxpXMbLRiJtX7sfGQnhsA
         WRH8gE/fUz4Qrx8i9HcpYfrVTVpeV1ohdkdiRZP77SGHizEtV0sT3TEyp9DuW1DTAM+Y
         m4w78p+LGkofLqk4RKSzznPGhwO589Pkw06aF1uObvtorirP6g3KnNNOpx0w2/rnGmZK
         DRc1Z6l2bifjxR84cr6gywQ0N1q3jJ/IpFvWci2EvJQ+9Jm8ujlDmYZbQVE1LK5ryXSG
         CynqIV9f1BN4PgXkymN6XyU4JU45HjkF+HSQk7b1kdhVsfmTs6tJuNktWBNenzJwi6or
         t1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832436; x=1785437236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SiSOFKr0Kvems3WldMsj2qAd8XWvGaX93cSHCBNiZh0=;
        b=fIBq7Ky+xmvH0kGbvjOysJHB0u4W3vRUeqd29xNsngTCTjxitB1A0/LABLPBBFJaWe
         htEqozb21AbS2dCSd0ZsoEcUUgfAx/7m5H/Lorb9uGhwg9NoBzOxoEot2yuzYlTJclAh
         pEP05lcwgQi8LtaEeYLbAWpIhzSr137iufIM4WezbiLzS2amztkOPiRfp1fx+6vaEIzO
         bACWhHfKdA0F0pD9iH4wP/Ln7+JC5KMwf8WeQv5iohDNKiT6MbzA9QsfefV5TZxjRsl7
         2sNdJoqm6sZevw3uM/cUgT56qLQbn17PUbC42EMq0VmlG6htThbE1BYCCn69x3p3SrCO
         /JeQ==
X-Forwarded-Encrypted: i=1; AHgh+RoNSPkrmAh1dZli3v2lhW8e1wfm9bWXumgn6uibdTuC2S6T0EEoJKgY0Sb8zREck7WNu+zRhZ7e6n4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGWkwWk/iEzAX+gd+fSdiGwOnlMd9tip0I1eyvinf208h+NpPJ
	OLqm6fijJXIkB6uqLpnNcwUhGcZFcnsr/pnNMW8xmvOKcQO46ymGa/S4
X-Gm-Gg: AR+sD10Tr1gsEu6cWhMixrFaQS2NcbQ3MSFayw0Q6afb8CubX8l2ywnWow+9tPDCqj9
	MSc7baxuq/K9gSvS8Lqws7B2guXLWSHRPvYvBVZcEJsuJadMDlQBq8149npmOudUkDCoNrGPihj
	gAf+cdbMf8UqEeNaJfyesm2AqboFKvEqEgtuogIRDJhyVPCk3HhJumKjdOliTHHRTv7R3fW77FW
	i0SsMFdTF/3XfW4yfW9DIZ+38dvASSB/RXIUqIRO/HKFVoLntwRS0zigLQr7yxKzvd2TrEGlRgm
	ZPxiykOIF8AHsWmcmYO9MaUh3sexwt2u3vcJJyHcyfu2t2ElPZUd1O8b7KGQEKdIROUePK1eExt
	3MIfP/Hil3NlEkISJR7oFge8BCTo2WR5uZBP8LXIegT5k19+beD7oyz5UIR7HRXk5EiizSycb
X-Received: by 2002:a17:90b:5885:b0:38e:921a:5512 with SMTP id 98e67ed59e1d1-38ec64dd01emr5012020a91.10.1784832436164;
        Thu, 23 Jul 2026 11:47:16 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:47:15 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr,
	Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: cocci@inria.fr,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 32/36] USB: serial: ch341: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:34 +0900
Message-ID: <20260723184538.3888637-33-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/usb/serial/ch341.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 569f4aede215..3de317bde07b 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -279,12 +279,8 @@ static int ch341_set_baudrate_lcr(struct usb_device *dev,
 	if (priv->version < 0x30)
 		return 0;
 
-	r = ch341_control_out(dev, CH341_REQ_WRITE_REG,
-			      CH341_REG_LCR2 << 8 | CH341_REG_LCR, lcr);
-	if (r)
-		return r;
-
-	return r;
+	return ch341_control_out(dev, CH341_REQ_WRITE_REG,
+				 CH341_REG_LCR2 << 8 | CH341_REG_LCR, lcr);
 }
 
 static int ch341_set_handshake(struct usb_device *dev, u8 control)
-- 
2.43.0

