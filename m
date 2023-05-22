Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C055C7EE2E
	for <linux-usb@archiver.kernel.org>; Mon, 22 May 2023 16:30:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbjEVQ3u (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 22 May 2023 12:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232739AbjEVQ3o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 May 2023 12:29:44 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECFFBE9;
        Mon, 22 May 2023 09:29:42 -0700 (PDT)
Received: from jupiter.universe (dyndsl-091-248-208-162.ewe-ip-backbone.de [91.248.208.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E9BA6606E6C;
        Mon, 22 May 2023 17:29:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1684772981;
        bh=0urNWz7mMhMsKpDQYbBX0PiKNPzp7YARQwGpKuF6yjg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HeEnHndkbhXAMgTvkCMKd59pduF/rqtgAbi12tyL5aueZMUodnS6h/fr+0XLMNc+v
         AdN10xrdsv6k54d3jIHYqXZABTHBsLELoiX1F4YFLSAGN8UxK7qZo9EAu4Nh1ATkUM
         gcEglVMVrTbsNCfeoq/usutmGM+7UI0f9sc9nxV09ekQbvUqMXs4iUV/eP5kiUZJpd
         vU31x4YK2/qFPn9WPtuHeSCfG3F6/pfITi7++dXe7C7s2y4mmjsLO4A8cCLQgMfUd9
         rPDYeKyprPPJ0anGNe73O7yT4CLqs8cCepF36WaZb+hZt9EKxINfW/qr2idoy9NGZW
         3aIzkpw2Ui0Xg==
Received: by jupiter.universe (Postfix, from userid 1000)
        id F2FE34807E1; Mon, 22 May 2023 18:29:37 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        kernel@collabora.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 2/3] dt-bindings: usb: Add RK3588 EHCI
Date:   Mon, 22 May 2023 18:29:36 +0200
Message-Id: <20230522162937.53190-3-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522162937.53190-1-sebastian.reichel@collabora.com>
References: <20230522162937.53190-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add compatible for RK3588 EHCI. As far as I know it's fully
compatible with generic-ehci.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 9445764bd8de..b956bb5fada7 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -61,6 +61,7 @@ properties:
               - ibm,476gtr-ehci
               - nxp,lpc1850-ehci
               - qca,ar7100-ehci
+              - rockchip,rk3588-ehci
               - snps,hsdk-v1.0-ehci
               - socionext,uniphier-ehci
           - const: generic-ehci
-- 
2.39.2

