Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C135DC433E0
	for <linux-usb@archiver.kernel.org>; Thu, 18 Mar 2021 15:30:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7881B64F18
	for <linux-usb@archiver.kernel.org>; Thu, 18 Mar 2021 15:30:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbhCRPaZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Mar 2021 11:30:25 -0400
Received: from mga12.intel.com ([192.55.52.136]:35359 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231273AbhCRPaT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Mar 2021 11:30:19 -0400
IronPort-SDR: kd3TYgwsQy4GC3KaMrRWmgiQb3DGlWoGszDkQfq+KDL5RkWfHeEVP+KY0GXr91ewOMsp3m/uYw
 nAG2PwTuOE3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="168996128"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; 
   d="scan'208";a="168996128"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2021 08:30:19 -0700
IronPort-SDR: riDi3OtB/WbLxQ0MFrtDLRGdBceEwcgs8My3KYGuq/hVx4Dhx+641rzDyN3H63p78g7FWdTYYI
 B+27HzexLISQ==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; 
   d="scan'208";a="450518213"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2021 08:30:15 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 18 Mar 2021 17:30:12 +0200
Date:   Thu, 18 Mar 2021 17:30:12 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Isaac Hazan <isaac.hazan@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Subject: Re: [PATCH 00/18] thunderbolt: Align with USB4 inter-domain and DROM
 specs
Message-ID: <20210318153012.GI2542@lahna.fi.intel.com>
References: <20210304123125.43630-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304123125.43630-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 04, 2021 at 03:31:07PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> The latest USB4 spec [1] also includes inter-domain (peer-to-peer, XDomain)
> and DROM (per-device ROM) specs. There are sligth differences between what
> the driver is doing now and what the spec say so this series tries to align
> the driver(s) with that. We also improve the "service" stack so that it is
> possible to run multiple DMA tunnels over a single XDomain connection, and
> update the two existing service drivers accordingly.
> 
> We also decrease the control channel timeout when software based connection
> manager is used.
> 
> The USB4 DROM spec adds a new product descriptor that includes the device
> and IDs instead of the generic entries in the Thunderbotl 1-3 DROMs. This
> series updates the driver to parse this descriptor too.
> 
> [1] https://www.usb.org/document-library/usb4tm-specification
> 
> Mika Westerberg (18):
>   thunderbolt: Disable retry logic for intra-domain control packets
>   thunderbolt: Do not pass timeout for tb_cfg_reset()
>   thunderbolt: Decrease control channel timeout for software connection manager
>   Documentation / thunderbolt: Drop speed/lanes entries for XDomain
>   thunderbolt: Add more logging to XDomain connections
>   thunderbolt: Do not re-establish XDomain DMA paths automatically
>   thunderbolt: Use pseudo-random number as initial property block generation
>   thunderbolt: Align XDomain protocol timeouts with the spec
>   thunderbolt: Add tb_property_copy_dir()
>   thunderbolt: Add support for maxhopid XDomain property
>   thunderbolt: Use dedicated flow control for DMA tunnels
>   thunderbolt: Drop unused tb_port_set_initial_credits()
>   thunderbolt: Allow multiple DMA tunnels over a single XDomain connection
>   net: thunderbolt: Align the driver to the USB4 networking spec
>   thunderbolt: Add KUnit tests for XDomain properties
>   thunderbolt: Add KUnit tests for DMA tunnels
>   thunderbolt: Check quirks in tb_switch_add()
>   thunderbolt: Add support for USB4 DROM

All applied to thunderbolt.git/next.
