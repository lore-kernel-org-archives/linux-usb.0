Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BF7C10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 10:38:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3551220857
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 10:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555411119;
	bh=wn9EcWsG0lHYD2u9vfI9rJca/go8JVsa39K7pVirHe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=a+xpl5ScMkR/r4rZbTaEVeB4gizrhN8g8u+FN8DAK1rCIJoRd5yVH9q7VUpRc50Ni
	 SNM/Z59WkkeSKCWXEOygmx/RIKBRWPP0ysdKl31AxL6TbmlasPgd3CKzje3J4SyEPV
	 b/XuKB+mfVrodlt2DWKY0dkkhklt/ancy/wYSkJw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728599AbfDPKih (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 06:38:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:57190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726682AbfDPKig (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Apr 2019 06:38:36 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D549206BA;
        Tue, 16 Apr 2019 10:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555411115;
        bh=wn9EcWsG0lHYD2u9vfI9rJca/go8JVsa39K7pVirHe8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U0cnXlV//S8vEWNfYt/qOP0gq+d+7D8+Pk9nZOIbb+vkAe5aA/sWDOaDq9kD4fCAr
         /mKtAOWvXQR2Bl0fOul52MZlDzXNRsnPHOIKV2PFLaJ2+GrqZtQBjl8uA4P7ZmCQ/p
         fSZOruYmmtfv+8DKv9JuQCfcn2xutdI4CmbK3dls=
Date:   Tue, 16 Apr 2019 12:00:44 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/7] usb: typec: ucsi: ccg: add firmware flashing
 support
Message-ID: <20190416100044.GD896@kroah.com>
References: <20190415120931.61328-1-heikki.krogerus@linux.intel.com>
 <20190415120931.61328-4-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190415120931.61328-4-heikki.krogerus@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416100044.wK0g46xEAxZwf2zpeV2LQxLoP80mzXyFSwrrXSYC6tI@z>

On Mon, Apr 15, 2019 at 03:09:27PM +0300, Heikki Krogerus wrote:
> +static ssize_t do_flash_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	return sprintf(buf, "[Usage]\n"
> +		"1) copy ccg_boot.cyacd /lib/firmware/\n"
> +		"2) copy ccg_primary.cyacd /lib/firmware/\n"
> +		"3) copy ccg_secondary.cyacd /lib/firmware/\n"
> +		"4) echo 1 > do_flash\n");
> +}

That is cute, but no, the kernel does NOT provide built-in help texts
for sysfs files.  If you know of any existing ones that do this, please
point them out to me and I will go delete them from the tree.

sysfs is "one value per file", and a "multi-line-help-text" is not a
single value.

That is what the Documentation/ABI files are for, which I do not see an
update for in this patch so I can not take it, sorry :(

thanks,

greg k-h
