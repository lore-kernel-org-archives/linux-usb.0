Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A040C4320A
	for <linux-usb@archiver.kernel.org>; Sun,  8 Aug 2021 12:39:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD62160F39
	for <linux-usb@archiver.kernel.org>; Sun,  8 Aug 2021 12:39:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbhHHMkH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 8 Aug 2021 08:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbhHHMkG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Aug 2021 08:40:06 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050::465:202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C970C061760;
        Sun,  8 Aug 2021 05:39:47 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4GjJh12yzGzQk21;
        Sun,  8 Aug 2021 14:39:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001;
        t=1628426383;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vSXYURrU3J7OncJl8RWnabghsuEIsLwm4iQPOfAaK6M=;
        b=SymtR4QvMovDV0m1yXQIi7vVmjljQEmTnS2GYPqk7fcuZ+Sj1bpBUDKH1ECxLrFSUtACsW
        quEINsmIjVgSOENUd9Vg32JGGDWQrK9Ys3ZnEKJFVZB01xd67Ac8ZTo4od6kOkgjAzdgOM
        kXVFx6+eOh1OK+SK9ZPS3Zkan+dG2Q3qn5gfZDFKRZ72ETTabgI2iAqN+7Kr/nui98wZgt
        dChaTTEozzJU9zno6/j8V2t+NklVw5sejJee9XxuTmsPefDntzNNFBk8No6MxVhbX6/gTd
        x2uyCXJpm2tBSbVH3RtyPDS1pItiJJwT528w/slibjILK0GT9xwcXns68sIbqw==
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
        with ESMTP id VZg91b7EB8Ws; Sun,  8 Aug 2021 14:39:42 +0200 (CEST)
From:   Sungbo Eo <mans0n@gorani.run>
To:     linux-mediatek@lists.infradead.org
Cc:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Min Guo <min.guo@mediatek.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Sungbo Eo <mans0n@gorani.run>
Subject: [PATCH v2 1/2] dt-bindings: usb: mtk-musb: add MT7623 compatible
Date:   Sun,  8 Aug 2021 21:38:39 +0900
Message-Id: <20210808123840.176738-2-mans0n@gorani.run>
In-Reply-To: <20210808123840.176738-1-mans0n@gorani.run>
References: <20210803151320.71531-1-mans0n@gorani.run>
 <20210808123840.176738-1-mans0n@gorani.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 72E40189C
X-Rspamd-UID: 07e247
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Document MT7623 compatible for mtk-musb.

Signed-off-by: Sungbo Eo <mans0n@gorani.run>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
v2:
* add reviewed by Matthias
---
 Documentation/devicetree/bindings/usb/mediatek,musb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
index 84ddacfdbe9b..03d62d60ce5f 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - mediatek,mt8516-musb
           - mediatek,mt2701-musb
+          - mediatek,mt7623-musb
       - const: mediatek,mtk-musb
 
   reg:
-- 
2.32.0

