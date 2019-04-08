Return-Path: <SRS0=iu7A=SK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E58C10F13
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 19:50:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD11620880
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 19:50:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbfDHTu3 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 8 Apr 2019 15:50:29 -0400
Received: from netrider.rowland.org ([192.131.102.5]:33699 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726436AbfDHTu3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Apr 2019 15:50:29 -0400
Received: (qmail 17886 invoked by uid 500); 8 Apr 2019 15:50:28 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 8 Apr 2019 15:50:28 -0400
Date:   Mon, 8 Apr 2019 15:50:28 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: Bug: VHCI + USB 3.0
In-Reply-To: <C22C24B7-A1A1-44E4-9559-ED576ABE8CFF@digi.com>
Message-ID: <Pine.LNX.4.44L0.1904081546540.17572-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 8 Apr 2019, Bollinger, Seth wrote:

> > On Apr 8, 2019, at 1:59 PM, Alan Stern <stern@rowland.harvard.edu<mailto:stern@rowland.harvard.edu>> wrote:
> 
> > No, that trace did not show any failure.  Did you see the corresponding
> > error messages in the kernel log while you were collecting the trace?
> > Maybe you can try again.
> 
> I’m certain the last trace I sent should have contained the read.
> 
> bulk A 000004bf ty 03 st 00000000 T 3584 L 0 ch 00000081 ep 1 fl 0
> BI completion: st 0 stat -75 AL 0 ec 0 returning -75

Hmmm.  The usbmon trace doesn't contain a "-75" anywhere, and it should 
if the error above occurred while the trace was in progress.

Is it possible that the problem occurs on the client rather than on the
server?  (You didn't say which machine produced the error messages in
the log.)  Perhaps simultaneous usbmon traces on both machines is the
way to go.

Alan Stern

