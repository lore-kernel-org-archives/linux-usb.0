Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7ED0C282DA
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 20:31:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C1F420868
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 20:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555446695;
	bh=guNqNmDD90m6Dxpy5lwwkbAOV+qQQDQzRqzAmRH6YIY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-ID:From;
	b=xmKh0dodFqM7BFcmr0/thS3rrpY/ewqy/dYtnKPlc6kLu+1KVCvBihcfyg+/s5+Fx
	 ntO+YYfx0BLKU3Y70GAWdsWv1lq8hUY3CuX5OQB7B+YjaNamyAnG6tXHj5O3qA6Ejx
	 7uxH/DWOo3t3NVtxLVn7q637/YxXUWwE457BpgIQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730651AbfDPUbe (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 16:31:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:37908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728466AbfDPUbe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Apr 2019 16:31:34 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BCBAC20663;
        Tue, 16 Apr 2019 20:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555446693;
        bh=guNqNmDD90m6Dxpy5lwwkbAOV+qQQDQzRqzAmRH6YIY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=rrVovOzUYGfP61k5urmNDdXALZi/woXaMj2Scx68wYp07N6NQVVJo6WjBL7MXozQR
         zlJ3I4IErCi92KnrUW0cPNPoTw5fEhmoBu8zERbmdDlmr6fQDljhTsKgWnePw5ojdt
         3kgROB3+0M12LauMWlIf3+eIZqMo2Blkb2GHCnkQ=
Date:   Tue, 16 Apr 2019 22:31:24 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel@vger.kernel.org, y2038@lists.linaro.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Peter Huewe <peterhuewe@gmx.de>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Artem Bityutskiy <dedekind1@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Alex Williamson <alex.williamson@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
        Willem de Bruijn <willemb@google.com>,
        linux-integrity@vger.kernel.org,
        linux1394-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
        devel@driverdev.osuosl.org, kvm@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v3 09/26] compat_ioctl: move drivers to
 compat_ptr_ioctl
In-Reply-To: <20190416202013.4034148-10-arnd@arndb.de>
Message-ID: <nycvar.YFH.7.76.1904162230560.9803@cbobk.fhfr.pm>
References: <20190416202013.4034148-1-arnd@arndb.de> <20190416202013.4034148-10-arnd@arndb.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416203124.GnwuUbh_bJFmGBDY7JNwE_dank1FLa_C-wV4391toi4@z>

On Tue, 16 Apr 2019, Arnd Bergmann wrote:

> Each of these drivers has a copy of the same trivial helper function to
> convert the pointer argument and then call the native ioctl handler.
> 
> We now have a generic implementation of that, so use it.
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/char/ppdev.c              | 12 +---------
>  drivers/char/tpm/tpm_vtpm_proxy.c | 12 +---------
>  drivers/firewire/core-cdev.c      | 12 +---------
>  drivers/hid/usbhid/hiddev.c       | 11 +--------

For hiddev.c:

Reviewed-by: Jiri Kosina <jkosina@suse.cz> 

-- 
Jiri Kosina
SUSE Labs

