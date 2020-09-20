Return-Path: <SRS0=Hokh=C5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CADC433DB
	for <linux-usb@archiver.kernel.org>; Sun, 20 Sep 2020 00:19:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F37621582
	for <linux-usb@archiver.kernel.org>; Sun, 20 Sep 2020 00:19:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKh2MwB7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgITATE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 19 Sep 2020 20:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbgITATE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Sep 2020 20:19:04 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2D9C0613CE;
        Sat, 19 Sep 2020 17:19:03 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id j11so13015641ejk.0;
        Sat, 19 Sep 2020 17:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5yaT5gZZGJLhXLmT2L9V2Hy/ARWeh+FAUBV0QnUx2j0=;
        b=OKh2MwB7YAnunkLwi9mBwWSPlaCMF2V4O40fHFkSKo0sUpoEoGINQ3wJXUMz7HrHZn
         MqbfAV8Qmo3UMJyhdoJf8Dpgmb4ExMaPHDfE2z6U34vlVIz/FrvOxeltI5sNJqD8wAe/
         3jW7JZ6TX0eZSTcWgiTFST0mqiHGaBd+9RNhFIAq6VCUPeQtUrrN6WByeZeTzNuvLKKe
         jGI4WMSiltp/NV4QpFIkrTCKWr5umucs50HSpKa1shqznnYPVGN1l7wdNgVVEJZD9aT6
         neIyXUNaLrB048snOOWnskYXA0vHMMOGD/R6pkPP+lts67U97bC/h2ThNDoyZJiZFA/F
         uQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5yaT5gZZGJLhXLmT2L9V2Hy/ARWeh+FAUBV0QnUx2j0=;
        b=iqFj6tgdglhGs6WVrBayYiBo8HNrbjU5t7lq8m27znT8X5VPamaTlDpJJqbJTQrRfH
         +V3CX1FPrsUoBCnc2jtcXssb3OBgiLqPYJb5NQGCup2YnJP+Wcq81myidXB1gLZIlCdB
         p+oRz9InFgQMZsr7a26XQUP6d6HxpraloqUqwAfHlMAiUDJbhQjZhBfINOxoj3+urKvw
         ZI2RP7acytprU/+1VCOjQmMO587TbUq/rxKGCoEMSqkdI7426VqbcJmX0tD3JHeynw+o
         pz+gfa6gs8dMHekLXeiX47bmWExa1FIHt8VT8Tkv4v7n6i0Fx/CkrwPixMkGX6cbRrY9
         Tvlg==
X-Gm-Message-State: AOAM533GyDlzIPtMGriBcigeQorNSM/Pe/5zbL5I0h4bR94yY/e93F+A
        nDuimhkqu04aTQnvhTSPoHs=
X-Google-Smtp-Source: ABdhPJzJrK3cKu/ge/dvWRohSexRPJbhGwDuFT805kDgJfQVKW04vd0cTvmAyqeJqlfMt493XlFP1w==
X-Received: by 2002:a17:906:e88:: with SMTP id p8mr45339836ejf.134.1600561142056;
        Sat, 19 Sep 2020 17:19:02 -0700 (PDT)
Received: from debian64.daheim (p4fd09180.dip0.t-ipconnect.de. [79.208.145.128])
        by smtp.gmail.com with ESMTPSA id i3sm5570067edn.55.2020.09.19.17.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2020 17:19:01 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.94)
        (envelope-from <chunkeey@gmail.com>)
        id 1kJn49-000s3p-Dv; Sun, 20 Sep 2020 02:18:53 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>
Subject: [PATCH v1 1/2] dt-bindings: usb: dwc2: add support for APM82181 SoCs USB OTG HS and FS
Date:   Sun, 20 Sep 2020 02:18:49 +0200
Message-Id: <a43868b06566f5d959d8cfc4e763bede2885931a.1600560884.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

adds the specific compatible string for the DWC2 IP found in the APM82181
SoCs. The APM82181's USB-OTG seems like it was taken from its direct
predecessor: the PPC460EX (canyonlands).

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index ffa157a0fce7..34ddb5c877a1 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -39,6 +39,7 @@ properties:
               - amlogic,meson-g12a-usb
           - const: snps,dwc2
       - const: amcc,dwc-otg
+      - const: apm,apm82181-dwc-otg
       - const: snps,dwc2
       - const: st,stm32f4x9-fsotg
       - const: st,stm32f4x9-hsotg
-- 
2.28.0

