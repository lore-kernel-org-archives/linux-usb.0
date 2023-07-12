Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A2DEB64DD
	for <linux-usb@archiver.kernel.org>; Wed, 12 Jul 2023 23:59:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233306AbjGLX7M (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 12 Jul 2023 19:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233281AbjGLX7K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jul 2023 19:59:10 -0400
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15EDB1FF0;
        Wed, 12 Jul 2023 16:59:09 -0700 (PDT)
Received: from newone.lan (unknown [10.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 57387160644;
        Thu, 13 Jul 2023 01:59:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1689206347;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=HEQ/nBdhcKoJpT1GT432SOJlqlqCZC/w182rCJFbRqc=;
        b=Jwvxbfb3n3k/qzamA4faHig41Co4uy8auPUWzDCoCKLDwcs6jjZvZMFKGTxkBpInosjJV+
        1zkUfOK6Fn4KF/Z1/CqUMfZJOAB39YKOYLaZ8drwrh5VLWybY1bbkvPFrDxriWOslBaq5u
        3QTkMhuPCWR0OMOo2QzYKUdS1YiWQ2M=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: qcom,dwc3: document extcon property
Date:   Thu, 13 Jul 2023 01:59:02 +0200
Message-Id: <20230712235902.98557-1-david@ixit.cz>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver has support for it already. Only missing bit is dt-binding entry.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 4875c5b7d5b5..7099b583d21c 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -107,6 +107,10 @@ properties:
     minItems: 1
     maxItems: 4
 
+  extcon:
+    description:
+      Phandle to the extcon device providing the cable state.
+
   qcom,select-utmi-as-pipe-clk:
     description:
       If present, disable USB3 pipe_clk requirement.
-- 
2.40.1

