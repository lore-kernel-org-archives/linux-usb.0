Return-Path: <SRS0=3jNv=3E=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02CCC33CB1
	for <linux-usb@archiver.kernel.org>; Wed, 15 Jan 2020 12:41:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 826D0214AF
	for <linux-usb@archiver.kernel.org>; Wed, 15 Jan 2020 12:41:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="dWPel/yW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgAOMlA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 15 Jan 2020 07:41:00 -0500
Received: from aer-iport-1.cisco.com ([173.38.203.51]:21314 "EHLO
        aer-iport-1.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgAOMlA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 07:41:00 -0500
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Jan 2020 07:40:59 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1610; q=dns/txt; s=iport;
  t=1579092059; x=1580301659;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aRG6Mvhhkx841M802BVUu4RpDXt3XjDAd9oCXEtLuRs=;
  b=dWPel/yW6ZtONj+9hFzUduNLcfq5M0K/gMjasxdirc68ljIJSL+8cuFJ
   i2phMyEjp2gEm8myisfLFbD7V75edpskNEFXFLzL6lRc7SUHA0osdNB1r
   ebYkiYE8WmCQZ/+udm4d731Z2WXssTK60tfWjGMmfB7EtqLLVmWRsTxyC
   4=;
X-IronPort-AV: E=Sophos;i="5.70,322,1574121600"; 
   d="scan'208";a="21831667"
Received: from aer-iport-nat.cisco.com (HELO aer-core-4.cisco.com) ([173.38.203.22])
  by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 15 Jan 2020 12:33:51 +0000
Received: from localhost.rd.cisco.com ([10.47.76.148])
        by aer-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id 00FCXoHd008119;
        Wed, 15 Jan 2020 12:33:51 GMT
From:   Johan Korsnes <jkorsnes@cisco.com>
To:     linux-usb@vger.kernel.org
Cc:     Johan Korsnes <jkorsnes@cisco.com>,
        Armando Visconti <armando.visconti@st.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH 1/2] HID: core: fix off-by-one memset in hid_report_raw_event()
Date:   Wed, 15 Jan 2020 13:33:43 +0100
Message-Id: <20200115123344.4650-1-jkorsnes@cisco.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.76.148, [10.47.76.148]
X-Outbound-Node: aer-core-4.cisco.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case a report is greater than HID_MAX_BUFFER_SIZE it is truncated,
but the report-number byte is not correctly handled. This results in a
off-by-one in the following memset, causing a kernel Oops and ensuing
system crash.

Note: With commit 8ec321e96e05 ("HID: Fix slab-out-of-bounds read in
hid_field_extract") I no longer hit the kernel Oops as we instead fail
"controlled" at probe if there is a report too long in the HID
report descriptor. I still believe this is worth fixing though, as
hid_report_raw_event() should have its logic correct. But if we fail at
probe for too large reports, a better solution might be to remove this
truncation logic entirely.

Fixes: 966922f26c7f ("HID: fix a crash in hid_report_raw_event()
                     function.")
Signed-off-by: Johan Korsnes <jkorsnes@cisco.com>
Cc: Armando Visconti <armando.visconti@st.com>
Cc: Jiri Kosina <jkosina@suse.cz>
Cc: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/hid/hid-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 851fe54ea59e..359616e3efbb 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1741,7 +1741,9 @@ int hid_report_raw_event(struct hid_device *hid, int type, u8 *data, u32 size,
 
 	rsize = ((report->size - 1) >> 3) + 1;
 
-	if (rsize > HID_MAX_BUFFER_SIZE)
+	if (report_enum->numbered && rsize >= HID_MAX_BUFFER_SIZE)
+		rsize = HID_MAX_BUFFER_SIZE - 1;
+	else if (rsize > HID_MAX_BUFFER_SIZE)
 		rsize = HID_MAX_BUFFER_SIZE;
 
 	if (csize < rsize) {
-- 
2.24.1

