Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C654A2A70
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 12:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613045; cv=none; b=tckFsIng6mVFzGAsbsnU/dBfI8Byvxq5MaXXQrSiMZ+JZOH/F8tiq0lZtMVeSTClt5goKm7VPr+q+eEpHfMDYhNaZdjRWWJBBso6Znj5h8RljaORhcl8iYLdah31aU6rqnvfVjWQIrpIsLuGlaHu21sPZy0I8eyf5Dw1a4Wn1C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613045; c=relaxed/simple;
	bh=fqRQGN2NtOQEQ6U4DtETKEyMZbTPYavOTcCPLbSO1d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iMGm9x0vfsy5lYhRDrn7syKlEvSub3VBpu8Ced9N869zJxIg4h6//TIxvY4xpT7GNQnV1D3F51WSkaJFfQVAD1TZasKIBOdsO/r5kL5KJZufSRZEslYWpm8aH7dxlgWwFCsw6gwT6Vnrq3AekHfBvobN9d2h70WNv4KiMD72Cfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oL64eJiy; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oL64eJiy"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bf5370d38fso768961e0c.2
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 05:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788613042; x=1789217842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=oL64eJiyZHx/JqXDa0DLvHL/BUopETrEFGRWlFErEtn5Vzcf0K1vZj5bfCjV0JTq5V
         wh9HWgh/Be4BkF4E75rIGN1PaxFiOM/a2z4Wkt+cGz9ucsTKSW2SPudorALbIM9YuLc0
         0/rMSo2ZsqcwuOKWbDecJDkcudLIJKxxOSF+EN2NhgZzrlPtP9aYhZdsW6sBI9OWyyUL
         zybdeZ9TJqBDU9IdHbsfUAWKFmiv5naM4CY2HTJj/oHoBgX3P9VfuE90DKXyEV8YZYE0
         uT0tLKEphUgSKWBDq5O05H82PZZj6CXecUWWtxF5ZkuyDmBzP1Fau+7xvpG8GreBgDkj
         UOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613042; x=1789217842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=cBM8etlYZSc1ie1a6gxdPIRy+Jf2IhfpoD95u58J4X5gitEpf8I9t4Ygom4yy25elQ
         TCjNLEoOyHEP8AjQYAtJG68TkDtPen+UQ0Uye0Kjs6CoiWn8V9vBybyNjpIR2FxcxGba
         1KW1HY4kaJpcTeaPozOqR//C8pGjCBPUUCv641Ejudl0mLAJJORV/BRtERVQfNxdAU5f
         vyxILh4BZdCpJRp4ZunGPbja4LhK0DKfRIBraahU7oQAoEsehJ0+bkXA3bsvOm4MGE2x
         ofmyga0e0bWLNyiQ5nVUkn0ADG8orn+nw9OulfeeRBqMx2oZrYep2wQwybQfiGFmAhiJ
         ZhxA==
X-Forwarded-Encrypted: i=1; AKwUvBzR5avtw5/YTg6C9m4s/Qwapx2ZFeWrY9VMWRMxRzCAESlN8TDkoycqxZl2vx6C2L7LGv0yR4n83d8=@vger.kernel.org
X-Gm-Message-State: AFuF++ksIkJQGG24jkpxu2SYCQwR//ZkrQxMet0wYmvS6XU6hn6/52xb
	ON8+oY7ipsCjM5qjESHgSDRWLJkLA7CRHYmtFuzJc3Ij+0Zs5HrHzHaJ
X-Gm-Gg: AYBFou098/ZfUSQ15qQFzuMnceMVzcy5kcjd+jtZURY6aUGA3h0qwvBIRSbD2ihoSeo
	V524evUITAG7m81s05m8SDsl3FpjFNL6Dy8H0LV1GKFCzPwC31ofuYJTrnM9IyF2fB0QX408NQA
	6hpSMvGC1OhxJB2WyTH/J41Bv+sprYPFeBQLCPILNnYMxenDuPZMP9wfpv9iyjY0jPsBP9LO4sN
	+8tkgA1WuoSM4HcVEZ2ZFzN20gJ7r8hI3vEXXsBzfijOyAgrd/k86ytWbFEj52aQadlOQ68Uu0Q
	Eb2XXcOMWFmbNO+hFk40wkPCNGAI0cChWsKywRQvIMXcuu4lavWN5qMWdPtRKC7T7vrjLRYvzKr
	jk0SR3KRiD1wl78eAX8TcvTKGVYrm+9jaA4cMi0CqvzI15asRheR8aYlsLwUUnCs6P2hIuDura6
	j2TBWVMTeF43e1lD59lig8d7OvGVWDB7aeBYCoY82wr4FdHB/Ml9NUcb4wVsNI6xQyyCfyrJTUS
	GuTdSV2qYA3PMHo+mUBrC8Mljoubh2BMBacZ/XTr5s=
X-Received: by 2002:a05:6122:4fa2:b0:5c7:c666:ec22 with SMTP id 71dfb90a1353d-5c7ed407509mr5471080e0c.6.1788613041673;
        Sat, 05 Sep 2026 05:57:21 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef7a5sm4349416e0c.5.2026.09.05.05.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:57:21 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v8 2/3] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 09:57:05 -0300
Message-ID: <20260905125706.6550-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905125706.6550-1-breno3011alves@gmail.com>
References: <20260905125706.6550-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a Makefile typo that incorrectly placed the mt6316-regulator object
under the old CONFIG_REGULATOR_MT6315 configuration flag.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/regulator/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8..f81d1f31a 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
-obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
+obj-$(CONFIG_REGULATOR_MT6316)  += mt6316-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
-- 
2.43.0

