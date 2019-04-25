Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D072AC10F03
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 09:05:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A1482214C6
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 09:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556183145;
	bh=t2+NUrbYCbU+NOxf65eq6vxBsSgR1woBOrK+BI998Xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Hnc3UxyINrhwAJ8yt7vkENprZTJ9T3JGKuGWj8ogPn0DU3AOptVCwWcbRLuf+QXic
	 Zc9xvnc4HCyr1j4G0kMWRlQz9tL7Fjq+7TxG4QyFxN+QyFv3FfSI0hPV3yaEwxUwiA
	 t0yG2mE9NDfhvJEkfgTIgRqOf024pvh+2YbXENi8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbfDYJFp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 05:05:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:41094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725929AbfDYJFo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Apr 2019 05:05:44 -0400
Received: from localhost (62-193-50-229.as16211.net [62.193.50.229])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC88F214C6;
        Thu, 25 Apr 2019 09:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556183144;
        bh=t2+NUrbYCbU+NOxf65eq6vxBsSgR1woBOrK+BI998Xw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GX5haq6zon0xCThxtADsOGHJ/hoIWm8TsYiNQnDRC+I9iUWz6F7Nnti1puu2o3bE2
         BnSIdHk2zH1Eu3W6xqT6gshaCrCs+XZk0OPgBc0DTeWRK75AEnOTpCLYB2C+N3KMTG
         fgehy0LHylw8GYWJSM5SSS7U4S8WPaSClISPJS9c=
Date:   Thu, 25 Apr 2019 11:05:42 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 0/7] usb: typec: ucsi: Remaining changes for v5.2
Message-ID: <20190425090542.GA15975@kroah.com>
References: <20190423142151.26135-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190423142151.26135-1-heikki.krogerus@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 23, 2019 at 05:21:44PM +0300, Heikki Krogerus wrote:
> Hi Greg,
> 
> Ajay noticed that I was not considering earlier releases of the UCSI
> specification with a specific UCSI command, GET_CURRENT_CAM, in v3.
> The definition for the command was changed in UCSI specification v1.1.
> The issue is now fixed.

Looks good, thanks for sticking with these, now all queued up.

greg k-h
