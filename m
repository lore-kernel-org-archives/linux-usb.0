Return-Path: <SRS0=6o++=ED=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF1BC388F7
	for <linux-usb@archiver.kernel.org>; Wed, 28 Oct 2020 22:27:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FE3720720
	for <linux-usb@archiver.kernel.org>; Wed, 28 Oct 2020 22:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603924035;
	bh=U8N6vg6X2eYcSrQSkrm8NKGZN+U0c9/qNL8RW2RKxFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=HY2CrFiOp1L26zw5I/THXot0CDJSWeoObKP7k6pkMXA6lkv2Tcu6evVcizW3eyo0x
	 5+wlgN4n3gg7ImGo0CR1PQcv9PIvqzYLBZjffBYBFdqWky8AXVB77UZczw+RJWm6SU
	 AQ2oBfDBCK2X79NcOaV4WjSNLyFSV9jnm3GQ/gxc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733008AbgJ1WYo (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:24:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:36834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732655AbgJ1WWY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Oct 2020 18:22:24 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB76224689;
        Wed, 28 Oct 2020 09:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603876192;
        bh=U8N6vg6X2eYcSrQSkrm8NKGZN+U0c9/qNL8RW2RKxFY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d9NrgKXpsS6WBfcM7CUhO4Y0J6crO+QvjUheK3Vjd1l/gAs06AMhfllfM1Kra4Ou2
         e3w2jfHLO/PybGblgHPD2cu6h4wYzhjh0ZcdQ3VZKrHXG8eOdgwrnyweBLK0r5C/zR
         8xxE/m2/ob9Uivgh2Mw2HlS/Q/zDGrh8OMAMpXl0=
Date:   Wed, 28 Oct 2020 10:10:43 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Benjamin Berg <benjamin@sipsolutions.net>
Cc:     linux-usb@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, Benjamin Berg <bberg@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 0/2] UCSI race condition resulting in wrong port state
Message-ID: <20201028091043.GC1947336@kroah.com>
References: <20201009144047.505957-1-benjamin@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009144047.505957-1-benjamin@sipsolutions.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 09, 2020 at 04:40:45PM +0200, Benjamin Berg wrote:
> From: Benjamin Berg <bberg@redhat.com>
> 
> Hi all,
> 
> so, I kept running in an issue where the UCSI port information was saying
> that power was being delivered (online: 1), while no cable was attached.
> 
> The core of the problem is that there are scenarios where UCSI change
> notifications are lost. This happens because querying the changes that
> happened is done using the GET_CONNECTOR_STATUS command while clearing the
> bitfield happens from the separate ACK command. Any change in between will
> be lost.
> 
> Note that the problem may be almost invisible in the UI as e.g. GNOME will
> still show the battery as discharging. But some policies like automatic
> suspend may be applied incorrectly.
> 
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Benjamin Berg (2):
>   usb: typec: ucsi: acpi: Always decode connector change information
>   usb: typec: ucsi: Work around PPM losing change information

Do these need to be backported to stable kernel releases?  If so, how
far back?

thjanks,

greg k-h
