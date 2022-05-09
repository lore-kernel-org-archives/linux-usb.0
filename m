Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FF5C433F5
	for <linux-usb@archiver.kernel.org>; Mon,  9 May 2022 11:55:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233473AbiEIL7A (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 9 May 2022 07:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233367AbiEIL64 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 07:58:56 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D7C81FB559
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652097302; x=1683633302;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D8FdH0eOncKJZmF5aLzw7K9L9KQbEA7+Zv/MiJdRx2A=;
  b=tchMPdA5+chhzdy8foQcQD10CT3HbSzpUy4Uz49MoWqyxZqBoRU85BEP
   R+OkrPEVWeBkZqaAz2o4rl05dnWINPB8lX2vHD9Gx9FBLBTwUBBmGzWWL
   nWILRmdsdtJXiVUw2RRRK5CFkLgg1LJs39Nhk+ItzIz8Vqox7g2wvo9Qx
   E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 09 May 2022 04:55:01 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 04:55:00 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 04:55:00 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 04:54:58 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 0/4] usb: gadget: update DECLARE_USB_FUNCTION(_INIT) macro
Date:   Mon, 9 May 2022 19:54:44 +0800
Message-ID: <1652097288-19909-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

this allow generate better function and variable name,
no function change.

v1: only change the macros
v2: fix f_sourcesink.c build issue report by kernel test robot <lkp@intel.com>
v3: fix f_tcm.c build issue report by kernel test robot <lkp@intel.com>,
    fix comment from Greg,
    clean some code of f_sourcesink.c.

thanks to kernel test robot <lkp@intel.com>.

Linyu Yuan (4):
  usb: gadget: f_mass_storage: fix warning of
    -Werror=unused-but-set-variable
  usb: gadget: f_sourcesink: use DECLARE_USB_FUNCTION_INIT()
  usb: gadget: f_loopback: use DECLARE_USB_FUNCTION_INIT() macro
  usb: gadget: add '_' in DECLARE_USB_FUNCTION(_INIT) macros

 drivers/usb/gadget/function/f_loopback.c     | 12 +-----------
 drivers/usb/gadget/function/f_mass_storage.c |  2 +-
 drivers/usb/gadget/function/f_sourcesink.c   | 22 +---------------------
 drivers/usb/gadget/function/f_tcm.c          |  6 +++---
 drivers/usb/gadget/function/g_zero.h         |  3 ---
 include/linux/usb/composite.h                | 14 +++++++-------
 6 files changed, 13 insertions(+), 46 deletions(-)

-- 
2.7.4

