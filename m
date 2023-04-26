Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5587BC77B60
	for <linux-usb@archiver.kernel.org>; Wed, 26 Apr 2023 11:49:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240422AbjDZLtg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 26 Apr 2023 07:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240408AbjDZLtf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Apr 2023 07:49:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4FD74EC0
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 04:49:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7FA3B6344A
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 11:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CEBC433EF;
        Wed, 26 Apr 2023 11:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1682509771;
        bh=NspjrVn0uSpP44QdgMTmuWyjmP0rfAMrorv0/jzwL74=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RF8Fd8JKhProf/ZgeMspG8+qAW/DH35L9v+8NCTAXAVmpEkDatx/KiMckBTM6d3XW
         cZgq0RsSBsopa2grCt0l7vFK/iHW+ryGgJkLzdAhN0jqPctfgwg2b66ONl5wTB62OZ
         Fi+IOcB7DQeMVM1/zxVdy/+kYi5JMMGsEStIhSko=
Date:   Wed, 26 Apr 2023 13:49:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Konrad =?iso-8859-1?Q?Gr=E4fe?= <k.graefe@gateware.de>
Cc:     linux-usb@vger.kernel.org, quentin.schulz@theobroma-systems.com
Subject: Re: [PATCH] usb: gadget: u_ether: Fix host MAC address case
Message-ID: <2023042625-rendition-distort-fe06@gregkh>
References: <2023042534-thing-shamrock-88c1@gregkh>
 <d62f5a2b-ec47-6cee-4cf1-0d1ea18dee56@gateware.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d62f5a2b-ec47-6cee-4cf1-0d1ea18dee56@gateware.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 26, 2023 at 12:17:53PM +0200, Konrad Gräfe wrote:
> 
> As the CDC-ECM specification states the host MAC address must be sent to
> the host as an uppercase hexadecimal string:
>     The Unicode character is chosen from the set of values 30h through
>     39h and 41h through 46h (0-9 and A-F).
> 
> However, snprintf(.., "%pm", ..) generates a lowercase MAC address
> string. While most host drivers are tolerant to this, UsbNcm.sys on
> Windows 10 is not. Instead it uses a different MAC address with all
> bytes set to zero including and after the first byte containing a
> lowercase letter. On Windows 11 Microsoft fixed it, but apparently they
> did not backport the fix.
> 
> This change fixes the issue by upper-casing the MAC to comply with the
> specification.
> 
> Signed-off-by: Konrad Gräfe <k.graefe@gateware.de>
> ---
> V1 -> V2: Fixed checkpatch.pl warnings

There is no "v2" in the subject line, so our tools will get confused and
have no idea this is a newer patch.

Please fix up and send a v3?

>  	snprintf(host_addr, len, "%pm", dev->host_mac);

Is there no option to print a mac address with all uppercase?  If not,
why not add that instead as it's needed here and maybe other places,
right?

thanks,

greg k-h
