Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A323C7618A
	for <linux-usb@archiver.kernel.org>; Mon, 20 Mar 2023 10:08:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbjCTKIr (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 20 Mar 2023 06:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjCTKIY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Mar 2023 06:08:24 -0400
Received: from mail-m11879.qiye.163.com (mail-m11879.qiye.163.com [115.236.118.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3CCD252A3;
        Mon, 20 Mar 2023 03:07:56 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11879.qiye.163.com (Hmail) with ESMTPA id 19B9D6801EE;
        Mon, 20 Mar 2023 18:07:13 +0800 (CST)
From:   Frank Wang <frank.wang@rock-chips.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, heiko@sntech.de
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, huangtao@rock-chips.com,
        william.wu@rock-chips.com, jianwei.zheng@rock-chips.com,
        yubing.zhang@rock-chips.com, wmc@rock-chips.com,
        Frank Wang <frank.wang@rock-chips.com>
Subject: [PATCH v2 0/3] Fix some defects related Type-C TCPM
Date:   Mon, 20 Mar 2023 18:07:08 +0800
Message-Id: <20230320100711.3708-1-frank.wang@rock-chips.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0MdTVZITkIfGEodGkpCGUpVEwETFh
        oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSkpLSEpMVUpLS1VLWQ
        Y+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MAw6GQw6Mz0RFxEzIzw3GFEB
        A1EKCghVSlVKTUxCSEtNQ0hIQ0JNVTMWGhIXVR0JGhUQVQwaFRw7CRQYEFYYExILCFUYFBZFWVdZ
        EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKQ0lONwY+
X-HM-Tid: 0a86fe7cbde52eb5kusn19b9d6801ee
X-HM-MType: 1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series fix some defects of TCPM like port reset error, SVIDs
discover error and etc.

Tested on Rockchip EVB board integrated with FUSB302 or HUSB311 Type-C
controller.

Changes in v2:
 - Make some tweaking based on Guenter and Heikki's comments for [PATCH 1/3] and [PATCH 2/3].
 - Abandon [PATCH 4/4] in v1.

Frank Wang (3):
  usb: typec: tcpm: fix cc role at port reset
  usb: typec: tcpm: fix multiple times discover svids error
  usb: typec: tcpm: add get max power support

 drivers/usb/typec/tcpm/tcpm.c | 43 +++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

-- 
2.17.1

