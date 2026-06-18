Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898E62877C3
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 06:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781763594; cv=none; b=GSNVU01QSEMr/cpxZTAKnVUiiYm5/V+PoUbFld7jf7VYaIQuW3SOjhZez6JIVaXtEQpHh3/8dlkq/H3ryoi5uAOwpyi9ze9+6JKhZwNVWj3dCk4lnSibB47BsUpVeW6A8SOnj2xEjPXgHbB0JJhMSid2lrV0K0pnG60sm3OToHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781763594; c=relaxed/simple;
	bh=MR2Nm1LmUc4dhFtlCkfzDS2422dNtrlpxROFYdYilic=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=J7+0HQQUgHR+0wRwqmaDGv+ceahfESTy9rJIhYs1YXyIUnwDewZ5g2qVk0Oygw9XEYD0ND5c/cUp5YWuN6f+sOWzyDCNBsfUq2uHQjE1O48ZC+H27esHK3o/jt7fl2ybZHQSgB0fKKwd0OaCVGzRLMSNB8oSW61PCis8iS1WW3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiSwLRLn; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiSwLRLn"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36b8d414666so248312a91.3
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 23:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781763593; x=1782368393; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ScOr+/vdrOb5bFKQDTI3ANdSYyfxyJ58Srz3IQTKWsw=;
        b=QiSwLRLn51EdAxG1FHzi81jsXF1Be0OpyGVsZfpcOqA16NSi1zHzK5HdaHXxpwegnr
         K6wlFc2Dr4UlcHlwvZ6o+Oay7o0vqDxqPsVMcb/mLx/iNTqmu5v97NCrR2fxcObfalr/
         Vlgdj8F58j5MHSdk3+UbTCnLa5weYgXb+fBzzfLXkrMB6Jx+ETMFN95bfjh/0p3vzaG/
         HW60zdtXsRWU2i28QnhDZCToLvcj1VosItsrSBE1Io6k52WdoovKycpIJHT7LUxZbXYl
         skDH8E66BpoZqdTNBO0yjz8QF6vTrhMusAJgOj/a9LXAr9oRTm7OQ4gZN/1w11Xr4j3H
         6WzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781763593; x=1782368393;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScOr+/vdrOb5bFKQDTI3ANdSYyfxyJ58Srz3IQTKWsw=;
        b=USMANB/uqu/1xC5hPoaNyJbN89ajrstcfCd+ta5NbKLImEVDxvfYTiCwbw+4ID8kwb
         YfzHApGRf9lmB0hfFmU4pQQflVtR2N2KNilkUZn/7PkTNFBOY+HnumZ1bstyKqe3UuBq
         8sreoaiDnSQWfOb54djILtQfmU1y9deUCzvMMgVujFOJD3roShleSRenHMRGB2bDSx5K
         tRHJkFs3x7AGUDFm3+seLVtxKbPwNiyl7OcgYKMnpIA6zD4OAwo5pJVWKMr/w2j4bXxh
         aIZIpYhVootcxh+6JcuvbVBsZPxa1A/tvpQ4cRYfGDhiTcqY3qowKtpHVzaIzzl6f1WC
         kq9A==
X-Forwarded-Encrypted: i=1; AFNElJ9obtqoScLTWRVfXgeNXsA9r132XA+HgQ/1H76bdiuYOHBSH0acG+b1fggATycL16fcdROfw7DhcMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC+DNB4vGQYZmHX6SeGGzDjaZ+4Jz/S4KWemUzt3zrBmvJdu/Q
	je/+mCiZeZWe9RwRJOxn2UtuFkTY5Ll0iw55267rcms805LI6liQ4AMu
X-Gm-Gg: AfdE7cnjiTtAxKChyHxRyuO/55XOvFf61hpjSKOVQQrWL6LBsxEuYkayfmcqOlgFVJO
	Bg0r96WrWshnQ7gDtxM9gXQXRZyXkBz+ZfC57d6vgi2c3HZSbDo/xaS4jVvtHLxhaSxRDDacMfc
	kNAuQ0iRezAjQ4LXDjtJjpMQYtGSLnB7FmL+O5srPYq9e1nZwvuvz3yOUFdwl9ZBiOy9KHINo4c
	B8oK6x6i6p/o66UrsmwJyzP1mZBbTF0jp2BctHID8TZhlBD9ZBSqImgW4ibh3fEj/Vnw/7vKX5a
	igbaoSNYOd82r+zc+ZIVcdsbn8vG82NQyeT2RfkTdX8+6GyintQGzR3aa7ktBUxSRTwGZbsI1sQ
	zKe00WbtG4fMjoBbdqLltmJhbH/E3oQvtnkqXKRO/SQpxOUfh51AbukI5xqtLcJcj75u6a6bs+y
	PpDvniASl5TeC9A+wFfHfm+zZl0SWmEaEW4NeDAA==
X-Received: by 2002:a17:90b:3a0c:b0:37c:543f:b83 with SMTP id 98e67ed59e1d1-37ce857afd6mr1402234a91.4.1781763592872;
        Wed, 17 Jun 2026 23:19:52 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ae7d1sm7653752a91.3.2026.06.17.23.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 23:19:52 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Lixu Zhang <lixu.zhang@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] usb: ljca: bound bank_num in ljca_enumerate_gpio()
Date: Thu, 18 Jun 2026 14:19:48 +0800
Message-ID: <178176358875.3352358.6059116660356914900@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

ljca_enumerate_gpio() reads desc->bank_num from the device and loops
valid_pin[i] = get_unaligned_le32(...) for i < bank_num. valid_pin[]
holds only LJCA_MAX_GPIO_NUM / 32 = 2 entries.

Two checks run before the loop. The reply length must match
struct_size(desc, bank_desc, bank_num). The product
pins_per_bank * bank_num must not exceed LJCA_MAX_GPIO_NUM. Neither one
bounds bank_num against the size of valid_pin[]. The reply is capped at
LJCA_MAX_PAYLOAD_SIZE (60) bytes, so the struct_size check limits
bank_num to 9. A device that reports bank_num 9 with pins_per_bank 7
still passes both checks. gpio_num is 63 and the reply is 56 bytes. The
loop then writes nine u32 into the two entry array and overruns
valid_pin[] on the stack.

A broken or malicious LJCA device can therefore overflow the stack.
Reject a bank_num that does not fit valid_pin[].

Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 drivers/usb/misc/usb-ljca.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index c60121faa3da..a1876c05b7c2 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -596,6 +596,9 @@ static int ljca_enumerate_gpio(struct ljca_adapter *adap)
 	if (gpio_num > LJCA_MAX_GPIO_NUM)
 		return -EINVAL;
 
+	if (desc->bank_num > ARRAY_SIZE(valid_pin))
+		return -EINVAL;
+
 	/* construct platform data */
 	gpio_info = kzalloc_obj(*gpio_info);
 	if (!gpio_info)
-- 
2.34.1

