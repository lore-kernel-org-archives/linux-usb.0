Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3F6C6FD1C
	for <linux-usb@archiver.kernel.org>; Mon, 13 Mar 2023 03:06:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjCMDGj (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 12 Mar 2023 23:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjCMDGf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Mar 2023 23:06:35 -0400
Received: from mail-m11879.qiye.163.com (mail-m11879.qiye.163.com [115.236.118.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB8FA2748B;
        Sun, 12 Mar 2023 20:06:33 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11879.qiye.163.com (Hmail) with ESMTPA id 698DA6804CF;
        Mon, 13 Mar 2023 10:58:44 +0800 (CST)
From:   Frank Wang <frank.wang@rock-chips.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, heiko@sntech.de
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, huangtao@rock-chips.com,
        william.wu@rock-chips.com, jianwei.zheng@rock-chips.com,
        yubing.zhang@rock-chips.com, wmc@rock-chips.com,
        Frank Wang <frank.wang@rock-chips.com>
Subject: [PATCH 0/4] Fix some defects related Type-C TCPM
Date:   Mon, 13 Mar 2023 10:58:39 +0800
Message-Id: <20230313025843.17162-1-frank.wang@rock-chips.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkkfGlZJT0pKQhhMGhoaH0NVEwETFh
        oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSkpLSEpMVUpLS1VLWQ
        Y+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NjI6Sww5Nz0USC8BEBE9TzA1
        SglPCilVSlVKTUxDTUxNSElOSUlDVTMWGhIXVR0JGhUQVQwaFRw7CRQYEFYYExILCFUYFBZFWVdZ
        EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKTE9LNwY+
X-HM-Tid: 0a86d8e7f1992eb5kusn698da6804cf
X-HM-MType: 1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series fix some defects of TCPM like port reset error, SVIDs
discover error and etc.

Tested on Rockchip EVB board integrated with FUSB302 or HUSB311 Type-C
controller.

Frank Wang (4):
  usb: typec: tcpm: fix cc role at port reset
  usb: typec: tcpm: fix multiple times discover svids error
  usb: typec: tcpm: add get max power support
  usb: typec: tcpm: fix source caps may lost after soft reset

 drivers/usb/typec/tcpm/tcpm.c | 53 +++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 6 deletions(-)

-- 
2.17.1

