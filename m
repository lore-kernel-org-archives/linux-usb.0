Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC20C432BE
	for <linux-usb@archiver.kernel.org>; Sat, 28 Aug 2021 09:48:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B1766054E
	for <linux-usb@archiver.kernel.org>; Sat, 28 Aug 2021 09:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233707AbhH1JtZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 28 Aug 2021 05:49:25 -0400
Received: from mga17.intel.com ([192.55.52.151]:39364 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233682AbhH1JtZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 28 Aug 2021 05:49:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10089"; a="198319733"
X-IronPort-AV: E=Sophos;i="5.84,359,1620716400"; 
   d="scan'208";a="198319733"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2021 02:48:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,359,1620716400"; 
   d="scan'208";a="599634133"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 28 Aug 2021 02:48:33 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Sat, 28 Aug 2021 12:48:32 +0300
Date:   Sat, 28 Aug 2021 12:48:32 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ulrich Huber <ulrich@huberulrich.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: ucsi_acpi GET_CONNECTOR_STATUS failed (-5)
Message-ID: <YSoGcC4Z1EP0S3KQ@kuha.fi.intel.com>
References: <b36249c5-776a-9338-bb9f-ae6a5c446860@huberulrich.de>
 <YSX7hZnCoFSXTFJe@kuha.fi.intel.com>
 <0e77017d-9358-a691-6293-234fcbab6a31@huberulrich.de>
 <a7f971ef-c3aa-aadc-e453-4c667a414131@huberulrich.de>
 <YSekP0+tq6ISq6my@kuha.fi.intel.com>
 <3fe6d701-bc14-9b26-a5af-aa38fe7c585e@huberulrich.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fe6d701-bc14-9b26-a5af-aa38fe7c585e@huberulrich.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 26, 2021 at 09:50:58PM +0200, Ulrich Huber wrote:
> I just got around to test your patches. They seem to solve the issue
> completely! Whatever I tried, the behavior of the port stayed consistent and
> no error messages appeared in the log.
> 
> I'll continue using the patch for now and will notify you, should any issue
> appear.

Great! If there are no problems, I'll send them to Greg after the next
-rc1.

thanks,

-- 
heikki
