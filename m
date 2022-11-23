Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA47C3A59F
	for <linux-usb@archiver.kernel.org>; Wed, 23 Nov 2022 09:27:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237652AbiKWJ1t (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 23 Nov 2022 04:27:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237516AbiKWJ0o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Nov 2022 04:26:44 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054C626DA;
        Wed, 23 Nov 2022 01:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669195543; x=1700731543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t2SAnOgsySRM7mHKRUcNknHBsBrjQkkMc+UA0mZmAHQ=;
  b=EQ6BHbzsng3P88k8EAT5rrsQ2J/JLM6JkzvcR/rCKA3pF5MV1n6kXxge
   cSzCHzHS68Tb5n1Wy9eoUjHenxMbSdF/a7oUN5A+pUE9s1rqbOLE1kpfn
   gnanTuIBHrJ7mouZncUlvchJmrHXZlreAtcYeQ0Buwi+zlJP4vi/AyJZo
   t3zFON+D4eZWia8q3/SnocGL4WSgmFni4Sv3ki1Ay1/nObAYCFOVXEqSj
   7cAPOB1jm0mc2Oi0PIPrDG0LEQJA7dTAzyuqLhlE5LWB+8FhUw9t6Wh/M
   7eQq9Fu64hFcOwLF40jLgjqtfsiUBWGo5FiXHBYzKUkg9okybd7zA9xlL
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="311653033"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="311653033"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 01:25:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="784172353"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="784172353"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 23 Nov 2022 01:25:41 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 23 Nov 2022 11:25:40 +0200
Date:   Wed, 23 Nov 2022 11:25:40 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Todd Brandt <todd.e.brandt@intel.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Resume in separate work
Message-ID: <Y33nFODsGwuDt1Vy@kuha.fi.intel.com>
References: <20221123092246.22007-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123092246.22007-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 23, 2022 at 11:22:46AM +0200, Heikki Krogerus wrote:
> It can take more than one second to check each connector
> when the system is resumed. So if you have, say, eight
> connectors, it may take eight seconds for ucsi_resume() to
> finish. That's a bit too much.
> 
> This will modify ucsi_resume() so that it schedules a work
> where the interface is actually resumed instead of checking
> the connectors directly. The connections will also be
> checked in separate tasks which are queued for each connector
> separately.
> 
> Reported-by: Todd Brandt <todd.e.brandt@intel.com>
> Fixes: f9f019f7d849 ("usb: typec: ucsi: Resume in separate work")

Sorry, that Fixes line is not correct. I'll resend.

Br,

-- 
heikki
