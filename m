Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_RED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37A5C47082
	for <linux-usb@archiver.kernel.org>; Wed, 26 May 2021 13:01:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDA78611CD
	for <linux-usb@archiver.kernel.org>; Wed, 26 May 2021 13:01:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235041AbhEZNDG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 26 May 2021 09:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234862AbhEZNCl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:41 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4859DC061350
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:06 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id r12so1065012wrp.1
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4ynJxnpUACagJ1PRG8av2gZwk6Q/EIQ9VI4Cq/HwLkQ=;
        b=ssYLQUB5UqpTDXgRfJyhf7QESK8IsqWzk/9Xtmno5Z9IXAt0z9CnK0I0uKbGZImCPQ
         WGJYk4caiZtR4cpemwfokceEgKL8EUOOHGCM1AIdhWdJ7JsSlmOheI2bV6McMo/3Ilzv
         nCqLTQxWZ6CDHMiOXceCjXD26rriaWrQAdZW5RtyZPfFGCaSkMUv009h+rdhY04apvCv
         vyxr9dTYEEo3R4M9UwsTxySdqvWFiEjYkrV/orKQ9encuOW/1wiFAR8b3Oq3BFyoTzY7
         wSQDO6PsmWO2DZvHSLDnZyJxF9Ari56Hs62n0x+z24VdBOHWYnU+GAgsLCLM+BKb8edb
         KUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4ynJxnpUACagJ1PRG8av2gZwk6Q/EIQ9VI4Cq/HwLkQ=;
        b=IKS0XUClAU+jZzBzuznIzbEu+VsWgeafzXTs94W/k+z5nOyaIBYuLr11SLsLGoRqWu
         M+kIp2CBWD0vonopUWZ5EdtBuXYkCw6/vRoEe0vlMu9F36amXITEsX0KY+pgSsKloQPb
         Rs1JDmViBkvWQ6eNbIbltO822nnahuodgPLHDbbEl+o8zRzyYjc3g6xou/nOgImiXnoB
         stk/tY1CKNMvE+YphySPsk2jyXqWl8Cd0pAZsE9G39F7L09QfKodcEKw+RFWBsQQX6+X
         ksvHUcDT0VPL+a2j/N3/iOUk1XibiIOyH62W+TWsDPS6tG9G9TQWkJBxU7L1KhRc7vpa
         sZow==
X-Gm-Message-State: AOAM530NCDiq3YMXRqmuwz9SkSQfrahmUsGIYVKwueYZW4sVyab/4zAL
        4Za4HUcnOeLMggtsc6V1ZaxUxw==
X-Google-Smtp-Source: ABdhPJyF3TqysAgaRiv3QaQr06FQAN77YlyS9WNhVKxL6TmWnfq2kezblAecIcdfC9TJOvcKmfpGxw==
X-Received: by 2002:adf:ee86:: with SMTP id b6mr25972174wro.53.1622034065270;
        Wed, 26 May 2021 06:01:05 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:01:04 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: [PATCH 18/24] usb: gadget: udc: pxa27x_udc: Fix documentation for 'pxa27x_udc_start()'
Date:   Wed, 26 May 2021 14:00:31 +0100
Message-Id: <20210526130037.856068-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/gadget/udc/pxa27x_udc.c:1749: warning: expecting prototype for pxa27x_start(). Prototype was for pxa27x_udc_start() instead

Cc: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index ce57961dfd2d6..b2759b04b8e94 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -1730,7 +1730,7 @@ static void udc_enable(struct pxa_udc *udc)
 }
 
 /**
- * pxa27x_start - Register gadget driver
+ * pxa27x_udc_start - Register gadget driver
  * @g: gadget
  * @driver: gadget driver
  *
-- 
2.31.1

