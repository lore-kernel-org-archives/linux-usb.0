Return-Path: <SRS0=QlPk=5P=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4349FC43331
	for <linux-usb@archiver.kernel.org>; Mon, 30 Mar 2020 00:09:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1468D20784
	for <linux-usb@archiver.kernel.org>; Mon, 30 Mar 2020 00:09:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OUxU6Dh2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgC3AJz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 29 Mar 2020 20:09:55 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:54052 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726403AbgC3AJz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Mar 2020 20:09:55 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AB0EC43B10;
        Mon, 30 Mar 2020 00:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585526994; bh=Aj0XkZcZj2+klVG3AESjmKd3IGlywrH4F8sa3AXu5zM=;
        h=Date:From:Subject:To:Cc:From;
        b=OUxU6Dh2faTpBPoyLYlVoClwFrxiIlp56bHOemA6nLELlIgqSigFSdpq00ia8caTl
         x5jdbAtxSCF3r60HzfdsHoyHw+Z9zDXgUU/6ErRZijqSTb5ypyv9t2x311eoD/Jq4Y
         xlY+8X+JF0mSf6RHy4qw+E8YeFXL01zm8u7DcmiLQme+WX3fVGz4ZuuFuHShmbUj5G
         KYiMRbioPdwmsU2uNb2/JE7DO8xQaHFZroLdiGBIj3aNqsTtqWizgq4KUvl3sRWeEb
         4BiKF7nK1QXzG5ut3Vz8sDYqWurauhif456YWtaExBjhyJ6NJHBBGRAcH2zRHYkwqV
         lUzJmpdeaQjsw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 65A53A006D;
        Mon, 30 Mar 2020 00:09:53 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Sun, 29 Mar 2020 17:09:53 -0700
Date:   Sun, 29 Mar 2020 17:09:53 -0700
Message-Id: <cover.1585526614.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 0/2] usb: dwc3: gadget: Default mode for DRD
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DWC3 just learned to use the DRD role-switch API. If the driver is configured
to use it, then delegate its default mode selection to the drd role-switch
code-path. Also, make sure not to free non-existing OTG irq.




Thinh Nguyen (2):
  usb: dwc3: drd: Don't free non-existing irq
  usb: dwc3: core: Use role-switch default dr_mode

 drivers/usb/dwc3/core.c | 2 ++
 drivers/usb/dwc3/drd.c  | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.11.0

