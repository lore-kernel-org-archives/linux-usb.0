Return-Path: <SRS0=9XAl=DQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D469DC433E7
	for <linux-usb@archiver.kernel.org>; Fri,  9 Oct 2020 14:41:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0E3F222BA
	for <linux-usb@archiver.kernel.org>; Fri,  9 Oct 2020 14:41:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388818AbgJIOlF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 9 Oct 2020 10:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388707AbgJIOlE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Oct 2020 10:41:04 -0400
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 827F0C0613D5;
        Fri,  9 Oct 2020 07:41:04 -0700 (PDT)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94)
        (envelope-from <benjamin@sipsolutions.net>)
        id 1kQtZs-002KHD-Ot; Fri, 09 Oct 2020 16:41:01 +0200
From:   Benjamin Berg <benjamin@sipsolutions.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, Benjamin Berg <bberg@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 1/2] usb: typec: ucsi: acpi: Always decode connector change information
Date:   Fri,  9 Oct 2020 16:40:46 +0200
Message-Id: <20201009144047.505957-2-benjamin@sipsolutions.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201009144047.505957-1-benjamin@sipsolutions.net>
References: <20201009144047.505957-1-benjamin@sipsolutions.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Benjamin Berg <bberg@redhat.com>

Normal commands may be reporting that a connector has changed. Always
call the usci_connector_change handler and let it take care of
scheduling the work when needed.
Doing this makes the ACPI code path identical to the CCG one.

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Benjamin Berg <bberg@redhat.com>
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index fbfe8f5933af..04976435ad73 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -103,11 +103,12 @@ static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
 	if (ret)
 		return;
 
+	if (UCSI_CCI_CONNECTOR(cci))
+		ucsi_connector_change(ua->ucsi, UCSI_CCI_CONNECTOR(cci));
+
 	if (test_bit(COMMAND_PENDING, &ua->flags) &&
 	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
 		complete(&ua->complete);
-	else if (UCSI_CCI_CONNECTOR(cci))
-		ucsi_connector_change(ua->ucsi, UCSI_CCI_CONNECTOR(cci));
 }
 
 static int ucsi_acpi_probe(struct platform_device *pdev)
-- 
2.26.2

