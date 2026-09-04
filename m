Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AA247D459
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 11:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522790; cv=none; b=bn4Xf500LkfgpgYT1RIik+Bsvq2TOyy8OkVNYdtl1kAlei7IGz6GyKKLi8yhFrFh8FyhS8dW1/hfmeQ/IfurnRJ6yVpqN0gqlTS03+RooIhIcORTwE23c05qvSda4vtpn6dISv2y2lvr9HSmKbBr5IopaAWxMiqTIfj0gaD97WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522790; c=relaxed/simple;
	bh=AvA5xutwueEBv7g4m//lMANLh5n6he6fF22r33hj24U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sRODtxv859XRwt9GuhClvH2VY/cVKuqqXAlmhTidfZtnhgMmzaGZf49TPlCEmB81GyG2LlXtS9Nj/ivyICGyA/eesMX+TuQ4vQ0zzX9X+GcpMSVhumHXklEWDbsTj/VCqhIswIFiwIuYmvrYe8E328F6FcoWz9aZeity8Rb/aLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwfKl0C2; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwfKl0C2"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39675172593so714898a91.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 04:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522785; x=1789127585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=su/pv3iYAht5ogkGgF2P0degCEAQbGRgDBNWGy4Uw6U=;
        b=EwfKl0C23Bv9jaD1T1pZQSsEZBmX5iJKyesIlpM87AMwvYrNG3DApe7Vvxt7feShMl
         22KstIhUgo102sqc1DWWYZsNEFmYAnaoNK1HC7EpYNJoA0llgIOmYCCwSjz/4p1QysK/
         izK9ypFP4ctySeS/RiK7v1MLmuQ7CaBCKMW+ckcmUnbpdXEVPW2stuJwgDI3i30WEAGm
         wcGGtOlSxojDDBmOOJGDfe0HFk+3aR4zISY7U0lkaNDfxAN5bbbQfhm/qHjBFGiySmVI
         kWZFB0mFkYYooAl4+SEoQ5G1BNA3Pz2v9ag7koS+hVZFv/jRlBpC6xhCfay3AExC/T8q
         E5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522785; x=1789127585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=su/pv3iYAht5ogkGgF2P0degCEAQbGRgDBNWGy4Uw6U=;
        b=pPqR/ZjN51sVhOaXlG8hXG4i/2I485MBCARIUa4xO12e5jQt7ViDZ/qlk7MDp3EpvB
         fcAirNETFbXLs1E6cg4f7mqiIizBWR6JxQ+gBImpRSUwET+GxlCdEMQkIkfc5bPW7Gmd
         jLTKPlJPgQQoTNu1o5CjgELgfApp8dC0wjVVwJgGa6czcwGu+z4KEmHvN+pFz6t/yc/I
         D/I+a1snGGyrJQgWQ7EBdeOq1cGcKs2cv+KHvVymmcQR3ZSuoZgTayueGUCV3pGwRXU3
         Sa6dzTcFS+sQpFP9TmqN9fH/YvW+2/trhcnER41Ho0SfB8bFT/8RZhaDjcTQhRgiLfId
         PvhA==
X-Forwarded-Encrypted: i=1; AKwUvByJcDwXCPd3TLZ7f2MrPbd8E+0TIPYrHOcYwuspbh3lluS8kGE9InjqmNABAHfBHLuPgUpsNylJvSE=@vger.kernel.org
X-Gm-Message-State: AFuF++kw2j3Use1FEPb0NZJRPJWX1Q3H0tMp3pXOt9xHJgSVn2jHskH1
	VAdafdJDRQYQTlB14PmRTO5NkRVwug2BhuNslZJ/V2LCswn1rMGQ/V9v
X-Gm-Gg: AYBFou1hCfgD0GX6qjDpS5LoEL9clDmDMop6MnpOIW4O9umPF4zHJZVM72nc7lxXqQW
	BsmJqtlXP76A4i+1iZv6CUFbwGPifqIB5vwVEHNXnDm4g4nrBGWRYqLlV+s64r1krjihujrbiiO
	IYAUn1aR6p73canHU2yVeCJAmaaa1em+RSsXoHOOjK7ILvMY5KWWy+ZG39sOytPEIq2vnV8obX5
	FUVxuX64kfDcneclwmj37Omh3wplUNc3lR682tBra25BoqngHUq0Pu/aBMPm08RiQju9FWuHvHo
	FWb9y+Rf9Mp2bd+82h8abkyY1XAcof0BIUDfGMu2X4rPhYkEZgu5gjeBXCUCs/ASz4+gZGyXNeN
	JQBAZEn3K2kTvtbrZZWYzoUzxFKMTVeJX2Fx7qiLBAHSbZ9FiwvmWu95iSi/subrQj2iXuvBNgz
	o4Imlh/nR1TYUFQNydLAd8EoixPSD38EP3+nmRNkL+AHvQnXeRZ9/er/K73UJOjHf1kFrE1ug0e
	QFp7XxChCrhEiU=
X-Received: by 2002:a17:90b:538c:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39b26204a3emr9193570a91.13.1788522785070;
        Fri, 04 Sep 2026 04:53:05 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm9221726eec.16.2026.09.04.04.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:53:04 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: fix typo "harware" in comments
Date: Fri,  4 Sep 2026 17:22:58 +0530
Message-ID: <20260904115259.8346-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "harware" to "hardware", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index df5cca43afbe..f6352e814598 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2091,7 +2091,7 @@ static void handle_ep(struct pxa_ep *ep)
  * @config: usb configuration
  *
  * Post the request to upper level.
- * Don't use any pxa specific harware configuration capabilities
+ * Don't use any pxa specific hardware configuration capabilities
  */
 static void pxa27x_change_configuration(struct pxa_udc *udc, int config)
 {
@@ -2121,7 +2121,7 @@ static void pxa27x_change_configuration(struct pxa_udc *udc, int config)
  * @alt: alternate setting number
  *
  * Post the request to upper level.
- * Don't use any pxa specific harware configuration capabilities
+ * Don't use any pxa specific hardware configuration capabilities
  */
 static void pxa27x_change_interface(struct pxa_udc *udc, int iface, int alt)
 {
-- 
2.48.1

