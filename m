Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598438;
	b=jnJqQ887FOtj6glVWawwQsnNV7DXcm6NCdyCrgguNbsBid5DnUOEEQETcQeiu6EEig6E
	 IrqvMKzAPV77CafHQj/1Xzz1pYDjdF8ADLZJjLwlEKkI9PZhKPzLUVGXJ5P8VKSvF4UuG
	 qmYsWKqZ6tm8tviJhmWdJXjzu18wj2umjftsN58H4dvxwjswxIXauXyxNXB3aWhkJzmJM
	 QdyOA4mhWbnCamcf3IwPCieI9zfbTtQ/NtmUH6T5Qsj8+TNNzQyTL/ALzGgkVBe/5fm+J
	 AvWpoo+1HI2YccubyygV80reXkjdQWpZ5jtQRaHp8h9k1amYg6r3yRNcLm0pdN0Be5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598438;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iMaWcrtMHiGOzwYE2hAYk1HTEq1eOwZhbrsN12QXlG0=;
	b=gvm2zzgsMWXJxilizrT0BSQuXMMjics0Nb60dVb7wzoOIWyQnj4kC4m2SIQ+JMeKvCTB
	 p9RZvFaFAqgsYFM+MYPVRySofB9Iii31LuAO3Vs38mX0Z2eYbB+PuAdHJrlwbQnhMHAOZ
	 WBYn7hgE55sBD9xelz3xzpgN9g8qJX1v+uILVxr0TYaRHKEH1rt4xgtHa6vFY19ccRKe3
	 wyuLHmkjpaT8uxsu+CvZo0RKveM2FIEp+TxEAsJX9nRYl2BoWd00hBMsyhcbYS3hzBAcX
	 dbkr1NSYhcnTxBu25eenGzW8q3pYlZRIPoW9igLnhOCoe7FhEWR/buTkvPQpaqHnoGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=bmdEoiNU;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59497606A6AD
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 09:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59497606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=bmdEoiNU
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C63573F639
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795598433;
	bh=iMaWcrtMHiGOzwYE2hAYk1HTEq1eOwZhbrsN12QXlG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=bmdEoiNU62TyikbyheoVTn4mP3H5hKQsAtmVNWl/2pOWlq5Kb+wKhlzXqZhx/pgcK
	 yEBk1wbhDvSQsGlpIOyNhjWiNjinE+sssHHNyTVocdywG0i9uyRyzdQOWs54NN5P67
	 HLQ/fdHDhegVPDSFOlrz+q2nJQQSS5ajVyvniMGEJ8J3Lab5yDPuckjqfQcYUEUbz4
	 ht6kv0k6u5gCG8eaII31E6FAfx40zjW6L4Mu5amfcac7Bp2eNBc+Zo+2q5oiGj5Y15
	 /l6A6fDkxQ8OkX4rs1vLhBHpVt615exyJxKfDw9TaVMV6WDDbAoIdF8wdZsONVjRcT
	 MI/07DgjMCeYS16qOfLxpm8xTTQ1j5BomDT7RmYy6kOTvVU0ziudRFysSlXSOnYASc
	 snxdKcRlWrOldIPg4cDsg1ey3GEzeab/5JoJYnwpET30HHQPwIERP5/gFSFBYMLdpE
	 69cZTYjzjQWQ1+DoSgA9N4Ii37zMHSFM0XE+YPghXK7DRSxD2Q+SJ+M1LjEjUVzZWH
	 /w1IXQFTffNHZONilHfuNEcL4Rvkv8k3u5RXmZex+aJ49o9YkFVnmkmmaRsqmvElHt
	 kqAgJwscr188idfB69pSmi94KZ55AFW3mUO9twNW6IDmRi8EZSJvqI40j2k/EYgNcc
	 g3h4Sl0mtZC+/79IkmnDqyx8=
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so44317705ad.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 01:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598432; x=1796203232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMaWcrtMHiGOzwYE2hAYk1HTEq1eOwZhbrsN12QXlG0=;
        b=nlcXTE/cmSvjQXkGx3JxaJ7CFSA6TjE8mgr929049p7VewIWGn4UGMa4J2BoIo5eJ8
         ltV1CKaq0vPH2LWAoxAylQCyrKZOHu62AUWJjq8qAWn8JI1TAjnbkLciZsKdPTXSqHHo
         0Kf+hNgG/jhdW43Jv3thrpo8mkXP5AuZrxILg85mcTdi8bB5XY+NqMJO3Yy0TkhcAwtV
         mP3y68rWtyLIp94ugDm3zbATfZQv/Ew+DbLC5OWluVd9pCnzhNj1ZnGMqpqZj4XJQYpE
         O7/DLsmP2EzDDxAKXjFv+Kne8cW2fvRS1NtLeLxPxc5jkjGLVi6GbGl40vtAUbFcmx8l
         XdmA==
