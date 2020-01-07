Return-Path: <SRS0=uAmH=24=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1FEC33C99
	for <linux-usb@archiver.kernel.org>; Tue,  7 Jan 2020 08:46:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 470E6206DB
	for <linux-usb@archiver.kernel.org>; Tue,  7 Jan 2020 08:46:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgAGIqx (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 7 Jan 2020 03:46:53 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:58505 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgAGIqx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jan 2020 03:46:53 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1595A240006;
        Tue,  7 Jan 2020 08:46:50 +0000 (UTC)
Message-ID: <a03988283e4858c0eb00e46bd9c41f52e356d1e0.camel@hadess.net>
Subject: Re: [PATCH v3 0/6] Add Apple MFi fastcharge USB device driver
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Tue, 07 Jan 2020 09:46:50 +0100
In-Reply-To: <2f9b9dad3e8b390f70168b2fef1607f0b72ce7c3.camel@hadess.net>
References: <20191016093933.693-1-hadess@hadess.net>
         <2f9b9dad3e8b390f70168b2fef1607f0b72ce7c3.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey,

On Thu, 2019-11-21 at 16:20 +0100, Bastien Nocera wrote:
> Hey,
> 
> Any updates on getting this into the USB tree?
> 
> Alan acked the patchset more than a month ago.

Thought I'd ask again, the 6 patches were acked by Alan, and tested by
me. Is there any chance they could be considered for merging, or
reviewed?

Cheers

> On Wed, 2019-10-16 at 11:39 +0200, Bastien Nocera wrote:
> > This is version 3 of the patch set.
> > 
> > Changes in v3:
> > - Add Alan's ack
> > - don't export usb_device_match_id()
> 
> 

