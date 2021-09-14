Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA30C433EF
	for <linux-usb@archiver.kernel.org>; Tue, 14 Sep 2021 14:34:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38804610CE
	for <linux-usb@archiver.kernel.org>; Tue, 14 Sep 2021 14:34:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233584AbhINOgI (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 14 Sep 2021 10:36:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:57442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233856AbhINOeJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Sep 2021 10:34:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD2C96121D;
        Tue, 14 Sep 2021 14:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631629970;
        bh=0VhIU7oIW19mqtxZEKsJZTHlixOevr7iBll8y7c2BTg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XbeK0VC+l2SkgW03upKsvRJE39T0pqT2/VBXEJmCHnpC7CHgRNW20n4nK1IZRGPcy
         iEfrkYaDQlfd5vMjCZZyMa35AWT5FP9SgoE2aHAUL8cgiWacOa2EsBXRBIw0m6NdNB
         Ln4DK2d5GRa8gZpiGco85+lVmhYE1hThOBmwCaarcNa0vHa8DcyTer/AnOfdvHtutE
         8y8NrtWmtH0j0pcFv9RcYMNknRBeBxtK71A0Is/z5zvDpUspkbiWDB6SDA745okEGC
         AFkrFQDiocmrCR+tyW28uXpYMh+QlHmJMmFsESVHPy/l+OiyeOci7zuelsxxXR8c+Y
         p69wxfmSWmsJw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQ9UN-000Kku-RE; Tue, 14 Sep 2021 16:32:47 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v2 11/29] ABI: sysfs-class-typec: fix a bad What field
Date:   Tue, 14 Sep 2021 16:32:26 +0200
Message-Id: <3284da746c7f2bf7c120913a35db51cc5650e2ea.1631629496.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631629496.git.mchehab+huawei@kernel.org>
References: <cover.1631629496.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The <partner> wildcard is missing the '<' character. Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/sysfs-class-typec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 40122d915ae1..c09add32e596 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -200,7 +200,7 @@ Description:	USB Power Delivery Specification defines a set of product types
 		amc			Alternate Mode Controller
 		======================  ==========================
 
-What:		/sys/class/typec/<port>-partner>/identity/
+What:		/sys/class/typec/<port>-<partner>/identity/
 Date:		April 2017
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
-- 
2.31.1