X-Forwarded-Encrypted: i=1; AL+hErHwpTf0089m82YULIBjIXOo7mOuv31C7pyS53ncEqbF80fmUH9z7ysSAK8fxWNpm6aU9CVKB+xqMuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gZ92xN2h7tfGEO2B7S3OoSQfMJDA8/wfueHCx/jwe0fDAEa0q
	wMPVywzNeiLZyNaVoPHE0hyg5CV4JZL2CzpYoGk2A47FyXtGubdebraBnTDEHqMsaBjT/r/TmDN
	hKEfDt0rPcQio4zakCIkrditUU/Df3sm1KJuRZgo0zoO7lkkSrT5rWtKJUc2J4QANkkZkdZKE8N
	ZNcA==
X-Gm-Gg: AZFdTZd/4w5nnYrKPaO/KQNSb03o0m1+z9N48bECjQwY7antKDIUkO1P3YEggXhcRmu
	AW67CzoDCqXEffg2LiMChVDdi1N7niTBMrGcYk0143zNNbKHnXfUqLnANy+qrGNhK8oeEJ4xU1a
	Iz1l7O2xm4/1P+YfVwEnc1Q1IE0zdn8wI/+CxmzoFL/Kg1t6moVwALGKhu5Xh0YkgX8kwZDlP8p
	qLW1tdpp/Il3MC5WP8tZ7X8D4zvqPCc6Rfq4/MZZYNOdKBModz+bKG6aOJyrerTaTWpxDO3ggGk
	cJrmDb8LtPqoAZjO31UZj7n8ALcp/p7pxCvlKTGk2uaykq2tUKuf554NY9Zvsll51iOhSP9LPJr
	HLAndWn/SE9yB9fiY040gV3FVYSSNDGnFerqZLALdINZCq/JyenWaaUIZ+iClCAB8odVx86wWW1
	Z4pU8RKnnjFlMnRRd4Zi5KPZoDJiTgBg==
X-Received: by 2002:a17:902:cec5:b0:2dd:c100:80ba with SMTP id d9443c01a7336-2f03f1bece2mr190850735ad.53.1795598432251;
        Wed, 25 Nov 2026 01:20:32 -0800 (PST)
X-Received: by 2002:a17:902:cec5:b0:2dd:c100:80ba with SMTP id d9443c01a7336-2f03f1bece2mr190850545ad.53.1795598431880;
        Wed, 25 Nov 2026 01:20:31 -0800 (PST)
Received: from resolute-linux.lxd (124-218-37-86.cm.dynamic.apol.com.tw. [124.218.37.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f099a4d875sm42673685ad.37.2026.11.25.01.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:20:30 -0800 (PST)
From: Aristo Chen <aristo.chen@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-usb@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] usb: gadget: udc: do not fail bind when the UDC has no pullup callback
Date: Wed, 25 Nov 2026 09:05:30 +0000
Message-ID: <20261125092004.15562-3-aristo.chen@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125092004.15562-1-aristo.chen@canonical.com>
References: <20261125092004.15562-1-aristo.chen@canonical.com>
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

Commit 0ea39e030a80 ("usb: gadget: udc: Handle gadget_connect failure
during bind operation") made gadget_bind_driver() fail when
usb_udc_connect_control_locked() returns an error. Before that commit
the return value was ignored.

usb_gadget_connect_locked() and usb_gadget_disconnect_locked() return
-EOPNOTSUPP when the UDC driver has no pullup callback. So since that
commit, no gadget driver can bind to such a UDC. max3420_udc,
fotg210-udc, fsl_qe_udc, goku_udc and snps_udc_core have no pullup
callback.

The core cannot control the pullup of such a UDC, so there is nothing
for it to do in this step. Skip the step during bind when there is no
pullup callback. If the step runs and returns an error, the bind still
fails, which is what the commit above wanted.

I do not have hardware for any of these drivers. I found the problem
with a KUnit test under User Mode Linux that emulates a MAX3420 on a
fake SPI controller. There the bind failed with -EOPNOTSUPP:

  udc spi0.0: failed to start max3420-kunit: -95

With this patch the bind works and the emulated controller answers
SETUP packets. I did not test on hardware or with the other drivers.

This patch and the test were written with an AI coding assistant.

Fixes: 0ea39e030a80 ("usb: gadget: udc: Handle gadget_connect failure during bind operation")
Cc: stable@vger.kernel.org
Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
 drivers/usb/gadget/udc/core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 577bc15f61a1..aa6226666eb5 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1680,9 +1680,12 @@ static int gadget_bind_driver(struct device *dev)
 	}
 	usb_gadget_enable_async_callbacks(udc);
 	udc->allow_connect = true;
-	ret = usb_udc_connect_control_locked(udc);
-	if (ret)
-		goto err_connect_control;
+	/* Without a pullup callback the core cannot control the pullup */
+	if (gadget->ops->pullup) {
+		ret = usb_udc_connect_control_locked(udc);
+		if (ret)
+			goto err_connect_control;
+	}
 
 	mutex_unlock(&udc->connect_lock);
 
-- 
2.53.0

