Return-Path: <SRS0=eaYy=XI=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9ECC49ED7
	for <linux-usb@archiver.kernel.org>; Fri, 13 Sep 2019 15:20:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6D34214AE
	for <linux-usb@archiver.kernel.org>; Fri, 13 Sep 2019 15:20:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388992AbfIMPUN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 13 Sep 2019 11:20:13 -0400
Received: from mga07.intel.com ([134.134.136.100]:9071 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388354AbfIMPUN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Sep 2019 11:20:13 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Sep 2019 08:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,501,1559545200"; 
   d="scan'208";a="200982564"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 13 Sep 2019 08:20:10 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 13 Sep 2019 18:20:09 +0300
Date:   Fri, 13 Sep 2019 18:20:09 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH v5] usb: typec: ucsi: add support for separate DP altmode
 devices
Message-ID: <20190913152009.GA26700@kuha.fi.intel.com>
References: <20190906165516.24006-1-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906165516.24006-1-ajayg@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ajay,

On Fri, Sep 06, 2019 at 09:55:16AM -0700, Ajay Gupta wrote:
> From: Ajay Gupta <ajayg@nvidia.com>
> 
> CCGx controller used on NVIDIA GPU card has two separate display
> altmode for two DP pin assignments. UCSI specification doesn't
> prohibits using separate display altmode.
> 
> Current UCSI Type-C framework expects only one display altmode for
> all DP pin assignment. This patch squashes two separate display
> altmode into single altmode to support controllers with separate
> display altmode. We first read all the alternate modes of connector
> and then run through it to know if there are separate display
> altmodes. If so, it prepares a new port altmode set after squashing
> two or more separate altmodes into one.

I'm going to go over this one more time during the merge window. I
have an idea how to improve this. Please bear with me. I have to make
sure all options were considered.

I'm really sorry to block this for so long, but I'm just really really
afraid of mixing special case solutions like this into otherwise
generic code. They always make it difficult to modify the code later,
and unfortunately we have them all over the kernel. Look at the serial
driver 8250_core/port/*.cas an example. Ideally we should be able to
"modularize" the whole alternate mode handling in the ucsi driver
since there are now two different ways the PPMs can handle them
instead of simply mixing the support for the new method straight into
the existing structures.

thanks,

-- 
heikki
