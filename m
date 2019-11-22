Return-Path: <SRS0=/11T=ZO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D952C432C0
	for <linux-usb@archiver.kernel.org>; Fri, 22 Nov 2019 04:24:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E69E020704
	for <linux-usb@archiver.kernel.org>; Fri, 22 Nov 2019 04:24:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KWkzto2Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfKVEYz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 21 Nov 2019 23:24:55 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39585 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfKVEYz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Nov 2019 23:24:55 -0500
Received: by mail-pl1-f194.google.com with SMTP id o9so2563663plk.6
        for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2019 20:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vl/L3GceOHYxcg4cTV/C8OsBfxoa2/C+RjQ/F5C0XIo=;
        b=KWkzto2YidBehY5hy6CnYbfskxUqhiKN52tLynPMla94UhTtKFFQ67SOJ2g+PKqbjY
         HF6tZ8W2aqp+g6NR4dPAwwwB298tgN7Sr32qMNr/vNkHGYXuEMhm61vAHMvIJJk4en6a
         LOBdOYGyxlbDz0KvKvVIYxsiuJfH7LFYUu5aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vl/L3GceOHYxcg4cTV/C8OsBfxoa2/C+RjQ/F5C0XIo=;
        b=bpKx91IZIGYq0FcXF3xecXtOlwEmQqSkh+OpATOBjIxKF2lq9b2eVEMjmDgL+EKkQ7
         MkT0Rk+kug/+pl3nhWYUJDwPOpLteAXgEuoh3TQkB0pgvLMrOxnk5uWVun0PBv4ROQ7Q
         26079fsc4vGy5qgSYqypCGZyPtKtJ6HpeNQaRbwMmB59asfAy/gyi7NeL0ZuPPeMr7e8
         qcVAEcWa72CbMZ8g5a2NqyxYA+HPYBXQW/3HI6NbM65hYbtnqJ5hJ/hvC1RPay7NV6Ox
         OgUgdAIHEAQT+FoVpn/aJcI1lkxtAZEbULshawdrY4f2vz8cRiq0JnAOPIsEFfgdy9dY
         /jeQ==
X-Gm-Message-State: APjAAAUNckq8qXC7TDm5HyDL8TqNG17SZICVZYw6VPdRy6De4WRNszNw
        eY4gPcgIqIfIG99rIx99jm9AiA==
X-Google-Smtp-Source: APXvYqzR7Pewj2r6dUUfOv/6ROcwoWzNzrYgFMIJzyy+mJ8KW5vjsie2VAtXyT5q+9mmayBamWqEKw==
X-Received: by 2002:a17:90a:86c3:: with SMTP id y3mr16294373pjv.102.1574396694254;
        Thu, 21 Nov 2019 20:24:54 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id x203sm4812869pgx.61.2019.11.21.20.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 20:24:53 -0800 (PST)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     devicetree@vger.kernel.org
Cc:     GregKroah-Hartman <gregkh@linuxfoundation.org>,
        RobHerring <robh+dt@kernel.org>,
        MarkRutland <mark.rutland@arm.com>,
        AlanStern <stern@rowland.harvard.edu>,
        SuwanKim <suwan.kim027@gmail.com>,
        "GustavoA . R . Silva" <gustavo@embeddedor.com>,
        IkjoonJang <ikjn@chromium.org>, JohanHovold <johan@kernel.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        drinkcat@chromium.org
Subject: [PATCH v3 1/2] dt-bindings: usb: add "hub,interval" property
Date:   Fri, 22 Nov 2019 12:24:49 +0800
Message-Id: <20191122042449.205621-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add "hub,interval" property to usb-device, so hub device can override
endpoint descriptor's bInterval.

When we know reducing autosuspend delay for built-in HIDs is better for
power saving, we can reduce it to the optimal value. But if a parent hub
has a long bInterval, mouse lags a lot from more frequent autosuspend.
So this enables overriding bInterval for a hard wired hub device only
when we know that reduces the power consumption.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
 Documentation/devicetree/bindings/usb/usb-device.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
index 036be172b1ae..44bef2ff2704 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.txt
+++ b/Documentation/devicetree/bindings/usb/usb-device.txt
@@ -66,6 +66,9 @@ Required properties for host-controller nodes with device nodes:
 - #size-cells: shall be 0
 
 
+Optional properties for hub nodes
+- hub,interval: bInterval of status change endpoint. The range is 1-255.
+
 Example:
 
 &usb1 {	/* host controller */
@@ -75,6 +78,7 @@ Example:
 	hub@1 {		/* hub connected to port 1 */
 		compatible = "usb5e3,608";
 		reg = <1>;
+		hub,interval = <8>;
 	};
 
 	device@2 {	/* device connected to port 2 */
-- 
2.24.0.432.g9d3f5f5b63-goog

