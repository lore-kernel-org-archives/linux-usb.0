Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB34C77B73
	for <linux-usb@archiver.kernel.org>; Thu, 27 Apr 2023 19:12:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244012AbjD0TMn (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 27 Apr 2023 15:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjD0TMm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Apr 2023 15:12:42 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 13B3A1993
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 12:12:40 -0700 (PDT)
Received: (qmail 175589 invoked by uid 1000); 27 Apr 2023 15:12:40 -0400
Date:   Thu, 27 Apr 2023 15:12:40 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 1/2] USB: Extend pci resume function to handle PM
 events
Message-ID: <0cb92112-5f11-49a8-b4a4-907c6555e4b4@rowland.harvard.edu>
References: <20230427174220.3953123-1-Basavaraj.Natikar@amd.com>
 <20230427174220.3953123-2-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427174220.3953123-2-Basavaraj.Natikar@amd.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 27, 2023 at 11:12:19PM +0530, Basavaraj Natikar wrote:
> Currently, the pci_resume method has only a flag indicating whether the
> system is resuming from hibernation. In order to handle all PM events like
> AUTO_RESUME (runtime resume from device in D3), RESUME (system resume from
> s2idle, S3 or S4 states) etc change the pci_resume method to handle all PM
> events.
> 
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---

For the core, EHCI, OHCI, and UHCI portions:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
