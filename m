Return-Path: <SRS0=CVr8=AR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6433DC433DF
	for <linux-usb@archiver.kernel.org>; Mon,  6 Jul 2020 13:10:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FE102063A
	for <linux-usb@archiver.kernel.org>; Mon,  6 Jul 2020 13:10:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=flameeyes.com header.i=@flameeyes.com header.b="EC3wUUDJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gaPwBHg9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729120AbgGFNKS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 6 Jul 2020 09:10:18 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:54101 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729048AbgGFNKS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:10:18 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id E44465C01BB;
        Mon,  6 Jul 2020 09:10:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 06 Jul 2020 09:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flameeyes.com;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
        Fy+EcY7StAyG32xMGFxIl8nckA4L8Q+wG3G1XWJFnTY=; b=EC3wUUDJg83SM4By
        GmZw6fPQYFtGAzQPWcCWge+se7mlYf0Mh1e3xRehaXdi64d1YItHYypDNjSPeaco
        UOYQ3y6oLsrIxAWzEzVDBHM1a5A51yTG1d9NRNC+FKRB1fk8d8q0zm3Rle1Ix+DM
        zl5bqrfWjR5DQ5CdxEXy9nL/5Sq2tBm5z2ltanC+sD309OC9i6X4NCW8jgA23KyS
        ZXr117wfJpuY6cj5uQC4w9NJ/lhsA5HpN2l1BVvYxeZmmuu6zgpTAQ7Uoev42DVx
        L0hFflFC46YzXmnyDuHDMN26dCCQaduYJ2F9oM+GMhDGAd4yF0qpGFn5Vmi7xdEE
        Lw3msg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=Fy+EcY7StAyG32xMGFxIl8nckA4L8Q+wG3G1XWJFn
        TY=; b=gaPwBHg9Wt9Gh2Hdo3ZTAxA1bTlHvVXO2g7aEAZboKJF9u/LLLc7BGgNM
        burAeUKY2N24Tjse1gEqRwnl5rmyNspF3QYmkAhLCwWHoFIpsjn3vkMFG7jVXRyq
        73CVKCw/Vx0vsAFzofq+jClRzV0i4ds65Am68ZxSiAoTE1QLwfaSRNz3UpEpf6pi
        Bf+tjzpXBRGs6Ku3/8sBB5fFDA7wGOOrfQrmjCtKvC4KKeTxSz3UmfnqRjSawBYf
        RHLQ8yBL0iAsldP6OdVt/q+8F7UtGlYZo56B8NGOVmQJXyCnRZZzu+4S+KXJxdg8
        jzESriRXGdXXrprOQp3zNpQdrxWtQ==
X-ME-Sender: <xms:uSIDXy0caXc8ncby61BfGm6yyWUbJMD4k8smSGWmYQabejJLm3W7lQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfgggtgfesthekre
    dtredtjeenucfhrhhomhepffhivghgohcugfhlihhoucfrvghtthgvnhpjuceofhhlrghm
    vggvhigvshesfhhlrghmvggvhigvshdrtghomheqnecuggftrfgrthhtvghrnhepleejgf
    dtueefhfeitefgueevvddtvdeifeeghedvgfdvleelkeelkeevvefhudeunecukfhppeek
    kedrleekrddvfeekrddufedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepfhhlrghmvggvhigvshesfhhlrghmvggvhigvshdrtghomh
X-ME-Proxy: <xmx:uSIDX1GJg46OTqDFjY1erhr3mU0i0REFinsRi2ddj2SRqHRkQsaSCw>
    <xmx:uSIDX66VbKdMlVJjPAaUSa5x1qpyw0dTwTh-luW9Wx4R5tYwScYKwg>
    <xmx:uSIDXz17Af0Y6C6rv6dgUQ-zHx-rlKh2H-OxQxPG1BTwPZ98xRL_bg>
    <xmx:uSIDX5T_3T6v_UEx5o9z-nXnaKOqWRcFS3XPqsISeuffkMVVqvnDnw>
Received: from localhost.localdomain (unknown [88.98.238.130])
        by mail.messagingengine.com (Postfix) with ESMTPA id E8163328006A;
        Mon,  6 Jul 2020 09:10:16 -0400 (EDT)
From:   =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@flameeyes.com>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@flameeyes.com>
Subject: [PATCH v3 1/2] Remove documentation line that adds nothing and sounds condescending.
Date:   Mon,  6 Jul 2020 14:10:13 +0100
Message-Id: <20200706131014.19064-1-flameeyes@flameeyes.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200705150225.21500-1-flameeyes@flameeyes.com>
References: <20200705150225.21500-1-flameeyes@flameeyes.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Diego Elio Pettenò <flameeyes@flameeyes.com>
---
 Documentation/usb/usbmon.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/usb/usbmon.rst b/Documentation/usb/usbmon.rst
index b0bd51080799..e9ec7e40b3bf 100644
--- a/Documentation/usb/usbmon.rst
+++ b/Documentation/usb/usbmon.rst
@@ -346,8 +346,6 @@ be polled with select(2) and poll(2). But lseek(2) does not work.
 
 * Memory-mapped access of the kernel buffer for the binary API
 
-The basic idea is simple:
-
 To prepare, map the buffer by getting the current size, then using mmap(2).
 Then, execute a loop similar to the one written in pseudo-code below::
 
-- 
2.27.0

