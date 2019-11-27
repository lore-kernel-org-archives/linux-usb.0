Return-Path: <SRS0=g+oQ=ZT=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45637C432C0
	for <linux-usb@archiver.kernel.org>; Wed, 27 Nov 2019 21:19:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12AEC216F4
	for <linux-usb@archiver.kernel.org>; Wed, 27 Nov 2019 21:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="g8mGxjIE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbfK0VTu (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 27 Nov 2019 16:19:50 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:39526 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727303AbfK0VTs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Nov 2019 16:19:48 -0500
X-Greylist: delayed 545 seconds by postgrey-1.27 at vger.kernel.org; Wed, 27 Nov 2019 16:19:48 EST
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 59E7E423C5;
        Wed, 27 Nov 2019 21:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1574889043; bh=8GexeTKdrJVGUozw9tp34nM+7HL1tTaIP6RQMWGkyWM=;
        h=Date:From:Subject:To:Cc:From;
        b=g8mGxjIETzgoHoPpeATQD+H8V5GfnrxjLW+dpee3/bb3mAFrVshyLQhyLcgZejALX
         rCftaVNTcpEuCu9LiUPIxuDArs/ALsGJNhzi+IyFsERRvASrw6aOuiP/3SQjEQabVY
         s0Ky+FlXCjQcYEeczyhwAbcUfx9udDkluNaO5v2xQsPMBrmtENoWc72niQ/v5y87WS
         qZv+g3vYCSQZMSBuldocwgMTKB+dollEmt2NiNmhDFq7Xt2844TjwDi71SWglCmKVS
         7B18hayHZ7Bx2FxFakgeaoRSLN58alwTSTkG9nCotno+N1BPquY0FOF4k2pSiqEJ7L
         xE/LyTgeHYQ8g==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id AEFBEA006D;
        Wed, 27 Nov 2019 21:10:41 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 27 Nov 2019 13:10:41 -0800
Date:   Wed, 27 Nov 2019 13:10:41 -0800
Message-Id: <cover.1574888929.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 0/2] usb: dwc3: gadget: Fix END_TRANSFER handling
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>, stable@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series adds a couple of fixes related to handling
END_TRANSFER command.



Thinh Nguyen (2):
  usb: dwc3: gadget: Clear started flag for non-IOC
  usb: dwc3: ep0: Clear started flag on completion

 drivers/usb/dwc3/ep0.c    | 8 ++++++++
 drivers/usb/dwc3/gadget.c | 3 +++
 2 files changed, 11 insertions(+)

-- 
2.11.0

