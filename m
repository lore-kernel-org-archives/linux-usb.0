Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0798AC001E0
	for <linux-usb@archiver.kernel.org>; Mon, 31 Jul 2023 11:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231558AbjGaLQL (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 31 Jul 2023 07:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbjGaLQK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 07:16:10 -0400
Received: from mgamail.intel.com (unknown [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142CEE78
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 04:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690802169; x=1722338169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YMWo9estWkjuMfiOArXa0mRz2e8whKB/et7PL5IHc8s=;
  b=knj83B/Ljkh30+2kufkEfXUfTdX9B04zP2qSsYE3ETQmEj9Ax+agwK0H
   QY6r8jlnKASmFlY2wz9dqR2m5E/G19GdSECEPFtTueOtsu8ixr6EyZi83
   jQwI7UQCs0RNMzg6ae+pXKSGXhdMdHX0f4GwFQ3ImbmBUtmApG6sOBK4j
   LCQtiqlheMiPmu6f0uOF3bkjgwIFdITcEt3ZCd0Vn9meNL5haU6nkhI3I
   lg4iM/QEmymlfrhxMkUZGxT9nC/U0StNOxTcltV5DFGAcoVA7cELqx/yD
   SJYR5NdzarywjAq5REjS1y57rjCFjISC5MTBAqOdKcRhw+1JPN/7S1RVu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="359027970"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="359027970"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 04:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="763349387"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="763349387"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 31 Jul 2023 04:15:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 32A1D1E8; Mon, 31 Jul 2023 14:15:30 +0300 (EEST)
Date:   Mon, 31 Jul 2023 14:15:30 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <sanju.mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
        Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH V2] thunderbolt: Fix Thunderbolt 3 display flickering
 issue on 2nd hot plug onwards
Message-ID: <20230731111530.GI14638@black.fi.intel.com>
References: <1689185779-25648-1-git-send-email-sanju.mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1689185779-25648-1-git-send-email-sanju.mehta@amd.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 12, 2023 at 01:16:19PM -0500, Sanjay R Mehta wrote:
> Previously, on unplug events, the TMU mode was disabled first
> followed by the Time Synchronization Handshake, irrespective of
> whether the tb_switch_tmu_rate_write() API was successful or not.
> 
> However, this caused a problem with Thunderbolt 3 (TBT3)
> devices, as the TSPacketInterval bits were always enabled by default,
> leading the host router to assume that the device router's TMU was
> already enabled and preventing it from initiating the Time
> Synchronization Handshake. As a result, TBT3 monitors experienced
> display flickering from the second hot plug onwards.
> 
> To address this issue, we have modified the code to only disable the
> Time Synchronization Handshake during TMU disable if the
> tb_switch_tmu_rate_write() function is successful. This ensures that
> the TBT3 devices function correctly and eliminates the display
> flickering issue.
> 
> Co-developed-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>

Looks good.

I suppose you want this in -stable too, right?
