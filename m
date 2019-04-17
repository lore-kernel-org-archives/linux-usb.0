Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA0CC282DA
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 14:40:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0884320645
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 14:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731565AbfDQOkF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 10:40:05 -0400
Received: from mga18.intel.com ([134.134.136.126]:12709 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729395AbfDQOkF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Apr 2019 10:40:05 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Apr 2019 07:40:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,362,1549958400"; 
   d="scan'208";a="165544808"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 17 Apr 2019 07:40:02 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 17 Apr 2019 17:40:01 +0300
Date:   Wed, 17 Apr 2019 17:40:01 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 0/7] usb: typec: ucsi: Remaining changes for v5.2
Message-ID: <20190417144001.GA3336@kuha.fi.intel.com>
References: <20190417114750.21420-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190417114750.21420-1-heikki.krogerus@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 17, 2019 at 02:47:43PM +0300, Heikki Krogerus wrote:
> Hi Greg,
> 
> This is the third version of this collection of UCSI driver related
> changes. I fixed the header problem I caused in Ajay's patch adding the
> NVIDIA alt mode support (patch 7/7), and I also took the liberty of
> writing the missing ABI documentation for the extra sysfs file that's
> created in the driver for Cypress CCGx Type-C controller (ucsi_ccg.c).

Ajay reported one more issue with one of the patches :-(

I need to do one more version.

thanks,

-- 
heikki
