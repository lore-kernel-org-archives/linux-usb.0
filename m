Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BBD367F4A
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 11:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784028067; cv=none; b=BC5ifZUX6Eb0rLsDgliI9dSXPI24nfWiOMJYHjxJ94WRXoa1ObYvi6UDVlzmV2hwU5pAR6LC9WQM6jl8UoRu7WAI+iwxwixjBFHr/QVvoMJRVU/s3Z5PkBdZ9qoitBTZ4/Tx+lspUO8nkNZb7LfudsVUIPcRdEHCdw1M7VM6Ms0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784028067; c=relaxed/simple;
	bh=5U8Xt+5FII5bnnfNrELICp5w/0y/KFXkF6lLjw5vPX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oi4SmfpSdL+g9E/qtNm13g8iIZpXr6Ox6WOXL7vYK64sYdxD4ln+68rkiPjTTNxl+ZXn4qcPb5MYSOxHfFaBjfOznrLQQo7F6A4ueZxFH0GpNVqbdRr+w2Xdlnm6r/ypO0BBNLnJvXSOGSSQxsV+vLk7iZ1wEI1uhkybC1NOdQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MECwqnit; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MECwqnit"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493f75f7172so27545775e9.1
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 04:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784028065; x=1784632865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c3OMzo2xKVZ4mg1KtmSh/Is84yo0PGktqHQ2pNf/fQs=;
        b=MECwqnit1XkVxJRFp/LYOAxIL7d2qNJFx+n0sMuLVXzGVA0Qa6zlQq16teSjFc6Ydm
         pCHWlEYs9E8Ao0cMLKHlILPCwJj09g6hQeajFQuS5cVznWuG8SjVzEvM8WU9pEQuf2Pu
         oWRZBvfDHcllloHE1QiHDPtX+35cBL0lgPfc5q9aE2CmpsF2g6QJNqYusT73iaZnJ4rr
         ZKiw3JGjZ3IrBuaq5bNr45i38WsJC42T0KfaFvPIJoTJEtOlGav+gJSkm7Ldc4WKyIuT
         1aDXixCdvK/YkYKohPFYuJ8muhGEhPHkdCzFXUNJUtXEuSx0PNJWXVvApIvRk62rg92M
         yfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784028065; x=1784632865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c3OMzo2xKVZ4mg1KtmSh/Is84yo0PGktqHQ2pNf/fQs=;
        b=cVRPwb051u20W6VYMzKxRcLToIeDw/Wb00OJbd/a1xtuQcVZl9Sa0o5ZQzg6haObh/
         yaOU5qD1Po+26Sl9QrSc+8nhVR3IEpMRpBD+e4z3Qmxb87cocU05Y2aroS995TVPvs2+
         SIGEIbxIUzkEfpmG6K388gQHg7HgzUPFrdkdCQXwR0upTmZzj5RgrKZjr5ZCFqB5FR0w
         REZcU17ZJKv/do2OTuU+WkIod+EOxF01AkHcoGQD1kBSgPn9eOwIPode3Jqg6Jgm1uQY
         vNB6TZTIddYpt2nB9vXw4E5k3opOB7JazTGpVqQqRjjTIJ4IW0WE1TWd/gHbbmO951vc
         tfLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWcH2IpcxrpiW+K2uFsY8WzinIZcrPIoV46mb2CPJ+/Daqp/nGOPH0fvqga4tFdC6fILAViv04PWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCgPIk41A96YudgvJve3S/KhSAkvo0JTWqXz2zpQBFE3gPcmvo
	CE5jrnJaAADszNCKtoFxgNCTBaZl0d7BcZ6+f7gddkq/ZM5337f29xpL
X-Gm-Gg: AfdE7cmHtZgSO5fASJ8O/H6pBWhp+p40rivxdn5iz1roAxzyY0+cA/nz+Ob0BNta0ZI
	/tl7b1/QNyaxZYH2zKT08Nmf+JMuKEpIGBpW4l96rZlvOlrdt/ONlUc31whrg4LrcCu1kSf/3V8
	pkiT6avIMex6rumfI5ZifkZ6Fk/SeUQSQE9k3uOi9cW5mocGaFypPjJ881U4T/tmaZPauWgo0mT
	CZHewXAkpoBNNx244o5pxkIDfFXQJ+4CSw/xS06BJbtjKDW2OgDa2otc8cu6Psak+q9TX9hnBGk
	ex07hHiCC+PJUSPp8xTeE+n5fJm8PSUp12HN0wc4ozg3EUMkXC/qFohDidUVBKwezB61nZ8dpk3
	+6grO9axdbNt6+j2IfBweN/2Cate+iWz217xJDFJCRkQdvnpzQ3cG7lH5cv/bz8qCav24N4o+1Z
	WwhnS5MppQ0OmjsfAZ1vpz+y3p6Fqbm90szAgPxRlh1PzmiS3GUZSs3CjgCLUJvxqxtMS3dHRZN
	032
X-Received: by 2002:a05:600c:468f:b0:493:df1d:7488 with SMTP id 5b1f17b1804b1-493f87e5b4cmr138862515e9.16.1784028064220;
        Tue, 14 Jul 2026 04:21:04 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49508739c99sm65552465e9.9.2026.07.14.04.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 04:21:03 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: b-liu@ti.com,
	gregkh@linuxfoundation.org
Cc: conor@kernel.org,
	arnd@arndb.de,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daire.mcnamara@microchip.com,
	valentina.fernandezalanis@microchip.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	claudiu.beznea@microchip.com,
	jassisinghbrar@gmail.com,
	a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	wsa@kernel.org,
	ben.dooks@codethink.co.uk,
	heinrich.schuchardt@canonical.com,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2] usb: musb: remove dead select of USB_MUSB_DUAL_ROLE
Date: Tue, 14 Jul 2026 12:20:47 +0100
Message-ID: <20260714112047.2304856-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714112047.2304856-1-julianbraha@gmail.com>
References: <20260714112047.2304856-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'select' does not work on config options in a 'choice', so currently it is
possible to enable USB_MUSB_POLARFIRE_SOC without USB_MUSB_DUAL_ROLE.

Remove the dead select, as it is unnecessary, from this conversation:
https://lore.kernel.org/all/20260712-parole-stoning-d7e66a0961a8@spud/

This dead select was found by kconfirm, a static analysis tool for Kconfig.

Suggested-by: Conor Dooley <conor@kernel.org>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1: remove 'select' instead of changing to dependency  
Link: https://lore.kernel.org/all/20260711130349.592545-1-julianbraha@gmail.com/

 drivers/usb/musb/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index f56929267eaa..1b0d27d8e02f 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -116,7 +116,6 @@ config USB_MUSB_POLARFIRE_SOC
 	tristate "Microchip PolarFire SoC platforms"
 	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
 	depends on NOP_USB_XCEIV
-	select USB_MUSB_DUAL_ROLE
 	help
 	  Say Y here to enable support for USB on Microchip's PolarFire SoC.
 
-- 
2.54.0

