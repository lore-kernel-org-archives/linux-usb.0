Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333814A138B
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 23:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528565; cv=none; b=N3mwyYeDCWgh2yXNNtOAhiC+b2fJBR7FxFZq3ExlzTvUWrG5AbHiiS7UoAFSunEijWG+9z8feM8y+HD4W8962bmW4qMKAhBTGyTya1/AWjMErjYMie7eWTou6c2J8IAUNHKlH8PDpwsAFrHeGzK3USGj1AOyWviqgTQIdQl5X3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528565; c=relaxed/simple;
	bh=lGVibLZ88OYDetx4HaMajA3aLa3MCH348dgkIBtr1x4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bTjOnf9YyLXr+26rYyIt+A7b3bScsIgtYsy7jLawithwVoWy4Pm6oMxUcx+U8bHBC3MjBRec17Czb4nvqLrW2EePwQYs+AQBss6Nrm2+ZLPtAEpfciDYXmEtI8FyQ+o1mpcBvy6K/O28IdHFXghR8A59bfRpYDS2AM6d+S37Hsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aD7EuAa2; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aD7EuAa2"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0a5354da1so588775ad.0
        for <linux-usb@vger.kernel.org>; Wed, 03 Jun 2026 16:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780528563; x=1781133363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=93lU9Ogu/Vwrovx/6m1anCLkQQefT1LVS8MCcVlyQto=;
        b=aD7EuAa2ltvlz+/Cw+RzBCQ7Q/6rDWiMDhci4lNV+fltE7jGAsY2chfnZJjwNcNupM
         Z9O2EDI0FIQXltEDiH/lJLzCy73c9qth9QtKeMGHjmCbi3nti5UjS+pU4TqJOh+9hd8q
         MafuZT2WKTGxCzqgsThpbfx3h99NhdPARL6uoqPV6EnP2KiNBwn+gKQSYdI5lf0Q31Wa
         YTt3s+CN1iV2OIFp8YxfEvcX9cCtPPErLS14Oyi6CWYI8yf5ZbHK+OgJzSi3j5+IyQgR
         zXXhRb5t9lLmPX3ZPlnEtVea+GUmOa6ju/XKS3Cq3xNMt8X57BHCjhjVy/aIxACd79QF
         893w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528563; x=1781133363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93lU9Ogu/Vwrovx/6m1anCLkQQefT1LVS8MCcVlyQto=;
        b=OrZrlbKcp6a85v6J1xZDyMSMvCbBUVbhpqfisnpVM3Gb3ymB+6d9iobJFNeTVvKKip
         Kh/ZAvC+eoa2iP/1GAXFP2RAQQBZTlnIXXgfiUkOxfpIYkrS7X0TTFSf1CHp42LM48vb
         bE7SSCfHckhLa6qmfOvXw2cK8q6RHujisbQJ8wj9MLzOmIVL4tVS3tluMHERxhs7Ns79
         eKv2CrmGtKBmqnOWKZvtlCTNhacGd21LmVqxIGqtDpdLcn35OOmAzGUZ70jPBbTn1dfh
         wtOscq6PoG7AUT/esWuOZdkfI5dxdoVo7p1mqK3OihqZgtfWEZlJjhKwuUkco1dnNPwT
         0tcA==
X-Gm-Message-State: AOJu0YyVzC+dulKjkYwsUT8spYxR5QnDwErXoAEP3ifOCKwKddpA3zdU
	qvzigRm9HRsqsNcJu7w5DOYHAxp38UPdCGpGlp515DzgYD+xB0J5wxXxCqalshfs
X-Gm-Gg: Acq92OE7e/6B3tIaWlWvN16NDm+WF2x/vpoYj45qmNu5sryhjM+huEr2kkdw4iqScYf
	7sp1vIju8lXUXGR0KEuOeFlDpqFT6jcHcxsIWycA07P+6EQf0kjfDb67e7nltLsI4xNqnBn5/7u
	+BWTFWfCAJoI0UnVB1d4v3YuUxgqePoRwCZbvYLz+62AVU6kWmBFUScVzLI1TQ9KYN8Ms9D9ziN
	V39Eu9resNxBc9cDc0iomy/HW/q3lKD87QFcvbU3Lizcpan5amrlmD/JejdHy/ot935WR5cogJk
	9DgcbjFziINleFHtzz74IlaLVUt4FA07mFW9vFnbFEYLC/4oyCnbXUV6gDh1wLXlzw0DQiyAJ7Q
	YLPOFmSxdRoqPDO93tucVwDO4czkypVDFUATSQRbXWLm7penjYBWdD2LB8k38aqZ/pO51gVmZHz
	1f+IGNTBdfpV+8sjNNwtbs3qUbNV9+3wnVBK9OhYDecl4imnSuanVhWzl/qeN41Vz6BwLeK2gDF
	GpGAvvMFgqNqxKDjwwmJNK+2uQPgCAbDMc/BtOKkPwSAQ==
X-Received: by 2002:a17:903:2cb:b0:2bf:1ae5:2c56 with SMTP id d9443c01a7336-2c197ea21f2mr11473935ad.19.1780528563437;
        Wed, 03 Jun 2026 16:16:03 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d318sm38918675ad.15.2026.06.03.16.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:16:02 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] usb: gadget: pch_udc: remove excess kernel-doc member for registered
Date: Wed,  3 Jun 2026 16:15:45 -0700
Message-ID: <20260603231545.7065-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is no longer present.

Fixes: 5a8a375714d0 ("usb: gadget: pch_udc: let udc-core manage gadget->dev")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/gadget/udc/pch_udc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 0a6886428739..99b3ce28210f 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -320,7 +320,6 @@ struct pch_vbus_gpio_data {
  * @lock:		protects all state
  * @stall:		stall requested
  * @prot_stall:		protcol stall requested
- * @registered:		driver registered with system
  * @suspended:		driver in suspended state
  * @connected:		gadget driver associated
  * @vbus_session:	required vbus_session state
--
2.54.0

