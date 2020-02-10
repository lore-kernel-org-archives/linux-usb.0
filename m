Return-Path: <SRS0=EFIa=36=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33ED8C352A3
	for <linux-usb@archiver.kernel.org>; Mon, 10 Feb 2020 15:36:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13E8C2080C
	for <linux-usb@archiver.kernel.org>; Mon, 10 Feb 2020 15:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgBJPgH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 10 Feb 2020 10:36:07 -0500
Received: from mga07.intel.com ([134.134.136.100]:64735 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726816AbgBJPgG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Feb 2020 10:36:06 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Feb 2020 07:36:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,425,1574150400"; 
   d="scan'208";a="347068809"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 10 Feb 2020 07:36:03 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 10 Feb 2020 17:36:02 +0200
Date:   Mon, 10 Feb 2020 17:36:02 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH v2 1/2] usb: typec: ucsi: register DP only for NVIDIA DP
 VDO
Message-ID: <20200210153602.GA1708@kuha.fi.intel.com>
References: <20200123005859.13194-1-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123005859.13194-1-ajayg@nvidia.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ajay,

On Wed, Jan 22, 2020 at 04:58:58PM -0800, Ajay Gupta wrote:
> From: Ajay Gupta <ajayg@nvidia.com>
> 
> NVIDIA VirtualLink (svid 0x955) has two altmode, vdo=0x1 for
> VirtualLink DP mode and vdo=0x3 for NVIDIA test mode.
> Register display altmode driver only for vdo=0x1
> 
> Signed-off-by: Ajay Gupta <ajayg@nvidia.com>

I'll give this a quick test, and send them forward.

thanks,

-- 
heikki
