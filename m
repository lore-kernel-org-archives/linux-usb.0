Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83180C63697
	for <linux-usb@archiver.kernel.org>; Mon, 16 Nov 2020 04:07:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17A32222C4
	for <linux-usb@archiver.kernel.org>; Mon, 16 Nov 2020 04:07:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SjhlmeeC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbgKPEHE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 15 Nov 2020 23:07:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbgKPEHE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Nov 2020 23:07:04 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192C8C0613CF;
        Sun, 15 Nov 2020 20:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=G0dfAfznZJzv/nBcCwxeSpzHAALeDcd4KyZc28j1+1U=; b=SjhlmeeCa3/0T1Ta5vBzs0wEEP
        EsNwXGl5nEA3fXU8O5O07bHdEfyKtOI/S1bTsjMFyeYTzY6qLTUbuOjyvQl9vj7lizWjfq8Fgpli5
        4LTqhh3zx97PQHXkNwQFKxj0kIxLgHynLQFHqwUAYMQX4RBc4659/d9RgGq30clg2lAXNVu3nsR6H
        m2rSGFL3MSz2I/7cAp2nP+qhFPSPRkQ8Q7vKjLGnpItYujXaPvgmAWNgx6AZp6kZfC5A17kNp1/Yf
        M5r3dClbDvvNCQrlGXzo3Xmax3I7FrSttvqKuLewHZBIf+zO/OMZy9jtTdPeKAx/8EbrQmw8e/7hU
        xDCC7UXA==;
Received: from [2601:1c0:6280:3f0::f32] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1keVn8-0003ZY-W0; Mon, 16 Nov 2020 04:06:59 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: typec: qcom-pmic-typec: fix builtin build errors
Date:   Sun, 15 Nov 2020 20:06:53 -0800
Message-Id: <20201116040653.7943-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix build errors when CONFIG_TYPEC_QCOM_PMIC=y and
CONFIG_USB_ROLE_SWITCH=m by limiting the former to =m when
USB_ROLE_SWITCH also =m.

powerpc64-linux-ld: drivers/usb/typec/qcom-pmic-typec.o: in function `.qcom_pmic_typec_remove':
qcom-pmic-typec.c:(.text+0x28): undefined reference to `.usb_role_switch_set_role'
powerpc64-linux-ld: qcom-pmic-typec.c:(.text+0x64): undefined reference to `.usb_role_switch_put'
powerpc64-linux-ld: drivers/usb/typec/qcom-pmic-typec.o: in function `.qcom_pmic_typec_check_connection':
qcom-pmic-typec.c:(.text+0x120): undefined reference to `.usb_role_switch_set_role'
powerpc64-linux-ld: drivers/usb/typec/qcom-pmic-typec.o: in function `.qcom_pmic_typec_probe':
qcom-pmic-typec.c:(.text+0x360): undefined reference to `.fwnode_usb_role_switch_get'
powerpc64-linux-ld: qcom-pmic-typec.c:(.text+0x4e4): undefined reference to `.usb_role_switch_put'

Fixes: 6c8cf3695176 ("usb: typec: Add QCOM PMIC typec detection driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Cc: Wesley Cheng <wcheng@codeaurora.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20201113.orig/drivers/usb/typec/Kconfig
+++ linux-next-20201113/drivers/usb/typec/Kconfig
@@ -88,6 +88,7 @@ config TYPEC_STUSB160X
 config TYPEC_QCOM_PMIC
 	tristate "Qualcomm PMIC USB Type-C driver"
 	depends on ARCH_QCOM || COMPILE_TEST
+	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
 	help
 	  Driver for supporting role switch over the Qualcomm PMIC.  This will
 	  handle the USB Type-C role and orientation detection reported by the
