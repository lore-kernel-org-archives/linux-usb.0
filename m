Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4379C432BE
	for <linux-usb@archiver.kernel.org>; Thu, 26 Aug 2021 12:45:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9747F6109E
	for <linux-usb@archiver.kernel.org>; Thu, 26 Aug 2021 12:45:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242080AbhHZMqR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Aug 2021 08:46:17 -0400
Received: from mga03.intel.com ([134.134.136.65]:32383 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233687AbhHZMqR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Aug 2021 08:46:17 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="217767734"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="217767734"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2021 05:45:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="474190879"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 26 Aug 2021 05:45:24 -0700
Subject: Re: [PATCH v2 2/3] usb: core: hcd: Add support for deferring roothub
 registration
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        chris.chiu@canonical.com, lokeshvutla@ti.com
References: <20210826111426.751-1-kishon@ti.com>
 <20210826111426.751-3-kishon@ti.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <1c49d091-cb9d-6c5c-eb34-5a5bc7b8c25e@linux.intel.com>
Date:   Thu, 26 Aug 2021 15:47:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210826111426.751-3-kishon@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 26.8.2021 14.14, Kishon Vijay Abraham I wrote:
> It has been observed with certain PCIe USB cards (like Inateck connected
> to AM64 EVM or J7200 EVM) that as soon as the primary roothub is
> registered, port status change is handled even before xHC is running
> leading to cold plug USB devices not detected. For such cases, registering
> both the root hubs along with the second HCD is required. Add support for
> deferring roothub registration in usb_add_hcd(), so that both primary and
> secondary roothubs are registered along with the second HCD.
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Tested-by: Chris Chiu <chris.chiu@canonical.com>

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
