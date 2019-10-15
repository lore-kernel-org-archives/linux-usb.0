Return-Path: <SRS0=phTe=YI=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E369DC10F14
	for <linux-usb@archiver.kernel.org>; Tue, 15 Oct 2019 14:29:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C25B3214AE
	for <linux-usb@archiver.kernel.org>; Tue, 15 Oct 2019 14:29:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732643AbfJOO3U (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 15 Oct 2019 10:29:20 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:55939 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732087AbfJOO3U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 10:29:20 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 48786C001C;
        Tue, 15 Oct 2019 14:29:18 +0000 (UTC)
Message-ID: <a30df988f8b338c7ad04feeb747936aa0baeba24.camel@hadess.net>
Subject: Re: [PATCH v2 0/6] Add Apple MFi fastcharge USB device driver
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 15 Oct 2019 16:29:17 +0200
In-Reply-To: <16edde941e06216fa26477b9e1c121ffbb88a0b4.camel@hadess.net>
References: <16edde941e06216fa26477b9e1c121ffbb88a0b4.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2019-10-15 at 16:27 +0200, Bastien Nocera wrote:
> This is version 2 of the patch set.
> 
> - checkpatch.pl is now quiet
> - fallback to the generic driver when driver ->probe() fails

And I'll send a v3 because all the patches got mangled by my mail
client.

