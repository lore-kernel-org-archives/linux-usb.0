Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DE9C433E0
	for <linux-usb@archiver.kernel.org>; Sat, 27 Mar 2021 19:15:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56D3D61951
	for <linux-usb@archiver.kernel.org>; Sat, 27 Mar 2021 19:15:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhC0TPY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Mar 2021 15:15:24 -0400
Received: from mail-oo1-f50.google.com ([209.85.161.50]:33636 "EHLO
        mail-oo1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbhC0TOy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Mar 2021 15:14:54 -0400
Received: by mail-oo1-f50.google.com with SMTP id i25-20020a4aa1190000b02901bbd9429832so2090077ool.0;
        Sat, 27 Mar 2021 12:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RJM2bVHCK7BxNIGpfIcjAjD1sJBOUOHW5fDFqBo6mGU=;
        b=FCfr5AYSKqT5b/nQLNHPIWPJHSU5+fQBrKdSqNiWhWjj6yX9bel2lNrjhbquBgyFs9
         rmIsmN4j0L/dADQTe+opXP46cF/X/oZi4UhwtTvbVrwwa+FGcwF0bFEpEZrNIhw3SUej
         XbodHKyPraOm8tInBy4t5gVhBUdMXvaP3lpJ1oPt6Sh9QrNdkpz794/j4KCIrADGiwxy
         7OPfsz5qjQmrxKev1qyzXbTtN7toi2y4b2nsmJSXU/4sX+sCARQgsocOxqrnBfGReCHd
         oRYH94Iiym4/A5JLCsbXFtg5mVqFAv9TrlOBK4NaISnl3vnM9VQ+oLZtDajW/WwapT43
         xMJQ==
X-Gm-Message-State: AOAM532HFLELFECQH8sclAmVP33GpjxXnC16RcCxq5BgC/gWXf4iN4Hw
        JK13bIX1uGt12Fun6ujtvw==
X-Google-Smtp-Source: ABdhPJxuVYP4PMMJrWg+7NZfyL/wCninyJW1DtmR9kRPcqdJGU+7CoadsQWAkRt9wBjvtuHifV5EaQ==
X-Received: by 2002:a4a:d513:: with SMTP id m19mr339295oos.92.1616872493395;
        Sat, 27 Mar 2021 12:14:53 -0700 (PDT)
Received: from localhost.localdomain ([172.58.99.41])
        by smtp.googlemail.com with ESMTPSA id k9sm3072686ots.24.2021.03.27.12.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 12:14:52 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: mediatek,mtu3: Use graph schema
Date:   Sat, 27 Mar 2021 14:14:48 -0500
Message-Id: <20210327191448.410795-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Users of the DT graph binding now should reference it for their 'port'
schemas, so add it for Mediatek MTU3 binding.

Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index f5c04b9d2de9..ca11a70ece7f 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -126,7 +126,7 @@ properties:
       Any connector to the data bus of this controller should be modelled
       using the OF graph bindings specified, if the "usb-role-switch"
       property is used. See graph.txt
-    type: object
+    $ref: /schemas/graph.yaml#/properties/port
 
   enable-manual-drd:
     $ref: /schemas/types.yaml#/definitions/flag
-- 
2.27.0

