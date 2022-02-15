Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FEDC433EF
	for <linux-usb@archiver.kernel.org>; Tue, 15 Feb 2022 12:32:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233701AbiBOMcS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 15 Feb 2022 07:32:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbiBOMcR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Feb 2022 07:32:17 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27DC107D33
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 04:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644928327; x=1676464327;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AqR/TPqk05nOxAoGU6Ow1U5NOF6xyOqMY3woSH3O1hE=;
  b=E1p5D5SMGtAvA3lMztJmynOEF9B4faAoqtyoFw7UZ/lH1vzBVJTkf4Zk
   bBtUqeBQt2G2riVDypIcYqNLYe19/nmfAPxrlpRY+/Y2XHtzHA97dTB7J
   7t7VuGAloorA+KCq8cQZayjDfs0srwOYtpJ227UlgE9b1Qnqctm0Hdq5w
   K31XGmm5XM0wxT/MJBdafyljvbENh2YbayeHUl29Yyv2jZ2gfK1ox79/e
   OpNKoKa6gypvynKsp9KJ3DuruFW6H0hC3guUTTrAdL0H6Cr5+kbhi5uFG
   IVwPP5JV9PzSo0ZYHkDhdhBsWX9/a6u8w0txwSjDwBAbRqq7CSz9TR0Jd
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="250082431"
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; 
   d="scan'208";a="250082431"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 04:32:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; 
   d="scan'208";a="703641728"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 15 Feb 2022 04:32:05 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/2] xhci fixes for usb-linus
Date:   Tue, 15 Feb 2022 14:33:18 +0200
Message-Id: <20220215123320.1253947-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A couple small xhci fixes for usb-linus

Add Host controller error (HCE) to the list of reasons to reset the host
during resume.
Also make sure we don't change the error value returned if URB submission
fails.

Thanks
-Mathias


Hongyu Xie (1):
  xhci: Prevent futile URB re-submissions due to incorrect return value.

Puma Hsu (1):
  xhci: re-initialize the HC during resume if HCE was set

 drivers/usb/host/xhci.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

-- 
2.25.1

