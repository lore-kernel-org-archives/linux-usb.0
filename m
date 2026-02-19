Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A65129B8D0
	for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 16:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771519783; cv=none; b=fsIvEBe4xoaIbkFTKqlgBONkTlQXnbdVjZC1yMVWLUmvuJ2p8+GAH06vUeSsjD4c6/gU6y8+T22MWUdCsZUygGLSqa8Pk5KreQMYgYUmD+v/QOFMjwhCIAzhJTAWyvU67UGR/ARUCinK1jxE8KFkioNXp/t+hcipojMeiYWsP4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771519783; c=relaxed/simple;
	bh=eFQNWZfkWYuOwkPWwPvI4PHV0Uj92xnGg8zciXd+4KE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yfgr3DTp5I7qmQbI3Ay1PTyHixntkXnW3BHFINDtx5ABggvtHgB5QyfA5cAJjvJVWA6qhRyVQmir8et1Lkf77HLUElZqgZe/fskMtA5wZ/GrqnsrRlWjVvcJGZ4uOexGDFA08QFkmH9F5AvWhxdGLuiA/ennpDv10D7KBCeBNZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEOY/R7+; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEOY/R7+"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c9f6b78ca4so139076385a.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 08:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771519781; x=1772124581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxpjpmIspZOCmp2qnJMVZZA0VoBJVNgpGyro+unlamE=;
        b=CEOY/R7+KWAy3WE5U/OtIgrH5mgOKay66GVcZOmPJpAFI0N4cj4gMRmJ6bQHrZ+L2q
         YB2R4pYKH3aLTOuf9RC14sH84af24yT95q89mmQFOLmbhtoSRxkxIQ5z/rEuthDsMJZa
         p1lsuL91TQwHrdADFMlUUyN1pgQZkgPKmQgPZgMoeDdRWB90GBuzzp2tI9+LdfORAP/G
         GSAqGz3URbGxAS05FZ1w8J7gnHMTWQ6ZbYvdscAvhIilinnxRgnm9c3wKzJ2u0tt6y4Y
         XPxfWIjhrE/CW7YEdkx7eOuTZ2vrmUNtR3Xy8rOA5BP3bEw5ZHmGLxRCRSJQMxs3ykYs
         yrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771519781; x=1772124581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uxpjpmIspZOCmp2qnJMVZZA0VoBJVNgpGyro+unlamE=;
        b=czwLQkflg14o6YrkBWGEd7enf0yLdMD9jGpR4W6nPE82U6Jr4lDp5+XMZRcLzbBSIE
         qBuAvx1xZw4CP8KtQqzm2T1pDH3KbenZMR6pfcZkEVzOgMBLNPzzEwzgihqiaOA0nRk2
         K1n1zR1kA69KQPVrypBmXrBRvZHlM4eRXzYHk+qXf/nJDE1n9nckUnWFozeHZyZvJrTU
         nC6OAnisySrG2TASFZ5G+SOQZ+m0y9v0IzFJf7w8+7LaqtDpf39Qy/zrfpSHR3lv1TOQ
         9ENlL/lv/2RGHt40qf4dqxGmgZKl7SMGXXSzmpz4wghju0jC7BLS+WGm62HZnzBflMy+
         LsFw==
X-Gm-Message-State: AOJu0YxqyDKtuDkVHWZgmU/SHZwx0R2Qih3qR53bTdd/gfG/+/CUMjKL
	YBJE+rJKzipG9xcDR/ri9bxqNpHLHy8jlsrZVrOjDtD8qPKZkKnYvOZJJKNy1g==
X-Gm-Gg: AZuq6aK3OdppnZR3UB6Goo6A3u4ygGJGwnZ8EH0NhRvRW77gody8hdQkSNwkAUJKdcP
	TOFTu5jd4LFjM45OP/gRQ3bd8eA5WSqwURM8x0BV8w506HBdefstSedl/mxdT017LkZLUcYby9q
	65nncGDyQBUiwlPR0KguuVlaMOEfzNmSTw9uzohIiBA6KXH0VtL+0Gzayt+7oCZXp2XbEUaxoCp
	81e9JhjBSP7y0W3a5fWyGZhI41swlXcE0g/kW5BRYzff2/AdSuApuSXeI6OMSiqPbqYf5+gdl3g
	zTCv7QhH8TI7dtKrDLvgItu1XGBaXMnjV1seEXEDWiSPOrAHVP0Q852XXYD53NMrkTly8gQMk1g
	OIRJ7Ki7tuwWwFqf/abT2sKMnfIxcZQ2CPUnOmn/sFaQ0A2XwUhQwHXhRSsPaXXTv1/4qq8ewg/
	1wxRZe2v9L0vuZ8NOH/eOC2n/IPFmOXv2C41RBcoMYeFfP++n8RbbB4lv4nq5UP3tck/xPVKrI/
	WAr4l3dlcGIcW620/fO
X-Received: by 2002:a05:620a:4452:b0:8ca:d5cb:6840 with SMTP id af79cd13be357-8cb4c025b05mr2135791785a.73.1771519780551;
        Thu, 19 Feb 2026 08:49:40 -0800 (PST)
Received: from localhost.localdomain ([129.170.197.104])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0ce73fsm2259615685a.11.2026.02.19.08.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 08:49:40 -0800 (PST)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	Nathan Rebello <nathan.c.rebello@gmail.com>
Subject: [PATCH 2/2] usb: typec: ucsi: clamp returned length in ucsi_run_command()
Date: Thu, 19 Feb 2026 11:49:24 -0500
Message-ID: <20260219164925.3249-3-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20260219164925.3249-1-nathan.c.rebello@gmail.com>
References: <20260219164925.3249-1-nathan.c.rebello@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ucsi_run_command() returns UCSI_CCI_LENGTH(cci) as the data length to
callers. This value comes directly from the CCI register and reflects
the length reported by the PPM firmware, not the actual number of bytes
copied into the caller's buffer (which is bounded by the size parameter
passed to sync_control).

If the firmware reports a length larger than the buffer provided by the
caller, callers such as ucsi_register_altmodes() will iterate past the
end of their stack buffer when computing:

    num = len / sizeof(alt[0]);
    for (j = 0; j < num; j++)  /* reads past alt[2] */

Clamp the return value to the buffer size to prevent out-of-bounds reads.

Fixes: bdc62f2bae8f ("usb: typec: ucsi: Simplified registration and I/O API")
Signed-off-by: Nathan Rebello <nathan.c.rebello@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 7109d3bd39b4..5791597fe662 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -140,7 +140,7 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 	if (ret)
 		return ret;
 
-	return err ?: UCSI_CCI_LENGTH(*cci);
+	return err ?: min_t(u32, UCSI_CCI_LENGTH(*cci), size);
 }
 
 static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
-- 
2.43.0.windows.1

