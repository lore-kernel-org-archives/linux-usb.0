Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFCEC77B60
	for <linux-usb@archiver.kernel.org>; Fri, 31 Mar 2023 16:35:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbjCaQfh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 31 Mar 2023 12:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232489AbjCaQfR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Mar 2023 12:35:17 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02030270D;
        Fri, 31 Mar 2023 09:31:53 -0700 (PDT)
Received: from jupiter.universe (dyndsl-091-248-213-136.ewe-ip-backbone.de [91.248.213.136])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 9DC1A660319B;
        Fri, 31 Mar 2023 17:31:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1680280312;
        bh=OgfXjcXqHXqTd05i5CQ+3lxsgrg0XkVdWBGeN/xjGIU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L0lbLk3mBK++uQ6JciEPgHlSEIxoliXSjxMeUcnR4QB9l8UAoUZDeXKBO8hIGl1sy
         iidbD5SP8GcFfxbaXJ6TgkjApor6vfuOBvgqwBd3SXiqvXIjBvrnIp8xOsBZrbk11L
         apBoFYohIJ9AdTUiIQBxdE4EU+47JmEPZf7U9WHbLrlu+CDD46/MquSv/WcB3raMUZ
         1rF67S+tO3ged6313s6p0p1Djo/0eIl3utV35mRlvMIFpOHRHx215zGjfoNl7g2wFz
         D0Dhr6rebd2Qz9QOXAgr0aBGGZVXS5on/lBjmhYh8XJcfwiwVr0HYEYBu4hr14KfXb
         kmdbF9w0HyOKA==
Received: by jupiter.universe (Postfix, from userid 1000)
        id 65BF94807E2; Fri, 31 Mar 2023 18:31:50 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        kernel@collabora.com
Subject: [PATCHv1 1/2] dt-bindings: usb: generic-ohci: increase allowed clocks
Date:   Fri, 31 Mar 2023 18:31:47 +0200
Message-Id: <20230331163148.5863-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331163148.5863-1-sebastian.reichel@collabora.com>
References: <20230331163148.5863-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Increase number of allowed clocks to 4, which is the number
required on Rockchip RK3588.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index a9ba7257b884..c0880d0664f1 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -69,7 +69,7 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
     description: |
       In case the Renesas R-Car Gen3 SoCs:
         - if a host only channel: first clock should be host.
-- 
2.39.2

