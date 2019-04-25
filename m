Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A562C43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 15:33:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 613D320895
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 15:33:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kalray.eu header.i=@kalray.eu header.b="AUex10Vf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730311AbfDYPdn (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 11:33:43 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:55380 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730280AbfDYPdm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 11:33:42 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id F1BE627E0512;
        Thu, 25 Apr 2019 17:33:40 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id TucJfq8Cslpx; Thu, 25 Apr 2019 17:33:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id AFAF927E0510;
        Thu, 25 Apr 2019 17:33:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu AFAF927E0510
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1556206420;
        bh=J8h5RtvO5J7W+OxBUM9HcxK6n2n/Q0wLsJmkZU9/SVs=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=AUex10VfkKRA9urs4y8U2cC0qXRilQntdEDMzx5zrH7GDbZIC8gClUrc3q++qsKY/
         qzmdGJ9QHqafRubhJ1GkQ1YQsAOaaA8PxKuZzCQWjfgM32SlXA7/6DTWSrpID1Im1X
         3UrvNNJe4C9NMQk9IX8vV9jGKOalMwCYBw16dmEc=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id jW7i5dibTftq; Thu, 25 Apr 2019 17:33:40 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 920B227E0309;
        Thu, 25 Apr 2019 17:33:40 +0200 (CEST)
Date:   Thu, 25 Apr 2019 17:33:32 +0200
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pierre-Yves Kerbrat <pkerbrat@kalray.eu>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/5] usb: dwc2: Move UTMI_PHY_DATA defines closer
Message-ID: <20190425153018.a6npobdvje2o4mld@tellis.lin.mbt.kalray.eu>
References: <20190402103922.16729-1-jmaselbas@kalray.eu>
 <20190402103922.16729-2-jmaselbas@kalray.eu>
 <87ef5qs0vz.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <87ef5qs0vz.fsf@linux.intel.com>
User-Agent: NeoMutt/20180716-1557-a6ba22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425153332.D3WeNL8_9cMKqaYgrJFa89Mfn7xWW-2ivGWX_zXoVD4@z>

Hi Felipe,

On Thu, Apr 25, 2019 at 03:52:16PM +0300, Felipe Balbi wrote:
> Jules Maselbas <jmaselbas@kalray.eu> writes:
> 
> > Makes GHWCFG4_UTMI_PHY_DATA* defines closer to their relative shift and
> > mask defines to improve readability.
> >
> > Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> 
> Doesn't apply. Please make sure to rebase on testing/next

I've applied this patch serie on v5.1-rc6 and I didn't saw any problems.
I also found that theses patchs are already included in testing/next.
Did I miss something? 


Regards,
--
Jules

