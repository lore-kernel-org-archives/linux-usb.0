Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4892C433F5
	for <linux-usb@archiver.kernel.org>; Tue, 31 May 2022 14:09:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241285AbiEaOJA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 31 May 2022 10:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233187AbiEaOI6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 10:08:58 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75FEE64D10
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654006135; x=1685542135;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hMCWwQP9iH7tlvh+sKvPtISP7G0RTOClH/nUYLuVFss=;
  b=SA/2Ink0QdceOG65JGfngLTjWWAAk092wARmJvrrjqEQbhN49Qn+Aedu
   QJKP/XvhSmSK0BPZl7i5+UEbXh2S0myQUZO4YB7DQruU0XqhpFzB7u62H
   0HZF8JHsVWDqSoNqjmYG++dzkACpHRUzDBzEnrIUo1he+NqE7E5/fFoH0
   s=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 31 May 2022 07:08:52 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 07:08:51 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 07:08:51 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 07:08:49 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>,
        Michael Wu <michael@allwinnertech.com>,
        "John Keeping" <john@metanate.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 0/2] usb: f_fs: safe operation in ffs_epfile_io()
Date:   Tue, 31 May 2022 22:08:37 +0800
Message-ID: <1654006119-23869-1-git-send-email-quic_linyyuan@quicinc.com>
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

Fix two possible issue in ffs_epfile_io() when operation at blocking mode.

v1: https://lore.kernel.org/linux-usb/1653989775-14267-1-git-send-email-quic_linyyuan@quicinc.com/T/#m1b8ccbae36671f9d3662968567f95ef106b2b3f8
v2: correct interrupted variable according comment from John Keeping

Linyu Yuan (2):
  usb: gadget: f_fs: change ep->status safe in ffs_epfile_io()
  usb: gadget: f_fs: change ep->ep safe in ffs_epfile_io()

 drivers/usb/gadget/function/f_fs.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

-- 
2.7.4

