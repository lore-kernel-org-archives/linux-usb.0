Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256E5C43218
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 22:45:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4111A2067C
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 22:45:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="jKwc2LB9";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="ifjGKyAk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726611AbfDYWpC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 18:45:02 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53624 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbfDYWpC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 18:45:02 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4BE136076C; Thu, 25 Apr 2019 22:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1556232301;
        bh=sUFW4bRZZ6HrxuGuV5e8nZUxAjd+JMjlKCqFibB9yK0=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=jKwc2LB9yIiwSFirp4lacc77ehCjJgPIsUUuejDrRrkW3of/qoIjEZu04+CNnGOxd
         m6J8F/u73G1OMn86pORguATh+XvYi7Gaynv9k4OR0tqeaxFgrAo+rMAx4evE97ttb/
         k+2JRsSGd009N9ho1lyGSIH5N3SMCgesVgcLJU+g=
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A1A7560388;
        Thu, 25 Apr 2019 22:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1556232300;
        bh=sUFW4bRZZ6HrxuGuV5e8nZUxAjd+JMjlKCqFibB9yK0=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=ifjGKyAkS5twBN2epBRyQumpQppGGSmIFZWrWfScWMVuN5q7wcasGxNHgtSheAYy8
         C9hVfN5APVlMSMx8C/aX0R8slwBriX7vlS+ocYf8BH13MsogRXyKENOGU6tnvc539t
         xkzkAF+BcSpYgUAEeHTvrrtihGh4/yeFI5PxDAVE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A1A7560388
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
Date:   Thu, 25 Apr 2019 15:44:57 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: configfs on dwc3: msc enum failed if three functions defined
Message-ID: <20190425224456.GA27553@jackp-linux.qualcomm.com>
References: <20190422134357.GA2071@uda0271908>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190422134357.GA2071@uda0271908>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Bin,

On Mon, Apr 22, 2019 at 08:43:57AM -0500, Bin Liu wrote:
> Hi Felipe,
> 
> I am having an issue with dwc3 on TI AM57x device, and would like to ask
> for your comments.
> 
> I use configfs to create a multi-function gadget on dwc3, mass_storage
> is the last function, it seems if I create 3 functions, the mass_storage
> enumeration will fail on the host. It works fine if only create 2
> functions.
> 
> The dwc3 tracepoints log shows after all the ep0 transfers for
> mass_storage, the very first epXin transfer is not complete - dwc3
> programmed the urb, but never generates RX completion event. This also
> matches the bus analyzer trace - dwc3 NAKs the very first IN token for
> ever.
> 
> I use the attached script to create the gadget, The macro FUNCS in the
> beginning of the script defines the functions to be created.
> 
> Any comments are appreciated.

A stab in the dark here but what is the value of GTXFIFOSIZ(X)[15:0]
for epXin on your device? Is it at least wMaxPacketSize? Depending on
the default hardware values it might be deficient as compared to the
working endpoint that gets assigned in your 2-function config.

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
