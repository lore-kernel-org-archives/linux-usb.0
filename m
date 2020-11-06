Return-Path: <SRS0=WR2x=EM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405EEC2D0A3
	for <linux-usb@archiver.kernel.org>; Fri,  6 Nov 2020 13:48:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2EBF2065D
	for <linux-usb@archiver.kernel.org>; Fri,  6 Nov 2020 13:48:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgKFNsn (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 6 Nov 2020 08:48:43 -0500
Received: from mga17.intel.com ([192.55.52.151]:1080 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727093AbgKFNsn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Nov 2020 08:48:43 -0500
IronPort-SDR: hUQaQuixFtmG3nTQt8G2RljiOsrWAngoApzbnStr+hWT0P7VmQ4rrJklkOo44JEWbpTo+FvkhG
 5lUQs+3m9djw==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="149396969"
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; 
   d="scan'208";a="149396969"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 05:48:42 -0800
IronPort-SDR: cXYbMuDD4o/hXl/ZVFy6z2HEiPU7bYdI075STXFZOZxy77sMiOCZDa54kLInF28eVOs4lEbJcs
 HTcJwAzEij8g==
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; 
   d="scan'208";a="354738341"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 05:48:40 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 06 Nov 2020 15:46:26 +0200
Date:   Fri, 6 Nov 2020 15:46:26 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] thunderbolt: Add support for Intel Tiger Lake-H
Message-ID: <20201106134626.GS2495@lahna.fi.intel.com>
References: <20201102160617.40101-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102160617.40101-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 02, 2020 at 07:06:17PM +0300, Mika Westerberg wrote:
> Intel Tiger Lake-H has the same Thunderbolt/USB4 controller as Tiger
> Lake-LP. Add the Tiger Lake-H PCI IDs to the driver list of supported
> devices.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.
