Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E71C433E0
	for <linux-usb@archiver.kernel.org>; Mon, 28 Dec 2020 09:48:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAD1A221F0
	for <linux-usb@archiver.kernel.org>; Mon, 28 Dec 2020 09:48:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgL1JsL (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 28 Dec 2020 04:48:11 -0500
Received: from mga17.intel.com ([192.55.52.151]:61177 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727013AbgL1JsL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Dec 2020 04:48:11 -0500
IronPort-SDR: gIt2XxV8zfshG9czocz+Ak7ZMhz7DKqNL9S2GAxiHZWqgNXWxyUkr0zmF5rmaLL1TEjeh9VIAr
 ghWjp+BLV3kQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9847"; a="156154134"
X-IronPort-AV: E=Sophos;i="5.78,454,1599548400"; 
   d="scan'208";a="156154134"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 01:46:25 -0800
IronPort-SDR: FuRWlNqFz0ifaOPHNtdWRMQcip8PKf34QFQI0kbsIuD9zJqyOTdKgo/jVyvWsQRBGg5varuaXe
 9OGEjq6Xs6Lw==
X-IronPort-AV: E=Sophos;i="5.78,454,1599548400"; 
   d="scan'208";a="375580259"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 01:46:22 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 28 Dec 2020 11:46:20 +0200
Date:   Mon, 28 Dec 2020 11:46:20 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     isaac.hazan@intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Use kmemdup instead of kzmalloc and memcpy
Message-ID: <20201228094620.GJ968855@lahna.fi.intel.com>
References: <1608686793-52044-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608686793-52044-1-git-send-email-tiantao6@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 23, 2020 at 09:26:33AM +0800, Tian Tao wrote:
> Fixes coccicheck warning:
> drivers/thunderbolt/dma_test.c:302:13-20: WARNING opportunity for kmemdup.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied, thanks!
