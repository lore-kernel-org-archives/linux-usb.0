Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE70FC10F12
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 06:33:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E22720693
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 06:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555482791;
	bh=EAcIZMcxG323i98cgoknYmGJtxsFdCdU5G8nOedLVRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=v8D+ueiapGTgydFg1K7lMh+pqHT6aEsbBmYAMPDRbnLMFcvm2pqNmXZUDZLyPjIY5
	 tZwcAbZgZ3wsTpZTGzKtv6i9zdsQK4/a0Q7IaJDoBds5W9gSgAhbuoodmEC1DG5Pc5
	 QQ2HftGuqp3KJKAAIZkjjH2rZdZm9kGIut5CrjBk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728650AbfDQGdK (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 02:33:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:38358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727013AbfDQGdK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Apr 2019 02:33:10 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58F3420693;
        Wed, 17 Apr 2019 06:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555482789;
        bh=EAcIZMcxG323i98cgoknYmGJtxsFdCdU5G8nOedLVRQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=txa9qEd5CrBPG0ZzPNOWkKgQR/xn5pNrfKILzAfJXnoB0jWU4mfbp6uCfeJygkCUK
         APOuKejEAuyIE9YtZZ0wTJlK6t2kich03u74RQjhI7JgEYxxwPn0UDR21Hgap7opZA
         kUWCj68tFOnXGBv3m2H40S3Vndn1qtB50tekec6U=
Date:   Wed, 17 Apr 2019 08:33:07 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH v8 3/3] usb: typec: ucsi: ccg: add firmware flashing
 support
Message-ID: <20190417063307.GA24174@kroah.com>
References: <20190416172747.22139-1-ajayg@nvidia.com>
 <20190416172747.22139-4-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190416172747.22139-4-ajayg@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417063307.5uM9i7xS9_siM_BwjwdhR19mDDr3-tSAvS49bWBoUpc@z>

On Tue, Apr 16, 2019 at 10:27:47AM -0700, Ajay Gupta wrote:
> From: Ajay Gupta <ajayg@nvidia.com>
> 
> CCGx has two copies of the firmware in addition to the bootloader.
> If the device is running FW1, FW2 can be updated with the new version.
> Dual firmware mode allows the CCG device to stay in a PD contract and
> support USB PD and Type-C functionality while a firmware update is in
> progress.
> 
> First we read the currently flashed firmware version of both
> primary and secondary firmware and then compare it with
> version of firmware file to determine if flashing is required.
> 
> Command framework is added to support sending commands to CCGx
> controller. We wait for response after sending the command and then
> read the response from RAB_RESPONSE register.
> 
> Below commands are supported,
> 	- ENTER_FLASHING
> 	- RESET
> 	- PDPORT_ENABLE
> 	- JUMP_TO_BOOT
> 	- FLASH_ROW_RW
> 	- VALIDATE_FW
> 
> Command specific mutex lock is also added to sync between driver
> and user threads.
> 
> PD port number information is added which is required while sending
> PD_PORT_ENABLE command
> 
> Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
> Changes from v7->v8
> 	- Fixed comments from Greg by dropping do_flash_show()

You still have a new sysfs file without a new Documentation/ABI/ update
for it, so I will have to reject this patch again :(

I thought I said that in the last review...

thanks,

greg k-h
