Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535791DE894
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 19:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762614; cv=none; b=UF+Gja6Y56GBuO+v/N14Mu1wBjZ9dBsYcWyOtRDQbOk7/+QfnS6SqOUE2KKHZCUZN4SrcB+FZF03KZw5dYFrxx1tr2/MuolRPr14Yec7SrwI7jK9XQ+kbNzBQXU0sG0XMZHuMRGrP1iOVbFSwbGeXeUkqVOilBS9Gu4RuQMxPog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762614; c=relaxed/simple;
	bh=qoN6igkrWbOlb45qlTXOirSohErKuB2rWvqGvlLdHWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ScmgRxAGeENHZbB//QbuCHGNNkyqLZJEzECizIc9dk/mzMynQYtXUscsFrk7DupURVR2c24Q6sbaWM2LUWMrufV1WWPSI1m2LMvTW9pQHe7Po1Az5ilwIpKMSlkSlTOSMKRZ9xqq2OUoBvQQ6aN6aDmi2Hi1H/S6yMhFC9QJIiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAZX6oVD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAZX6oVD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ca11143dbbso7037125ad.2
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 12:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782762612; x=1783367412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QBn6VbDoCaQPNtGeLIJZzo8oFouBg5xwQihuCt036fc=;
        b=IAZX6oVDe7VOWn9QIsF+DWU0xaauLKJ4RUoR1JtLsy+Q5UEQ29Z5d715bfs0J+TbIG
         dANA8vQ1oxnZuyUYd2G/xCU4ujjKsxG2jxWj0RXhxmSSnqTVO8XIcqUADXRu4vYP7MwZ
         RdOqwAboUwSue+Dod8Vi0dOFRFjEaWUfmdWftsTUKtv39i8OP6DnAU0JFV/zaEvozl50
         wXxT6WzNGiEKD/EU3y/uCUL9Me9mvNS0QaXz9psnrZ5cfq1Nhh9lMROxQKVru6bi6u7X
         9wVlfEne9asBR7bZqPlcGGIYBocZzxCmRQ5jipUxhQbgL8NtNtG3hDGdofW5PlUhnb2Z
         TLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782762612; x=1783367412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBn6VbDoCaQPNtGeLIJZzo8oFouBg5xwQihuCt036fc=;
        b=Sv7uG9hdDCBkHhEPBsO8euIonNUXDKQ/lpePDZ/xkMGGNAZ6koSyk+R8rgCXE5cLGX
         2hHfeaCDUWbvvkey5M5gNtvp9PxUxtirl8pP/4iG1cEc6gOlTJZ4QJQAFc83nEsrRJDv
         kZMSikp0V/e7Pm95VDEeEF3suxRrTJnuabXLWgpxG5DIFibTRCdN5OKbw+Uy34qUSQ0t
         fDBaICbInd1773PmIlaS7cffi2kacar/kGEv0KBnmlEWyqkw4Ly03TGaZOsZdqNW93E1
         ArJn2dNBeNDG7DmtTPcaYICrL6SBnciFlCrtbUyTKGL0k9EWCj8UbH7lQOTnDjah2FJp
         FEhw==
X-Forwarded-Encrypted: i=1; AHgh+RozRC/CH0xkjTlL2x9pRzqwk9eX+gmE85nKPng8ue/BD+XGPcjrhPHAYovxNmVCek98HZnxzA58ld4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbxXjzI0sSO5wx1C2LlzO6Pqh962NvuedhP6yXZtxgY71PwcAC
	StHdkD+QfDjday/Q3dSX7WpuD4hYfUbDn6pNjwE8POFxtPdPcWB90BbJRP+kbn5F0S3AFQ==
X-Gm-Gg: AfdE7clYGx7aHWy5QvOqpMpqWCkpd7hSkK0MNBeoROA0SMR+H8b7N0sJYLlyCO0OE/G
	K0EOBc/wT+siXTbOWghXmyEH9y4zkhNsGzcvDculOZ/rBmk9FU4si1Vp8Q/BFZBX/MeJ1QWjjwc
	7cdjQlDs3fDaoDdTDVmhXBNuqZpvv1mpmJNTDDbNy1Y3Qyx4rgXO6Hr61jY5l9VZVtL/LV46/5V
	yTLcXD0Qz/4nSeoXypJrpKX3WICi5zbvCBaiJ/sprlkHAuAHeaATOMqx2TDGMF/R0ibAq1c4paS
	icg13C2OfgFCjK+ZKdDbFoPOg3k6l33wGANACFZMsn6+YFdhsfhXWZmCbCn7wjLUbNLSjQKvIzr
	QcLkTrBHQ1L9EY3PTVMZXMhf3JCwHtmrxPIr1b9+XUCgcmoDd7nk5zS0dzgz+zCQVVVpTCt9Lmk
	E9KnE9WlwEDRH5i44Xv8AJ2hY+Q3I4bM7BnjAS5GRC84MqT7Csxq9I47NNhU/5RRnTJ2LaIHE=
X-Received: by 2002:a17:902:cf01:b0:2ca:202c:644e with SMTP id d9443c01a7336-2ca2e91640emr4921755ad.32.1782762612541;
        Mon, 29 Jun 2026 12:50:12 -0700 (PDT)
Received: from node ([149.40.62.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9e28d8129sm36969575ad.80.2026.06.29.12.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:50:12 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: uvc: clamp SEND_RESPONSE length to the response buffer
Date: Tue, 30 Jun 2026 00:50:04 +0500
Message-ID: <20260629195004.148405-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uvc_send_response() builds the UVC control response from a user-supplied
struct uvc_request_data:

	req->length = min_t(unsigned int, uvc->event_length, data->length);
	...
	memcpy(req->buf, data->data, req->length);

req->length is clamped to uvc->event_length, which is taken from the
host control request wLength (up to UVC_MAX_REQUEST_SIZE, 64), and to
data->length, which comes from the UVCIOC_SEND_RESPONSE ioctl and is
only checked for being negative.  The source buffer data->data is only
60 bytes, so a response with uvc->event_length and data->length both
greater than 60 makes memcpy() read past the end of data->data.

Clamp req->length to sizeof(data->data) as well.

Fixes: a5eaaa1f33e7 ("usb: gadget: uvc: use capped length value")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/usb/gadget/function/uvc_v4l2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 514e5930b9ca9..dfa0521a243ac 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -200,6 +200,8 @@ uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
 		return usb_ep_set_halt(cdev->gadget->ep0);
 
 	req->length = min_t(unsigned int, uvc->event_length, data->length);
+	if (req->length > sizeof(data->data))
+		req->length = sizeof(data->data);
 	req->zero = data->length < uvc->event_length;
 
 	memcpy(req->buf, data->data, req->length);
-- 
2.54.0

