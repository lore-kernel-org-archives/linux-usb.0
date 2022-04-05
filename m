Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5542FC433FE
	for <linux-usb@archiver.kernel.org>; Tue,  5 Apr 2022 23:26:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbiDEXEP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 5 Apr 2022 19:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442918AbiDEPik (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Apr 2022 11:38:40 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F06F8445
        for <linux-usb@vger.kernel.org>; Tue,  5 Apr 2022 06:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649166829; x=1680702829;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1YO+OXyrjMidY3rK/meaulb3J1EfqjF6czt6HhO/u1E=;
  b=Jd2QGC5APb1iJ01ZhRU33g5pebqMScKnsj0qkKhgUluUnrJ3ntm2OdHG
   o6vLbloOkm+mV2RCsVpp/CHzNyURP40whoCeP11ty9QEYWaEufrE74EWf
   fu/v0XjdmeUKclF/uztd0h/K0E4tyPKX2ovuOJX3ontPb3MnbdUtlpwmG
   KVX38hwbjQMrJACgDDuJz6ZYpu6Q67mRNiYR+NsHAVavvAck91yWNeGAY
   qJF5r0aJjF3QkVhsdcvmrShwiJgQAQSIlTSUAR3A2JPMDT2qeAS7NFV0c
   FXQYP/xSFQ/V33gcs0R0t+bm1oK5taqYxX5tfhxpaYlyuom37hP5Fy6dC
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="259583352"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
   d="scan'208";a="259583352"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 06:53:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
   d="scan'208";a="696938393"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2022 06:53:48 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jia-Ju Bai <baijiaju1990@gmail.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org
Subject: [PATCH v1 0/2] usb: typec: ucsi: Role swapping fixes
Date:   Tue,  5 Apr 2022 16:48:22 +0300
Message-Id: <20220405134824.68067-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

It appears these role swapping routines have been broken for a while.
The role swap UCSI commands always actually did work, and the roles were
most likely always swapped, but these operations just always appeared to
fail because of these bugs.

I'm guessing that has kept the problem hidden. Nobody cared about the
return values from these operations. It was enough that the roles were
swapped in the end.

thanks,

Heikki Krogerus (2):
  usb: typec: ucsi: Fix reuse of completion structure
  usb: typec: ucsi: Fix role swapping

 drivers/usb/typec/ucsi/ucsi.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

-- 
2.35.1

