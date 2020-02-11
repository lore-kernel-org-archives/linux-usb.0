Return-Path: <SRS0=9l+J=37=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4253C3B187
	for <linux-usb@archiver.kernel.org>; Tue, 11 Feb 2020 13:59:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B48D62086A
	for <linux-usb@archiver.kernel.org>; Tue, 11 Feb 2020 13:59:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730134AbgBKN7Y (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 11 Feb 2020 08:59:24 -0500
Received: from mga01.intel.com ([192.55.52.88]:37658 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729330AbgBKN7X (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 08:59:23 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Feb 2020 05:59:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="347283285"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 11 Feb 2020 05:59:20 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 11 Feb 2020 15:59:20 +0200
Date:   Tue, 11 Feb 2020 15:59:20 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Oliver Neukum <oneukum@suse.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: No PNP0CA0 device on a Dell Precision 5520 laptop
Message-ID: <20200211135920.GB1498@kuha.fi.intel.com>
References: <1581427518.1580.3.camel@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581427518.1580.3.camel@suse.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 11, 2020 at 02:25:18PM +0100, Oliver Neukum wrote:
> Hi,
> 
> I just not getting ucsi_acpi to bind on this laptop.
> There just is no PNP0CA0 device. Any idea about what I am doing wrong?

Is the interface enabled? What do you get if you do:

        % cat /sys/bus/acpi/devices/USBC000\:00/status

thanks,

-- 
heikki
